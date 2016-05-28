::-------------------------------------------------------------------------
echo off
title Darius' Word Processor Selector
color a
color 0a
rem This batch file will prompt the user for which application they would like to load, and load it. I decided to use the CHOICE command to grab input and then to pass off the output to a labeled local variable of which was then passed to a GOTO according to the user input.
::-------------------------------------------------------------------------
echo.
echo Hello %COMPUTERNAME% the current time is %TIME%. 
echo.
echo Which program would you like to start?
echo.
echo Enter your choice:
CHOICE /C:123 /m "Choose [1] Notepad, [2] Word, [3] Powerpoint"
goto choice_%ERRORLEVEL%

:choice_1
Echo You typed 1 for Notepad.
start notepad
exit

:choice_2
Echo You typed 2 for Word
start winword
exit

:choice_3
Echo You typed 3 for Powerpoint
start powerpnt
exit
::-------------------------------------------------------------------------
