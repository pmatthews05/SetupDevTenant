<#
.SYNOPSIS
Add User photos to Exchange, this will allow photos to appear in DELVE and SharePoint.

You will need to run this from Powershell Exchange.
You will need to connect usingConnect-EXOPSSession -UserPrincipalName

.EXAMPLE

.\Set-UserPhotosInExchange.ps1 -Path:'.\data\AzureADUser.csv' -TenantDomain:'mytenant.onmicrosoft.com'
#>

param(
    # The path to the CSV file
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)][string]$TenantDomain
)

#Connect using Exchange Online Powershell

$ErrorActionPreference = 'stop'

# Show basic information
$InformationPreference = 'continue'


Write-Information -MessageData:"$(Get-Date) Started populating photos the AD tenant for $TenantDomain."

@($(Import-Csv -path:$Path) | ForEach-Object {
        $UserCSV = $PSItem

        $DisplayName = $UserCSV.GivenName + ' ' + $UserCSV.Surname
        $ImageName = $UserCSV.UserPrincipalName -replace '\.', ' '

        try {
            Get-User -Identity $UserCSV.UserPrincipalName
        }
        catch {
            Write-Error "Unable to find user $DisplayName"    
        }


        if (Test-Path -path:"$PSScriptRoot\UserImages\$ImageName.jpg") {
            Write-Information -MessageData:"Setting UserPhoto for $DisplayName"
            $pathtoPicture = "$PSScriptRoot\UserImages\$ImageName.jpg"
            Set-UserPhoto -Identity $UserCSV.UserPrincipalName -PictureData ([System.IO.File]::ReadAllBytes($pathtoPicture)) -Confirm:$false
        }
        else {
            Write-Warning -Message:"Unable to find picture for $DisplayName"
        }
})


Write-Host "Finished uploading Data at $(Get-Date)"