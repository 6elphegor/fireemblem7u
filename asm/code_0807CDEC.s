	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CDEC
sub_0807CDEC: @ 0x0807CDEC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x80
	movs r5, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	subs r1, r1, r4
	adds r0, r1, #0
	muls r0, r5, r0
	muls r0, r1, r0
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x30
	adds r2, r5, #0
	bl sub_0807764C
	ldr r3, _0807CE5C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x80
	blt _0807CE54
	adds r0, r7, #0
	bl Proc_Break
_0807CE54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE5C: .4byte 0x03002870
