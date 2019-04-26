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
Set-PnPTenant -AllowDownloadingNonWebViewableFiles: $($Parameters.AllowDownloadingNonWebViewableFiles) `
    -AllowEditing: $($Parameters.AllowEditing) `
    -ApplyAppEnforcedRestrictionsToAdHocRecipients: $($Parameters.ApplyAppEnforcedRestrictionsToAdHocRecipients) `
    -BccExternalSharingInvitations: $($Parameters.BccExternalSharingInvitations) `
    -BccExternalSharingInvitationsList: $($Parameters.BccExternalSharingInvitationsList) `
    -CommentsOnSitePagesDisabled: $($Parameters.CommentsOnSitePagesDisabled) `
    -ConditionalAccessPolicy: $($Parameters.ConditionalAccessPolicy) `
    -DefaultLinkPermission: $($Parameters.DefaultLinkPermission) `
    -DefaultSharingLinkType: $($Parameters.DefaultSharingLinkType) `
    -DisallowInfectedFileDownload: $($Parameters.DisallowInfectedFileDownload) `
    -DisplayStartASiteOption: $($Parameters.DisplayStartASiteOption) `
    -EmailAttestationReAuthDays: $($Parameters.EmailAttestationReAuthDays) `
    -EmailAttestationRequired: $($Parameters.EmailAttestationRequired) `
    -EnableGuestSignInAcceleration: $($Parameters.EnableGuestSignInAcceleration) `
    -ExternalServicesEnabled: $($Parameters.ExternalServicesEnabled) `
    -FileAnonymousLinkType: $($Parameters.FileAnonymousLinkType) `
    -FilePickerExternalImageSearchEnabled: $($Parameters.FilePickerExternalImageSearchEnabled) `
    -FolderAnonymousLinkType: $($Parameters.FolderAnonymousLinkType) `
    -HideDefaultThemes: $($Parameters.HideDefaultThemes) `
    -IPAddressAllowList: $($Parameters.IPAddressAllowList) `
    -IPAddressEnforcement: $($Parameters.IPAddressEnforcement) `
    -IPAddressWACTokenLifetime: $($Parameters.IPAddressWACTokenLifetime) `
    -LegacyAuthProtocolsEnabled: $($Parameters.LegacyAuthProtocolsEnabled) `
    -NoAccessRedirectUrl:$($Parameters.NoAccessRedirectUrl) `
    -NotificationsInOneDriveForBusinessEnabled: $($Parameters.NotificationsInOneDriveForBusinessEnabled) `
    -NotificationsInSharePointEnabled: $($Parameters.NotificationsInSharePointEnabled) `
    -NotifyOwnersWhenInvitationsAccepted: $($Parameters.NotifyOwnersWhenInvitationsAccepted) `
    -NotifyOwnersWhenItemsReshared: $($Parameters.NotifyOwnersWhenItemsReshared) `
    -ODBAccessRequests: $($Parameters.ODBAccessRequests) `
    -ODBMembersCanShare: $($Parameters.ODBMembersCanShare) `
    -OfficeClientADALDisabled: $($Parameters.OfficeClientADALDisabled) `
    -OneDriveForGuestsEnabled: $($Parameters.OneDriveForGuestsEnabled) `
    -OneDriveStorageQuota: $($Parameters.OneDriveStorageQuota) `
    -OrphanedPersonalSitesRetentionPeriod: $($Parameters.OrphanedPersonalSitesRetentionPeriod) `
    -OwnerAnonymousNotification: $($Parameters.OwnerAnonymousNotification) `
    -PreventExternalUsersFromResharing: $($Parameters.PreventExternalUsersFromResharing) `
    -ProvisionSharedWithEveryoneFolder: $($Parameters.ProvisionSharedWithEveryoneFolder) `
    -PublicCdnAllowedFileTypes:  $($Parameters.PublicCdnAllowedFileTypes) `
    -PublicCdnEnabled:  $($Parameters.PublicCdnEnabled) `
    -RequireAcceptingAccountMatchInvitedAccount: $($Parameters.RequireAcceptingAccountMatchInvitedAccount) `
    -RequireAnonymousLinksExpireInDays: $($Parameters.RequiredAnonymousLinksExpireInDays) `
    -SearchResolveExactEmailOrUPN: $($Parameters.SearchResolveExactEmailOrUPN) `
    -SharingAllowedDomainList: $($Parameters.SharingAllowedDomainList) `
    -SharingBlockedDomainList: $($Parameters.SharingBlockedDomainList) `
    -SharingCapability:$($Parameters.SharingCapability) `
    -SharingDomainRestrictionMode: $($Parameters.SharingDomainRestrictionMode) `
    -ShowAllUsersClaim: $($Parameters.ShowAllUsersClaim) `
    -ShowEveryoneClaim: $($Parameters.ShowEveryoneClaim) `
    -ShowEveryoneExceptExternalUsersClaim: $($Parameters.ShowEveryoneExceptExternalUsersClaim) `
    -ShowPeoplePickerSuggestionsForGuestUsers: $($Parameters.ShowPeoplePickerSuggestionsForGuestUsers) `
    -SignInAccelerationDomain: $($Parameters.SignInAccelerationDomain) `
    -SocialBarOnSitePagesDisabled: $($Parameters.SocialBarOnSitePagesDisabled) `
    -SpecialCharactersStateInFileFolderNames: $($Parameters.SpecialCharactersStateInFileFolderNames) `
    -StartASiteFormUrl: $($Parameters.StartASiteFormUrl) `
    -UseFindPeopleInPeoplePicker: $($Parameters.UseFindPeopleInPeoplePicker) `
    -UsePersistentCookiesForExplorerView: $($Parameters.UsePersistentCookiesForExplorerView) `
    -UserVoiceForFeedbackEnabled: $($Parameters.UserVoiceForFeedbackEnabled) `
  
<#This sets 
*/MASTERPAGE
*/STYLE LIBRARY
*/CLIENTSIDEASSETS
#>
Write-Information -MessageData "Setting Public CDN to enabled = $($Parameters.PublicCdnEnabled)"
Set-PnPTenantCdnEnabled -CdnType Public -Enable:$Parameters.PublicCdnEnabled

Write-Host "Finished setting tenant settings at $(Get-Date)"