	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenu_HandleDPadInput
SioMenu_HandleDPadInput: @ 0x080428B8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, [r5, #0x48]
	cmp r0, #1
	bne _08042938
	ldr r0, _080429B0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042902
	ldr r1, _080429B4 @ =0x0203D90C
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080428EA
	movs r0, #2
	strb r0, [r1, #5]
_080428EA:
	ldr r0, [r5, #0x30]
	movs r1, #6
	rsbs r1, r1, #0
	movs r2, #4
	str r2, [sp]
	movs r2, #0x34
	movs r3, #0x1f
	bl SioMenuItem_SetArrowConfig
	movs r0, #3
	bl SioPlaySoundEffect
_08042902:
	ldr r0, _080429B0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042938
	ldr r4, _080429B4 @ =0x0203D90C
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #5]
	ldr r0, [r5, #0x30]
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #0
	movs r2, #0x3a
	movs r3, #4
	bl SioMenuItem_SetArrowConfig
	movs r0, #3
	bl SioPlaySoundEffect
_08042938:
	ldr r1, _080429B0 @ =0x08B857F8
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	adds r4, r1, #0
	cmp r0, #0
	beq _08042972
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	cmp r1, r0
	bgt _08042956
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08042972
_08042956:
	subs r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_0804295C:
	ldr r0, [r5, #0x48]
	subs r0, #1
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _08042968
	str r2, [r5, #0x48]
_08042968:
	ldr r0, [r5, #0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804295C
_08042972:
	ldr r2, [r4]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080429A6
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	blt _0804298C
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _080429A6
_0804298C:
	adds r4, r5, #0
	adds r4, #0x40
_08042990:
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r5, #0x48]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08042990
_080429A6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080429B0: .4byte 0x08B857F8
_080429B4: .4byte 0x0203D90C
