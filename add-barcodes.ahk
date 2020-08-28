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
    Send %new1%%
    Send {Enter}
    Sleep 200
    WinGetActiveTitle, Title
    if (RegExMatch(Title, %new1%) == 0) {
	    throw Exception("Fail", -1)
    }
    Send ^i
    Send b
    Send %new2%
    Send ^s
    Sleep 200
    Send {Escape}
  }
catch e
  {
    MsgBox, Something went wrong with %new1%
    ExitApp
  }
}
MsgBox, All Done!  
return
