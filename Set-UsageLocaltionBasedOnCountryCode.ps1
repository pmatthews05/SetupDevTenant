<#
.SYNOPSIS
Set Office 365 Usage Location Based on Active Directory Country Code

.DESCRIPTION
This script will set the WAAD User Usage Location based on the country field 
synchronized from Active Directory through DirSync.  This script needs to be run 
once connected to the Office 365 tenant.

.EXAMPLE
.\Set-UsageLocationBasedOnCountryCode.ps1

.LINK
Gallery at http://gallery.technet.microsoft.com/Set-Office-365-Usage-4a0121a7

.NOTES
2018-08-15	Updated with new logging and parameter options
2016-07-22	Original release

#>
[CmdletBinding(DefaultParameterSetName="Report")]
param (
	[parameter(ParameterSetName = "Report")][switch]$Report,
	[parameter(ParameterSetName = "Update")][switch]$Update,
	[string]$Logfile = (Get-Date -Format yyyy-MM-dd) + "_SetUsageLocation.txt"
)

$header = "TimeStamp,LogLevel,UserPrincipalName,CurrentCountryValue,CurrentUsageLocationValue,NewUsageLocationValue"
$header | Out-File -Append $Logfile

function Write-LogCSV([string[]]$Message, [string]$LogFile = $Script:LogFile, [switch]$ConsoleOutput, [ValidateSet("SUCCESS", "INFO", "WARN", "ERROR", "DEBUG")][string]$LogLevel)
{
	$Message = $Message + $Input
	If (!$LogLevel) { $LogLevel = "INFO" }
	switch ($LogLevel)
	{
		SUCCESS { $Color = "Green" }
		INFO { $Color = "White" }
		WARN { $Color = "Yellow" }
		ERROR { $Color = "Red" }
		DEBUG { $Color = "Gray"} 
	}
	if ($Message -ne $null -and $Message.Length -gt 0)
	{
		$TimeStamp = [System.DateTime]::Now.ToString("yyyy-MM-dd HH:mm:ss")
		if ($LogFile -ne $null -and $LogFile -ne [System.String]::Empty)
		{
			Out-File -Append -FilePath $LogFile -InputObject "$($TimeStamp),$($LogLevel),$($Message)"
		}
		if ($ConsoleOutput -eq $true)
		{
			Write-Host "[$TimeStamp] [$LogLevel] :: $Message" -ForegroundColor $Color
		}
	}
}

