@echo off
title miner launcher
set "allchoices=123456789abcdefghijklmnopqrstuvwxyz¦"

rem //CONFIG BELOW//
rem set the seconds after which the miner will run with the default settings
set /a countdown=20 

rem enter the folder location of the miner executable 
set "location=C:\Users\User\Desktop\folder"

rem paste your miner config here (without the --cpu parameter)
set "config=hellminer.exe -c stratum+tcp://eu.luckpool.net:3956#xnsub -u RB7sFYVzfGSnFNcq255u7sCywvaiDRxcJh.pc -p x"

rem set the number of threads you want to run when the button is pressed
set "if_1=8"
set "if_2=10"
set "if_3=12"

rem set the number of threads to run when the countdown is over
set "threads=12"

:loop 
	cls
	
	echo press [1] for %if_1% cpu threads
	echo press [2] for %if_2% cpu threads
	echo press [3] for %if_3% cpu threads
	echo press another alpha-numeric key in order not to start the miner
	echo.
	echo Countdown - [%countdown%]
	echo.
	
	if %countdown%==0 goto launch

	choice /t 1 /c %allchoices% /d ¦ >nul
	if %errorlevel% EQU 36 goto dec
	if %errorlevel% EQU 1 goto 1
	if %errorlevel% EQU 2 goto 2
	if %errorlevel% EQU 3 goto 3
	if %errorlevel% GEQ 4 exit
	
:dec
	set /a countdown=%countdown%-1
	goto loop

:1
	set "threads=%if_1%"
	echo [1] pressed, launching %threads% cpu threads
	goto launch
 
:2
	set "threads=%if_2%"
	echo [2] pressed, launching %threads% cpu threads
	goto launch

:3
	set "threads=%if_3%"
	echo [3] pressed, launching %threads% cpu threads
	goto launch

:launch
	cd %location%
	%config% --cpu %threads% 