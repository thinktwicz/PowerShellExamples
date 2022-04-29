# Populate with the App Registration details and Tenant ID
$clientid = ""
$tenantid = ""
$secret = ''
 
$body =  @{
    Grant_Type    = "client_credentials"
    Scope         = "https://graph.microsoft.com/.default"
    Client_Id     = $clientid
    Client_Secret = $secret
}
 
$connection = Invoke-RestMethod -Uri https://login.microsoftonline.com/$tenantid/oauth2/v2.0/token -Method POST -Body $body
 
$token = $connection.access_token
 
Connect-MgGraph -AccessToken $token
