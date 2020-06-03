;OPTIMIZATIONS START
#MaxHotkeysPerInterval 920000000
#HotkeyInterval 920000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
;OPTIMIZATIONS END
Gui, Show, w100 h50, KRUNKER ZARES AIM ASSIST
Gui Font, s8 Norm cLime, MS Sans Serif
Gui, Add, CheckBox, x12 y12 vaimbot, Aim Assist
Gui, Add, Text, x5 y32, Made by: ZaRes X
Gui, Color, Black
CoordMode, Mouse, Screen 
CoordMode, Pixel, Screen 
MidX := A_ScreenWidth / 2 
MidY := A_ScreenHeight / 2 
Triggerbot = 0 
Sense = 7
FirstPairX := floor(MidX - 100)
FirstPairY := floor(MidY - 100)
SecondPairX := floor(MidX + 100)
SecondPairY := floor(MidY + 100)
aim := 0x5064FB
aimbot:
~RButton::
{
While GetKeyState("RButton"){
PixelSearch, TargetX, TargetY, FirstPairX, FirstPairY, SecondPairX, SecondPairY, %aim%, 20, Fast
If ErrorLevel = 0 
{ 
TargetX := TargetX + 42
TargetY := TargetY + 20
MoveX := ((TargetX - MidX) / sense) 
MoveY := ((TargetY - MidY) / sense) 
MouseMove, MoveX, MoveY,, R 
if (TriggerBot = 1) 
Click 
}
}
}
return
GuiClose:
ExitApp
return
;got some errors here D: Will be fixed in v0.5
;Made by ZaRes X
;ZaRes X has quited hacking but anyways you using this you need to give credits if you make a youtube video about this cheato. 
;you will get copyright striked and a youtube unlike ride :D
;Thanks for the leak ZaRes X
;https://www.youtube.com/channel/UCLxuarUbS3qzUy2SpLf3WEg

;This is modified
; Official one is https://github.com/HackerHansen/Krunker-color-aimbot/blob/master/krunker_aimbot%20-%20Public.ahk but it's bad Z>_<z
