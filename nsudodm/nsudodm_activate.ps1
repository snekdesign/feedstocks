using namespace System.Runtime.InteropServices
using namespace System.Security.Principal

if ($PSVersionTable.PSVersion.Major -ge 7) {
    [WindowsPrincipal]$p = [WindowsIdentity]::GetCurrent()
    if ($p.IsInRole([WindowsBuiltInRole]::Administrator)) {
        $global:NSUDODM_DLL = [NativeLibrary]::Load("$CONDA_PREFIX\bin\NSudoDM.dll")
    } else {
        [IntPtr]$global:NSUDODM_DLL = 0
    }
}
