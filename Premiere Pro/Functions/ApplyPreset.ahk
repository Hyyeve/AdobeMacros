ApplyPreset(item)
{

;Gives us access to all the premiere pro shortcuts - handling them in one file makes it easy to change them.
#Include %A_WorkingDir%\Premiere Pro Shortcuts.ahk

SendMode Event

;Waits to make sure any previous hotkeys have been released
keywait, %A_PriorHotKey%

;Just in case we're not in Premiere Pro
if(WinActive("ahk_exe Adobe Premiere Pro.exe") = 0)
	goto apEnd

;Sets up the coord modes, making sure our pixel distances are consistent
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window

;Disables mouse and keyboard input to make sure the function runs properly
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

;Sets the keypress delay for Send/Sendinput commands to be zero.
SetKeyDelay, 0

;Gets the current position of the mouse and stores it in ox and oy (Original X and Original Y)
MouseGetPos, oX, oY 

;Selects the Effects Panel -> Find Box
Sendinput, %kbSelectEffectsPanel%
Sendinput,%kbSelectFindBox%

;Types the preset we're looking for into the find box
Send %item%

;get effects panel position
ControlGetPos, cX, cY, cW, cH, DroverLord - Window Class34, ahk_class Premiere Pro

;find top preset icon
ImageSearch, iX, iY, cX, cY, cX + cW, cY + cH, Img/preset.png

if(ErrorLevel == 1)
	goto apEnd
if(ErrorLevel == 2)
	goto apEnd

;move mouse to preset
MouseMove, iX, iY + 5, 0

;drag preset back
MouseClickDrag, Left, , , oX, oY, 0

apEnd:

;Resets the effects panel for easier editing
SendInput, %kbSelectEffectsPanel%
SendInput,%kbSelectFindBox%
Send Video Presets

;Puts the mouse back where it started
MouseMove oX, oY, 0

;Re-selects the timeline panel
MouseClick, middle, , , 1 

;Re-enables input
BlockInput, MouseMoveOff 
BlockInput, off 
}

