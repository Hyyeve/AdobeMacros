#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%\Functions\ApplyPreset.ahk
#Include %A_ScriptDir%\Functions\QuickSplit.ahk
#IfWinActive ahk_exe Adobe Premiere Pro.exe

;;;;THIS SCRIPT IS JUST FOR SETTING HOTKEYS TO CALL FUNCTIONS;;;;

f13:: ApplyPreset("Cam Zoom (1.5x)")
f14:: ApplyPreset("Cam Zoom (2.0x)")
f15:: ApplyPreset("Cam Zoom (2.5x)")
f16:: ApplyPreset("Cam Zoom (3.0x)")
f17:: ApplyPreset("Cam Zoom (3.5x)")

f9:: ApplyPreset("MM Anchor")
f10:: ApplyPreset("Dip to Black")
f11:: ApplyPreset("Dissolve")
f12:: ApplyPreset("SquishWarp (ADJ)")

f1:: ApplyPreset("UL Anchor")
f2:: ApplyPreset("UR Anchor")
f3:: ApplyPreset("DL Anchor")
f4:: ApplyPreset("DR Anchor")

f5:: ApplyPreset("ML Anchor")
f6:: ApplyPreset("MR Anchor")
f7:: ApplyPreset("UM Anchor")
f8:: ApplyPreset("DM Anchor")

^c:: QuickSplit()