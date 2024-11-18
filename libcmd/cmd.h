#pragma once

#include <wchar.h>

#define UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>

#define _tchdir _wchdir
#define _tmain wmain
#define cmd_exit(code) ExitProcess(code)
#define CMDLINE_LENGTH 8192
#define StdErr (&csStdErr)
#define StdIn (&csStdIn)
#define StdOut (&csStdOut)

typedef struct _CON_STREAM CON_STREAM, *PCON_STREAM;
typedef enum {
    Binary = 0,
    AnsiText,
    WideText,
    UTF16Text,
    UTF8Text,
} CON_STREAM_MODE;

#ifdef __cplusplus
extern "C" {
#endif
__declspec(dllimport) extern HANDLE CMD_ModuleHandle;
__declspec(dllimport) extern CRITICAL_SECTION ChildProcessRunningLock;
__declspec(dllimport) extern VOID Cleanup(VOID);
__declspec(dllimport) extern LANGID ConSetThreadUILanguage(
    IN LANGID LangId OPTIONAL);
__declspec(dllimport) extern HANDLE ConStreamGetOSHandle(
    IN PCON_STREAM Stream);
__declspec(dllimport) extern BOOL ConStreamInit(
    OUT PCON_STREAM Stream,
    IN PVOID Handle,
    IN CON_STREAM_MODE Mode,
    IN UINT CacheCodePage OPTIONAL);
__declspec(dllimport) extern LPTSTR DuplicateEnvironment(VOID);
__declspec(dllimport) extern VOID GetCmdLineCommand(
    OUT LPTSTR commandline,
    IN LPCTSTR ptr,
    IN BOOL AlwaysStrip);
__declspec(dllimport) extern LPCTSTR Initialize(VOID);
__declspec(dllimport) extern UINT InputCodePage;
__declspec(dllimport) extern BOOL IsConsoleHandle(IN HANDLE hHandle);
__declspec(dllimport) extern UINT OutputCodePage;
__declspec(dllimport) extern CON_STREAM_MODE OutputStreamMode;
__declspec(dllimport) extern INT ParseCommandLine(LPTSTR);
__declspec(dllimport) extern INT ProcessInput(VOID);
__declspec(dllimport) extern BOOL bAlwaysStrip;
__declspec(dllimport) extern BOOL bExit;
__declspec(dllimport) extern void cmd_free(void *ptr);
__declspec(dllimport) extern CON_STREAM csStdErr;
__declspec(dllimport) extern CON_STREAM csStdIn;
__declspec(dllimport) extern CON_STREAM csStdOut;
__declspec(dllimport) extern BOOL fSingleCommand;
__declspec(dllimport) extern LPTSTR lpOriginalEnvironment;
__declspec(dllimport) extern INT nErrorLevel;
#ifdef __cplusplus
}
#endif
