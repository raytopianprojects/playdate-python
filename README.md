# Transpile Python to Lua for the Playdate
Make games for the playdate handheld using Python.

This is currently a work in progress but feel free to start using it.

## How it works
pd.py contains a generated api that your python files can use. Each file in the Source directory gets converted in a corresponding lua file, when yu run the powershell file. 

## Difference with CPython
The biggest different is importing. By default, lua doesn't have namespaces and so we create a dictionary to replicate this.
By default, everything is local to that file, so you must  add attributes to the file's dictionary to expose the classes, functions, vars in other files.
To see an example of this look at the dvd.py and test.py file.
We're working on a better way to do this and if you have an idea please chime in.

You cannot use python's standard library, and must use lua's instead. We'd like to provide a standard library replacement at some point.


## Template Installation
<img src="https://media.giphy.com/media/QhNgpDotBASjWj7asJ/giphy.gif" width="800" height="480" />

## Installation (Windows):  
1. **Unlock** `Build and Run (Simulator).ps1` file if it's locked: open properties and click unlock in the bottom of the window.
2. If you've installed Playdate SDK to the default path (Documents folder) then just **run** `ADD_ENV_VARIABLE.cmd` to add env variables:  
    * PLAYDATE_SDK_PATH to Playdate SDK
    * Adds Playdate SDK's bin folder to PATH (if it is not already added) to create `pdc` shortcut  

    **!!!** If you've changed default path - edit 6th line in `ADD_ENV_VARIABLE.cmd`, then run it.  
    `set SDKPATH="YOUR CUSTOM SDK PATH HERE"`
    
    This should be done only once, you need to restart VSCode after this.  
3. pip install PyYaml and update & py.exe convert.py to the name/path of your python exe.
3. Open Windows PowerShell and change execution policy to RemoteSigned, so you can run closeSim.ps1 without admin rights:  
    Enter `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` into PowerShell then hit `Y`.
4. Open template folder with VSCode, **install recomended extensions** (popup will show in the lower right corner): `Lua`, `Lua Plus`. Then restart VSCode.  
5. If you want to change "build and run" key (default is Ctrl+Shift+B):  
    * **Ctrl + K, Ctrl + S**  
    * Change keybind for `Tasks: Run Build Task` (I've changed to **F5**)  
6. Your can find your `main.lua` file inside `Source` folder. Press your "Run Build Task" button, you should see "Template" text in playdate simulator.
7. Feel free to delete `dvd.lua` and all dvd-related lines from `main.lua` (marked `-- DEMO`)

#### ⚠️ Don't forget to change your unique project info in `Source/pdxinfo`: "bundleID", "name", "author", "description". Read more about pdxinfo [here](https://sdk.play.date/Inside%20Playdate.html#pdxinfo). It's critical to change your game bundleID, so there will be no collisions with other games, installed via sideload.

# Special thanks to 
Whitebrim for creating the template: https://github.com/Whitebrim/VSCode-PlaydateTemplate

Eremin Dmitrii for creating the transpiler used to turn python into lua: https://github.com/dmitrii-eremin/python-lua

To you!