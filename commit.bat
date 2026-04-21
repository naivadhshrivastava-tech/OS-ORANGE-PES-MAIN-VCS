@echo off
set COUNT=6

for /L %%i in (1,1,%COUNT%) do (

    echo Iteration %%i: Creating file...

    REM Create file
    echo This is iteration %%i > OS-report

    REM Add, commit, push
    git add OS-report
    git commit -m "Add OS-report file (iteration %%i)"
    git push

    echo Iteration %%i: Deleting file...

    REM Delete file
    del OS-report

    REM Add deletion, commit, push
    git add -A
    git commit -m "Remove OS-report file (iteration %%i)"
    git push
)

echo Done!
pause