	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021164
sub_08021164: @ 0x08021164
	push {lr}
	ldr r0, _08021170 @ =0x08B93CD4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08021170: .4byte 0x08B93CD4
