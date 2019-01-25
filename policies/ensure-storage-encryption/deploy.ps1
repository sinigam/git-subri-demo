#Get-AzureRmSubscription -SubscriptionName "HDCS_DELOITTE_DEV" | Set-AzureRmContext
Get-AzureRmSubscription -SubscriptionName "Pay-As-You-Go" | Set-AzureRmContext

$policyName = 'hdcs-ensure-storage-encryption-test-sid'
$policyDescription = "HDCS restricts creation of Storage Accounts without Storage Service Encryption (256 bit AES encryption) enabled"

New-AzureRmPolicyDefinition -Name $policyName -Description $policyDescription -Policy "./policy.json"