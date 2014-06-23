restoreConferenceRooms
======================

This is a quick script that was written to undo some changes that were made to our Active Directory Infrastructure. It can be pretty easily adapted to make bulk changes. 

USAGE -- restoreConferenceRooms [input CSV path][OPTIONAL: Backup file path]

REQUIREMENTS: Powershell 2.0 or above (including in Windows 7 and Windows 8/8.1). Active Directory Users and Computers, or Remote Server Administration Tools

RSAT for Windows 8.1: http://www.microsoft.com/en-us/download/details.aspx?id=39296

RSAT for Windows 8: http://www.microsoft.com/en-us/download/details.aspx?id=28972

RSAT for Windows 7: http://www.microsoft.com/en-us/download/details.aspx?id=7887

This script was designed to undo a bulk change that was made to all of the conference room user objects in an enterprise's domain. The script is very simple: it takes the following parameters from a CSV and replaces the active object's properties: samaccountname, givenname, sn, displayname.

The script creates a backup of the active objects in the domain it will change, and backs up only the attributes it will change. A second script: restoreBackup.ps1 can be used to restore the changes if the script makes an error. The backup script usage is as follows:

restoreBackup [input CSV Path]

This script can be easily modified to do other bulk changes. 