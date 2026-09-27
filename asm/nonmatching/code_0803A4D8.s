	.include "macro.inc"

	.syntax unified

	thumb_func_start AiCountEnemyInRangeOrTryMoveToSpecificPosition
AiCountEnemyInRangeOrTryMoveToSpecificPosition: @ 0x0803A4D8
	push {r4, lr}
	sub sp, #8
	ldr r4, _0803A508 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803A510
	ldr r0, [r4]
	bl AiMakeMoveRangeMapsForUnitAndWeapon
	bl AiCountEnemyUnitsInRange
	adds r1, r0, #0
	cmp r1, #0
	beq _0803A516
	ldr r0, _0803A50C @ =0x0203A8EC
	adds r0, #0x86
	strb r1, [r0]
	movs r0, #0
	b _0803A540
	.align 2, 0
_0803A508: .4byte 0x03004690
_0803A50C: .4byte 0x0203A8EC
_0803A510:
	ldr r0, [r4]
	bl RevertMapChange
_0803A516:
	add r4, sp, #4
	adds r0, r4, #0
	bl AiTryMoveToSpecificPosition
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	beq _0803A52A
	movs r0, #0
	b _0803A540
_0803A52A:
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
_0803A540:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
