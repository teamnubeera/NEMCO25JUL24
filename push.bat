@echo off
setlocal

:: Check if a commit message was provided
if "%~1"=="" (
    echo Please provide a commit message.
    echo Usage: git_auto.bat "Your commit message"
    exit /b 1
)

:: Navigate to your Git repository directory (change this to your repo path)
:: cd "E:\Practices\GitPractice\NEMCO25JUL24\NEMCO25Jul24(TopicCovered)"

:: Add all changes
git add .

:: Commit changes with the provided message
git commit -m "%~1"

:: Push changes to the remote repository
git push

echo Done!
pause
endlocal
