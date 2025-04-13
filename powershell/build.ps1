#Requires -Version 7.4
Set-StrictMode -Version Latest
Set-Variable ErrorActionPreference, PSNativeCommandUseErrorActionPreference 1

$v = [Environment]::Version
$d = "$Env:DOTNET_TOOLS\.store\powershell\$Env:PKG_VERSION\powershell\$Env:PKG_VERSION\tools\net$($v.Major).$($v.Minor)\any\win"
mkdir $d
cp.exe -al . $d
Set-Location $d
Remove-Item *.bat, *.xml
