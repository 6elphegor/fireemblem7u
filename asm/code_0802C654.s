	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemRescueStaffAction
DoItemRescueStaffAction: @ 0x0802C654
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _0802C6C4 @ =0x0203A85C
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
	add r3, sp, #4
	adds r0, r5, #0
	mov r2, sp
	bl GetRescueStaffTargetPosition
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp, #4]
	strb r1, [r0, #0x11]
	ldr r0, _0802C6C8 @ =0x0203A470
	ldr r1, [sp]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldr r1, [sp, #4]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6C4: .4byte 0x0203A85C
_0802C6C8: .4byte 0x0203A470
