	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805FB24
sub_0805FB24: @ 0x0805FB24
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805FB84 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r5, #0
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	ldr r1, [r4, #0x44]
	ldr r0, _0805FB88 @ =0x00002AAA
	muls r0, r1, r0
	strh r0, [r4, #0x30]
	ldr r3, _0805FB8C @ =0x08BD29CC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r5, [r0, #6]
	ldr r1, _0805FB90 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB84: .4byte 0x0201774C
_0805FB88: .4byte 0x00002AAA
_0805FB8C: .4byte 0x08BD29CC
_0805FB90: .4byte 0x0000F3FF
