::-------------------------------------------------------------------------
echo off
title Darius' Google Chrome Installer
color a
color 0a
rem This batch file will attempt to install Chrome only after checking the processor architecture(to determine where it will be installed inside of Windows) and whether it can find the executable. The OR logical operator is emulated via GOTO functions for the purpose of allowing AMD/Intel 64-bit detection to occur before x86. This is just in case Chrome is installed as 64-bit, and to thus to prevent multiple installations.
::-------------------------------------------------------------------------
echo.
echo Hello %COMPUTERNAME% the current time is %TIME%. 
echo.
if /i "%processor_architecture%"=="AMD64" GOTO X64DC
if /i "%processor_architecture%"=="X64" GOTO X64DC
if /i "%processor_architecture%"=="X86" GOTO X86DC

:X86DC
echo Architecture is 32-bit:
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" ( 
	echo Chrome is installed.
	exit
	)
	
if not exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
	echo Chrome is NOT installed.
	GOTO installChrome
	exit
	)

:X64DC
echo Architecture is 64-bit:
if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
	echo Chrome is installed.
	pause
	exit
	)    
	
if not exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
	echo Chrome is NOT installed.
	GOTO installChrome
	exit
	)
	
:installChrome
echo Install Google Chrome?
CHOICE /C:YN /m "Choose [1]Yes or [2]No."
goto choice_%ERRORLEVEL%

:choice_1
Echo Yes. Installing Google Chrome.
start ChromeStandaloneSetup
exit

:choice_2
Echo No. Exiting commandline.
exit

::-------------------------------------------------------------------------
