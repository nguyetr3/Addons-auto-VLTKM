#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstantsEx.au3>
#include "Telegram.au3"

$ChatID = "541648962"
_InitBot("460995822:AAGyEHNURn2UKHeemfIZDNQnsx9xcGJZ-O8")

$appAtivo = 0

$hGUI = GUICreate("Test", 150, 150)

$btnCuidar = GUICtrlCreateButton("Start", 10, 10, 80, 30)
$btnStop = GUICtrlCreateButton("Stop", 10, 50, 80, 30)

$hlabel = GUICtrlCreateLabel("", 10, 100, 200, 20)

GUISetState()

While 1

    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            _Exit()
        Case $btnCuidar
			$kills = ControlGetText(WinGetTitle("[CLASS:WindowsForms10.Window.8.app.0.ea7f4a_r14_ad1]"), "", "[CLASS:WindowsForms10.STATIC.app.0.ea7f4a_r14_ad1; INSTANCE:10]")
            _Action()
        Case $btnStop
            _Stop()
    EndSwitch
WEnd

Func _Exit()
    Exit
EndFunc   ;==>_Sair

Func _Action() ; Routine to make some thinks when button is pressed.

    ; Set flag to show we are running
    $appAtivo = 1
    ; Keep running until $appAtivo is set to 0
    While $appAtivo

        Sleep(100) ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        GUICtrlSetData($hLabel, "Running") ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

	$sTuvong = ControlGetText(WinGetTitle("[CLASS:WindowsForms10.Window.8.app.0.ea7f4a_r14_ad1]"), "", "[CLASS:WindowsForms10.STATIC.app.0.ea7f4a_r14_ad1; INSTANCE:10]")

	If Number($sTuvong) > Number($kills) Then
		ConsoleWrite("Test _GetUpdates   -> "  & @TAB & _GetUpdates() & @CRLF)
		ConsoleWrite("Test _GetMe        -> "  & @TAB & _GetMe() & @CRLF)
		ConsoleWrite("Test _SendMsg      -> "  & @TAB & _SendMsg($ChatID,"Bi giet chet :( :(") & @CRLF)
		$kills = $sTuvong
	EndIf

	If GUIGetMsg() = $btnStop Then _Stop()

    WEnd

    GUICtrlSetData($hLabel, "") ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

EndFunc   ;==>_Cuidar

Func _Stop()
    ; Set flag to show we should stop
    $appAtivo = 0
EndFunc   ;==>_appAtivo