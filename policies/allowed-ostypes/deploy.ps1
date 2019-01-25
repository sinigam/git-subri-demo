#Get-AzureRmSubscription -SubscriptionName "HDCS_DELOITTE_DEV" | Set-AzureRmContext
Get-AzureRmSubscription -SubscriptionName "Pay-As-You-Go" | Set-AzureRmContext

$policyName = 'hdcs-restrict-os-types-test-sid'
$policyDescription = "HDCS restricts OS types to be provisioned"

New-AzureRmPolicyDefinition -Name $policyName -Description $policyDescription -Policy "./policy.json"