<#
.SYNOPSIS
Add User photos to SharePoint UserProfile.

You will need to connect to your mysite root using PNP PowerShell
E.g Connect-PNPOnline -url:https://<tenant>-my.sharepoint.com -useweblogin 

.EXAMPLE

.\Set-UserPhotosInSharePoint.ps1 -Path:'.\AzureADUser.csv'
#>

param(
    # The path to the CSV file
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)][string]$TenantDomain    
)

<#
.SYNOPSIS
   Resize an image
.DESCRIPTION
   Resize an image based on a new given height or width or a single dimension and a maintain ratio flag. 
   The execution of this CmdLet creates a new file named "OriginalName_resized" and maintains the original
   file extension
.PARAMETER Width
   The new width of the image. Can be given alone with the MaintainRatio flag
.PARAMETER Height
   The new height of the image. Can be given alone with the MaintainRatio flag
.PARAMETER ImagePath
   The path to the image being resized
.PARAMETER MaintainRatio
   Maintain the ratio of the image by setting either width or height. Setting both width and height and also this parameter
   results in an error
.PARAMETER Percentage
   Resize the image *to* the size given in this parameter. It's imperative to know that this does not resize by the percentage but to the percentage of
   the image.
.PARAMETER SmoothingMode
   Sets the smoothing mode. Default is HighQuality.
.PARAMETER InterpolationMode
   Sets the interpolation mode. Default is HighQualityBicubic.
.PARAMETER PixelOffsetMode
   Sets the pixel offset mode. Default is HighQuality.
.EXAMPLE
   Resize-Image -Height 45 -Width 45 -ImagePath "Path/to/image.jpg"
.EXAMPLE
   Resize-Image -Height 45 -MaintainRatio -ImagePath "Path/to/image.jpg"
.EXAMPLE
   #Resize to 50% of the given image
   Resize-Image -Percentage 50 -ImagePath "Path/to/image.jpg"
.NOTES
   Written By: 
   Christopher Walker
#>
Function Resize-Image() {
    [CmdLetBinding(
        SupportsShouldProcess = $true, 
        PositionalBinding = $false,
        ConfirmImpact = "Medium",
        DefaultParameterSetName = "Absolute"
    )]
    Param (
        [Parameter(Mandatory = $True)]
        [ValidateScript( {
                $_ | ForEach-Object {
                    Test-Path $_
                }
            })][String[]]$ImagePath,
        [Parameter(Mandatory = $False)][Switch]$MaintainRatio,
        [Parameter(Mandatory = $False, ParameterSetName = "Absolute")][Int]$Height,
        [Parameter(Mandatory = $False, ParameterSetName = "Absolute")][Int]$Width,
        [Parameter(Mandatory = $False, ParameterSetName = "Percent")][Double]$Percentage,
        [Parameter(Mandatory = $False)][System.Drawing.Drawing2D.SmoothingMode]$SmoothingMode = "HighQuality",
        [Parameter(Mandatory = $False)][System.Drawing.Drawing2D.InterpolationMode]$InterpolationMode = "HighQualityBicubic",
        [Parameter(Mandatory = $False)][System.Drawing.Drawing2D.PixelOffsetMode]$PixelOffsetMode = "HighQuality",
        [Parameter(Mandatory = $True)][String]$Destination
    )
    Begin {
        If ($Width -and $Height -and $MaintainRatio) {
            Throw "Absolute Width and Height cannot be given with the MaintainRatio parameter."
        }
 
        If (($Width -xor $Height) -and (-not $MaintainRatio)) {
            Throw "MaintainRatio must be set with incomplete size parameters (Missing height or width without MaintainRatio)"
        }
 
        If ($Percentage -and $MaintainRatio) {
            Write-Warning "The MaintainRatio flag while using the Percentage parameter does nothing"
        }
    }
    Process {
        ForEach ($Image in $ImagePath) {
            $Path = (Resolve-Path $Image).Path
            $Dot = $Path.LastIndexOf(".")

       
            $OutputPath = $Destination
            
            $OldImage = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $Path
            # Grab these for use in calculations below. 
            $OldHeight = $OldImage.Height
            $OldWidth = $OldImage.Width
 
            If ($MaintainRatio) {
                $OldHeight = $OldImage.Height
                $OldWidth = $OldImage.Width
                If ($Height) {
                    $Width = $OldWidth / $OldHeight * $Height
                }
                If ($Width) {
                    $Height = $OldHeight / $OldWidth * $Width
                }
            }
 
            If ($Percentage) {
                $Product = ($Percentage / 100)
                $Height = $OldHeight * $Product
                $Width = $OldWidth * $Product
            }

            $Bitmap = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $Width, $Height
            $NewImage = [System.Drawing.Graphics]::FromImage($Bitmap)
             
            #Retrieving the best quality possible
            $NewImage.SmoothingMode = $SmoothingMode
            $NewImage.InterpolationMode = $InterpolationMode
            $NewImage.PixelOffsetMode = $PixelOffsetMode
            $NewImage.DrawImage($OldImage, $(New-Object -TypeName System.Drawing.Rectangle -ArgumentList 0, 0, $Width, $Height))

            If ($PSCmdlet.ShouldProcess("Resized image based on $Path", "save to $OutputPath")) {
                $Bitmap.Save($OutputPath)
            }
            
            $Bitmap.Dispose()
            $NewImage.Dispose()
        }
    }
}



