using namespace System.Runtime.InteropServices

if ($PSVersionTable.PSVersion.Major -ge 7) {
    if ($global:NSUDODM_DLL) {
        [NativeLibrary]::Free($global:NSUDODM_DLL)
    }
    [IntPtr]$global:NSUDODM_DLL = 0
}
