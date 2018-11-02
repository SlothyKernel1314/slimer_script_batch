::        .__  .__                                           .__        __
::   _____|  | |__| _____   ___________    ______ ___________|__|______/  |_
::  /  ___/  | |  |/     \_/ __ \_  __ \  /  ___// ___\_  __ \  \____ \   __\
::  \___ \|  |_|  |  Y Y  \  ___/|  | \/  \___ \\  \___|  | \/  |  |_> >  |
:: /____  >____/__|__|_|  /\___  >__|    /____  >\___  >__|  |__|   __/|__|
::      \/              \/     \/             \/     \/         |__|

:: Author :
:: +-+-+-+-+-+-+-+-+-+
:: |I|A|m|T|e|r|r|o|r|
:: +-+-+-+-+-+-+-+-+-+

:: Licence :
:: Everyone is permitted to copy and distribute verbatim or modified
:: copies of this license document, and changing it is allowed as long
:: as the name is changed.
::
::            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
::   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
::
::  0. You just DO WHAT THE FUCK YOU WANT TO.

:: #######################################################################################################################

:: #######################################################################################################################

@echo off

:: this instruction allows to manage accented characters 
chcp 1252 > nul

:: currentDirectory denotes the directory in which you will put the backup file
set currentDirectory=C:\Log\

:: create currentDirectory directory
if not exist %currentDirectory% mkdir %currentDirectory%

:: create the end of the backup file fileName
set endFileName=_log_slimerscript.txt

:: format timestamp of today's date and put it in the variable currentDate
set currentDate=%date:~6,4%%date:~3,2%%date:~0,2%


:: format timestamp of today's hour and minute
for /f "tokens=1,2,3 delims=:" %%a in ('time /t') do set hour=%%a
for /f "tokens=1,2,3 delims=:" %%a in ('time /t') do set minute=%%b

:: format timestamp of today's seconds
set second=%time:~6,2%

:: put the timestamp of today's hour and minute in the variable currentHour
set currentHour=%hour%%minute%%second%

:: create the definitive backup file name and put it in the variable fileName
set fileName=%currentDirectory%%currentDate%_%currentHour%_%endFileName%

echo SLIMER SCRIPT is currently running : creation of the backup file(s). 
echo This can take up to several minutes...
echo At the end of the execution of the script, the window will close by itself.

:: Parsing and displaying of directories, subdirectories and descendants of the selectionned directory (path)...
:: ... and write results in the backup file fileName 
set path="C:\"
dir %path% /A /S >%fileName%

::same operation, fot an another directory
set path2="F:\"
dir %path2% /A /S >>%fileName%

set otherDirectory=F:\Log\
copy %fileName% %otherDirectory%



