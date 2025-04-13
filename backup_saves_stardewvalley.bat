@echo off
::Setup
::Fill these out. 

set GameName=StardewValley
::This will be the name of the game's directory under %APPDATA%. Please make sure it is correct.

set BackupFolder=E:\Backups\Games
::This is where your backups will go. If the folder doesn't exists, the script creates it for you


::Don't touch anything beyond this point
::Or do, I can't stop you

setlocal enabledelayedexpansion
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set DateTime=%datetime:~0,4%_%datetime:~4,2%_%datetime:~6,2%_HOUR-%datetime:~8,2%

set OriginalSavePath="%APPDATA%\%GameName%\"
set BackupSavePath="%BackupFolder%\%GameName%\%DateTime%"

if not exist %OriginalSavePath% (
	echo %OriginalSavePath% does not exist. Exiting...
	timeout 30
	exit \b	
)

md %BackupSavePath%

xcopy /e %OriginalSavePath% %BackupSavePath% /Y /I 

echo.
echo Your save folder is here:
echo %OriginalSavePath%
echo.
echo Your save files have been copied here:
echo %BackupSavePath%
echo.
timeout 30
