.include "macros.asm"
.include "device.asm"

.equ TIBSIZE  = $64   ; 80 characters is one line...
.equ APPUSERSIZE = 10 ; size of application user area

; the dictionary search treats lowercase and uppercase
; letters the same. Set to 0 if you do not want it
.set WANT_IGNORECASE = 1

; cpu clock in hertz
.equ F_CPU = 16000000
; baud rate of terminal
.include "drivers/usart_0.asm"
.equ BAUD = 9600
.equ USART_B_VALUE = bm_ENABLE_TX | bm_ENABLE_RX | bm_ENABLE_INT_RX
.equ USART_C_VALUE = bm_ASYNC | bm_NO_PARITY | bm_1STOPBIT | bm_8BIT
.set rstackstart = RAMEND
.set stackstart  = RAMEND - 80

.set NUMWORDLISTS = 8
.include "amforth.asm"
