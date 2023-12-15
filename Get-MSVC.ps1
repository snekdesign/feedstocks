#Requires -Version 7.4

param(
    [Parameter(ParameterSetName='Current')]
    [Parameter(ParameterSetName='LTSC')]
    [ValidateRange(15, 17)]
    [int]
    $Major = 17,

    [Parameter(Mandatory, ParameterSetName='LTSC')]
    [ValidateScript({$Major -eq 17 -and $_%2 -eq 0})]
    [ValidateRange('NonNegative')]
    [int]
    $Minor,

    [Parameter(ParameterSetName='Current')]
    [Parameter(ParameterSetName='LTSC')]
    [ValidateNotNullOrWhiteSpace()]
    [string]
    $Layout = 'vs_BuildTools'
)

if (-not $IsWindows) {
    exit 1
}

$ErrorActionPreference = 'Stop'

$NAME = 'vs_BuildTools.exe'

$Uri = "https://aka.ms/vs/$Major/release"
if ($null -ne $Minor) {
    $Uri += ".ltsc.$Major.$Minor"
}
$Uri += "/$NAME"

Invoke-WebRequest $Uri -OutFile $NAME

Start-Process $NAME (
    '--layout', "`"$(Convert-Path $Layout)`"",
    '--add', 'Microsoft.VisualStudio.Component.VC.CMake.Project',
    '--add', 'Microsoft.VisualStudio.Component.Windows11SDK.22621',
    '--lang', 'en-US'
) -Wait

Start-Process $Layout\$NAME '--noweb' -Verb RunAs