$ProfilePathFolder = "user photos\profile pictures"
$ResizedImagePath = "\UserImages\Resized"
Write-Information -MessageData:"$(Get-Date) Started uploading User Profile photos the AD tenant for $TenantDomain."

if (-Not (Test-Path -Path:"$PSScriptRoot\$ResizedImagePath")) {
    New-Item -ItemType:Directory -Path:"$PSScriptRoot\$ResizedImagePath"
}

@($(Import-Csv -path:$Path) | ForEach-Object {
        $UserCSV = $PSItem

        $DisplayName = $UserCSV.GivenName + ' ' + $UserCSV.Surname
        $ImageName = $UserCSV.UserPrincipalName -replace '\.', ' '
        $OriginalImageName = "$PSScriptRoot\UserImages\$ImageName.jpg"
        if (Test-Path -path:$OriginalImageName) {

            
            Write-Information -MessageData:"Resizing Photo for  $DisplayName"
            $newFileName = $UserCSV.UserPrincipalName + '_' + $TenantDomain -replace '\.', '_'
            $LFilePath = "$PSScriptRoot\$ResizedImagePath\$newFileName" + "_LThumb.jpg" 
            $MFilePath = "$PSScriptRoot\$ResizedImagePath\$newFileName" + "_MThumb.jpg"
            $SFilePath = "$PSScriptRoot\$ResizedImagePath\$newFileName" + "_SThumb.jpg"

            #Large - Copy and Rename
            Copy-Item -Path:$OriginalImageName -Destination:$LFilePath
            #Medium
            Resize-Image -ImagePath $OriginalImageName -Height:72 -SmoothingMode:AntiAlias -MaintainRatio:$true `
                -Destination:$MFilePath
            #SMall
            Resize-Image -ImagePath $OriginalImageName -Height:48 -SmoothingMode:AntiAlias -MaintainRatio:$true `
                -Destination:$SFilePath

            #Upload To SharePoint Profile
            Write-Information -MessageData:"Uploading photos for $DisplayName to User Photos"
            Add-PnPFile -Path:$LFilePath -Folder:$ProfilePathFolder | Out-Null
            Add-PnPFile -Path:$MFilePath -Folder:$ProfilePathFolder | Out-Null
            Add-PnPFile -Path:$SFilePath -Folder:$ProfilePathFolder | Out-Null
        }
        else {
            Write-Warning -Message:"Unable to find picture for $DisplayName"
        }
        
    });



Write-Host "Finished uploading Data at $(Get-Date)"




