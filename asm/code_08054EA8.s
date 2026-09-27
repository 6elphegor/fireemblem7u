	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEfxAnimeDrvProc
EndEfxAnimeDrvProc: @ 0x08054EA8
	push {lr}
	ldr r0, _08054EB8 @ =0x0201FB0C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08054EB8: .4byte 0x0201FB0C
