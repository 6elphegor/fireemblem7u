	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_SetEliwoodMode
GC_SetEliwoodMode: @ 0x08012A24
	ldr r1, _08012A2C @ =0x0202BBF8
	movs r0, #2
	strb r0, [r1, #0x1b]
	bx lr
	.align 2, 0
_08012A2C: .4byte 0x0202BBF8
