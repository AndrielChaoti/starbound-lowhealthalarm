@echo off

ECHO Packing Mod Assets...
"C:\Program Files (x86)\Steam\steamapps\common\Starbound\win32\asset_packer.exe" -v .\server-side\ low-health-alarm.pak

TIMEOUT /T 5
