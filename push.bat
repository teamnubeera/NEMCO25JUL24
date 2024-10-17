@echo off
setlocal

:: Set a default commit message
set "defaultMessage=Auto commit: Changes made on %date% at %time%"

:: Check if a commit message was provided; if not, use the default
if "%~1"=="" (
    set "commitMessage=%defaultMessage%"
) else (
    set "commitMessage=%~1"
)

:: Navigate to your Git repository directory (change this to your repo path)
:: cd "E:\Practices\GitPractice\NEMCO25JUL24\NEMCO25Jul24(TopicCovered)"

:: Add all changes
git add .

:: Commit changes with the provided message
git commit -m "%commitMessage%"

:: Push changes to the remote repository
git push

echo Done!
pause
endlocal
