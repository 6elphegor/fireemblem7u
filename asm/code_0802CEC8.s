	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecMine
ExecMine: @ 0x0802CEC8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CF04 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xb
	movs r3, #0
	bl AddTrap
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldr r0, _0802CF08 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl StartMineAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF04: .4byte 0x0203A85C
_0802CF08: .4byte 0x0203A470
