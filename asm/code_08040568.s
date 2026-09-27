	.include "macro.inc"

	.syntax unified

	thumb_func_start New6C_SIOMAIN2
New6C_SIOMAIN2: @ 0x08040568
	push {lr}
	ldr r0, _08040578 @ =0x08B9A0E8
	movs r1, #2
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08040578: .4byte 0x08B9A0E8
