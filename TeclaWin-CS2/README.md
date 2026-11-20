# Tecla Windows desactivada para CS2

Scripts para desactivar la tecla Windows mientras juegas Counter-Strike 2 (o cualquier juego), sin dejar ningún programa abierto.

## Cómo funciona

Windows tiene un valor del Registro llamado `Scancode Map` que le dice al teclado qué teclas cambiar o anular. Estos scripts lo usan para anular las dos teclas Windows (izquierda y derecha). Es la misma técnica que usa SharpKeys.

- **Consumo de recursos: cero.** No queda ningún programa corriendo, a diferencia de PowerToys.
- **Hay que reiniciar** el PC cada vez que lo activas o desactivas.
- Funciona en Windows 10 y 11.

## Uso rápido (recomendado)

1. Haz doble clic en `tecla_win.bat`.
2. Acepta el permiso de administrador.
3. Elige **1** para desactivar la tecla (antes de jugar) o **2** para activarla de nuevo.
4. Responde **S** para reiniciar.

El menú también te muestra si la tecla está activada o desactivada.

## Alternativa: archivos .reg

- `desactivar_tecla_win.reg`: doble clic, aceptar, y reiniciar.
- `activar_tecla_win.reg`: doble clic, aceptar, y reiniciar.

## Ten en cuenta

- Mientras está desactivada, los atajos con la tecla Windows (Win+D, Win+E, Win+L, etc.) tampoco funcionan. `Ctrl+Esc` sigue abriendo el menú Inicio.
- Si ya usas SharpKeys u otro programa para remapear otras teclas, **activar** la tecla Windows borra el valor `Scancode Map` completo, así que también se pierden esos otros remapeos. En ese caso usa SharpKeys para quitar solo las teclas Windows.
