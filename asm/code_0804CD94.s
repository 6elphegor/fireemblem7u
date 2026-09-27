	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEkrDispUP
EndEkrDispUP: @ 0x0804CD94
	push {lr}
	ldr r0, _0804CDA4 @ =0x0200006C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804CDA4: .4byte 0x0200006C
