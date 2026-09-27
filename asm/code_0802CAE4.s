	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecAntitoxinItem
ExecAntitoxinItem: @ 0x0802CAE4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CB1C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldr r0, _0802CB20 @ =0x0203A3F0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB1C: .4byte 0x0203A85C
_0802CB20: .4byte 0x0203A3F0
