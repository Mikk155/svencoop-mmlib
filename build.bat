@echo off

cls
echo This script will build the plugin and copy the .dll to the same folder as the work space.
echo Before continuing, you should have installed:
echo - CMake 
echo - Visual Studio (with "Desktop development with C++" selected in the installer)

cd ..

if not exist "build" (
    mkdir build
)

cd build
cmake -A Win32 -DSKIP_IDE_SETUP=ON %* ..
cmake --build . --config Release

@echo off
if exist "Release\*.dll" (
    copy "Release\*.dll" .. /Y
) else (
    echo "Oopsie whoopsie! The build failed! Look above for errors.
    pause
)
