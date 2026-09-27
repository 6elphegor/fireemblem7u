	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060D88
sub_08060D88: @ 0x08060D88
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08060DA0 @ =0x08BD42A0
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_08060DA0: .4byte 0x08BD42A0
