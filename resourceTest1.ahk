#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x100 y5 w200 h20, Macro for only resource
Gui, Add, Text, x20 y35 w250 h20 vA, 해상도 1920x1080 / 240 dpi / 듀얼모니터 불가
Gui, Add, Text, x20 y58 w70 h20 resource1, 자원 지점1
Gui, Add, edit, x80 y55 w30 h20 vN1, 506
Gui, Add, edit, x120 y55 w30 h20 vN2, 353

Gui, Add, Text, x20 y81 w70 h20 resource2, 자원 지점2
Gui, Add, edit, x80 y78 w30 h20 vN3, 605
Gui, Add, edit, x120 y78 w30 h20 vN4, 362
;Gui, Add, edit, x80 y50 w50 h20 vN4, 605, 362

Gui, Add, Text, x20 y106 w70 h20 resource3, 자원 지점3
Gui, Add, edit, x80 y103 w30 h20 vN5, 589
Gui, Add, edit, x120 y103 w30 h20 vN6, 329
;Gui, Add, edit, x80 y73 w50 h20 vN6, 506, 353

Gui, Add, Text, x20 y131 w70 h20 resource4, 자원 지점4
Gui, Add, edit, x80 y128 w30 h20 vN7, 516
Gui, Add, edit, x120 y128 w30 h20 vN8, 348
;Gui, Add, edit, x80 y96 w50 h20 vN8, 516, 348

Gui, Add, Button, x100 y155 w110 h20, Start
Gui, Add, Button, x100 y180 w110 h20, Stop
Gui, Add, Text, x120 y210 w80 h20 vVersion, Beta Version 0.7
Gui, Add, Text, x20 y230 w100 h20, F1 시작 F2 정지 
Gui, Show

isMacro := false
CoordMode,Pixel,Relative 
CoordMode,Mouse,Relative 
MsgBox, 14서버의 천하의 설지, 위나라의 사형 등등 쟁쟁한 랭커들의 매크로 사용으로 14서버를 유령서버로 만들겠다는 일념하에 이 매크로를 만들게 되었습니다. 사용전 그분들께 감사한 마음과 함께 묵념드리고 사용하시길 바랍니다. and I love you mi amor, Sandra R de Leon.
return

F1::
ButtonStart:
{
	Gui,Submit,NoHide
	GuiControl, , A, start in 4 seconds
	
	isMacro := true
	isFull := false
	clearTime := 0
	Sleep, 4000
;image search error=1, -> location find
	Loop
	{
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *30 images\toAvoid.bmp
		if (ErrorLevel = 0)
		{
			Send {Click %x% %y%} 
			Sleep, 1000	
			avoidArmy()
		}
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\4by4.bmp
		if (ErrorLevel = 0)
		{
			isFull := true
			Sleep, 5000
		}
		else if (ErrorLevel = 1)
		{
			;MsgBox, test except for 4by4
			isFull := false
			Sleep, 1000
		}
		if (ErrorLevel = 1 && isFull = false)
		{
			MsgBox,2222
			ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *80 images\toAvoid.bmp
			if (ErrorLevel = 0)
			{
				Send {Click %x% %y%} 
				Sleep, 1000	
				avoidArmy()
			}
			Loop
			{
				isFull := checkTroops(isFull)
				if (isFull = true) 
					break
				inputLocation(N1,N2)
				Sleep, 1000
				sendForHarvest()  ;fileName = lumber ;fileName

				isFull := checkTroops(isFull)
				if (isFull = true) 
					break
				inputLocation(N3,N4)
				Sleep, 1000
				sendForHarvest()
				Sleep, 1000
				
				isFull := checkTroops(isFull)
				if (isFull = true) 
					break
				inputLocation(N5,N6)
				Sleep, 1000
				sendForHarvest()
				Sleep, 1000
					
				isFull := checkTroops(isFull)
				if (isFull = true) 
					break
				inputLocation(N7,N8)
				Sleep, 1000
				sendForHarvest()
				Sleep, 1000
			}
		}
	}
}

checkTroops(isFull)
{
	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\4by4.bmp
	if (ErrorLevel = 0)
	{
		;MsgBox, checkTroops
		Sleep, 1000
		isFull := true
	}
	if (ErrorLevel = 1)
	{
		isFull := false
	}
	return isFull
}

