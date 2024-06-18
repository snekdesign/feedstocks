#Requires -Version 7.4
Set-StrictMode -Version Latest
Set-Variable ErrorActionPreference, PSNativeCommandUseErrorActionPreference 1

$v = [Environment]::Version
$r = ".store\powershell\$Env:PKG_VERSION\powershell\$Env:PKG_VERSION\tools\net$($v.Major).$($v.Minor)\any"
$d = "$Env:DOTNET_TOOLS\$r"
$n = 'Microsoft.PowerShell.GlobalTool.Shim'
mkdir $d
@"
with open('$n.exe', 'rb') as f:
    b = f.read()
with open(r'$Env:DOTNET_TOOLS\pwsh.exe', 'x+b') as f:
    f.write(b)
    f.seek(b.index(b'$n.dll' + b'\0'*($($r.Length)+1)))
    f.write(br'$r\$n.dll')
"@ | python -
cp.exe -al "$n.dll" "$n.runtimeconfig.json" $d
cp.exe -al . "$d\win"
Remove-Item "$d\win\*.bat"
