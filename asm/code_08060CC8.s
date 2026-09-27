	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060CC8
sub_08060CC8: @ 0x08060CC8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08060CF0
	ldr r0, _08060CF8 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08060CF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060CF8: .4byte 0x0201774C