Switch ($PsCmdlet.ParameterSetName)
{
	Report {
		"You have selected Report Mode."
		Get-MsolUser -All | ForEach {
			If ($_.Country -imatch "UNITED STATES" -or $_.Country -match "^US$" -or $_.Country -match "U.S.") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ANDORRA" -or $_.Country -match "ANDORA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "UNITED ARAB EMIRATES" -or $_.Country -match "UAE" -or $_.Country -match "U.A.E.") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "AFGHANISTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ANTIGUA AND BARBUDA" -or $_.Country -match "ANTIGUA" -or $_.Country -match "BARBUDA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ANGUILLA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ALBANIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ARMENIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ANGOLA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ANTARCTICA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ARGENTINA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "AMERICAN SAMOA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "AUSTRIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "AUSTRALIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ARUBA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ÅLAND ISLANDS" -or $_.Country -match "ALAND ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "AZERBAIJAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BOSNIA AND HERZEGOVINA" -or $_.Country -match "BOSNIA" -or $_.Country -match "HERZEGOVINA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BARBADOS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BANGLADESH") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BELGIUM") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BURKINA FASO" -or $_.Country -match "BURKINA" -or $_.Country -match "BURKINAFASO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BULGARIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BAHRAIN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BURUNDI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BENIN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAINT BARTHÉLEMY" -or $_.Country -match "SAINT BARTHELEMY" -or $_.Country -match "ST BARTHELEMY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BERMUDA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BRUNEI DARUSSALAM" -or $_.Country -match "BRUNEI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BOLIVIA, PLURINATIONAL STATE OF" -or $_.Country -match "BOLIVIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BONAIRE, SINT EUSTATIUS AND SABA" -or $_.Country -match "BONAIRE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BRAZIL" -or $_.Country -match "BRASIL") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BAHAMAS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BHUTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BOUVET ISLAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BOTSWANA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BELARUS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BELIZE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CANADA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "COCOS (KEELING) ISLANDS" -or $_.Country -match "COCOS" -or $_.Country -match "KEELING") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CONGO, THE DEMOCRATIC REPUBLIC OF THE" -or $_.Country -match "CONGO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CENTRAL AFRICAN REPUBLIC") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CONGO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SWITZERLAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CÔTE D'IVOIRE" -or $_.Country -match "COTE DIVOIRE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "COOK ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CHILE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CAMEROON") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CHINA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "COLOMBIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "COSTA RICA" -or $_.Country -match "COSTARICA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CUBA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CAPE VERDE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CURAÇAO" -or $_.Country -match "CURACAO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CHRISTMAS ISLAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CYPRUS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CZECH REPUBLIC" -or $_.Country -match "CZECH") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GERMANY" -or $_.Country -match "DEUTSCHLAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "DJIBOUTI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "DENMARK") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "^DOMINICAN REPUBLIC$") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "^DOMINICA$") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ALGERIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ECUADOR") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ESTONIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "EGYPT") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "WESTERN SAHARA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ERITREA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SPAIN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ETHIOPIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FINLAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FIJI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FALKLAND ISLANDS (MALVINAS)" -or $_.Country -match "FALKLAND ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MICRONESIA, FEDERATED STATES OF" -or $_.Country -match "MICRONESIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FAROE ISLANDS" -or $_.Country -match "FAROE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FRANCE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GABON") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "UNITED KINGDOM" -or $_.Country -match "UK" -or $_.Country -match "U.K." -or $_.Country -match "GREAT BRITAIN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GRENADA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "^GEORGIA$") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FRENCH GUIANA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GUERNSEY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GHANA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GIBRALTAR") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GREENLAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GAMBIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GUINEA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GUADELOUPE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "EQUATORIAL GUINEA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GREECE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS" -or $_.Country -match "SOUTH GEORGIA" -or $_.Country -match "SANDWICH") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GUATEMALA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GUAM") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GUINEA-BISSAU" -or $_.Country -match "GUINEA BISSAU") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "GUYANA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "HONG KONG" -or $_.Country -match "HONGKONG") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "HEARD ISLAND AND MCDONALD ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "HONDURAS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CROATIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "HAITI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "HUNGARY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "INDONESIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "IRELAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ISRAEL") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ISLE OF MAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "INDIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "BRITISH INDIAN OCEAN TERRITORY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "IRAQ") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ISLAMIC REPUBLIC OF IRAN" -or $_.Country -match "IRAN, ISLAMIC REPUBLIC OF" -or $_.Country -match "IRAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ICELAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ITALY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "JERSEY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "JAMAICA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "JORDAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "JAPAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "KENYA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "KYRGYZSTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CAMBODIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "KIRIBATI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "COMOROS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAINT KITTS AND NEVIS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF" -or $_.Country -match "N KOREA" -or $_.Country -match "NORTH KOREA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "KOREA, REPUBLIC OF" -or $_.Country -match "S KOREA" -or $_.Country -match "SOUTH KOREA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "KUWAIT") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CAYMAN ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "KAZAKHSTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LAO PEOPLE'S DEMOCRATIC REPUBLIC") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LEBANON") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAINT LUCIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LIECHTENSTEIN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SRILANKA" -or $_.Country -match "SRI LANKA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LIBERIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LESOTHO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LITHUANIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LUXEMBOURG") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LATVIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "LIBYA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MOROCCO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MONACO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MOLDOVA, REPUBLIC OF" -or $_.Country -match "MOLDOVA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MONTENEGRO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAINT MARTIN (FRENCH PART)" -or $_.Country -match "SAINT MARTIN" -or $_.Country -match "ST MARTIN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MADAGASCAR") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MARSHALL ISLANDS" -or $_.Country -match "MARSHALL") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF" -or $_.Country -match "MACEDONIA" -or $_.Country -match "YUGOSLAV") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MALI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MYANMAR") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MONGOLIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MACAO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NORTHERN MARIANA ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MARTINIQUE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MAURITANIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MONTSERRAT") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MALTA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MAURITIUS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MALDIVES") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MALAWI") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MEXICO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MALAYSIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MOZAMBIQUE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NAMIBIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NEW CALEDONIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NIGER") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NORFOLK ISLAND" -or $_.Country -match "NORFOLK") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NIGERIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NICARAGUA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NETHERLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NORWAY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NEPAL") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NAURU") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NIUE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "NEW ZEALAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "OMAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PANAMA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PERU") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FRENCH POLYNESIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PAPUA NEW GUINEA" -or $_.Country -match "NEW GUINEA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PHILIPPINES") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PAKISTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "POLAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAINT PIERRE AND MIQUELON") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PITCAIRN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PUERTO RICO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PALESTINE, STATE OF" -or $_.Country -match "PALESTINE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PORTUGAL") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PALAU") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "PARAGUAY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "QATAR") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "RÉUNION") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ROMANIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SERBIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "RUSSIAN FEDERATION" -or $_.Country -match "RUSSIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "RWANDA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAUDI ARABIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SOLOMON ISLANDS" -or $_.Country -match "SOLOMON") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SEYCHELLES") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SUDAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SWEDEN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SINGAPORE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA" -or $_.Country -match "SAINT HELENA" -or $_.Country -match "ST HELENA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SLOVENIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SVALBARD AND JAN MAYEN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SLOVAKIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SIERRA LEONE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAN MARINO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SENEGAL") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SOMALIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SURINAME") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SOUTH SUDAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAO TOME AND PRINCIPE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "EL SALVADOR") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SINT MAARTEN (DUTCH PART)" -or $_.Country -match "ST MARTEN" -or $_.Country -match "ST MAARTEN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SYRIAN ARAB REPUBLIC") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SWAZILAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TURKS AND CAICOS ISLANDS" -or $_.Country -match "TURKS AND CAICOS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "CHAD") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "FRENCH SOUTHERN TERRITORIES") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TOGO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "THAILAND") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TAJIKISTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TOKELAU") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TIMOR-LESTE" -or $_.Country -match "TIMOR") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TURKMENISTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TUNISIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TONGA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TURKEY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TRINIDAD" -or $_.Country -match "TOBAGO") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TUVALU") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TAIWAN" -or $_.Country -match "TAIWAN, PROVINCE OF CHINA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "TANZANIA" -or $_.Country -match "TANZANIA, UNITED REPUBLIC OF") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "UKRAINE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "UGANDA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "^UNITED STATES MINOR OUTLYING ISLANDS$") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "URUGUAY") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "UZBEKISTAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "HOLY SEE (VATICAN CITY STATE)" -or $_.Country -match "VATICAN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAINT VINCENT AND THE GRENADINES" -or $_.Country -match "GRENADINES" -or $_.Country -match "ST VINCENT") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "VENEZUELA, BOLIVARIAN REPUBLIC OF" -or $_.Country -match "VENEZUELA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "VIRGIN ISLANDS, BRITISH" -or $_.Country -match "BRITISH VIRGIN ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "VIRGIN ISLANDS, U.S." -or $_.Country -match "U.S. VIRGIN ISLANDS" -or $_.Country -match "US VIRGIN ISLANDS") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "VIET NAM" -or $_.Country -match "VIETNAM") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "VANUATU") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "WALLIS AND FUTUNA" -or $_.Country -match "WALLIS" -or $_.Country -match "FUTUNA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SAMOA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "YEMEN") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "MAYOTTE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "SOUTH AFRICA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ZAMBIA") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If ($_.Country -match "ZIMBABWE") { Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation)," }
			If (!($_.Country)) { Write-Host -ForegroundColor Red "$($_.UserPrincipalName) does not have a country code set."; Write-LogCSV -Logfile $Logfile -LogLevel ERROR -Message "$($_.UserPrincipalName),NULL,$($_.UsageLocation)," }
		}
	}
	Update {
		"You have selected Update."
		Get-MsolUser -All | ForEach {
			If ($_.Country -match "UNITED STATES" -or $_.Country -match "^US$" -or $_.Country -match "U.S.") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation US; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),US" }
			If ($_.Country -match "ANDORRA" -or $_.Country -match "ANDORA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AD; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AD" }
			If ($_.Country -match "UNITED ARAB EMIRATES" -or $_.Country -match "UAE" -or $_.Country -match "U.A.E.") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AE" }
			If ($_.Country -match "AFGHANISTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AF" }
			If ($_.Country -match "ANTIGUA AND BARBUDA" -or $_.Country -match "ANTIGUA" -or $_.Country -match "BARBUDA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AG" }
			If ($_.Country -match "ANGUILLA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AI" }
			If ($_.Country -match "ALBANIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AL" }
			If ($_.Country -match "ARMENIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AM" }
			If ($_.Country -match "ANGOLA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AO" }
			If ($_.Country -match "ANTARCTICA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AQ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AQ" }
			If ($_.Country -match "ARGENTINA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AR" }
			If ($_.Country -match "AMERICAN SAMOA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AS" }
			If ($_.Country -match "AUSTRIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AT" }
			If ($_.Country -match "AUSTRALIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AU" }
			If ($_.Country -match "ARUBA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AW" }
			If ($_.Country -match "ÅLAND ISLANDS" -or $_.Country -match "ALAND ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AX; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AX" }
			If ($_.Country -match "AZERBAIJAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation AZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),AZ" }
			If ($_.Country -match "BOSNIA AND HERZEGOVINA" -or $_.Country -match "BOSNIA" -or $_.Country -match "HERZEGOVINA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BA" }
			If ($_.Country -match "BARBADOS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BB; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BB" }
			If ($_.Country -match "BANGLADESH") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BD; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BD" }
			If ($_.Country -match "BELGIUM") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BE" }
			If ($_.Country -match "BURKINA FASO" -or $_.Country -match "BURKINA" -or $_.Country -match "BURKINAFASO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BF" }
			If ($_.Country -match "BULGARIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BG" }
			If ($_.Country -match "BAHRAIN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BH" }
			If ($_.Country -match "BURUNDI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BI" }
			If ($_.Country -match "BENIN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BJ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BJ" }
			If ($_.Country -match "SAINT BARTHÉLEMY" -or $_.Country -match "SAINT BARTHELEMY" -or $_.Country -match "ST BARTHELEMY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BL" }
			If ($_.Country -match "BERMUDA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BM" }
			If ($_.Country -match "BRUNEI DARUSSALAM" -or $_.Country -match "BRUNEI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BN" }
			If ($_.Country -match "BOLIVIA, PLURINATIONAL STATE OF" -or $_.Country -match "BOLIVIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BO" }
			If ($_.Country -match "BONAIRE, SINT EUSTATIUS AND SABA" -or $_.Country -match "BONAIRE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BQ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BQ" }
			If ($_.Country -match "BRAZIL" -or $_.Country -match "BRASIL") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BR" }
			If ($_.Country -match "BAHAMAS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BS" }
			If ($_.Country -match "BHUTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BT" }
			If ($_.Country -match "BOUVET ISLAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BV; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BV" }
			If ($_.Country -match "BOTSWANA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BW" }
			If ($_.Country -match "BELARUS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BY" }
			If ($_.Country -match "BELIZE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation BZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),BZ" }
			If ($_.Country -match "CANADA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CA" }
			If ($_.Country -match "COCOS (KEELING) ISLANDS" -or $_.Country -match "COCOS" -or $_.Country -match "KEELING") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CC" }
			If ($_.Country -match "CONGO, THE DEMOCRATIC REPUBLIC OF THE" -or $_.Country -match "CONGO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CD; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CD" }
			If ($_.Country -match "CENTRAL AFRICAN REPUBLIC") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CF" }
			If ($_.Country -match "CONGO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CF" }
			If ($_.Country -match "SWITZERLAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CH" }
			If ($_.Country -match "CÔTE D'IVOIRE" -or $_.Country -match "COTE DIVOIRE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CI" }
			If ($_.Country -match "COOK ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CK" }
			If ($_.Country -match "CHILE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CL" }
			If ($_.Country -match "CAMEROON") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CM" }
			If ($_.Country -match "CHINA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CN" }
			If ($_.Country -match "COLOMBIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CO" }
			If ($_.Country -match "COSTA RICA" -or $_.Country -match "COSTARICA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CR" }
			If ($_.Country -match "CUBA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CU" }
			If ($_.Country -match "CAPE VERDE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CV; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CV" }
			If ($_.Country -match "CURAÇAO" -or $_.Country -match "CURACAO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CW" }
			If ($_.Country -match "CHRISTMAS ISLAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CX; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CX" }
			If ($_.Country -match "CYPRUS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CY" }
			If ($_.Country -match "CZECH REPUBLIC" -or $_.Country -match "CZECH") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation CZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),CZ" }
			If ($_.Country -match "GERMANY" -or $_.Country -match "DEUTSCHLAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation DE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),DE" }
			If ($_.Country -match "DJIBOUTI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation DJ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),DJ" }
			If ($_.Country -match "DENMARK") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation DK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),DK" }
			If ($_.Country -match "^DOMINICAN REPUBLIC$") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation "DO"; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),DO" }
			If ($_.Country -match "^DOMINICA$") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation DM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),DM" }
			If ($_.Country -match "ALGERIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation DZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),DZ" }
			If ($_.Country -match "ECUADOR") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation EC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),EC" }
			If ($_.Country -match "ESTONIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation EE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),EE" }
			If ($_.Country -match "EGYPT") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation EG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),EG" }
			If ($_.Country -match "WESTERN SAHARA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation EH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),EH" }
			If ($_.Country -match "ERITREA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ER; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ER" }
			If ($_.Country -match "SPAIN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ES; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ES" }
			If ($_.Country -match "ETHIOPIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ET; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ET" }
			If ($_.Country -match "FINLAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation FI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),FI" }
			If ($_.Country -match "FIJI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation FJ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),FJ" }
			If ($_.Country -match "FALKLAND ISLANDS (MALVINAS)" -or $_.Country -match "FALKLAND ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation FK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),FK" }
			If ($_.Country -match "MICRONESIA, FEDERATED STATES OF" -or $_.Country -match "MICRONESIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation FM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),FM" }
			If ($_.Country -match "FAROE ISLANDS" -or $_.Country -match "FAROE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation FO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),FO" }
			If ($_.Country -match "FRANCE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation FR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),FR" }
			If ($_.Country -match "GABON") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GA" }
			If ($_.Country -match "UNITED KINGDOM" -or $_.Country -match "UK" -or $_.Country -match "U.K." -or $_.Country -match "GREAT BRITAIN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GB; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GB" }
			If ($_.Country -match "GRENADA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GD; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GD" }
			If ($_.Country -match "^GEORGIA$") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GE" }
			If ($_.Country -match "FRENCH GUIANA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GF" }
			If ($_.Country -match "GUERNSEY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GG" }
			If ($_.Country -match "GHANA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GH" }
			If ($_.Country -match "GIBRALTAR") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GI" }
			If ($_.Country -match "GREENLAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GL" }
			If ($_.Country -match "GAMBIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GM" }
			If ($_.Country -match "GUINEA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GN" }
			If ($_.Country -match "GUADELOUPE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GP; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GP" }
			If ($_.Country -match "EQUATORIAL GUINEA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GQ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GQ" }
			If ($_.Country -match "GREECE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GR" }
			If ($_.Country -match "SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS" -or $_.Country -match "SOUTH GEORGIA" -or $_.Country -match "SANDWICH") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GS" }
			If ($_.Country -match "GUATEMALA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GT" }
			If ($_.Country -match "GUAM") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GU" }
			If ($_.Country -match "GUINEA-BISSAU" -or $_.Country -match "GUINEA BISSAU") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GW" }
			If ($_.Country -match "GUYANA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation GY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),GY" }
			If ($_.Country -match "HONG KONG" -or $_.Country -match "HONGKONG") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation HK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),HK" }
			If ($_.Country -match "HEARD ISLAND AND MCDONALD ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation HM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),HM" }
			If ($_.Country -match "HONDURAS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation HN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),HN" }
			If ($_.Country -match "CROATIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation HR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),HR" }
			If ($_.Country -match "HAITI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation HT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),HT" }
			If ($_.Country -match "HUNGARY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation HU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),HU" }
			If ($_.Country -match "INDONESIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ID; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ID" }
			If ($_.Country -match "IRELAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IE" }
			If ($_.Country -match "ISRAEL") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IL" }
			If ($_.Country -match "ISLE OF MAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IM" }
			If ($_.Country -match "INDIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IN" }
			If ($_.Country -match "BRITISH INDIAN OCEAN TERRITORY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IO" }
			If ($_.Country -match "IRAQ") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IQ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IQ" }
			If ($_.Country -match "ISLAMIC REPUBLIC OF IRAN" -or $_.Country -match "IRAN, ISLAMIC REPUBLIC OF" -or $_.Country -match "IRAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IR" }
			If ($_.Country -match "ICELAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IS" }
			If ($_.Country -match "ITALY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation IT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),IT" }
			If ($_.Country -match "JERSEY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation JE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),JE" }
			If ($_.Country -match "JAMAICA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation JM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),JM" }
			If ($_.Country -match "JORDAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation JO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),JO" }
			If ($_.Country -match "JAPAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation JP; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),JP" }
			If ($_.Country -match "KENYA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KE" }
			If ($_.Country -match "KYRGYZSTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KG" }
			If ($_.Country -match "CAMBODIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KH" }
			If ($_.Country -match "KIRIBATI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KI" }
			If ($_.Country -match "COMOROS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KM" }
			If ($_.Country -match "SAINT KITTS AND NEVIS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KN" }
			If ($_.Country -match "KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF" -or $_.Country -match "N KOREA" -or $_.Country -match "NORTH KOREA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KP; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KP" }
			If ($_.Country -match "KOREA, REPUBLIC OF" -or $_.Country -match "S KOREA" -or $_.Country -match "SOUTH KOREA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KR" }
			If ($_.Country -match "KUWAIT") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KW" }
			If ($_.Country -match "CAYMAN ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KY" }
			If ($_.Country -match "KAZAKHSTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation KZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),KZ" }
			If ($_.Country -match "LAO PEOPLE'S DEMOCRATIC REPUBLIC") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LA" }
			If ($_.Country -match "LEBANON") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LB; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LB" }
			If ($_.Country -match "SAINT LUCIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LC" }
			If ($_.Country -match "LIECHTENSTEIN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LI" }
			If ($_.Country -match "SRILANKA" -or $_.Country -match "SRI LANKA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LK" }
			If ($_.Country -match "LIBERIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LR" }
			If ($_.Country -match "LESOTHO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LS" }
			If ($_.Country -match "LITHUANIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LT" }
			If ($_.Country -match "LUXEMBOURG") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LU" }
			If ($_.Country -match "LATVIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LV; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LV" }
			If ($_.Country -match "LIBYA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation LY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),LY" }
			If ($_.Country -match "MOROCCO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MA" }
			If ($_.Country -match "MONACO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MC" }
			If ($_.Country -match "MOLDOVA, REPUBLIC OF" -or $_.Country -match "MOLDOVA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MD; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MD" }
			If ($_.Country -match "MONTENEGRO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ME; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ME" }
			If ($_.Country -match "SAINT MARTIN (FRENCH PART)" -or $_.Country -match "SAINT MARTIN" -or $_.Country -match "ST MARTIN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MF" }
			If ($_.Country -match "MADAGASCAR") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MG" }
			If ($_.Country -match "MARSHALL ISLANDS" -or $_.Country -match "MARSHALL") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MH" }
			If ($_.Country -match "MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF" -or $_.Country -match "MACEDONIA" -or $_.Country -match "YUGOSLAV") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MK" }
			If ($_.Country -match "MALI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ML; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ML" }
			If ($_.Country -match "MYANMAR") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MM" }
			If ($_.Country -match "MONGOLIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MN" }
			If ($_.Country -match "MACAO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MO" }
			If ($_.Country -match "NORTHERN MARIANA ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MP; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MP" }
			If ($_.Country -match "MARTINIQUE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MQ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MQ" }
			If ($_.Country -match "MAURITANIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MR" }
			If ($_.Country -match "MONTSERRAT") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MS" }
			If ($_.Country -match "MALTA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MT" }
			If ($_.Country -match "MAURITIUS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MU" }
			If ($_.Country -match "MALDIVES") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MV; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MV" }
			If ($_.Country -match "MALAWI") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MW" }
			If ($_.Country -match "MEXICO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation MX; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),MX" }
			If ($_.Country -match "NAMIBIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NA" }
			If ($_.Country -match "NEW CALEDONIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NC" }
			If ($_.Country -match "NIGER") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NE" }
			If ($_.Country -match "NORFOLK ISLAND" -or $_.Country -match "NORFOLK") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NF" }
			If ($_.Country -match "NIGERIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NG" }
			If ($_.Country -match "NICARAGUA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NI" }
			If ($_.Country -match "NETHERLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NL" }
			If ($_.Country -match "NORWAY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NO" }
			If ($_.Country -match "NEPAL") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NP; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NP" }
			If ($_.Country -match "NAURU") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NR" }
			If ($_.Country -match "NIUE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NU" }
			If ($_.Country -match "NEW ZEALAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation NZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),NZ" }
			If ($_.Country -match "OMAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation OM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),OM" }
			If ($_.Country -match "PANAMA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PA" }
			If ($_.Country -match "PERU") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PE" }
			If ($_.Country -match "FRENCH POLYNESIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PF" }
			If ($_.Country -match "PAPUA NEW GUINEA" -or $_.Country -match "NEW GUINEA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PG" }
			If ($_.Country -match "PHILIPPINES") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PH" }
			If ($_.Country -match "PAKISTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PK" }
			If ($_.Country -match "POLAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PL" }
			If ($_.Country -match "SAINT PIERRE AND MIQUELON") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PM" }
			If ($_.Country -match "PITCAIRN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PN" }
			If ($_.Country -match "PUERTO RICO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PR" }
			If ($_.Country -match "PALESTINE, STATE OF" -or $_.Country -match "PALESTINE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PS" }
			If ($_.Country -match "PORTUGAL") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PT" }
			If ($_.Country -match "PALAU") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PW" }
			If ($_.Country -match "PARAGUAY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation PY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),PY" }
			If ($_.Country -match "QATAR") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation QA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),QA" }
			If ($_.Country -match "RÉUNION") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation RE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),RE" }
			If ($_.Country -match "ROMANIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation RO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),RO" }
			If ($_.Country -match "SERBIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation RS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),RS" }
			If ($_.Country -match "RUSSIAN FEDERATION" -or $_.Country -match "RUSSIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation RU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),RU" }
			If ($_.Country -match "RWANDA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation RW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),RW" }
			If ($_.Country -match "SAUDI ARABIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SA" }
			If ($_.Country -match "SOLOMON ISLANDS" -or $_.Country -match "SOLOMON") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SB; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SB" }
			If ($_.Country -match "SEYCHELLES") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SC" }
			If ($_.Country -match "SUDAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SD; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SD" }
			If ($_.Country -match "SWEDEN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SE" }
			If ($_.Country -match "SINGAPORE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SG" }
			If ($_.Country -match "SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA" -or $_.Country -match "SAINT HELENA" -or $_.Country -match "ST HELENA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SH" }
			If ($_.Country -match "SLOVENIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SI" }
			If ($_.Country -match "SVALBARD AND JAN MAYEN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SJ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SJ" }
			If ($_.Country -match "SLOVAKIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SK" }
			If ($_.Country -match "SIERRA LEONE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SL" }
			If ($_.Country -match "SAN MARINO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SM" }
			If ($_.Country -match "SENEGAL") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SN" }
			If ($_.Country -match "SOMALIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SO" }
			If ($_.Country -match "SURINAME") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SR" }
			If ($_.Country -match "SOUTH SUDAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SS" }
			If ($_.Country -match "SAO TOME AND PRINCIPE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ST; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ST" }
			If ($_.Country -match "EL SALVADOR") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SV; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SV" }
			If ($_.Country -match "SINT MAARTEN (DUTCH PART)" -or $_.Country -match "ST MARTEN" -or $_.Country -match "ST MAARTEN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SX; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SX" }
			If ($_.Country -match "SYRIAN ARAB REPUBLIC") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SY" }
			If ($_.Country -match "SWAZILAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation SZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),SZ" }
			If ($_.Country -match "TURKS AND CAICOS ISLANDS" -or $_.Country -match "TURKS AND CAICOS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TC" }
			If ($_.Country -match "CHAD") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TD; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TD" }
			If ($_.Country -match "FRENCH SOUTHERN TERRITORIES") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TF" }
			If ($_.Country -match "TOGO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TG" }
			If ($_.Country -match "THAILAND") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TH; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TH" }
			If ($_.Country -match "TAJIKISTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TJ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TJ" }
			If ($_.Country -match "TOKELAU") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TK; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TK" }
			If ($_.Country -match "TIMOR-LESTE" -or $_.Country -match "TIMOR") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TL; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TL" }
			If ($_.Country -match "TURKMENISTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TM" }
			If ($_.Country -match "TUNISIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TN" }
			If ($_.Country -match "TONGA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TO; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TO" }
			If ($_.Country -match "TURKEY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TR; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TR" }
			If ($_.Country -match "TRINIDAD" -or $_.Country -match "TOBAGO") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TT" }
			If ($_.Country -match "TUVALU") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TV; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TV" }
			If ($_.Country -match "TAIWAN" -or $_.Country -match "TAIWAN, PROVINCE OF CHINA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TW" }
			If ($_.Country -match "TANZANIA" -or $_.Country -match "TANZANIA, UNITED REPUBLIC OF") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation TZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),TZ" }
			If ($_.Country -match "UKRAINE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation UA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),UA" }
			If ($_.Country -match "UGANDA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation UG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),UG" }
			If ($_.Country -match "^UNITED STATES MINOR OUTLYING ISLANDS$") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation UM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),UM" }
			If ($_.Country -match "URUGUAY") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation UY; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),UY" }
			If ($_.Country -match "UZBEKISTAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation UZ; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),UZ" }
			If ($_.Country -match "HOLY SEE (VATICAN CITY STATE)" -or $_.Country -match "VATICAN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation VA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),VA" }
			If ($_.Country -match "SAINT VINCENT AND THE GRENADINES" -or $_.Country -match "GRENADINES" -or $_.Country -match "ST VINCENT") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation VC; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),VC" }
			If ($_.Country -match "VENEZUELA, BOLIVARIAN REPUBLIC OF" -or $_.Country -match "VENEZUELA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation VE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),VE" }
			If ($_.Country -match "VIRGIN ISLANDS, BRITISH" -or $_.Country -match "BRITISH VIRGIN ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation VG; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),VG" }
			If ($_.Country -match "VIRGIN ISLANDS, U.S." -or $_.Country -match "U.S. VIRGIN ISLANDS" -or $_.Country -match "US VIRGIN ISLANDS") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation VI; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),VI" }
			If ($_.Country -match "VIET NAM" -or $_.Country -match "VIETNAM") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation VN; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),VN" }
			If ($_.Country -match "VANUATU") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation VU; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),VU" }
			If ($_.Country -match "WALLIS AND FUTUNA" -or $_.Country -match "WALLIS" -or $_.Country -match "FUTUNA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation WF; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),WF" }
			If ($_.Country -match "SAMOA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation WS; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),WS" }
			If ($_.Country -match "YEMEN") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation YE; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),YE" }
			If ($_.Country -match "MAYOTTE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation YT; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),YT" }
			If ($_.Country -match "SOUTH AFRICA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ZA; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ZA" }
			If ($_.Country -match "ZAMBIA") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ZM; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ZM" }
			If ($_.Country -match "ZIMBABWE") { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -UsageLocation ZW; Write-LogCSV -Logfile $Logfile -LogLevel INFO -Message "$($_.UserPrincipalName),$($_.Country),$($_.UsageLocation),ZW" }
			If (!($_.Country)) { Write-Host -ForegroundColor Red "$($_.UserPrincipalName) does not have a country code configured."; Write-LogCSV -Logfile $Logfile -LogLevel ERROR -Message "$($_.UserPrincipalName),NULL,$($_.UsageLocation)," }
		}
	}
}