<#
  Using GraphAPI and powershell I need to loop through pages to get all infomartion 

#>

# use a bool to know if we are starting on first page
[bool]$FirstPage = $true

# Looping
do
{
  if($FirstPage)
  {
    $Response = Invoke-RestMethod
    $FirstPage = $false
  }
  else
  {
    # Head to the next page link
    $apiURL = $nextLink
    $Response = Invoke-RestMethod
  }
  
  $nextLink = $Response.'@odata.nextlink'
  
  
  <#
    do the process of work you want with information from the $Response information as you will jump to next page once done till no more pages
  #>

}while ($nextLink -ne $null)






