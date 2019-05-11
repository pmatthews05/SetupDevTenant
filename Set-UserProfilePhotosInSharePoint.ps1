<#
.SYNOPSIS
Add User photos to SharePoint UserProfile.

You will need to connect to your tenant using PNP PowerShell
E.g Connect-PNPOnline -url:https://<tenant>-admin.sharepoint.com -useweblogin 

.EXAMPLE

.\Set-UserProfilePhotosInSharePoint.ps1 -Path:'.\data\AzureADUsers.csv' -TenantDomain:'mytenant.onmicrosoft.com'
#>

param(
    # The path to the CSV file
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)][string]$TenantDomain    
)

$ProfilePathFolder = "user photos/profile pictures"

Write-Information -MessageData:"$(Get-Date) Started populating user Profile photos the AD tenant for $TenantDomain."

$tenantName = $TenantDomain.Split('\.')[0] 
$mysite = "https://{0}-my.sharepoint.com" -f $tenantName 

@($(Import-Csv -path:$Path) | ForEach-Object {
        $UserCSV = $PSItem

        $DisplayName = $UserCSV.GivenName + ' ' + $UserCSV.Surname
        $ImageName = $UserCSV.UserPrincipalName -replace '\.', ' '
        $OriginalImageName = "$PSScriptRoot\UserImages\$ImageName.jpg"
        $UPN = $UserCSV.UserPrincipalName + '@' + $TenantDomain

        if (Test-Path -path:$OriginalImageName) {
            $newFileName = $UserCSV.UserPrincipalName + '_' + $TenantDomain -replace '\.', '_'
            $LFilePath = "/$ProfilePathFolder/$newFileName" + "_LThumb.jpg" 
            $Url = $mySite + $LFilePath

            Set-PnPUserProfileProperty -Account:$UPN -PropertyName:"PictureURL" -Value:$Url
            Set-PnPUserProfileProperty -Account:$UPN -PropertyName:"SPS-PicturePlaceholderState" -Value:0
            
            #Upload To SharePoint Profile
            Write-Information -MessageData:"Update User Profile Photos for $DisplayName"
            
        }
        else {
            Write-Warning -Message:"Unable to find picture for $DisplayName"
        }
        
    });



Write-Host "Finished uploading Data at $(Get-Date)"