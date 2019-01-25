Get-AzureRmSubscription -SubscriptionName "Pay-As-You-Go" | Set-AzureRmContext

$policyName = 'hdcs-restrict-vm-sizes-test-sid'
$policyDescription = "HDCS restricts VM size to be provisioned"

New-AzureRmPolicyDefinition -Name $policyName -Description $policyDescription -Policy "./policy.json"