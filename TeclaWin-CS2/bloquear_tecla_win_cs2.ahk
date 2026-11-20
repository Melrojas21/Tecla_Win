; Bloquea la tecla Windows solo mientras CS2 es la ventana activa.
; Se cierra solo cuando cierras CS2, asi que no queda nada corriendo.
; Requiere AutoHotkey v2: https://www.autohotkey.com
#Requires AutoHotkey v2.0
#SingleInstance Force

; Esperar hasta 10 minutos a que abra CS2
if !ProcessWait("cs2.exe", 600) {
    MsgBox "No se detecto CS2 en 10 minutos. El script se cerrara.", "Tecla Windows", "Iconi"
    ExitApp
}
TrayTip "La tecla Windows queda bloqueada mientras juegas CS2.", "Tecla Windows"

; Al cerrar CS2, el script tambien se cierra
SetTimer(RevisarCS2, 5000)
RevisarCS2() {
    if !ProcessExist("cs2.exe")
        ExitApp
}

; Solo cuando la ventana activa es CS2 (con Alt+Tab fuera del juego, funciona normal)
#HotIf WinActive("ahk_exe cs2.exe")
*LWin::return
*RWin::return
#HotIf
