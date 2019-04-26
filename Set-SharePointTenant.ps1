<#
.SYNOPSIS
Update Tenant Parameters, and enabling Public CDN

You will need to connect to https://<tenant>-admin.sharepoint.com first using Connect-PNPOnline

.EXAMPLE

.\Set-SharePointTenant.ps1 -SettingsPath:'.\Settings\SPTenantSettings.json'
#>

param(
    # The path to the Json file
    [Parameter(Mandatory)][string]$SettingsPath
)

#Have to create App Catalog Manually.
Write-Host -MessageData:"Started setting tenant settings at $(Get-Date)"

$Parameters = Get-Content -Raw -Path $SettingsPath | ConvertFrom-Json
                
# Uses PNP
# Set Tenant settings
Set-PnPTenant -ExternalServicesEnabled: $($Parameters.ExternalServicesEnabled) `
    -NoAccessRedirectUrl:$($Parameters.NoAccessRedirectUrl) `
    -SharingCapability:$($Parameters.SharingCapability) `
    -DisplayStartASiteOption: $($Parameters.DisplayStartASiteOption) `
    -StartASiteFormUrl: $($Parameters.StartASiteFormUrl) `
    -ShowEveryoneClaim: $($Parameters.ShowEveryoneClaim) `
    -ShowAllUsersClaim: $($Parameters.ShowAllUsersClaim) `
    -ShowEveryoneExceptExternalUsersClaim: $($Parameters.ShowEveryoneExceptExternalUsersClaim) `
    -SearchResolveExactEmailOrUPN: $($Parameters.SearchResolveExactEmailOrUPN) `
    -OfficeClientADALDisabled: $($Parameters.OfficeClientADALDisabled) `
    -LegacyAuthProtocolsEnabled: $($Parameters.LegacyAuthProtocolsEnabled) `
    -RequireAcceptingAccountMatchInvitedAccount: $($Parameters.RequireAcceptingAccountMatchInvitedAccount) `
    -ProvisionSharedWithEveryoneFolder: $($Parameters.ProvisionSharedWithEveryoneFolder) `
    -UsePersistentCookiesForExplorerView: $($Parameters.UsePersistentCookiesForExplorerView) `
    -BccExternalSharingInvitations: $($Parameters.BccExternalSharingInvitations) `
    -BccExternalSharingInvitationsList: $($Parameters.BccExternalSharingInvitationsList) `
    -UserVoiceForFeedbackEnabled: $($Parameters.UserVoiceForFeedbackEnabled) `
    -RequireAnonymousLinksExpireInDays: $($Parameters.RequiredAnonymousLinksExpireInDays) `
    -SharingAllowedDomainList: $($Parameters.SharingAllowedDomainList) `
    -SharingBlockedDomainList: $($Parameters.SharingBlockedDomainList) `
    -SharingDomainRestrictionMode: $($Parameters.SharingDomainRestrictionMode) `
    -OneDriveStorageQuota: $($Parameters.OneDriveStorageQuota) `
    -IPAddressAllowList: $($Parameters.IPAddressAllowList) `
    -IPAddressEnforcement: $($Parameters.IPAddressEnforcement) `
    -IPAddressWACTokenLifetime: $($Parameters.IPAddressWACTokenLifetime) `
    -DefaultSharingLinkType: $($Parameters.DefaultSharingLinkType) `
    -ODBMembersCanShare: $($Parameters.ODBMembersCanShare) `
    -ODBAccessRequests: $($Parameters.ODBAccessRequests) `
    -PreventExternalUsersFromResharing: $($Parameters.PreventExternalUsersFromResharing) `
    -ShowPeoplePickerSuggestionsForGuestUsers: $($Parameters.ShowPeoplePickerSuggestionsForGuestUsers) `
    -FileAnonymousLinkType: $($Parameters.FileAnonymousLinkType) `
    -FolderAnonymousLinkType: $($Parameters.FolderAnonymousLinkType) `
    -NotifyOwnersWhenItemsReshared: $($Parameters.NotifyOwnersWhenItemsReshared) `
    -NotifyOwnersWhenInvitationsAccepted: $($Parameters.NotifyOwnersWhenInvitationsAccepted) `
    -NotificationsInOneDriveForBusinessEnabled: $($Parameters.NotificationsInOneDriveForBusinessEnabled) `
    -NotificationsInSharePointEnabled: $($Parameters.NotificationsInSharePointEnabled) `
    -OwnerAnonymousNotification: $($Parameters.OwnerAnonymousNotification) `
    -CommentsOnSitePagesDisabled: $($Parameters.CommentsOnSitePagesDisabled) `
    -SocialBarOnSitePagesDisabled: $($Parameters.SocialBarOnSitePagesDisabled) `
    -DisallowInfectedFileDownload: $($Parameters.DisallowInfectedFileDownload) `
    -DefaultLinkPermission: $($Parameters.DefaultLinkPermission) `
    -ApplyAppEnforcedRestrictionsToAdHocRecipients: $($Parameters.ApplyAppEnforcedRestrictionsToAdHocRecipients) `
    -FilePickerExternalImageSearchEnabled: $($Parameters.FilePickerExternalImageSearchEnabled) `
    -EmailAttestationRequired: $($Parameters.EmailAttestationRequired) `
    -EmailAttestationReAuthDays: $($Parameters.EmailAttestationReAuthDays) `
    -HideDefaultThemes: $($Parameters.HideDefaultThemes) `
    -SpecialCharactersStateInFileFolderNames: $($Parameters.SpecialCharactersStateInFileFolderNames) `
    -UseFindPeopleInPeoplePicker: $($Parameters.UseFindPeopleInPeoplePicker) `

if ($Parameters.EnableGuestSignInAcceleration) {
    Set-PnPTenant  -SignInAccelerationDomain: $($Parameters.SignInAccelerationDomain) `
        -EnableGuestSignInAcceleration: $($Parameters.EnableGuestSignInAcceleration)
}

# Needs a confirm.
Set-PnPTenant -OneDriveForGuestsEnabled: $($Parameters.OneDriveForGuestsEnabled) 
Set-PnPTenant -OrphanedPersonalSitesRetentionPeriod: $($Parameters.OrphanedPersonalSitesRetentionPeriod) 

# Needs Itune and Azure Directory Premium Subscriptions
#TODO: Work out how to check if licenses are available before running.
#Set-PnPTenant -ConditionalAccessPolicy: $($Parameters.ConditionalAccessPolicy) 
#Set-PnPTenant -AllowDownloadingNonWebViewableFiles: $($Parameters.AllowDownloadingNonWebViewableFiles) 
#Set-PnPTenant -AllowEditing: $($Parameters.AllowEditing) `
  
  
<#This sets 
*/MASTERPAGE
*/STYLE LIBRARY
*/CLIENTSIDEASSETS
#>
Write-Information -MessageData "Setting Public CDN to enabled = $($Parameters.PublicCdnEnabled)"
Set-PnPTenantCdnEnabled -CdnType Public -Enable:$Parameters.PublicCdnEnabled
if($Parameters.PublicCdnEnabled)
{
    Set-PnPTenantCdnPolicy -CdnType Public -PolicyType:IncludeFileExtensions -PolicyValue:$($Parameters.PublicCdnAllowedFileTypes) 
    
    $Parameters.PublicCdnOrigins | ForEach-Object{
        Add-PnPTenantCdnOrigin -CdnType Public -OriginUrl $PSItem -ErrorAction:SilentlyContinue
    }
    
}

Write-Host "Finished setting tenant settings at $(Get-Date)"