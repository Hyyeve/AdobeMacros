QuickSplitHere()
{

SendMode Event
;Waits to make sure any previous hotkeys have been released
keywait, %A_PriorHotKey%


;Just in case we're not in Premiere Pro
if(WinActive("ahk_exe Adobe Premiere Pro.exe") = 0)
	goto qshEnd

;make sure timeline is currently selected - this is just for me, 
;because I want to replace the normal C key with this, but still need to be able to type C in other places.
ControlGetFocus, cCheck
if(cCheck != wdTimeline)
{
	goto qshEnd
}
	

;Sets up the coord modes, making sure our pixel distances are consistent
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window

;Disables mouse and keyboard input to make sure the function runs properly
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

;Sets the keypress delay for Send/Sendinput commands to be zero.
;If typing in the preset name isn't consistent for you, increase this value.
SetKeyDelay, 0

;switch to razor tool
SendInput, %kbRazorTool%
;slice
MouseClick, left, , , 1
;switch back to select tool
SendInput, %kbSelectionTool%

qshEnd:

;Re-enables input
blockinput, MouseMoveOff 
BlockInput, off 

}