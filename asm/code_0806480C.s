	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806480C
sub_0806480C: @ 0x0806480C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08064822
	adds r0, r1, #0
	bl Proc_Break
_08064822:
	pop {r0}
	bx r0
	.align 2, 0
