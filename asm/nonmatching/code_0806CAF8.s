	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateMuStepSounds
UpdateMuStepSounds: @ 0x0806CAF8
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806CB5A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x32
	blt _0806CB4C
	cmp r0, #0x33
	ble _0806CB34
	cmp r0, #0x37
	bgt _0806CB4C
	b _0806CB40
_0806CB34:
	ldr r0, _0806CB3C @ =0x08C9CF92
	str r0, [r7, #8]
	b _0806CB58
	.align 2, 0
_0806CB3C: .4byte 0x08C9CF92
_0806CB40:
	ldr r0, _0806CB48 @ =0x08C9CF66
	str r0, [r7, #8]
	b _0806CB58
	.align 2, 0
_0806CB48: .4byte 0x08C9CF66
_0806CB4C:
	ldr r0, _0806CB54 @ =0x08C9CF38
	str r0, [r7, #8]
	b _0806CB58
	.align 2, 0
_0806CB54: .4byte 0x08C9CF38
_0806CB58:
	b _0806CBA8
_0806CB5A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x46
	beq _0806CB90
	cmp r0, #0x46
	bgt _0806CB74
	cmp r0, #0x17
	bgt _0806CB9C
	cmp r0, #0x14
	blt _0806CB9C
	b _0806CB86
_0806CB74:
	cmp r0, #0x55
	beq _0806CB86
	cmp r0, #0x55
	blt _0806CB9C
	cmp r0, #0x5d
	bgt _0806CB9C
	cmp r0, #0x5b
	blt _0806CB9C
	b _0806CB86
_0806CB86:
	ldr r0, _0806CB8C @ =0x08C9CEF4
	str r0, [r7, #8]
	b _0806CBA8
	.align 2, 0
_0806CB8C: .4byte 0x08C9CEF4
_0806CB90:
	ldr r0, _0806CB98 @ =0x08C9CFBE
	str r0, [r7, #8]
	b _0806CBA8
	.align 2, 0
_0806CB98: .4byte 0x08C9CFBE
_0806CB9C:
	ldr r0, _0806CBA4 @ =0x08C9CED0
	str r0, [r7, #8]
	b _0806CBA8
	.align 2, 0
_0806CBA4: .4byte 0x08C9CED0
_0806CBA8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x43
	ldrb r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strb r3, [r0]
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	adds r1, r2, #0
	bl DivRem
	str r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, [r7]
	bl sub_0806CFFC
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806CC02
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	ldr r1, [r7, #8]
	adds r2, r1, #2
	ldrh r1, [r2]
	adds r3, r7, #0
	adds r3, #0x10
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl StartPlayMuStepSe
_0806CC02:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
