# backup-steam-saves
A Windows batch script to update a game's save files automatically upon launching the game.

Forked from Tacumoto's [Simple Save Backup Script](https://www.nexusmods.com/monsterhunterwilds/mods/379?tab=description) for Monster Hunter Wilds. Cleaned up some lines and made a version for Stardew Valley which has a completely different save location.

## Setup
Download the batch script.

For Monster Hunter Wilds:
1. Set the `UserID`, `SteamInstallDir`, and `BackupFolder` fields.

For Stardew Valley:
1. Set the `BackupFolder` field.

Then you can copy the script, name it `backup_saves.bat`, into the game's directory.
e.g. `C:\Program Files (x86)\Steam\steamapps\common\MonsterHunterWilds\backup_saves.bat`

Edit the game's launch options and add the following line:
`backup_saves.bat %COMMAND%`

Whenever you launch the game through Steam, it will run the batch script and backup the game's save files first before launching the game itself.

You can also launch this script manually to backup your saves whenever you want.

The backup save directories will be dated `YYYY_MM_DD_HOUR-HH`, meaning if you run the script twice in an hour, the second run will override the previous backups for that hour.

