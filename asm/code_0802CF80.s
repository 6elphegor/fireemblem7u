	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802CF80
sub_0802CF80: @ 0x0802CF80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _0802CFC0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x7d
	beq _0802CFD2
	cmp r0, #0x7d
	bgt _0802CFC4
	cmp r0, #0x7c
	beq _0802CFCE
	b _0802CFDC
	.align 2, 0
_0802CFC0: .4byte 0x0203A85C
_0802CFC4:
	cmp r0, #0x7e
	beq _0802CFD6
	cmp r0, #0x7f
	beq _0802CFDA
	b _0802CFDC
_0802CFCE:
	movs r5, #5
	b _0802CFDC
_0802CFD2:
	movs r5, #6
	b _0802CFDC
_0802CFD6:
	movs r5, #7
	b _0802CFDC
_0802CFDA:
	movs r5, #8
_0802CFDC:
	ldr r0, _0802D004 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	movs r2, #1
	bl SetUnitStatusExt
	ldr r1, _0802D008 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D004: .4byte 0x0203A85C
_0802D008: .4byte 0x0203A3D8
