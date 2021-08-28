#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;shortcuts for premiere functions
global kbSelectEffectsPanel := "<+7"
global kbSelectFindBox := "<+{F1}"
global kbSelectionTool := "v"
global kbRazorTool := "+c"

;window identifiers
global wdTimeline := "DroverLord - Window Class58"
global wdEffectsPanel := "DroverLord - Window Class34"