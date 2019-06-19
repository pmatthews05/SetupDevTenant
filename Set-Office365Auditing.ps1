
<#
.SYNOPSIS
Turns on the Audit logs, and assign people to view them.

You will need to run this from Powershell Exchange.
You will need to connect usingConnect-EXOPSSession -UserPrincipalName
You will also need to run Enable-OrganizationCustomization first.
.EXAMPLE

.\Set-Office365Auditing.ps1 -Path:'.\data\ViewAuditUsers.csv' -TenantDomain:'<tenant>.onmicrosoft.com'
#>

param(
    # The path to the CSV file
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)][string]$TenantDomain
)

#Connect using Exchange Online Powershell

# Show basic information
$InformationPreference = 'continue'


Write-Information -MessageData:"$(Get-Date) Started populating photos the AD tenant for $TenantDomain."

Write-Information -MessageData:"Creating Group View Audits Only";
New-RoleGroup -Name "View Audits Only" -Roles "View-Only Audit Logs" -Description "Allow the users read only to the Audit Logs" -ErrorAction SilentlyContinue

@($(Import-Csv -path:$Path) | ForEach-Object {
        $UserCSV = $PSItem

        $UPN = $UserCSV.UserPrincipalName + '@' + $TenantDomain
        $displayName = $UserCSV.UserPrincipalName -replace '\.', ' '

        Add-RoleGroupMember -Identity "View Audits Only" -Member:$UPN -Confirm:$false -ErrorAction: SilentlyContinue
        Write-Information -MessageData:"$($UserCsv.UserPrincipalName) Added" 
    })
#Turn on Auditing
Write-Information -MessageData:"Turning on Auditing"
Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $true