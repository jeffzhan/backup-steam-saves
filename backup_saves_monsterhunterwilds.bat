@echo off
::Setup
::Fill these out. Everything except UserID should be correct already

set UserID=282255476
::It's the same as your friend code. Go to settings in steam and it's on the account tab

set SteamInstallDir=C:\Program Files (x86)\Steam
::If you installed Steam somewhere other than the default directory, you can change it here

set GameID=2246340
::You can probably use this script for almost any game if you change the gameID.
::If you go to a game's steam store page, you can find it in the url just before the game's title.

set GameName=MonsterHunterWilds
::This should be the name of the game. 

set BackupFolder=E:\Backups\Games
::This is where your backups will go. Make sure there is no '\' after the last folder name. If the folder doesn't exists, the script creates it for you


::Don't touch anything beyond this point
::Or do, I can't stop you


setlocal enabledelayedexpansion
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set DateTime=%datetime:~0,4%_%datetime:~4,2%_%datetime:~6,2%_HOUR-%datetime:~8,2%

set OriginalSavePath="%SteamInstallDir%\userdata\%UserID%\%GameID%\remote\"
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
%1
exit
