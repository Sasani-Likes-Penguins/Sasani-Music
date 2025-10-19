@echo off
echo ~~~~~~~~~~~~~~~~~~~~~~~~
echo Updating ALL the things!
echo ~~~~~~~~~~~~~~~~~~~~~~~~
git add --all
set /p input=Commit message:
git commit -a -m "Updated. %input%"
git push
pause