@echo off
title Ventibuilder
cls
echo VentiBuilder
echo built for you!
echo ------------------
echo Press M if you have built and have been told to move in this tool
echo Press anything else to proceed with building.
set /P choice="Choose a choice:"
if "%choice%" == "M" ( goto MoveFiles )
set dist=".\dist\"
set /P buildDir="Enter the build directory: "
echo You have chosen %buildDir%.
echo Clearing...
del /S /F %buildDir%\*
rmdir /S /F %buildDir%\*
rmdir /S /F .\dist\
echo ------------------
echo Making directories...
mkdir %buildDir%\Web
echo Web directory made!
mkdir %buildDir%\DesktopFiles
echo Desktop directory made!
echo ------------------
echo PLEASE WAIT!
echo If you have made a mistake when typing the build directory...
echo [31mEXIT NOW!!![0m
echo Press a key to continue... if you're SURE you typed it right.
echo Just to recap, you chose %buildDir%.
echo To add on, when you finish, rerun this batch file and press M when you're prompted to press M to move something.
pause>nul
echo Building
pnpm build && pnpm buildWeb

:MoveFiles
echo Welcome back! We're moving your files now, please wait.
move %dist%\extension-* %buildDir%\Web\
move %dist%\*-unpacked %buildDir%\Web\
del /S /F %dist%\extension-*
del /S /F %dist%\chromium-unpacked
del /S /F %dist%\firefox-unpacked
del /S /F %dist%\monaco
del /S /F %dist%\browser*
move %dist%\* %buildDir%\DesktopFiles\
echo Done! You can now install your new-built Venticord with "pnpm inject".