;noobs
k0 = 0xD82A22
k1 = 0xD82A22
k2 = 0xD82A22
k3 = 0xD82A22
l0 = 0xD82A22
l1 = 0xD82A22
m0 = 0xD82A22
m1 = 0xD82A22
#Persistent
guif:
#NoEnv
#SingleInstance force
Gui, Color, Black
Gui, Show, w470 h260, KRUNKER ZARES HELP HAND v1.0
Gui Font, s8 Norm cLime, MS Sans Serif
Gui, Add, Text, x12 y60,  Start Bot { F1 }
Gui, Add, Text, x12 y80 ,  Restart Program { F12 }
Gui, Add, Text, x12 y100,  Pause/Resume { Alt }
Gui, Add, CheckBox, x12 y120 w53  h20 vaimbot, Aimbot
Gui, Add, Text, x65 y120 w20 h30 , ---
Gui, Add, CheckBox, x90 y120 w155 h20 vaimbotsmooth, Smooth Aimbot
Gui, Add, CheckBox, x12 y140 w70 h20 vtrigger, TriggerBot
Gui, Add, CheckBox, x90 y140 w100 h20 vsniper, SniperSettings
Gui, Add, CheckBox, x292 y19 vaimtype Checked, Left Click Hotkey
Gui, Add, CheckBox, x292 y45 vaimtype1, Right Click Hotkey
Gui, Add, Text, x270 y110 w120 h30 , Aim speed control
Gui, Add, Edit, x362 y110 w100 h30 vrx, 0.5
Gui, Add, Text, x235 y75 , Ingame Mouse Sensitivity
Gui, Add, Edit, x362 y75 w100 h30 vrxx, 19
Gui, Add, Button, x232 y150 w230 h90 gchange1, Apply settings
gui, add, button, x5 y5 w164 h33 gIssue, Help
Gui Font,, MS Sans Serif
Gui Add, Button, x12 y180 w164 h33 gDiscord, CHECK FOR UPDATES
Gui Font
Gui Add, Button, x12 y220 w164 h33 gYoutube, YOUTUBE
Gui Font
Gui, Show
Loop {
Gui, Submit, NoHide
Sleep -1
}
Return
#If mccree=1
~RButton::
Loop
If GetKeyState("RButton") {
Sleep, 5
moveAmount := (moveAmount = 2) ? 3 : 0
mouseXY(moveAmount,3.4)
}
else
break
Return
mouseXY(x,y)
{
DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
}
#If
return
#If genji=1
~v::
MouseClick, right
Send {shift down}{shift up}
sleep, 400
if(turn=1)
{
GuiControlget, rXx
if(timer < A_TickCount)
{
timer := A_TickCount +300
DllCall("mouse_event", uint, 1, int, ((A_ScreenWidth // 2)*2)*(14.2/rxx), int, -50, uint, 0, int, 0)
}
sleep, 250
}
Mouseclick, Right
send {Mbutton down}{MButton Up}
Return
#If
Return
Reload
Return
Issue:
{
msgbox,32, KRUNKER ZARES, KRUNKER ZARES help hand`n `nHaving issues?`n`n-Please make sure that InGameMouseSensitivity is on 50 or 40 as you like it. And AimSpeedControl on 10 or 15 `n`n-Better Aim on 1080p screen`n`n-This tracs enemies Color tag. Use this for help https://github.com/ZaResX/KrunkerZares/tree/master/TamperMonkey/SeeNameTags Learn make own ESP`n`n-Press F1 to start aimbot`n`n-Use AimAssist and KRUNKER ZARES v0.4 for better aim`n`n-Avoid much enemies`n`n-SniperSettings means it'll wait until sniper is done charging before shooting.`n`n-Be smart`n`n-Hold on left button for triggerbot to detect enemies.
}
return
GuiClose:
ExitApp
return
SkinForm(Param1 = "Apply", DLL = "", SkinName = ""){
if(Param1 = Apply){
DllCall("LoadLibrary", str, DLL)
DllCall(DLL . "\USkinInit", Int,0, Int,0, AStr, SkinName)
}else  if(Param1 = 0) {
DllCall(DLL . "\USkinExit")
}}
Change1:
Tooltip, Applied!
SetTimer, RemoveToolTip, 500
Gui,Submit, Nohide
return
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
F1::
Soundbeep
#KeyHistory, 0
#NoEnv
#HotKeyInterval 1
#MaxHotkeysPerInterval 2000
#Usehook
#SingleInstance, Force
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
SendMode, InputThenPlay
SetBatchLines,-1
ListLines, Off
CoordMode, Pixel, Screen, RGB
CoordMode, Mouse, Screen
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, Normal
MouseX1:= 895
MouseX2:= 1035
Mousey1:= 425
Mousey2:= 515
EMCol := 0xD82A22
ColVn := 64
Health :=0
Body:=1
if(body=1)
{
AntiShakeX := 30
AntiShakeY := 30
ZeroX := (A_ScreenWidth // 2)
ZeroY := (A_ScreenHeight // 2)
CFovX := (A_ScreenWidth // 8)
CFovY := (A_ScreenWidth // 64)
}else  {
AntiShakeX := 30
AntiShakeY := 30
ZeroX := 900
ZeroY := 450
CFovX := 20
CFovY := 20
}
xrange :=58
yrange :=85
ScanL := ZeroX - CFovX
ScanT := ZeroY
ScanR := ZeroX + CFovX
ScanB := ZeroY + CFovY
NearAimScanL := ZeroX - AntiShakeX
NearAimScanT := ZeroY - AntiShakeY
NearAimScanR := ZeroX + AntiShakeX
NearAimScanB := ZeroY + AntiShakeY
Timer:=0
Negative :=0
Positive :=0
Shoot :=0
ExitTimer:=0
ExitCount:=0
soundbeep
Loop, {
Gui,Submit, Nohide
 
if (aimtype=1){
GetKeyState, Mouse2, LButton , P
GoSub MouseMoves2
}
if (aimtype1=1)
{
GetKeyState, Mouse2, RButton, P
GoSub MouseMoves2
}
GoSub GetAimOffset1
}
MouseMoves2:
If ( Mouse2 == "D" ) {
if (aimbot=1 or aimbotsmooth=1)
{
blockinput, on
DllCall("mouse_event", "UInt", 0x01, "UInt", Movesx*(rx), "UInt", Movesy)
blockinput, off
}
if(1trigger =1)
{
if(sniper=1)
{
rx =0.5
Timeyes = 1
}else  {
GuiControlget, rX
}
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
if(sniper=1)
{
if(aimpixelx < zerox +20 and aimpixelx > zerox - 20 )
{
if(Timer > 200)
{
Timer := 0
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
}}}else  {
if(aimpixelx < zerox +5 and aimpixelx > zerox - 5 )
{
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
}}}
if(trigger)
{
DllCall("mouse_event", uint, 4, int, 0, int, 0, uint, , int, 0)
if(shoot=1)
{
if(sniper=1)
{
if(Timer < A_Tickcount)
{
Timer := A_Tickcount+1350
DllCall("mouse_event", uint, 2, int, 0, int, 0, uint, 0, int, 0)
Shoot :=0
}}else  {
DllCall("mouse_event", uint, 2, int, 0, int, 0, uint, 0, int, 0)
Shoot :=0
}}
Shoot:=0
}
if(otriaim =1)
{
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
if(aimpixelx < zerox + 5 and aimpixelx > zerox -5)
{
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
}}
if(triaim =1)
{
blockinput, on
if(Timer < A_Tickcount)
{
Timer:= A_tickcount + 300
if(Positive=1)
{
Dirx := (14.2/rxx)
Aimx := (Aimx-50) * Dirx
DllCall("mouse_event", uint, 4, int, aimx, int, aimy, uint, 0, int, 0)
Send, v
Positive :=0
}
if(Negative =1 )
{
Dirx := (14.2/rxx)
Aimx := (Aimx-20) * Dirx
DllCall("mouse_event", uint, 4, int, aimx, int, aimy, uint, 0, int, 0)
Send, v
Negative :=0
}}
blockinput, off
}
if(triaimhb =1)
{
blockinput, on
if(Timer < A_Tickcount)
{
Timer:= A_tickcount + 300
if(Positive=1)
{
Dirx := (14.2/rxx)
Aimx := (Aimx-50) * Dirx
DllCall("mouse_event", uint, 4, int, aimx, int, aimy, uint, 0, int, 0)
Send, v
Positive :=0
}
if(Negative =1 )
{
Dirx := (14.2/rxx)
Aimx := (Aimx-20) * Dirx
DllCall("mouse_event", uint, 4, int, aimx, int, aimy, uint, 0, int, 0)
Send, v
Negative :=0
}}
blockinput, off
}
}
Return
GetAimOffset1:
Gui,Submit, Nohide
if(trigger =1)
{
ImageSearch, , , 960, 0, 960, 540, *100 1.png
If Errorlevel = 0
ImageSearch, , , 960, 541, 960, 1080, *100 1.png
If Errorlevel = 0
ImageSearch, , , 0, 540, 960, 540, *100 1.png
If Errorlevel = 0
ImageSearch, , , 960, 540, 1920, 540, *100 1.png
if Errorlevel = 0
Shoot:=1
}
if(aimbotsmooth=1 or triaim =1)
{
PixelSearch, AimPixelX, AimPixelY, NearAimScanL, NearAimScanT, NearAimScanR, NearAimScanB, EMCol, ColVn, Fast RGB
if (!ErrorLevel=0) {
PixelSearch, AimPixelX, AimPixelY, ScanL, ScanT, ScanR, ScanB, EMCol, ColVn, Fast RGB
AimX := AimPixelX - ZeroX +50
AimY := AimPixelY - ZeroY
If ( AimX > 0 ) {
DirX := 1
negative:=0
positive:=1
}else  {
DirX := -1
DirY := -1
negative:=1
positive:=0
}
If ( AimY > 0 ) {
DirY := 1
}
AimOffsetX := (AimX * DirX) * (14.2/rxx)
AimOffsetY := (AimY * DirY) * (14.2/rxx)
MovesX := Floor(( AimOffsetX ** ( 1 / 2 ))) * DirX
MovesY := Floor(( AimOffsetY ** ( 1 / 2 ))) * DirY
}}
if(aimbot=1 or triaimhb = 1)
{
ImageSearch, AimPixelX, AimPixelY, NearAimScanL, NearAimScanT, NearAimScanR, NearAimScanB,  *4 hhp2.bmp
if (!ErrorLevel=0)
{
Body:=1
Health:=0
PixelSearch, AimPixelX, AimPixelY, NearAimScanL, NearAimScanT, NearAimScanR, NearAimScanB, EMCol, ColVn, Fast RGB
if (!ErrorLevel=0) {
PixelSearch, AimPixelX, AimPixelY, ScanL, ScanT, ScanR, ScanB, EMCol, ColVn, Fast RGB
AimX := AimPixelX - ZeroX +50
AimY := AimPixelY - ZeroY
If ( AimX > 0 ) {
DirX := 1
negative:=0
positive:=1
}else  {
DirX := -1
DirY := -1
negative:=1
positive:=0
}
If ( AimY > 0 ) {
DirY := 1
}
AimOffsetX := (AimX * DirX) * (14.2/rxx)
AimOffsetY := (AimY * DirY) * (14.2/rxx)
MovesX := Floor(( AimOffsetX ** ( 1 / 2 ))) * DirX
MovesY := Floor(( AimOffsetY ** ( 1 / 2 ))) * DirY
}else  {
Health:=1
Body:=0
ImageSearch, AimPixelX, AimPixelY, ScanL, ScanT, ScanR, ScanB,  *4 hhp.bmp
AimX := AimPixelX - ZeroX
AimY := AimPixelY - ZeroY
If ( AimX > 0 ) {
DirX := 1
negative:=0
positive:=1
}else  {
DirX := -1
DirY := -1
negative:=1
positive:=0
}
If ( AimY > 0 ) {
DirY := 1
}
AimOffsetX := (AimX * DirX) * (14.2/rxx)
AimOffsetY := (AimY * DirY) * (14.2/rxx)
MovesX := Floor(( AimOffsetX ** ( 1 / 2 ))) * DirX
MovesY := Floor(( AimOffsetY ** ( 1 / 2 ))) * DirY
}}}
Return
reload:
SleepF1:
SleepDuration = 1
TimePeriod = 1
DllCall("Winmm\timeBeginPeriod", uint, TimePeriod)
Iterations = 1
StartTime := A_TickCount
Loop, %Iterations% {
DllCall("Sleep", UInt, TimePeriod)
}
DllCall("Winmm\timeEndPeriod", UInt, TimePeriod)
Return
DebugTool1:
MouseGetPos, MX, MY
ToolTip, Mouse Pos: %Movesx% %MY% %cfovx% %cfovy%
ToolTip, Aimpixel: %aimpixelx% %AimY% ,,+3, 2
Return
Return
TEA(ByRef y,ByRef z, k0,k1,k2,k3)
{
s = 0
d = 0x9E3779B9
Loop 32
{
k := "k" . s & 3
y := 0xFFFFFFFF & (y + ((z << 4 ^ z >> 5) + z  ^  s + %k%))
s := 0xFFFFFFFF & (s + d)
k := "k" . s >> 11 & 3
z := 0xFFFFFFFF & (z + ((y << 4 ^ y >> 5) + y  ^  s + %k%))
}
}
XCBC(x, u,v, k0,k1,k2,k3, l0,l1, m0,m1)
{
Loop % Ceil(StrLen(x)/16)-1
XCBCstep(u, v, x, k0,k1,k2,k3)
If (StrLen(x) = 16)
{
u := u ^ l0
v := v ^ l1
XCBCstep(u, v, x, k0,k1,k2,k3)
}
Else {
u := u ^ m0
v := v ^ m1
x = %x%100000000000000
XCBCstep(u, v, x, k0,k1,k2,k3)
}
Return Hex8(u) . Hex8(v)
}
XCBCstep(ByRef u, ByRef v, ByRef x, k0,k1,k2,k3)
{
StringLeft  p, x, 8
StringMid   q, x, 9, 8
StringTrimLeft x, x, 16
p = 0x%p%
q = 0x%q%
u := u ^ p
v := v ^ q
TEA(u,v,k0,k1,k2,k3)
}
Hex8(i)
{
format = %A_FormatInteger%
SetFormat Integer, Hex
i += 0x100000000
StringTrimLeft i, i, 3
SetFormat Integer, %format%
Return i
}
Hex(ByRef b, n=0)
{
format = %A_FormatInteger%
SetFormat Integer, Hex
m := VarSetCapacity(b)
If (n < 1 or n > m)
n := m
Loop %n%
{
x := 256 + *(&b+A_Index-1)
StringTrimLeft x, x, 3
h = %h%%x%
}
SetFormat Integer, %format%
Return h
}
ALT::
pause,toggle,1
{
if(A_IsPaused=0)
{
Gui, Add, Text, x80 y5 w70 h30 , Running...!
Soundbeep
}
if(A_IsPaused=0)
{
Gui, Add, Text, x80 y5 w70 h30 , Running...!
Soundbeep
}
}
if(A_IsPaused=1)
{
Gui, Add, Text, x80 y5 w70 h30 , Paused...
Soundbeep
}
if(A_IsPaused=1)
{
Gui, Add, Text, x80 y5 w70 h30 , Paused...
Soundbeep
}
return
F12::
Reload
Return
Youtube:
Run https://www.youtube.com/channel/UCLxuarUbS3qzUy2SpLf3WEg
Discord:
Run https://discord.gg/fThurkh
;Made by ZaRes X
;ZaRes X has quited hacking but anyways you using this you need to give credits if you make a youtube video about this cheato. 
;you will get copyright striked and a youtube unlike ride :D
;Thanks for the leak ZaRes X
;https://www.youtube.com/channel/UCLxuarUbS3qzUy2SpLf3WEg
