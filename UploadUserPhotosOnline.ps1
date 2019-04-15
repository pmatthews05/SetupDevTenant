#Connect using Exchange Online Powershell
#Connect-EXOPSSession -UserPrincipalName pmatthews.admin@cfcode.onmicrosoft.com

$User = Get-User -identity pmatthews.admin

$pathtoPicture = "C:\users\MrPau\Downloads\CreateUserAccounts\UserImages\Andrew Ma.jpg"

Set-UserPhoto -Identity Steve.Harris -PictureData ([System.IO.File]::ReadAllBytes($pathtoPicture)) -Confirm:$false