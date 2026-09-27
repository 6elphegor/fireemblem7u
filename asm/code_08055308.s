	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055308
sub_08055308: @ 0x08055308
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #0x14]
	strh r1, [r5, #0x32]
	strh r2, [r5, #0x3a]
	ldr r5, [r0, #0x18]
	strh r3, [r5, #0x32]
	strh r4, [r5, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
