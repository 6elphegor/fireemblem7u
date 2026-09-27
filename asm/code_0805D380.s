	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D380
sub_0805D380: @ 0x0805D380
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805D396
	adds r0, r1, #0
	bl Proc_Break
_0805D396:
	pop {r0}
	bx r0
	.align 2, 0
