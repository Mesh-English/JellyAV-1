@echo off
title JellyAV
mode con cols=102 lines=30
color 4e
:menu
set quantity=0
cls
echo.  =================================================================================================
echo.  ==============================================JellyAV============================================
echo.
echo.                                               \Options/
echo.
echo.                
echo.
echo.
echo.
echo.
echo.                                            1. Scan a file
echo.
echo.
echo.                                              2. Credit
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                         +++++++++++++++++++++++
echo.                                           Free - Light - Safe
@CHOICe /C:12 /N
if errorlevel 2 goto credit
if errorlevel 1 goto scanfile
goto menu

:credit
cls
echo.
echo.
echo.
echo.
echo.
echo.                                               =Programmer=
echo.                                              Nguyen Phu Minh
echo.
echo. 
echo.                                         Press any key to continue...
pause >nul
goto menu

:scanfile
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo. =============================
echo. Enter file's path to scan:
set /p file=
type %file%>sctar.txt
cls
for /f "tokens=* delims= " %%x in (sctar.txt) do (
    for /f "tokens=* delims= " %%y in (Virus_Database.txt)do (
        if "%%x" == "%%y" (
            del /q %file%
            del /q sctar.txt
            echo.
            echo.
            echo.
            echo. =====================================
            echo. %file% was infected and deleted.
            echo.
            echo.
            echo. Press any key to get back to menu...
            pause >nul
            goto menu
        )
    )
)
echo. No threats found!
pause
goto menu