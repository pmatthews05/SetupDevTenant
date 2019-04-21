
#Have to create App Catalog Manually.

                
# Uses PNP
# Set Tenant settings
Set-PnPTenant -AllowDownloadingNonWebViewableFiles: "" `
    -AllowEditing: "" `
    -ApplyAppEnforcedRestrictionsToAdHocRecipients: "" `
    -BccExternalSharingInvitations: "" `
    -BccExternalSharingInvitationsList: "" `
    -CommentsOnSitePagesDisabled: "" `
    -ConditionalAccessPolicy: "" `
    -DefaultLinkPermission: "" `
    -DefaultSharingLinkType: "" `
    -DisallowInfectedFileDownload: "" `
    -DisplayStartASiteOption: "" `
    -EmailAttestationReAuthDays: "" `
    -EmailAttestationRequired: "" `
    -EnableGuestSignInAcceleration: "" `
    -ExternalServicesEnabled:"" `
    -FileAnonymousLinkType:"" `
    -FilePickerExternalImageSearchEnabled: "" `
    -FolderAnonymousLinkType: "" `
    -HideDefaultThemes: "" `
    -IPAddressAllowList: "" `
    -IPAddressEnforcement: "" `
    -IPAddressWACTokenLifetime: "" `
    -LegacyAuthProtocolsEnabled: "" `
    -MaxCompatibilityLevel:"" `
    -MinCompatibilityLevel:"" `
    -NoAccessRedirectUrl:"" `
    -NotificationsInOneDriveForBusinessEnabled: "" `
    -NotificationsInSharePointEnabled: "" `
    -NotifyOwnersWhenInvitationsAccepted: "" `
    -NotifyOwnersWhenItemsReshared: "" `
    -ODBAccessRequests: "" `
    -ODBMembersCanShare: "" `
    -OfficeClientADALDisabled: "" `
    -OneDriveForGuestsEnabled: "" `
    -OneDriveStorageQuota: "" `
    -OrphanedPersonalSitesRetentionPeriod: "" `
    -OwnerAnonymousNotification: "" `
    -PreventExternalUsersFromResharing: "" `
    -ProvisionSharedWithEveryoneFolder: "" `
    -PublicCdnAllowedFileTypes: "" `
    -PublicCdnEnabled: "" `
    -RequireAcceptingAccountMatchInvitedAccount: "" `
    -RequireAnonymousLinksExpireInDays: "" `
    -SearchResolveExactEmailOrUPN: "" `
    -SharingAllowedDomainList: "" `
    -SharingBlockedDomainList: "" `
    -SharingCapability:"" `
    -SharingDomainRestrictionMode: "" `
    -ShowAllUsersClaim: "" `
    -ShowEveryoneClaim: "" `
    -ShowEveryoneExceptExternalUsersClaim: "" `
    -ShowPeoplePickerSuggestionsForGuestUsers: "" `
    -SignInAccelerationDomain: "" `
    -SocialBarOnSitePagesDisabled: "" `
    -SpecialCharactersStateInFileFolderNames:"" `
    -StartASiteFormUrl: "" `
    -UseFindPeopleInPeoplePicker: "" `
    -UsePersistentCookiesForExplorerView: "" `
    -UserVoiceForFeedbackEnabled: "" `
   

# Setup Public CDN
