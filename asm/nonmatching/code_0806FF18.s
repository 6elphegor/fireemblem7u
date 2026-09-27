	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806FF18
sub_0806FF18: @ 0x0806FF18
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FF78 @ =0x02022C60
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r2, _0806FF7C @ =0x0000521F
	ldr r3, _0806FF80 @ =0x00005229
	str r3, [sp]
	movs r3, #2
	bl PutManimWindowNumber
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FF78 @ =0x02022C60
	adds r0, r0, r1
	ldr r2, [r7, #8]
	ldr r1, _0806FF84 @ =0x08C9D7E8
	str r1, [sp]
	movs r1, #0x63
	movs r3, #0
	bl PutManimWindowBar
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF78: .4byte 0x02022C60
_0806FF7C: .4byte 0x0000521F
_0806FF80: .4byte 0x00005229
_0806FF84: .4byte 0x08C9D7E8
