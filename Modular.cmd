@echo off

:: BatchGotAdmin
REM Check for administrative privileges
2>nul "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM If error level is not zero, we do not have administrative privileges
if errorlevel 1 (
echo Requesting administrative privileges...
goto UACPrompt
) else (
goto gotAdmin
)

:UACPrompt
echo Set UAC = CreateObject("Shell.Application") > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~dpnx0"" %*", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"
@echo off

set size=28

:: Menu
:prepare
for /L %%i in (0,1,%size%) do (
    if defined chbox%%i (
        set st%%i=Y
    ) else (
        set chbox%%i= 
    )
)

::Render
mode con:cols=80 lines=40
:menu
cls
echo:
@echo off
echo         ______________________________________________________
echo        ^|                                                      ^|
echo        ^| 1. [%chbox1%]  7-Zip          	      T. [%chbox16%]          ^|
echo        ^|                                                      ^|
echo        ^| 2. [%chbox2%]  Brave          	      Y. [%chbox17%]          ^|
echo        ^|                                                      ^|
echo        ^| 3. [%chbox3%]  JPEGView          	      U. [%chbox18%]          ^|
echo        ^|                                                      ^|
echo        ^| 4. [%chbox4%]  Spotify          	      I. [%chbox19%]          ^|
echo        ^|                                                      ^|
echo        ^| 5. [%chbox5%]  Windows KMS38                O. [%chbox20%]          ^|
echo        ^|                                                      ^|
echo        ^| 6. [%chbox6%]  Stremio          	      P. [%chbox21%]          ^|
echo        ^|                                                      ^|
echo        ^| 7. [%chbox7%]  Teams          	      S. [%chbox22%]          ^|
echo        ^|                                                      ^|
echo        ^| 8. [%chbox8%]  NTLite          	      D. [%chbox23%]          ^|
echo        ^|                                                      ^|
echo        ^| 9. [%chbox9%]  Steam          	      F. [%chbox24%]          ^|
echo        ^|                                                      ^|
echo        ^| 0. [%chbox10%]  Discord          	      G. [%chbox25%]          ^|
echo        ^|                                                      ^|
echo        ^| W. [%chbox13%]  Visual Studio                H. [%chbox26%]          ^|
echo        ^|                                                      ^|
echo        ^| E. [%chbox14%]  qBittorrent          	      J. [%chbox27%]          ^|
echo        ^|                                                      ^|
echo        ^| R. [%chbox15%]  ProtonVPN          	      K. [%chbox28%]          ^|
echo        ^|______________________________________________________^|
echo:
choice /C 1234567890qaWERTYUIOPSDFGHJK /N /M "Select Apps [A] Apply [Q] Quit"
echo.
set inp=%errorlevel%


if %inp%==11 (
    exit
)
if %inp%==12 (
    call :apply
)

::switch
if defined st%inp% (
    set st%inp%=
    set chbox%inp%= 
) else (
    set st%inp%=Y
    set chbox%inp%=X
)
goto :menu

:apply
for /L %%i in (0,1,%size%) do (
    if defined st%%i (
        call :st%%i
        echo.
    )
)
for /L %%i in (0,1,%size%) do (
    set chbox%%i= 
    set st%%i=
)
echo.
pause
goto :menu

:: Menu Options
:st1
winget install 7zip.7zip -e -h
goto :eof

:st2
winget install --id=Brave.Brave  -e -h
goto :eof

:st3
winget install --id=sylikc.JPEGView  -e -h
goto :eof

:st4
echo Downloading SpotX...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/vsedge/Modular/main/SpotX.bat', '%temp%\SpotX.bat')"
echo Running SpotX...
call %temp%\SpotX.bat
del %temp%\SpotX.bat
goto :eof

:st5
echo Downloading KMS38...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/vsedge/Modular/main/KMS38.cmd', '%temp%\KMS38.cmd')"
echo Running KMS38...
call %temp%\KMS38.cmd
echo Script finished!
del %temp%\KMS38.cmd
goto :eof

:st6
winget install --id=Stremio.Stremio  -e -h
goto :eof

:st7
winget install --id=Microsoft.Teams  -e -h
goto :eof

:st8
winget install --id=Nlitesoft.NTLite  -e -h
goto :eof

:st9
winget install --id=Valve.Steam  -e -h
goto :eof

:st10
winget install --id=Discord.Discord  -e -h
goto :eof 

:st13
winget install --id=Microsoft.VisualStudioCode  -e -h
winget install --id=Microsoft.VisualStudio.2022.Community  -e -h
goto :eof

:st14
winget install --id=qBittorrent.qBittorrent  -e -h
goto :eof

:st15
winget install --id=ProtonTechnologies.ProtonVPN  -e -h
goto :eof


