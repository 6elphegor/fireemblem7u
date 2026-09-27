	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061EEC
sub_08061EEC: @ 0x08061EEC
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08061F04 @ =0x08BD6D14
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_08061F04: .4byte 0x08BD6D14
