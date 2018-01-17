#NoTrayIcon
#include <Misc.au3>

_Singleton("winstate")

$win = ""
HotKeySet("#{Z}", "ShowHide")
HotKeySet("#{z}", "SayHello")
HotKeySet("#!{z}", "DoExit")

Func ShowHide()
   Global $win
   If $win = "" Then
	  $win = WinGetHandle("")
	  WinSetState($win, "", @SW_HIDE)
   Else
	  WinSetState($win, "", @SW_SHOW)
	  $win = ""
   EndIf
EndFunc

Func SayHello()
   TrayTip("Hello", "Hello", 30)
   ; MsgBox(0, "", "Hello", 1)
EndFunc

Func DoExit()
   If $win <> "" Then
	  $win = WinGetHandle("")
	  WinSetState($win, "", @SW_SHOW)
   EndIf
   Exit
EndFunc

While 1
   Sleep(10)
WEnd
