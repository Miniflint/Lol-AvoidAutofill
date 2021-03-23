SetKeyDelay 30,50
PathIni = C:\Users\%a_username%\AppData\Roaming\IniPath.ini
if (A_Hour>=16) And (A_Hour<=22)
    LoopFunc(50000,PathIni)
else if (A_Hour>=23) or (A_Hour<=2)
    LoopFunc(40000,PathIni)
else if (A_Hour>=3) And (A_Hour<=10)
    LoopFunc(45000,PathIni)
else if (A_Hour>=11) And (A_Hour<=15)
    LoopFunc(50000,PathIni)

return

LoopFunc(Number, PathIni)
{
    if !(fileexist(PathIni))
    {
        msgbox, place your cursor on "find match" button`nyou have 4 Second
        FunctGetAndWriteIni(PathIni)
    }
    else (fileexist(PathIni))
    {
        msgbox, f12 to stop the script and F10 to uninstall the code
        loop, 40
        {
            IniRead, ValueMouse1, %PathIni%, Section, 1
            IniRead, ValueMouse2, %PathIni%, Section, 2
            ControlClick, %ValueMouse1%, League of Legends
            Sleep %Number%
            ControlClick, %ValueMouse2%, League of Legends
            sleep 800
            ControlClick, %ValueMouse1%, League of Legends
            Send, {ALT DOWN}{TAB}{ALT UP}
        }
    return
    }
}
FunctGetAndWriteIni(PathIni)
{
    ValueMouses = 1
    while (ValueMouses != 3)
    {
        sleep, 4000
        MouseGetPos, xVar, yVar, OutputVarWin, OutputVarControl
        IniWrite, x%xVar% y%yVar%, %PathIni%, Section, %ValueMouses%
        ValueMouses++
        if (ValueMouses != 3)
            msgbox, cursor on the "x" (stop the matchmaking) is
    }
    if(ValueMouses = 3)
        Msgbox, it's the end -you can now launch the script again
    exitapp
}
return
F12::
pause
return
f10::
MsgBox, 4, uninstall ?, Are you sure you want to uninstall the script ?
ifmsgbox, Yes
{
    FileDelete, %PathIni%
    Run, %comspec% /c del "%A_ScriptFullPath%",, Hide
    Exitapp
}
