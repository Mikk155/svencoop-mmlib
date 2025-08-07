# mmlib
Utility code for metamod plugins. It handles metamod initialization so that you only need to define `PluginInit()`, `PluginExit()`, and a `Plugin_info` struct to create a functional plugin. Private API headers for Sven Co-op are included so you can use game-specific data/functions for things like CBaseEntity and CBasePlayer.

Some non-trivial utilities included here:  
- Text menus
- g_Scheduler (like in Angelscript)
- PlaySound
- Network sockets

MetaHelper.as exists for private APIs and hooks which are not accessible to metamod plugins. As [ApiGenerator](https://github.com/wootguy/ApiGenerator) improves, fewer of those functions will be necessary.

# Creating a new project that uses mmlib
1. Open a shell in your project repository folder and run these commands to setup mmlib as a submodule
```
git clone --recurse-submodules https://github.com/Mikk155/svencoop-mmlib mmlib
```
```
git submodule update --init --recursive
```
2. Create you ``CMakeLists.txt``
```CMake
cmake_minimum_required(VERSION 3.6)

project( Your-project-name )

# Your source files
set(SOURCE_FILES
    src/main.cpp
)

add_library(${PROJECT_NAME} SHARED)
add_subdirectory(mmlib)
mmlib_default_setup()
```
3. Run mmlib/build.bat/.sh

### Optional for debuggin:

1. Open `mmlib/CMakelists.txt` and make sure the [path to Sven Co-op](https://github.com/wootguy/mmlib/blob/master/CMakeLists.txt#L3) is correct.
2. Run `msvc.bat` to generate Visual Studio project files
3. Open the Visual Studio solution, then right click the `mmlib_example` project and select `Set as startup project`
4. Add `win32 addons/metamod/dlls/mmlib_example.dll` to your metamod `plugins.ini` file
5. Press F5 in VS. The game should start up with the debugger attached.

### To pull updates from this mmlib repo into your project, run:  
```
git submodule update --recursive --remote
```

# Generic build instructions for plugins that use mmlib
Most of my plugins don't change the mmlib build process and so you can follow the instructions below to build them all.

Windows:  
1. Intall Git for windows, CMake, and Visual Studio 2022 (select "Desktop development with C++")
2. Open a command prompt somewhere and run this command to download the code (replace `PluginName` with the name of the plugin repo):
    ```
    git clone --recurse-submodules https://github.com/wootguy/PluginName
    ```
3. Open the folder that was created and run `build.bat`

Linux:
1. Install Git, CMake, and a compiler.  
    Debian: `sudo apt install build-essential git cmake`
2. Open a terminal somewhere and and run these commands, replacing `PluginName` with the name of the plugin repo: 
    ```
    git clone --recurse-submodules https://github.com/wootguy/PluginName
    cd PluginName
    sh build.sh
    ```
