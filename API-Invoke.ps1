

#Connection of lists of objects we work on figured out
#

#the correct formated URL API enpoint to invooke on

#example header
$headers  = @{Authorization = "Bearer $($MSALtoken.accesstoken)" }

#h
#$headers =  your method as needed to invoke 
$apiUrl = "" #endpoint url
# body of request
$RequestBody = @{

            #
            Uri = $apiUrl
            headers  = $headers
            method = 'GET'
            Contenttype = "application/json" 
       
}
#//

try
{
    $Response = Invoke-RestMethod @RequestBody -ErrorAction Stop
}
catch [System.Net.WebException]
{}


<#
$count = 0
foreach($item in $response)
{

    #$item.'@odata.context'
    #$item.value
    $count
    $count++
    
}
#>

$Response | fl

$JSponse = $Response.value | ConvertTo-Json

$devices = $JSponse | ConvertFrom-Json

$count = 0
foreach($item in $devices)
{
$count

$item


$count++
}