inputLocation(locationX,locationY)
{	
	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *70 images\x.bmp
	if (ErrorLevel = 0)
	{
		x := x + 10
		y := y + 10
		Sleep, 1000
		Send {Enter} 
		Sleep, 1000
		Send {Click %x% %y%} 
		Sleep, 1000
		Send %locationX%
		Sleep, 2000
	}
	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *70 images\y.bmp
	if (ErrorLevel = 0)
	{
		x := x + 10
		y := y + 10
		Sleep, 1000
		Send {Enter}
		Sleep, 1000
		Send {Click %x% %y%} 
		Sleep, 1000
		Send %locationY%
		Sleep, 2000
	}
	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *70 images\findLocation.bmp
	if (ErrorLevel = 0)
	{
		x := x + 10
		y := y + 10
		Send {Enter}
		Sleep, 500
		Send {Click %x% %y%}
		Sleep, 1000
	}
	; check if there is someone on the resource point
;	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\notEmpty1.bmp
;	if (ErrorLevel = 0)
;	{
;		MsgBox, not empty
;		return
;	}
;	Sleep, 1000
;	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\notEmpty2.bmp
;	if (ErrorLevel = 0)
;	{
;		MsgBox, not empty
;		return
;	}
	Sleep, 1000
	MouseGetPos, xpos, ypos
	MouseMove (A_ScreenWidth / 2) - xpos, (A_ScreenHeight / 2) - ypos, , R
	Sleep, 1000
	MouseClick,L
	Sleep, 1000
	;MouseClick,L
}

; in the list, find the item in there. then click the resource in it.
sendForHarvest()
{
	MouseClick,L
	Sleep, 2000
	; harvest button on the map
	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\harvestButton.bmp
	if (ErrorLevel = 0)
	{
		x := x + 10
		y := y + 10
		Send {Click %x% %y%}
		Sleep, 2500
	}
	; when you use up ur stamina
	ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\stamina.bmp
	if (ErrorLevel = 0)
	{
		Send {Click %x% %y%}
		Sleep, 3000
		MouseGetPos, xpos, ypos
		MouseMove (A_ScreenWidth / 2) - xpos, (A_ScreenHeight / 2) - ypos, , R
		MouseClick,L
		Sleep, 1000
		MouseClick,L
		Sleep, 1000
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\harvestButton.bmp
		if (ErrorLevel = 0)
		{
			Send {Click %x% %y%}
			Sleep, 1000
		}
	}
	; select
	select = 1
	Loop 4
	{
		;selectHarvestArmy(select)
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\%select%.bmp
		if (ErrorLevel = 0)
		{
			Send {Click %x% %y%} 
			Sleep, 1500	
		}	
		; harvest button on the troops
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\harvest.bmp
		if (ErrorLevel = 0)
		{
			x := x + 10
			y := y + 10
			Send {Click %x% %y%}
			Sleep, 1000
		}
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\castle.bmp
		if (ErrorLevel = 0)
		{
			x := x + 10
			y := y + 10
			Send {Click %x% %y%}
			Sleep, 1000
			break
		}
		select += 1
	}
}

; avoid troops
avoidArmy()
{
	Loop
	{
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *70 images\avoidPointClick.bmp
		if (ErrorLevel = 0)
		{
			x := x + 420
			y := y + 20
			Send {Click %x% %y%} 
			Sleep, 1000	
			; to get the mouse area in middle of the screen
			MouseGetPos, xpos, ypos
			MouseMove (A_ScreenWidth / 2) - xpos, (A_ScreenHeight / 2) - ypos, , R
			MouseClick,L
			Sleep, 1000
			MouseClick,L
			Sleep, 1500
		}	
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *60 images\preRetreat.bmp
		if (ErrorLevel = 0)
		{
			Send {Click %x% %y%}
			Sleep, 1000
		}
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\retreat.bmp
		if (ErrorLevel = 0)
		{
			Send {Click %x% %y%}
			Sleep, 1000
		}
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *50 images\confirm.bmp
		if (ErrorLevel = 0)
		{
			Send {Click %x% %y%}
			Sleep, 1000
		}
		ImageSearch, x, y, 0,0, A_ScreenWidth, A_ScreenHeight, *30 images\toAvoid.bmp
		if (ErrorLevel = 0)
		{
			Send {Click %x% %y%} 
			Sleep, 1000	
		}
		else
		{
			break
		}
	}
}

F2::
ButtonStop:
{
	isMacro := false
	ExitApp
}
return	
		