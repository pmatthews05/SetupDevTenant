#Download Microsoft Online Services Sign In Assistant for IT Proffessionals RTW x64
#https://www.microsoft.com/en-us/download/details.aspx?id=41950

#https://supertekboy.com/2018/11/07/connect-msolservice-may-fail-when-mfa-is-enabled/

<#
.SYNOPSIS
Add Users and assign licenses and import pictures.

If tempPassword isn't set the password will be P@55w0rd

You will need to connect to Azure AD first using Connect-AzureAD
You will need to connect to MSO using Connect-MsolService

.EXAMPLE

.\Set-UserAccountOnline.ps1 -Path:'.\AzureADUser.csv' -tenantDomain:'mytenant.onmicrosoft.com' -tempPassword:'U$kd8*2BG'
#>

param(
    # The path to the CSV file
    [Parameter(Mandatory)][string]$Path,

    # The tenant Domain
    [Parameter(Mandatory)][string]$TenantDomain,

    #The temporary password
    [string]$TempPassword
)
try {
    Import-Module AzureAD
    Import-Module MSOnline
}
catch {
    Write-Error "Unable to find Module AzureAD, or MSOnline"
    return
}

#Connect using Exchange Online Powershell
#Connect-EXOPSSession -UserPrincipalName pmatthews.admin@cfcode.onmicrosoft.com

$ErrorActionPreference = 'stop'

# Show basic information
$InformationPreference = 'continue'


Write-Information -MessageData:"$(Get-Date) Started populating photos the AD tenant for $TenantDomain."

@($(Import-Csv -path:$Path) | ForEach-Object {
        $UserCSV = $PSItem

        $User = Get-User -identity $UserCSV.UserPrincipalName
        $DisplayName = $UserCSV.GivenName + ' ' + $UserCSV.Surname
        $ImageName = $UserCSV.UserPrincipalName -replace '\.', ' '

        if (Test-Path -path:"$PSScriptRoot\UserImages\$ImageName.jpg") {
            Write-Information -MessageData:"Setting UserPhoto for $DisplayName"
            Set-UserPhoto -Identity $User -PictureData ([System.IO.File]::ReadAllBytes($pathtoPicture)) -Confirm:$false
        }
        else {
            Write-Warning -Message:"Unable to find picture for $DisplayName"
        }
})