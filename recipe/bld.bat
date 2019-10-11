:: Build and install libinchi
cd %SRC_DIR%\INCHI_API\libinchi\vc9
if "%VS_YEAR%" == "2008" (
  vcbuild libinchi.vcproj Release /platform=x64
) else (
  devenv /Upgrade libinchi.vcproj
  msbuild libinchi.vcxproj /p:Configuration=Release /p:Platform=x64
)
copy %SRC_DIR%\INCHI_API\bin\Windows\x64\Release\libinchi.dll %LIBRARY_BIN%\libinchi.dll
copy %SRC_DIR%\INCHI_API\bin\Windows\x64\Release\libinchi.lib %LIBRARY_LIB%\libinchi.lib
copy %SRC_DIR%\INCHI_API\bin\Windows\x64\Release\libinchi.exp %LIBRARY_LIB%\libinchi.exp
if errorlevel 1 exit 1

:: Build inchi-1 executable
cd %SRC_DIR%\INCHI_EXE\inchi-1\vc9
if "%VS_YEAR%" == "2008" (
  vcbuild inchi-1.vcproj Release /platform=x64
) else (
  devenv /Upgrade inchi-1.vcproj
  msbuild inchi-1.vcxproj /p:Configuration=Release /p:Platform=x64
)
copy %SRC_DIR%\INCHI_EXE\bin\Windows\x64\Release\inchi-1.exe %LIBRARY_BIN%\inchi-1.exe
if errorlevel 1 exit 1

:: Install headers
mkdir %LIBRARY_INC%\inchi\
copy %SRC_DIR%\INCHI_API\libinchi\src\*.h %LIBRARY_INC%\inchi\*
copy %SRC_DIR%\INCHI_BASE\src\*.h %LIBRARY_INC%\inchi\*