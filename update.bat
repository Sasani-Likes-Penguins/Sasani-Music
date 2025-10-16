@echo off
echo ~~~~~~~~~~~~~~~~~~~~~~~~
echo Updating ALL the things!
echo ~~~~~~~~~~~~~~~~~~~~~~~~
powershell -ExecutionPolicy Bypass -File generate-index.ps1
git add -A && git commit -m "Auto updating site." && git push
pause