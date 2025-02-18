@echo off

if %2 gtr 12 (
    echo O mes deve ser um numero entre 1 e 12
    exit /b
)

if not exist "%1" (
    mkdir "%1"
)

set /a "resto=%1 %% 4"
set /a "resto100=%1 %% 100"
set /a "resto400=%1 %% 400"
set /a "conta = %1+4"

if %resto%==0 (
    if %resto100%==0 (
        if %resto400%==0 (
            set dias_fevereiro=29
        ) else (
        set dias_fevereiro=28
        echo num eh
        )
    ) else (
        set dias_fevereiro=29
        echo o proximo ano bissexto e %conta%
    )
) else (
    set dias_fevereiro=28
    echo num eh
)

cd "%1"

if not exist "%2" (
    mkdir "%2"
)

cd "%2"

if "%2" == "1" set dias=31
if "%2" == "2" set dias=%dias_fevereiro%
if "%2" == "3" set dias=31
if "%2" == "4" set dias=30
if "%2" == "5" set dias=31
if "%2" == "6" set dias=30
if "%2" == "7" set dias=31
if "%2" == "8" set dias=31
if "%2" == "9" set dias=30
if "%2" == "10" set dias=31
if "%2" == "11" set dias=30
if "%2" == "12" set dias=31

echo o numero de dias do mes %2 e %dias%

for /l %%i in (1,1,%dias%) do (
    if not exist "Dia %%i" (
        mkdir "Dia %%i"
    )
)

cd ..
cd ..

