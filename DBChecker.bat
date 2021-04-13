@echo off

REM Enabling delayed expansion to sandbox variables in case you want to run this multiple times

setlocal enabledelayedexpansion


Echo.
Echo.
Echo Please make sure to run the program in its entirity.
Echo Please copy the desired list, then press enter. 
Echo.
Echo.
pause

Echo Loading...

powershell get-clipboard >C:\Users\%USERNAME%\Documents\input_data.txt


set "source_file=C:\Users\%USERNAME%\Documents\input_data.txt"

for /f "usebackq delims=" %%A in ("%source_file%") do (
    for /f "tokens=3 delims=:" %%B in ('find /i /c "%%~A" "%source_file%"') do (
        if %%B GTR 1 (
            
            if not defined found[%%A] (
                set "found[%%A]=1"
                echo Found %%B instances of %%A
            )
        )
    )
)

Echo.
Echo.
Echo Complete. Please press enter to delete files created for this search.
Echo.
pause

Echo Deleting used resources. 
Echo.
Echo.

cd "C:\Users\%USERNAME%\Documents"
del input_data.txt

Echo Complete. Please press enter to close program. 
Echo.
pause