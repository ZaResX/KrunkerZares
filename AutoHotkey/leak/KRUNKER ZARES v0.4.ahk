;noobs
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance, Force
FirX := (A_ScreenWidth - A_ScreenWidth + 400)
FirY := (A_ScreenHeight - A_ScreenHeight + 400)
MidX := A_ScreenWidth / 2
MidY := A_ScreenHeight / 2
;OPTIMIZATIONS START
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
SetBatchLines,-1
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
IniRead, Key1, Settings.ini, Settings, SuspendKey, Insert
IniWrite, %Key1%, Settings.ini, Settings, SuspendKey
Hotkey, %Key1%, ~$hkWrite
;OPTIMIZATIONS END
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MidX := A_ScreenWidth / 2
MidY := A_ScreenHeight / 2
SetBatchLines,-1
;Triggerbot = 0 
;Sense = 3	
; INI Files / GUI setup
INI_Init("settings.ini")
GoSub, trimMain
GoSub, img_statics
GoSub, ShowGUI
GoSub, UpdateMainGuiText
k0 = 0xD82A22
k1 = 0xD82A22
k2 = 0xD82A22
k3 = 0xD82A22
l0 = 0xD82A22
l1 = 0xD82A22
m0 = 0xD82A22
m1 = 0xD82A22
aim := 0x5064FB
Gui, Show, x%FirX% y%FirY% w125 h157, ZaRes X Krunker Hack 0.4
Gui Font, s9 Norm cBlack, MS Sans Serif
Gui, Add, Text, x4 y4  h21 gGuiMove, KRUNKER ZARES v0.4
Gui Font
Gui, -Caption +Border
Gui, Add, Text, x150 y5 w670 h80 vMyText, ZARES ;retards gonna change this but it won't work properly for them because they are skids!
Gui, Show, w536 h359, KRUNKER ZARES v.04
Gui Font,, MS Sans Serif
Gui Add, Button, x358 y320 w164 h33 gExit, EXIT
Gui Font
Gui Font,, MS Sans Serif
Gui Add, Button, x358 y280 w164 h33 gDiscord, CHECK FOR UPDATES
Gui Font
Gui Font,, MS Sans Serif
Gui Add, Button, x358 y240 w164 h33 gSupport, GET HELP | SUPPORT
Gui Font
Gui Font ,, MS Sans Serif
Gui, Add, Button, x358 y160 w164 h33 gMainGuiToggle vMiniButton, MAIN SETTINGS
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, GroupBox, x13 y187 w330 h167, Aimbot settings
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x23 y270 gFovBox vFov, Fov Box 1 [1080p] ;color error
Gui Font
Gui Add, Slider, x22 y326 w167 vBoxColor gBoxColors ToolTip Thick8 Range1-10 NoTicks, Thick8
Gui Font, s10 Norm q0 cLime, MS Sans Serif
Gui Add, Text, x198 y324 w142 h23 +0x200, Fov Box Color
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x23 y299 gaction1, Fov Box 2 [All]
Gui 2: Color, EEAA99
Gui 2: Font, S72, Arial Black
Gui 2: Add, GroupBox, w200 h250 cFFB10F BackgroundTrans,
Gui 2: +LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, EEAA99     
Gui 2: -Caption
Gui Font
Gui Add, Slider, x23 y245 w167 vSense gOui ToolTip Thick8 Range1-10 NoTicks, 2
Gui Font, s10 Norm q0 cLime, MS Sans Serif
Gui Add, Text, x197 y244, Aim Smooth:
Gui, Add, Text, x280 y244 vSen w30, 2
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, Text, x23 y214 , No Recoil
Gui Add, DropDownList, x88 y210 w40 vRCT, 0||1|2|3|4|5|6|7|8|9 ;more ?
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, Text, x135 y214 , Suspend Key
Gui, Add, DropDownList, x218 y210 w90 vSuspend, Insert||XButton1|Delete|F1|F2|F3|F4|F5|TAB|1|2|3|4|5|6|7|8|9|0
Gui Font
Gui 3: Color, EEAA99
Gui 3: Font, S72, Arial Black
Gui 3: Add, GroupBox, w100 h150 cFFB10F BackgroundTrans,
Gui 3: +LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, EEAA99
Gui 3: -Caption
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x20 y370 gaction2, Show Nice Box
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x150 y370 vScope gScopeo, Quick Scope
Gui Font
Gui Font,, MS Sans Serif
Gui Add, Button, x358 y200 w164 h33 gYoutube, YOUTUBE
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x23 y155 vBhop gBHop, Key BunnyHop
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x23 y65 vAimSet gAimbot, Aimbot
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x23 y125 vReload gReloado, Auto Reload
Gui Font
Gui Font, s10 Norm cLime, MS Sans Serif
Gui Add, CheckBox, x23 y95 vTriggerbot, Triggerbot
Gui Font
Gui, Font, S50  Bold, Verdana
Gui, Font, S50  Bold, Verdana
loop ;rgb bg for gui
{
	Range := RGBRange(0xFF0000, 0xFF9900, -50, "`n")
	Loop,Parse,Range,`n
	{
		irgb := A_LoopField
		SetFormat, Integer, Hex
		irgb ^= 0xffffff
		Gui, Font, c%irgb%,
		GuiControl, Font, MyText
		Gui, Color, %A_LoopField%
		sleep, 50
	}
	Range := RGBRange(0xFF9900, 0xFFFF00, -50, "`n")
	Loop,Parse,Range,`n
	{
		irgb := A_LoopField
		SetFormat, Integer, Hex
		irgb ^= 0xffffff
		Gui, Font, c%irgb%,
		GuiControl, Font, MyText
		Gui, Color, %A_LoopField%
		sleep, 50
	}
	Range := RGBRange(0xFFFF00, 0x33FF00, -50, "`n")
	Loop,Parse,Range,`n
	{
		irgb := A_LoopField
		SetFormat, Integer, Hex
		irgb ^= 0xffffff
		Gui, Font, c%irgb%,
		GuiControl, Font, MyText
		Gui, Color, %A_LoopField%
		sleep, 50
	}
	Range := RGBRange(0x33FF00, 0x3300FF, -50, "`n")
	Loop,Parse,Range,`n
	{
		irgb := A_LoopField
		SetFormat, Integer, Hex
		irgb ^= 0xffffff
		Gui, Font, c%irgb%,
		GuiControl, Font, MyText
		Gui, Color, %A_LoopField%
		sleep, 50
	}
	Range := RGBRange(0x3300FF, 0x990099, -50, "`n")
	Loop,Parse,Range,`n
	{
		irgb := A_LoopField
		SetFormat, Integer, Hex
		irgb ^= 0xffffff
		Gui, Font, c%irgb%,
		GuiControl, Font, MyText
		Gui, Color, %A_LoopField%
		sleep, 50
	}
	Range := RGBRange(0x990099, 0xFF00FF, -50, "`n")
	Loop,Parse,Range,`n
	{
		irgb := A_LoopField
		SetFormat, Integer, Hex
		irgb ^= 0xffffff
		Gui, Font, c%irgb%,
		GuiControl, Font, MyText
		Gui, Color, %A_LoopField%
		sleep, 50
	}
	Range := RGBRange(0xFF00FF, 0xFF0000, -50, "`n")
	Loop,Parse,Range,`n
	{
		irgb := A_LoopField
		SetFormat, Integer, Hex
		irgb ^= 0xffffff
		Gui, Font, c%irgb%,
		GuiControl, Font, MyText
		Gui, Color, %A_LoopField%
		sleep, 50
	}
}
RGBRange(x, y=0, c=0, delim=",")
{
   oif := A_FormatInteger
   SetFormat, Integer, H
   dr:=(y>>16&255)-(r:=x>>16&255)
   dg:=(y>>8&255)-(g:=x>>8&255)
   db:=(y&255)-(b:=x&255)
   d := sqrt(dr**2 + dg**2 + db**2)
   v := Floor(d/c)
   IfLessOrEqual, c, 0, SetEnv, c, % d/( v := c<-3 ? -1-Ceil(c) : 2 )
   s := c/d
   cr:=sqrt(d**2-dg**2-db**2)*s*((dr>0)*2-1)
   cg:=sqrt(d**2-dr**2-db**2)*s*((dg>0)*2-1)
   cb:=sqrt(d**2-dg**2-dr**2)*s*((db>0)*2-1)
   Loop %v%
   {
      u := SubStr("000000" SubStr( ""
      . ((Round(r+cr*A_Index)&255)<<16)
      | ((Round(g+cg*A_Index)&255)<<8)
      | (Round(b+cb*A_Index)&255), 3)   ,-5)
      StringUpper, u, u
      x .= delim "0x" u
   }
   SetFormat, Integer, %oif%
   return x
}
GuiMove:
Gui Main:Default
PostMessage, 0xA1, 2,,, A
return
Change1:
Tooltip, Applied!
SetTimer, RemoveToolTip, 500
Gui,Submit, Nohide
return
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
action1:
if toggle = 0
{
	toggle = 1
	Gui 2: Hide
}
Else
{
	toggle = 0
	Gui 2: Show
}
return
action2:
if toggle = 0
{
	toggle = 1
	Gui 3: Hide
}
Else
{
	toggle = 0
	Gui 3: Show
}
return
FovBox:
Gui, Submit, NoHide 
if (Fov == 1) {
CreateBox("01FF01")
Box(840, 420, 240, 240, 1, 0)
}
else if (Fov == 0) {
	RemoveBox()
}
return
CreateBox(Color)
{
	Gui 81:color, %Color%
	Gui 81:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 82:color, %Color%
	Gui 82:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 83:color, %Color%
	Gui 83:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 84:color, %Color%
	Gui 84:+ToolWindow -SysMenu -Caption +AlwaysOnTop
}
Box(XCor, YCor, Width, Height, Thickness, Offset)
{
	If InStr(Offset, "In")
	{
		StringTrimLeft, offset, offset, 2
		If not Offset
			Offset = 0
		Side = -1
	} Else {
		StringTrimLeft, offset, offset, 3
		If not Offset
			Offset = 0
		Side = 1
	}
	x := XCor - (Side + 1) / 2 * Thickness - Side * Offset
	y := YCor - (Side + 1) / 2 * Thickness - Side * Offset
	h := Height + Side * Thickness + Side * Offset * 2
	w := Thickness
	Gui 81:Show, x%x% y%y% w%w% h%h% NA
	x += Thickness
	w := Width + Side * Thickness + Side * Offset * 2
	h := Thickness
	Gui 82:Show, x%x% y%y% w%w% h%h% NA
	x := x + w - Thickness
	y += Thickness
	h := Height + Side * Thickness + Side * Offset * 2
	w := Thickness
	Gui 83:Show, x%x% y%y% w%w% h%h% NA
	x := XCor - (Side + 1) / 2 * Thickness - Side * Offset
	y += h - Thickness
	w := Width + Side * Thickness + Side * Offset * 2
	h := Thickness
	Gui 84:Show, x%x% y%y% w%w% h%h% NA
}
RemoveBox()
{
	Gui 81:destroy
	Gui 82:destroy
	Gui 83:destroy
	Gui 84:destroy
}
BoxColors:
Gui, Submit, NoHide
GuiControl,, EditColor, %vBoxColor%
Return
EditColor:
Gui, Submit, NoHide
GuiControl,, vBoxColor, %EditColor%
CreateBox("FF0000")
CreateBox("01fff9")
CreateBox("000000")
CreateBox("0038ff")
CreateBox("f1ff0b")
CreateBox("ffc30b")
CreateBox("ff0be8")
CreateBox("ffffff")
CreateBox("bd00ff")
return ;still gotta some errors. Will be fixed in v0.5
Bhop:
toggleBHop := !toggleBHop
if toggleBHop
{
	Hotkey, *~$Space, label1, On
}
else
{
	Hotkey, *~$Space, label1, Off
}

label1:
Sleep 5
Loop
{
	GetKeyState, SpaceState, Space, P
	If SpaceState = U
		break 
	Sleep 20
	Send, {Blind}{Space}
}
Return
#if Reload ; Enable or disable hotkey based on contents of CheckBoxDate variable
F12::
~LButton up::
{
Send {r down}
sleep, 10
Send {r up}
}
return ;thanks hackerhansen for the help <3
return
#if
Reloado:	; Run when the CheckBox changes
Gui, Submit, NoHide ; This will set CheckBoxDate to true or false
return
#if Scope ; Enable or disable hotkey based on contents of CheckBoxDate variable
#Persistent
#KeyHistory, 0
#NoEnv
#HotKeyInterval 1
#MaxHotkeysPerInterval 127
#InstallKeybdHook
#SingleInstance, Force
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
#NoEnv
#InstallMouseHook
SendMode Input
SetWorkingDir %A_ScriptDir%
$rbutton::                   
Send, {RButton Down}   
Sleep 379               
Send, {LButton Down}   
Sleep 60       
Send, {LButton Up}     
Send, {RButton Up}   
return
return
#if
Scopeo:	; Run when the CheckBox changes
Gui, Submit, NoHide ; This will set CheckBoxDate to true or false
return
~*$LButton::
Loop
{
GetKeyState, state, LButton, P
if state=u
break
Gui, Submit, nohide
mouseXY(0,RCT)
sleep, 5
}
return
mouseXY(x,y)
{
DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
}
~$hkWrite:
Suspend, Permit
Suspend, Toggle
return 
SaveVal:
IniDelete, Settings.ini, NoRecoil, RecoilTiming
IniRead, SaveVal1, Settings.ini, NoRecoil, RecoilTiming, %RCT%
IniWrite, %SaveVal1%, Settings.ini, NoRecoil, RecoilTiming
MsgBox, Saved Config
goSub ~$hkWrite
return
LoadVal:
IniRead, ReadVal1, Settings.ini, NoRecoil, RecoilTiming
IniWrite, %ReadVal1%, Settings.ini, NoRecoil, RecoilTiming
GuiControl, choosestring, RCT, %ReadVal1%
MsgBox, Loaded Config
goSub ~$hkWrite
return
Aimbot:
Gui, Submit, NoHide
Gui, OSD:Show, x0 y0 NoActivate
~RButton::
{
While GetKeyState("RButton"){
PixelSearch, TargetX, TargetY, 640, 220, 1080, 660, aim, 20, Fast
If ErrorLevel = 0
Gui, Submit, NoHide
if (AimSet == 1)
{
TargetX := TargetX + 42
TargetY := TargetY + 30
MoveX := ((TargetX - MidX) / Sense)
MoveY := ((TargetY - MidY) / Sense)
MouseMove, MoveX, %MoveY%,, R
if (TriggerBot = 1)
{
Click, down
}
}
else
Gui, Submit, NoHide
if (Triggerbot = 1)
Click, up
}
}
return
~RButton up::
{
Gui, Submit, NoHide
if (Triggerbot = 300)
Click, up
}
return
Oui:
Gui, Submit, NoHide
GuiControl,,Sen, %Sense%
return
Youtube:
Run https://www.youtube.com/channel/UCLxuarUbS3qzUy2SpLf3WEg
Oui2:
Gui, Submit, NoHide 
GuiControl,,Sen, %Sense% 
return
Discord:
Run https://discord.gg/fThurkh
Oui4:
Gui, Submit, NoHide 
GuiControl,,Sen, %Sense% 
return
Support:
Msgbox, 32, KRUNKER ZARES, How to use? It's pretty easy. `nClick on the check box to activate the hack. `n====================================== `nHow to use Key BunnyHop? Hold space and it will auto jump. `n====================================== `nHow to use Auto Reload? When you end shooting it will auto reload for you. `n====================================== `nHow to use No Recoil. It just makes the cursor down while shooting. `n====================================== `nHow to use Aimbot? Activate Aimbot. Use the slider to make it less aiming or good aiming `n====================================== `nHow to use Fov Box? Your screen needs to be in screen 1080p resolution "1920×1080" to use fov box 1. If you have not "1920×1080" use fov box 2. It works for all `n====================================== `nHow to use Trigger Bot? Trigger Bot auto shoots when it's on object `n====================================== `nIf something not working Join my Discord Server and ask for help. Click on the "Check for updates" button to join. `n======================================
Oui5:
Gui, Submit, NoHide 
GuiControl,,Sen, %Sense% 
return
Exit:
Msgbox, 0, KRUNKER ZARES, Thanks for using! Good Bye!
Oui3:
Gui, Cancel
Gui, Destroy
ExitApp
GuiEscape:
GuiClose:
ExitApp
; ------ INI FUNCTIONS ------
; CREDITS: ZaRes X
; ------ DO NOT TOUCH THIS! ------

; globals: sections, sNumber, section_keys, section_kNumber, section_key

; By default, these values should be:
; sections = 4
; s1 = main, etc
; main_keys = 14, etc
; main_k1 = sen, etc
; main_sen = 6, etc

INI_Init(inifile) {
	local key
	sections := 0
	loop, read, %inifile%
	{
		if (regexmatch(A_Loopreadline,"\[(\w+)]")) { ; line is a section name
			sections+= 1
			s%sections%:=regexreplace(A_loopreadline,"(\[)(\w+)(])","$2")
			sec := s%sections%
			%sec%_keys := 0
			
		} else if (regexmatch(A_LoopReadLine,"(\w+)=(.*)")) { ; line is a key=value pair
			%sec%_keys+= 1
			key:=%sec%_keys
			%sec%_k%key%:=regexreplace(A_LoopReadLine,"(\w+)=(.*)","$1")
			var:=sec "_" %sec%_k%key%
			iniread,%var%,%inifile%,%sec%,% %sec%_k%key%
		}
	}
}

INI_Load(inifile,sec) { ; requires file location and section name
	Gui %sec%:default
	loop,% %sec%_keys
	{
		var := sec "_" %sec%_k%A_index%
		iniread,temp,%inifile%,%sec%,% %sec%_k%A_index%
		if (temp != "ERROR") {
			%var% := temp
			GuiControl,, %var%, % %var%
		} else {
			msgbox, Error loading settings value "%var%". Please select a new file:
			GoSub, imgprofileLoad
			break
		}
	}		
}

INI_Save(inifile,sec) { ; requires file location and section name
	loop,% %sec%_keys
	{
		var:= sec "_" %sec%_k%A_index%,var2:=%var%
		iniwrite,%var2%,%inifile%,%sec%,% %sec%_k%A_index%
	}
}
return
SaveTrg:
Gui Trg:Default
Gui submit, nohide
INI_Save("settings.ini","trg")
GuiControl,, TrgSaveText, Saved!
SetTimer, RevertText, -1000
return
imgprofileLoad:
Thread, NoTimers
FileSelectFile, SelectedFile, 3, imgprofile\, Open a file, Settings files (*.ini)
Thread, NoTimers, false
SplitPath, SelectedFile, name, dir, ext, name_no_ext, drive
if (SelectedFile = "" || ext != "ini") {
	return
}
img_profile := name_no_ext
file := "imgprofile\" . img_profile . ".ini"
INI_Load(file,"img")
INI_Save("settings.ini","img")
Gui Img:Default
GoSub, UpdateImg
GoSub, img_statics
return
imgprofileSaveAs:
Thread, NoTimers
FileSelectFile, SelectedFile, S, imgprofile\new.ini, Save as:, Settings files (*.ini)
Thread, NoTimers, false
if (SelectedFile = "") {
	return
}
SplitPath, SelectedFile, name, dir, ext, name_no_ext, drive
if (ext != "ini") {
   name=%name_no_ext%.ini
}
if (FileExist("imgprofile\"name)) {
	Msgbox, 4, Are you sure?, Overwrite existing file?
	IfMsgBox, No
		return
}
img_profile := name_no_ext
Gui Img:default
Gui submit, nohide
INI_Save("settings.ini","img")
file := "imgprofile\" . img_profile . ".ini"
INI_Save(file,"img")
INI_Load(file,"img")
GoSub, UpdateImg
GoSub, img_statics
return
MainGuiToggle:
Gui Main:Default
if (miniMode != 1) {
	miniMode := 1
	Gui, Show, w536 h400 NoActivate, %WinTitle%
	GuiControl,, MiniButton, SHOW LESS
} else {
	miniMode := 0
	Gui, Show, w536 h359 NoActivate, %WinTitle%
	GuiControl,, MiniButton, MAIN SETTINGS
}
return
toggleTrgGui:
if (showingTrgBox != 1) {
	GoSub, showTrg
} else {
	GoSub, hideTrg
}
return
ToggleHotkeyGui:
Gui Hotkeys:Default
if (showingHotkeys != 1) {
	showingHotkeys := 1
	Mousegetpos, xpos, ypos
	xpos += 10
	ypos += 10
	Gui, show, w225 h165 x%xpos% y%ypos%, Hotkeys:
} else {
	showingHotkeys := 0
	Gui, cancel
}
return
UpdateImg:
Gui Img:Default
GuiControl,, WhitePic, *w%img_WhiteW% *h%img_WhiteH% bmp\2.bmp
GuiControl,, GreyPic, *w%img_GreyW% *h%img_GreyH% bmp\3.bmp
return
showImg:
showingImgBox := 1
Gui Main:Default
Gui,+LastFound
GuiControl,, imgButton, MORE SETTINGS
WinGetPos,newWinx,newWiny,newWinw,newWinh
imgX := newWinx
imgY := newWiny + newWinh
Gui Img:Default
Gui, Show, w250 h302 x%imgX% y%imgY%, %WinTitle%
Sleep, 25
GoSub, UpdateImg
return
hideImg:
Gui Img:Default
Gui, cancel
showingImgBox := 0
Gui Main:Default
GoSub, trimImg
GuiControl,, imgButton, MORE SETTINGS %imgString%
return
trimImg:
imgString := img_profile
len := StrLen(img_profile)
if (len > 6) {
	trim := len - 5
	StringTrimRight, imgString, imgString, %trim%
	imgString := imgString . ".."
}
return
trimMain:
mainString := main_profile
len := StrLen(mainString)
if (len > 13) {
	trim := len - 12
	StringTrimRight, mainString, mainString, %trim%
	mainString := mainString . ".."
}
return
showTrg:
showingTrgBox := 1
Gui Main:Default
Gui, +LastFound,
GuiControl,, trgButton, ... (trg)
WinGetPos,newWinX,newWiny,newWinw,newWinh
trgGuiX := newWinx + newWinw
trgGuiY := newWiny
Gui Trg:Default
Gui, Show, w248 h317 x%trgGuiX% y%trgGuiY%, %winTitle%
return
hideTrg:
Gui Trg:Default
Gui, cancel
showingTrgBox := 0
Gui Main:Default
GuiControl,, trgButton, Triggerbot
return
RevertText:
Gui Main:Default
GuiControl,, MainSaveText, Save
Gui Img:Default
GuiControl,, ImgSaveText, Apply changes
Gui Trg:Default
GuiControl,, TrgSaveText, Save
return
UpdateMainGuiText:
Gui Main:Default
if (b = 1) { 
	GuiControl, +cLime, OnOff
	GuiControl,, OnOff, [%hotkeys_1%] Bot: ON
} else {
	GuiControl, +cRed, OnOff
	GuiControl,, OnOff, [%hotkeys_1%] Bot: OFF	
}
if (main_yMode = 1) {
	GuiControl, +cGreen, Ylock
	GuiControl,, Ylock, [%hotkeys_2%] Y Mode: LOCK
} else if (main_yMode = 0) {
	GuiControl, +cMaroon, Ylock
	GuiControl,, Ylock, [%hotkeys_2%] Y Mode: FREE
}
if (main_PVMode = 1) {
	GuiControl, +cGreen, PVText
	GuiControl,, PVText, [%hotkeys_3%] 2nd Check: PVP
} else if (main_PVMode = 2) {
	GuiControl, +cTeal, PVText
	GuiControl,, PVText, [%hotkeys_3%] 2nd Check: PvE
} else if (main_PVMode = 3) {
	GuiControl, +cOlive, PVText
	GuiControl,, PVText, [%hotkeys_3%] 2nd Check: Both
} else if (main_PVMode = 4) {
	GuiControl, +cMaroon, PVText
	GuiControl,, PVText, [%hotkeys_3%] 2nd Check: None	
}
if (main_trgMode = 1) {
	GuiControl, +cGreen, TrigText
	GuiControl,, TrigText, [%hotkeys_4%] Triggerbot: ON
} else {
	GuiControl, +cMaroon, TrigText
	GuiControl,, TrigText, [%hotkeys_4%] Triggerbot: OFF
}
if (main_anti = 1) {
	GuiControl, +cGreen, AntiText
	GuiControl,, AntiText, [%hotkeys_5%] Anti-Recoil: ON
} else {
	GuiControl, +cMaroon, AntiText
	GuiControl,, AntiText, [%hotkeys_5%] Anti-Recoil: OFF
}	
return
img_statics: ; only needs to be called on save/load
return
ShowGUI:
Random, r, 5, 10
Loop %r% {
	Random, Var,97,122
	WinTitle.=Chr(Var)
}
mousegetpos, xpos, ypos
xpos += -50
ypos += -50
Gui Main:default
Gui, Show, w270 h133 x%xpos% y%ypos%, %WinTitle%
return
;got some errors here D: Will be fixed in v0.5
;Made by ZaRes X
;ZaRes X has quited hacking but anyways you using this you need to give credits if you make a youtube video about this cheato. 
;you will get copyright striked and a youtube unlike ride :D
;Thanks for the leak ZaRes X
;https://www.youtube.com/channel/UCLxuarUbS3qzUy2SpLf3WEg
