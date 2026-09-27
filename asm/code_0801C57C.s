	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_InitUnitMovementSelect
PlayerPhase_InitUnitMovementSelect: @ 0x0801C57C
	push {r4, r5, lr}
	bl sub_0806C040
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C5B8
	ldr r4, _0801C608 @ =0x03004690
	ldr r2, [r4]
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	ldr r1, _0801C60C @ =0x0202BBF8
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _0801C5B8
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0801C5B8
	cmp r1, #4
	beq _0801C5B8
	adds r0, r2, #0
	bl StartMu
	ldr r0, [r4]
	bl HideUnitSprite
_0801C5B8:
	bl MU_SetDefaultFacing_Auto
	bl sub_08078FC8
	ldr r5, _0801C610 @ =0x0202BBB8
	movs r0, #2
	ldrb r2, [r5, #4]
	orrs r0, r2
	strb r0, [r5, #4]
	ldr r4, _0801C608 @ =0x03004690
	ldr r0, [r4]
	bl DisplayUnitEffectRange
	ldr r4, [r4]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x14
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801C618
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801C618
	movs r0, #0
	bl sub_0802FEF4
	ldr r0, _0801C60C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C61E
	ldr r0, _0801C614 @ =0x00000389
	bl m4aSongNumStart
	b _0801C61E
	.align 2, 0
_0801C608: .4byte 0x03004690
_0801C60C: .4byte 0x0202BBF8
_0801C610: .4byte 0x0202BBB8
_0801C614: .4byte 0x00000389
_0801C618:
	movs r0, #1
	bl sub_0802FEF4
_0801C61E:
	pop {r4, r5}
	pop {r0}
	bx r0
