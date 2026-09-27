	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806EDAC
sub_0806EDAC: @ 0x0806EDAC
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	ldr r1, _0806EDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	str r0, [r7, #0x14]
	ldr r1, _0806EDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EDF8
	cmp r0, #2
	beq _0806EDD4
	b _0806EDFA
	.align 2, 0
_0806EDD0: .4byte 0x0203E0FC
_0806EDD4:
	ldr r0, _0806EDF4 @ =0x0203A4F0
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806EDF0
	ldr r0, [r7, #0x14]
	adds r1, r0, #2
	str r1, [r7, #0x14]
_0806EDF0:
	b _0806EDFA
	.align 2, 0
_0806EDF4: .4byte 0x0203A4F0
_0806EDF8:
	b _0806EDFA
_0806EDFA:
	movs r0, #0
	str r0, [r7, #8]
_0806EDFE:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806EE08
	b _0806EE28
_0806EE08:
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806EDFE
_0806EE28:
	movs r0, #0
	str r0, [r7, #8]
_0806EE2C:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #8]
	cmp r1, r0
	blt _0806EE38
	b _0806EF6C
_0806EE38:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #0xc]
_0806EE3E:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806EE48
	b _0806EF64
_0806EE48:
	movs r0, #0
	str r0, [r7, #0x10]
	ldr r0, _0806EEC8 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806EEC8 @ =0x0203E0FC
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0806EECC
	ldr r0, _0806EEC8 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806EEC8 @ =0x0203E0FC
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806EEC6
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806EEC6:
	b _0806EF0C
	.align 2, 0
_0806EEC8: .4byte 0x0203E0FC
_0806EECC:
	ldr r0, _0806EF60 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806EF60 @ =0x0203E0FC
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806EF0C
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806EF0C:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _0806EF56
	adds r0, r7, #4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	ldr r2, [r7, #0xc]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	adds r1, r7, #4
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0806EF56:
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806EE3E
	.align 2, 0
_0806EF60: .4byte 0x0203E0FC
_0806EF64:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806EE2C
_0806EF6C:
	movs r0, #0
	str r0, [r7, #8]
_0806EF70:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806EF7A
	b _0806EFBC
_0806EF7A:
	ldr r0, _0806EFB4 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldr r1, _0806EFB8 @ =0x083FC174
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806EF70
	.align 2, 0
_0806EFB4: .4byte 0x0203E0FC
_0806EFB8: .4byte 0x083FC174
_0806EFBC:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0
