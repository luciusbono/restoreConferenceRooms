param($backupPath)

#Revert changes via backup file
$BackupData = Import-Csv $backupPath

Foreach ($BackupUser in $BackupData)
{
	Get-ADUser -Identity $item.samaccountname | Set-ADUser -Replace @{samaccountname=$item.samaccountname;givenname=$item.givenname;sn=$item.sn;displayname=$item.DISPLAYNAME}
}