
<#
  Ways to Handle Errors in Powershell depends on what you are using calling and how its presented back to you varry. 
  
  -ErrorAction
  Stop - Stop Processing Lines of Code till this is solved or handled 
  Continue - Keep on chugging through but report
  Silentlycontinue - Dont show me anything if errors do happen

#>


<#

Using Powershell to talk with AD or computer in general

To determin the exception type to catch specifically on an error use this command to bring up the last error on the error stack 
$Error[0].Exception.GetType().FullName this will return the Error Object Base so if we made a call to Get-ADUser and you got User Not Found this would return
Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException we can then 'Catch' this and take action

#>

<#

Example 1 - I have to create new users but dont know if the name is open for use in active directory

If we do a Get with the UPN or SamAccountName we want to create and if if comes back with an error we know we can then use it

#>

try
{
  Get-ADUser $userName -ErrorAction Continue
  
  # If we make it to here then the username was found and we can use it to create this new JohnSmith user
  Write-Host "Username in use, logging this out for newuser creation to a file"
  
}
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
{
  # This user name was not found so we can then use it and create a new user
  CreateNewUser($UserDetails)
}
catch
{
  # if something else happens we need to lookup the error and we can then action on it 
  Write-Host "Something went Wrong º¿º Try-Catch block lines to lines - Default catch all catch"
}


<#

Example 2 - I user the Microsoft GraphAPI with Powershell and need the response errors
I have only messed around and played with two of them 

$Error[0].Exception.Message
$errorCode = ConvertFrom-Json $Error[0].ErrorDetails.Message
$errorCode.error.message

#>





