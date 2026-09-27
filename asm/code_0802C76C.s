	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemAttackStaffAction
DoItemAttackStaffAction: @ 0x0802C76C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802C7C0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	ldr r4, _0802C7C4 @ =0x0203A3F0
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	bl RandRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C7CC
	ldr r0, _0802C7C8 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #2
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	b _0802C808
	.align 2, 0
_0802C7C0: .4byte 0x0203A85C
_0802C7C4: .4byte 0x0203A3F0
_0802C7C8: .4byte 0x0203A50C
_0802C7CC:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x51
	beq _0802C800
	cmp r0, #0x51
	bgt _0802C7E4
	cmp r0, #0x50
	beq _0802C7F4
	b _0802C808
_0802C7E4:
	cmp r0, #0x52
	bne _0802C808
	ldr r0, _0802C7F0 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #4
	b _0802C806
	.align 2, 0
_0802C7F0: .4byte 0x0203A470
_0802C7F4:
	ldr r0, _0802C7FC @ =0x0203A470
	adds r0, #0x6f
	movs r1, #3
	b _0802C806
	.align 2, 0
_0802C7FC: .4byte 0x0203A470
_0802C800:
	ldr r0, _0802C818 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #2
_0802C806:
	strb r1, [r0]
_0802C808:
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C818: .4byte 0x0203A470
