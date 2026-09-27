	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024A88
sub_08024A88: @ 0x08024A88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	bl CountTargets
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08024AD4
_08024A9C:
	adds r0, r6, #0
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r0, r1
	bgt _08024ACE
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	movs r1, #0
	mov r2, r8
	bl PidStatsRecordDefeatInfo
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl PidStatsRecordLoseData
_08024ACE:
	adds r6, #1
	cmp r6, r7
	blt _08024A9C
_08024AD4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
