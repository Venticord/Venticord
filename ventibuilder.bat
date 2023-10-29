@echo off
title Ventibuilder
cls
echo VentiBuilder
echo built for you!
echo ------------------
echo Press M if you have built and have been told to move in this tool.
echo Press I to use the files in your build directory to install Venticord.
echo Press P to push to the origin.
echo Press anything else to proceed with building.
set dist=".\dist\"
set /P choice="Choose a choice:"
if "%choice%" == "M" ( goto MoveFiles )
if "%choice%" == "I" ( goto Installation )
if "%choice%" == "P" ( goto PushGit )
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
echo ------------------
echo Welcome back! We're moving your files now, please wait.
echo moving extensions
move .\dist\extension-chrome.zip %buildDir%\Web\
move .\dist\extension-firefox.zip %buildDir%\Web\
echo moving unpacked builds
move .\dist\chromium-unpacked %buildDir%\Web\
move .\dist\firefox-unpacked %buildDir%\Web\
echo deleting leftover web files
del /S /F .\dist\extension-chrome.zip
del /S /F .\dist\chromium-unpacked\*
del /S /F .\dist\extension-firefox.zip
del /S /F .\dist\firefox-unpacked\*
rmdir /S .\dist\monaco\
del /S /F .\dist\browser*
echo moving desktop
move .\dist\* %buildDir%\DesktopFiles\
echo Done! You can now install your new-built Venticord by rerunning this batch file pressing "I" when prompted.
exit /B
:Installation
echo ------------------
echo Welcome back!
set /P buildDir="Enter the build directory with the DesktopFiles folder: "
echo You're installing from %buildDir%\DesktopFiles.
echo If you have made a mistake when typing the build directory...
echo [31mEXIT NOW!!![0m
echo Press a key to install.
pause>nul
echo ------------------
move %buildDir%\DesktopFiles\* .\dist
pnpm inject
exit /B
:PushGit
git add .
git commit -m "Ventibuild Commit"
git push