# SetupDevTenant
Scripts required to set up a dev tenant

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

### Set-SharePoint.ps1
- Uses PNP
- Create App Catalog
