# using ImportExcel

Import-Module ImportExcel


$xlFile = 'FilePath'
Remove-Item $xlFile -ErrorAction Ignore


$File = @()

$FileData = New-Object psobject

#Filling in our data and adding into the file array 
$FileData | add-member -MemberType NoteProperty -Name Name -Value 'John Smith'
$FileData | add-member -MemberType NoteProperty -Name UPN -Value 'Email@Email.Email'
$FileData | add-member -MemberType NoteProperty -Name Guid -Value '65465-4456654-564654564-654-654-6546-654'
$FileData | add-member -MemberType NoteProperty -Name Format -Value 'º'
$FileData | add-member -MemberType NoteProperty -Name Multiple -Value 'º'

$File += $FileData 

$FileData = New-Object psobject

#Filling in our data and adding into the file array 
$FileData | add-member -MemberType NoteProperty -Name Name -Value 'º'
$FileData | add-member -MemberType NoteProperty -Name UPN -Value 'º'
$FileData | add-member -MemberType NoteProperty -Name Guid -Value 'º'
$FileData | add-member -MemberType NoteProperty -Name Format -Value '¿'
$FileData | add-member -MemberType NoteProperty -Name Multiple -Value 'Per Row Item'

$File += $FileData 


$ConText = New-ConditionalText -Text 'º' -PatternType DarkGrid
$ConText2 = New-ConditionalText -Text '¿' -PatternType DarkHorizontal

$File | Export-Excel -Path $xlFile.ToString() -AutoSize -AutoFilter -Show -FreezeTopRow -PivotRows 'Guid' -IncludePivotChart -ConditionalText $ConText,$ConText2



<#
  Using the above we can loop around and have Dynamic Values to then be stored and outputed using the amazing Powershell Module ImportExcel 












#>


















