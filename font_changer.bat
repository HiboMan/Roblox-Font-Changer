@echo off
title font_changer - S0LVe
echo 1) Regular Roblox
echo 2) Bloxstrap
echo 3) Fishtrap
set /p input=Choose an option:

set "url=https://raw.githubusercontent.com/S0LVeStudios/Font-Changer/refs/heads/main/content.zip"
set "tempZip=%temp%\content.zip"

echo Downloading content.zip...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%tempZip%'"

if /I "%input%"=="1" (
    echo Searching for RobloxPlayerBeta.exe...
    for /D %%D in ("%localappdata%\Roblox\Versions\*") do (
        if exist "%%D\RobloxPlayerBeta.exe" (
            echo Found RobloxPlayerBeta.exe in: %%D
            set "target=%%D"
            goto :extract
        )
    )
    echo RobloxPlayerBeta.exe not found!
    goto :end
)

if /I "%input%"=="2" (
    set "target=%localappdata%\Bloxstrap\Modifications"
    goto :extract
)

if /I "%input%"=="3" (
    set "target=%localappdata%\Fishstrap\Modifications"
    goto :extract
)

echo Invalid option!
goto :end

:extract
echo Extracting to %target%...
powershell -Command "Expand-Archive -Path '%tempZip%' -DestinationPath '%target%' -Force"
echo Done!
goto :end

:end
pause