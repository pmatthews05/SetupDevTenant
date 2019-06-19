

#https://supertekboy.com/2018/11/07/connect-msolservice-may-fail-when-mfa-is-enabled/

<#
.SYNOPSIS
Add Users and assign licenses and import pictures.

If tempPassword isn't set the password will be P@55w0rd

You will need to connect to Azure AD first using Connect-AzureAD
You will need to connect to MSO using Connect-MsolService

.EXAMPLE

.\Set-UserAccountsOnline.ps1 -Path:'.\data\AzureADUsers.csv' -tenantDomain:'mytenant.onmicrosoft.com' -tempPassword:'U$kd8*2BG'
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

$ErrorActionPreference = 'stop'

# Show basic information
$InformationPreference = 'continue'


Write-Host -MessageData:"$(Get-Date) Started populating the AD tenant for $TenantDomain."

#Setup temp password
$dummyPasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
if ([string]::IsNullOrEmpty($tempPassword)) {
    $tempPassword = "P@55w0rd"
}
$dummyPasswordProfile.Password = $tempPassword
$dummyPasswordProfile.ForceChangePasswordNextLogin = $true

$st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
$st.RelyingParty = "*"
$st.State = "Enabled"
$sta = @($st)



@($(Import-Csv -path:$Path) | ForEach-Object {
        $UserCSV = $PSItem

        #Changes "" values to $null
        foreach ($p in $UserCSV.PSObject.Properties) {
            if ($p.Value -eq [string]::Empty) {
                Write-Verbose "Replacing empty Property $($p.Name) value with null"
                $p.Value = $null
            }
        }
        try {
    
            $UPN = $UserCSV.UserPrincipalName + '@' + $TenantDomain
            $DisplayName = $UserCSV.GivenName + ' ' + $UserCSV.Surname
    
  
            $user = Get-AzureADUser -Filter "userPrincipalName eq '$UPN'" 
            if (!$user) {
                Write-Information -MessageData:"Creating user details $DisplayName"
                $user = New-AzureADUser  -UserPrincipalName $UPN `
                    -PasswordProfile $dummyPasswordProfile `
                    -AccountEnabled ([System.Convert]::ToBoolean($UserCSV.AccountEnabled)) `
                    -GivenName $UserCSV.GivenName `
                    -DisplayName $DisplayName `
                    -Surname $UserCSV.Surname `
                    -MailNickName $UserCSV.MailNickName `
                    -JobTitle $UserCSV.JobTitle `
                    -Department $UserCSV.Department `
                    -Mobile $UserCSV.Mobile `
                    -TelephoneNumber $UserCSV.Telephone `
                    -PhysicalDeliveryOfficeName $UserCSV.Office `
                    -StreetAddress $UserCSV.StreetAddress `
                    -City $UserCSV.City `
                    -Country $UserCSV.Country `
                    -State $UserCSV.State `
                    -PostalCode $UserCSV.PostCode `
                    -ShowInAddressList ([System.Convert]::ToBoolean($UserCSV.ShowInAddressList)) `
                    -UsageLocation $UserCSV.UsageLocation

                $createduser = $false
                do {
                    #Gives time for the account to be created before the next step runs.
                    Start-Sleep -Seconds 1
                    try
                    { 
                        Get-MsolUser -UserPrincipalName $UPN  
                        $createdUser = $true
                    }
                    catch{

                    }
                }while (!$createduser)
            }
            else {
                Write-Information -MessageData:"Updating user details $DisplayName"
                #Update user
                Set-AzureADUser -ObjectId $user.ObjectId `
                    -AccountEnabled ([System.Convert]::ToBoolean($UserCSV.AccountEnabled)) `
                    -GivenName $UserCSV.GivenName `
                    -DisplayName $DisplayName `
                    -Surname $UserCSV.Surname `
                    -MailNickName $UserCSV.MailNickName `
                    -JobTitle $UserCSV.JobTitle `
                    -Department $UserCSV.Department `
                    -Mobile $UserCSV.Mobile `
                    -TelephoneNumber $UserCSV.Telephone `
                    -PhysicalDeliveryOfficeName $UserCSV.Office `
                    -StreetAddress $UserCSV.StreetAddress `
                    -City $UserCSV.City `
                    -Country $UserCSV.Country `
                    -State $UserCSV.State `
                    -PostalCode $UserCSV.PostCode `
                    -ShowInAddressList ([System.Convert]::ToBoolean($UserCSV.ShowInAddressList)) `
                    -UsageLocation $UserCSV.UsageLocation
            }

            

            if ([System.Convert]::ToBoolean($UserCSV.MFAEnabled)) {  
                Write-Information -MessageData:"Enabling MFA for $DisplayName"
                Set-MsolUser -UserPrincipalName $UPN -StrongAuthenticationRequirements $sta
            }
            else {
                Write-Information -MessageData:"Disabling MFA for $DisplayName"
                Set-MsolUser -UserPrincipalName $UPN -StrongAuthenticationRequirements @()
            }
    
            #Assign Manager
            if ($UserCSV.Manager) {
                $manager = Get-AzureADUser -Filter "DisplayName eq '$($UserCsv.Manager)'"
                if ($manager) {
                    Write-Information -MessageData:"Found Manager and assigning for $DisplayName"
                    $UserManager = Set-AzureADUserManager -ObjectId $user.ObjectId -RefObjectId $manager.ObjectId 
                }
            }

            $license = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
            $licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses

            $SKU = Get-AzureADSubscribedSku | Where-Object -Property SkuPartNumber -Value $UserCSV.License -EQ
            if ($null -eq $SKU) {
                Write-Warning -Message:"No License type found called $($UserCSV.License)"
            }
            else {
                $license.SkuId = $SKU.SkuId
                $licenses.AddLicenses = $license

                if ($SKU.ConsumedUnits -ge $SKU.PrepaidUnits.Enabled) {
                    Write-Warning -Message:"No licenses of:$($UserCSV.License) available in Tenant"
                }
                else { 
                    Write-Information -MessageData:"Assigning license:$($UserCSV.License) to $DisplayName"
                    $remaining = $SKU.PrepaidUnits.Enabled - $SKU.ConsumedUnits
                    Set-AzureADUserLicense -ObjectId $user.ObjectId -AssignedLicenses $licenses
                    Write-Information -MessageData:"There are $($remaining-1) licenses $($UserCSV.License) left"
                }
            }
            $ImageName = $UserCSV.UserPrincipalName -replace '\.', ' '
            if (Test-Path -path:"$PSScriptRoot\UserImages\$ImageName.jpg") {
                Write-Information -MessageData:"Setting UserPhoto for $DisplayName"
                Set-AzureADUserThumbnailPhoto -ObjectId $user.ObjectId -FilePath "$PSScriptRoot\UserImages\$ImageName.jpg"
            }
            else {
                Write-Warning -Message:"Unable to find picture for $DisplayName"
            }
 
        }
        catch {
            $Exception = $PSItem
            Write-Warning -Message:"$Exception for User $($UserCSV.DisplayName) $($Exception.ScriptStackTrace)"
        }
    })

Write-Host "Finished uploading Data at $(Get-Date)"

