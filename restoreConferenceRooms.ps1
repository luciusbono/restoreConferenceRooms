param($inputfile, $backupPath = [Environment]::GetFolderPath("Desktop")+'\'+'ConfBackupData-'+(Get-Date -format M-d-yyyy)+'.csv')

$data = Import-Csv $inputfile

#First, back up all the conference rooms that will be changed
$(Foreach ($item in $data)
{
	Get-ADUser $item.samaccountname -Properties samaccountname, givenname, sn, displayname
}) | select samaccountname, givenname, sn, displayname | Export-Csv $backupPath -NoTypeInformation

If (Test-Path $backupPath) { 
	Write-Host -NoNewline `n"A backup of conference rooms to be changed was created:" `n `n $backupPath `n `n
}

#Then, write changes to AD
Foreach ($item in $data)
{
	Get-ADUser -Identity $item.samaccountname | Set-ADUser -Replace @{samaccountname=$item.samaccountname;givenname=$item.givenname;sn=$item.sn;displayname=$item.DISPLAYNAME}
}