Describe "HDCS Policy Definitions Tests" {
  BeforeAll {
    Get-AzureRmSubscription -SubscriptionName "Pay-As-You-Go" | Set-AzureRmContext
    $DebugPreference = "Continue"
  }

  AfterAll {
    $DebugPreference = "SilentlyContinue"
  }

  Context "When HDCS policy definitions implemented" {

    $output = Get-AzureRmPolicyDefinition `
              -Name "hdcs-restrict-vm-sizes-test-sid" `
              -ErrorAction Stop `
              5>&1

    Write-Host "output: $output"
    
    $result = ($output[29] -split "Body:")[1] | ConvertFrom-Json
    
    It "Should have hdcs-restrict-vm-size policy with custom type" {
      $result.name | Should -Be "hdcs-restrict-vm-sizes-test-sid"
      $result.properties.policyType | Should -Be "Custom"
    }

    It "Should deny from provisioning if size is not Standard_D2_V3" {
      $result.properties.policyRule.if.allOf[1].notIn[0] | Should -Be "Standard_D2_V3"
      $result.properties.policyRule.then.effect | Should -Be "Deny"
    }
  }
}