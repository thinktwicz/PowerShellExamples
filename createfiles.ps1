


$File = @()

$FileData = New-Object PSObject 
$FileData | Add-member -Type NoteProperty -Name 'MyVar1Name' -Value $myVar1
$FileData | Add-member -Type NoteProperty -Name 'MyVar2Name' -Value $myVar2

$File += $FileData

$File | export-csv .\myfile.csv
