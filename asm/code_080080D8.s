	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkPrintDelay
SetTalkPrintDelay: @ 0x080080D8
	ldr r2, _080080F0 @ =0x08B909B8
	ldr r1, [r2]
	strb r0, [r1, #0x13]
	ldr r2, [r2]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080080EC
	movs r0, #0
	strb r0, [r2, #0x13]
_080080EC:
	bx lr
	.align 2, 0
_080080F0: .4byte 0x08B909B8
