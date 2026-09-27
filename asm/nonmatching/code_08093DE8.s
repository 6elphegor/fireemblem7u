	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093DE8
sub_08093DE8: @ 0x08093DE8
	push {lr}
	bl nullsub_11
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl ShowSysHandCursor
	pop {r0}
	bx r0
