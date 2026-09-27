	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_InitInfoBox
Manim_InitInfoBox: @ 0x0806E8D8
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806E940 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #2
	bgt _0806E946
	cmp r0, #1
	blt _0806E946
	b _0806E944
	.align 2, 0
_0806E93C: .4byte 0x03002870
_0806E940: .4byte 0x0203E0FC
_0806E944:
	b _0806EA8A
_0806E946:
	b _0806E948
_0806E948:
	ldr r0, _0806E964 @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocReturnBool
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0806E968
	b _0806EA8A
	.align 2, 0
_0806E964: .4byte 0x0203E0FC
_0806E968:
	ldr r1, _0806E998 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806E9AA
	ldr r0, _0806E998 @ =0x0203E0FC
	ldr r1, [r0]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	lsls r0, r2, #4
	ldr r1, _0806E99C @ =0x0202BBB8
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0x6f
	ble _0806E9A0
	ldr r0, [r7, #4]
	adds r1, r0, #0
	subs r1, #0x28
	str r1, [r7, #4]
	b _0806E9A8
	.align 2, 0
_0806E998: .4byte 0x0203E0FC
_0806E99C: .4byte 0x0202BBB8
_0806E9A0:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x18
	str r1, [r7, #4]
_0806E9A8:
	b _0806EA76
_0806E9AA:
	movs r0, #0
	str r0, [r7, #0x10]
_0806E9AE:
	ldr r1, _0806E9C0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0x10]
	cmp r1, r0
	blt _0806E9C4
	b _0806EA00
	.align 2, 0
_0806E9C0: .4byte 0x0203E0FC
_0806E9C4:
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, _0806E9F8 @ =0x0203E0FC
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	lsls r1, r3, #4
	ldr r2, _0806E9FC @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _0806E9AE
	.align 2, 0
_0806E9F8: .4byte 0x0203E0FC
_0806E9FC: .4byte 0x0202BBB8
_0806EA00:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	blt _0806EA16
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806EA22
	b _0806EA28
_0806EA16:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806EA22
	b _0806EA28
_0806EA22:
	movs r0, #0x40
	str r0, [r7, #4]
	b _0806EA76
_0806EA28:
	movs r0, #0
	ldr r1, [r7, #8]
	ldr r2, [r7, #0xc]
	cmp r1, r2
	bgt _0806EA34
	movs r0, #1
_0806EA34:
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	cmp r1, #0x6f
	ble _0806EA62
	movs r0, #1
	ldr r1, [r7, #0x14]
	subs r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	subs r0, #0x28
	str r0, [r7, #4]
	b _0806EA76
_0806EA62:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r7, #4]
_0806EA76:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	cmp r0, #0
	bge _0806EA80
	adds r0, #7
_0806EA80:
	asrs r1, r0, #3
	movs r0, #0xf
	ldr r2, [r7]
	bl StartManimInfoWindow
_0806EA8A:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
