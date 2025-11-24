@ECHO OFF
echo .
echo . 
echo . 
echo *********************************** 
echo *** COMPILING EMULATE BIN BOOT  ***
echo *********************************** 
echo .
echo . 
echo . 
SET COMPILER_DIR=..\..\..\Compiler
SET PATH=%COMPILER_DIR%\WINDOWS\Other Utilities;%COMPILER_DIR%\WINDOWS\bin;%PATH%
cd satiator-powerrings-emulate
rm -rf "SD\satiator-powerrings\emulate.bin"
copy libiapetus.a "%COMPILER_DIR%\WINDOWS\sh-elf\lib\libiapetus.a"
rm makefile
copy makefile_windows makefile
make clean
mkdir out
make
type ip.bin emulate_code.bin >> out/emulate.bin
echo "created emulate.bin"
move emulate_code.bin out/emulate_code.bin
move emulate.elf out/emulate.elf
rm -rf makefile
copy makefile_linux makefile
cd ..
copy "satiator-powerrings-emulate\out\emulate.bin" "SD\satiator-powerrings\emulate.bin"

echo .
echo .
echo .
echo *********************************** 
echo ***  COMPILING AR PACTHED FW    *** 
echo *********************************** 
echo .
echo .
echo .

rmdir   "SD\satiator-powerrings\ar" /s /q
mkdir "SD\satiator-powerrings\ar"
cd satiator-powerrings-arpatch
START /WAIT build
cd..
move satiator-powerrings-arpatch\release\*.bin SD\satiator-powerrings\ar\

echo .
echo .
echo .
echo *********************************** 
echo ***  COMPILING SATIATOR RINGS   *** 
echo *********************************** 
echo .
echo .
echo .

compile
