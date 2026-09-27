	.include "macro.inc"

	.syntax unified

	thumb_func_start AttackMapSelect_SwitchIn
AttackMapSelect_SwitchIn: @ 0x08021D68
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08021D9E
	ldr r1, _08021DBC @ =0x0203A85C
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
	bl InitObstacleBattleUnit
_08021D9E:
	ldr r1, _08021DBC @ =0x0203A85C
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _08021DC4
	ldr r0, _08021DC0 @ =0x03004690
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	adds r1, r5, #0
	bl BattleGenerateBallistaSimulation
	b _08021DD8
	.align 2, 0
_08021DBC: .4byte 0x0203A85C
_08021DC0: .4byte 0x03004690
_08021DC4:
	ldr r0, _08021DE8 @ =0x03004690
	ldr r0, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	ldrb r1, [r1, #0x12]
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r3, #0
	bl BattleGenerateSimulation
_08021DD8:
	bl UpdateBattleForecastContents
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021DE8: .4byte 0x03004690
