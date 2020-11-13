;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win10/NT
; Author:         Sean Crowe <crowesn@ucmail.uc.edu>
;
; Script Function:
;	Innovative Systems Sierra Desktop macro to add barcodes to item records via CSV.
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^m::

Loop Read, list.csv
{ 
  Loop, Parse, A_LoopReadLine, %A_Tab%
  {
    stringsplit, new, A_LoopField, `,
    record_num = %new1%
    barcode = %new2%
  }
  try
  {
    Send .
    Sleep 500
    Send %new1%
    Sleep 500
    Send {Enter}
    Sleep 3000
    WinGetActiveTitle, Title
    if (InStr(Title, record_num) == 0) {
	    throw Exception("Fail", -1)
    }
    Send ^i
    Sleep 500
    Send b
    Sleep 500
    Send %new2%
    Sleep 500
    Send {Enter}
    Sleep 500
    Send ^s
    Sleep 500
    Send !q
    Sleep 700
  }
catch e
  {
    MsgBox, Something went wrong with %new1%
    ExitApp
  }
}

MsgBox, All Done!  
Escape::
ExitApp
return
