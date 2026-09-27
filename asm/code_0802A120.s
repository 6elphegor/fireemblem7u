	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyReaverEffect
BattleApplyReaverEffect: @ 0x0802A120
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A138
	ldr r0, [r3, #0x4c]
	ands r0, r1
	cmp r0, #0
	bne _0802A16C
_0802A138:
	adds r1, r2, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_0802A16C:
	bx lr
	.align 2, 0
