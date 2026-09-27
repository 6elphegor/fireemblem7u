	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecTorchStaff
ExecTorchStaff: @ 0x0802CF4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CF7C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xa
	movs r3, #8
	bl AddTrap
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF7C: .4byte 0x0203A85C
