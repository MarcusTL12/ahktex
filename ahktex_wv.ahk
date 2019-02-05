#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

doc := A_Args[1]

ifWinExist, wvs
{}
else
{
	FileDelete, %doc%
	run, ahktex_init.ahk %doc%
	loop
	{
		ifExist, %doc%
		{
			FileDelete, %doc%
			break
		}
		Sleep, 100
	}
}

ControlSend,, wvtx(raw"%doc%"){Enter}, wvs

loop
{
	ifExist, %doc%
	{
		FileDelete, %doc%
		break
	}
	Sleep, 100
}
