@echo off
echo ~~~~~~~~~~~~~~~~~~~~~~~~
echo Updating ALL the things!
echo ~~~~~~~~~~~~~~~~~~~~~~~~
git add -A
set /p input=Commit message:
git commit -m "Auto updating site. %input%" 
git push
pause