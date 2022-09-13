# As is sample change lines 6, 24, 29 to meet your needed values on conversions 
# line 6 change - this is your Hex value from msds-consistencyguid and or can be hex that you want to move to guid via immutableID
# line 24 change - this is your ImmutableID value from Cloud side objects that are synced
# line 29 change - this is your Guid as a string and not Hex we will convert this to Hex later
#HEX to ImmutableID
$HexToChange = "20 FD 35 FE 10 5E 3A 48 84 F6 F6 91 6C 12 55 2B"

## https://stackoverflow.com/questions/68503049/converting-a-hex-string-to-base-64-in-powershell
# Remove everything except word characters from the string.
# In effect, this removes any punctuation ('-', ':', '.')
$sanitizedHexStr = $HexToChange.ToString() -replace '\W'

Write-host "Object Hex Value from ms-ds-consistencyguid value onprem" $sanitizedHexStr

# Convert all hex-digit pairs in the string to an array of bytes.
$bytes = [byte[]] -split ($sanitizedHexStr -replace '..', '0x$& ')

# Get the Base64 encoding of the byte array.
$ImmutableString = [System.Convert]::ToBase64String($bytes)

Write-host "Object ImmutableID Value cloud side from Hex" $ImmutableString

#ImmutableID to Guid
$ImmutableToChange = "IP01/hBeOkiE9vaRbBJVKw=="
$Guid = [Guid]([Convert]::FromBase64String($ImmutableToChange.ToString()))

Write-Host "Object Guid value onprem side from ImmutableID" $Guid

$GuidToChange = "fe35fd20-5e10-483a-84f6-f6916c12552b"
$IMID = [Convert]::ToBase64String([guid]::New($GuidToChange.ToString()).ToByteArray())

Write-Host "Object ImmutableID cloud side value from Guid" $IMID

#Guid to Hex
$Guid = [guid]$GuidString.ToString()
#GUID to array of bytes then formatted into hex
$bytes = $Guid.ToByteArray()
$hexString = ($bytes|ForEach-Object ToString X2) -join ''

Write-Host "Object Hex value onperm side from Guid" $hexString
