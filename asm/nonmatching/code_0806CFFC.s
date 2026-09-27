	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806CFFC
sub_0806CFFC: @ 0x0806CFFC
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806D014
	b _0806D06C
_0806D014:
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	movs r0, #1
	b _0806D140
_0806D06C:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D134 @ =0x0202BBB8
	ldrh r1, [r1, #0xc]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D134 @ =0x0202BBB8
	ldrh r1, [r1, #0xe]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D138
	adds r0, r7, #0
	adds r0, #8
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0806D138
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D138
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0xb0
	bgt _0806D138
	b _0806D13C
	.align 2, 0
_0806D134: .4byte 0x0202BBB8
_0806D138:
	movs r0, #0
	b _0806D140
_0806D13C:
	movs r0, #1
	b _0806D140
_0806D140:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1
