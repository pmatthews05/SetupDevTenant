
#Have to create App Catalog Manually.


$Parameters = Get-Content -Raw -Path $Path | ConvertFrom-Json
                
# Uses PNP
# Set Tenant settings
Set-PnPTenant -AllowDownloadingNonWebViewableFiles: "" `
    -AllowEditing: "" `
    -ApplyAppEnforcedRestrictionsToAdHocRecipients: "" `
    -BccExternalSharingInvitations: $($Parameters.BccExternalSharingInvitations) `
    -BccExternalSharingInvitationsList: $($Parameters.BccExternalSharingInvitationsList) `
    -CommentsOnSitePagesDisabled: "" `
    -ConditionalAccessPolicy: "" `
    -DefaultLinkPermission: "" `
    -DefaultSharingLinkType: "" `
    -DisallowInfectedFileDownload: "" `
    -DisplayStartASiteOption: $($Parameters.DisplayStartASiteOption) `
    -EmailAttestationReAuthDays: "" `
    -EmailAttestationRequired: "" `
    -EnableGuestSignInAcceleration: $($Parameters.EnableGuestSignInAcceleration) `
    -ExternalServicesEnabled:$($Parameters.ExternalServicesEnabled) `
    -FileAnonymousLinkType:"" `
    -FilePickerExternalImageSearchEnabled: "" `
    -FolderAnonymousLinkType: "" `
    -HideDefaultThemes: $($Parameters.HideDefaultThemes) `
    -IPAddressAllowList: "" `
    -IPAddressEnforcement: "" `
    -IPAddressWACTokenLifetime: "" `
    -LegacyAuthProtocolsEnabled: $($Parameters.LegacyAuthProtocolsEnabled) `
    -MaxCompatibilityLevel:"" `
    -MinCompatibilityLevel:"" `
    -NoAccessRedirectUrl:$($Parameters.NoAccessRedirectUrl) `
    -NotificationsInOneDriveForBusinessEnabled: "" `
    -NotificationsInSharePointEnabled: "" `
    -NotifyOwnersWhenInvitationsAccepted: "" `
    -NotifyOwnersWhenItemsReshared: "" `
    -ODBAccessRequests: "" `
    -ODBMembersCanShare: "" `
    -OfficeClientADALDisabled: $($Parameters.OfficeClientADALDisabled) `
    -OneDriveForGuestsEnabled: "" `
    -OneDriveStorageQuota: $($Parameters.OneDriveStorageQuota) `
    -OrphanedPersonalSitesRetentionPeriod: "" `
    -OwnerAnonymousNotification: "" `
    -PreventExternalUsersFromResharing: "" `
    -ProvisionSharedWithEveryoneFolder: $($Parameters.ProvisionSharedWithEveryoneFolder) `
    -PublicCdnAllowedFileTypes: "" `
    -PublicCdnEnabled: "" `
    -RequireAcceptingAccountMatchInvitedAccount: $($Parameters.RequireAcceptingAccountMatchInvitedAccount) `
    -RequireAnonymousLinksExpireInDays: "" `
    -SearchResolveExactEmailOrUPN: $($Parameters.SearchResolveExactEmailOrUPN) `
    -SharingAllowedDomainList: "" `
    -SharingBlockedDomainList: "" `
    -SharingCapability:$($Parameters.SharingCapability) `
    -SharingDomainRestrictionMode: "" `
    -ShowAllUsersClaim: $($Parameters.ShowAllUsersClaim) `
    -ShowEveryoneClaim: $($Parameters.ShowEveryoneClaim) `
    -ShowEveryoneExceptExternalUsersClaim: $($Parameters.ShowEveryoneExceptExternalUsersClaim) `
    -ShowPeoplePickerSuggestionsForGuestUsers: "" `
    -SignInAccelerationDomain: $($Parameters.SignInAccelerationDomain) `
    -SocialBarOnSitePagesDisabled: "" `
    -SpecialCharactersStateInFileFolderNames:"" `
    -StartASiteFormUrl: $($Parameters.StartASiteFormUrl) `
    -UseFindPeopleInPeoplePicker: "" `
    -UsePersistentCookiesForExplorerView: $($Parameters.UsePersistentCookiesForExplorerView) `
    -UserVoiceForFeedbackEnabled: $($Parameters.UserVoiceForFeedbackEnabled) `
   
Set-PnPTenantCdnEnabled -CdnType Public -Enable:$true
<#This sets 
*/MASTERPAGE
*/STYLE LIBRARY
*/CLIENTSIDEASSETS
#>