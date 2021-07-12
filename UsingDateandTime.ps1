<#

Example 1 - We are connecting to an API and have a Token that needs to be refreshed as it will expire in an hour

#>

# After you get the Token for you API get the current date and time - Get-Date
$TokenRefreshTime = Get-Date

# To find out the Difference we take our TokenRefreshTime and compare it to the current date and time
$TokenDifference = New-TimeSpan -Start $TokenRefreshTime -End (Get-Date)

# Check to see if 30mins have passed. If true then we need to call a refresh on the API token and then update time out time
# this is done while in a loop
if($TokenDifference.Minutes -ge 30)
{
  # its been more than 30 mins our token will expire in an hour so lets refresh it - below line is not real replace with correct token refresh call you use
  $Token = RefreshToken()
  
  # We need to now update our Token to the new time
  $TokenRefreshTime = Get-Date
}


<#

Example 2 - How long did the script take to run and display it 

#>

# At the start of the script get the current date and time
$ScriptStartTime = Get-Date

# At the end of the script find the difference and display it
$ScriptRunTime = New-TimeSpan -Start $ScriptSartTime -End Get-Date

Write-Host "Run Time:" "Days:" $ScriptRunTime.Days "Hours" $ScriptRunTime.Hours "Minutes:" $ScriptRunTime.Minutes "Seconds:" $ScriptRunTime.Seconds

# make a custom friendly timestring : :: - ~ _ - ; [] {} d,h,m,s pick your own format the power is yours :D
$TimeString = $ScriptRunTime.Days.toString() + ':' + $ScriptRunTime.Hours.toString() + ':' + $ScriptRunTime.Minutes.toString() + ':' + $ScriptRunTime.Seconds.toString()

Write-Host $TimeString

