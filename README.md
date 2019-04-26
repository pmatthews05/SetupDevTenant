# SetupDevTenant
Scripts required to set up a dev tenant

## What you cannot do with script
- Create a Tenant App Catalog
- Set Organization Details
- Set Login Branding
- Set Tenant Branding


### Set-UserAccountsOnline.ps1
- Creates users from CSV
- Assigns License
- Enables the Account for MFA
- Uploads Photo to AAD

### Set-UserPhotosInExchange.ps1
- Requires "Microsoft Exchange Online PowerShell"
- Uploads photo to Exchange Online.

### Set-UserPhotosInSharePoint.ps1
- Uploads photos to root of the mysites

### Set-UserProfilePhotosInSharePoint.ps1
- After running Set-UserPhotosInSharePoint
- Updates the user profile properties

### Set-Office365Auditing.ps1
- Requires "Microsoft Exchange Online PowerShell"
- Creates a Group and assign users
- Enable auditing

### Set-SharePointTenant.ps1
- Uses PNP
- Set Tenant settings
- Setup Public CDN
