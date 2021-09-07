ApplyPreset(item)
{

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
SendInput, %kbSelectEffectsPanel%
SendInput,%kbSelectFindBox%

;Types the preset we're looking for into the find box
Send %item%

;this is where we'd usually need to wait for premiere to update the presets list.
;If, however, it's pre-opened like mine (and reset to be pre-opened at the end of this function)
;then premiere will update the list instantly
;however, if not, or we want it to be reliable no matter what the current state is, we need to delay
;10 ms seems to be about right for my system, you may want to increase/decrease for your own
sleep 10

;get effects panel position
ControlGetPos, cX, cY, cW, cH, %wdEffectsPanel%, ahk_class Premiere Pro

;move mouse to top bin - we don't care what it is, but we need to make sure that no presets are already selected for the image search to work properly.
MouseMove, cX + 40, cY + 35, 0
;click to select it, deselecting whatever preset was last used
MouseClick, left, , , 1 

;find top preset icon
ImageSearch, iX, iY, cX, cY, cX + cW, cY + cH, Img/preset.png

if(ErrorLevel == 1 || ErrorLevel == 2)
	goto apEnd

;move mouse to preset
MouseMove, iX, iY + 5, 0

;drag preset back
MouseClickDrag, Left, , , oX, oY, 0

apEnd:

;Resets and pre-opens my presets list for easier editing - this is just for how I work
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

