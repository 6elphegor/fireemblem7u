	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecLightRune
ExecLightRune: @ 0x0802CF0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CF44 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	bl AddLightRune
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl StartLightRuneAnim3
	ldr r0, _0802CF48 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF44: .4byte 0x0203A85C
_0802CF48: .4byte 0x0203A470
