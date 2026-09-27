	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerate
BattleGenerate: @ 0x08028424
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _08028470 @ =0x0203A3F0
	ldr r4, _08028474 @ =0x0203A470
	adds r0, r5, #0
	adds r1, r4, #0
	bl ComputeBattleUnitStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitStats
	adds r0, r5, #0
	adds r1, r4, #0
	bl ComputeBattleUnitEffectiveStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitEffectiveStats
	cmp r6, #0
	bne _08028454
	bl ComputeBattleObstacleStats
_08028454:
	ldr r1, _08028478 @ =0x0203A3D8
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028480
	ldr r0, _0802847C @ =0x0203A85C
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _08028480
	bl BattleUnwindScripted
	b _08028484
	.align 2, 0
_08028470: .4byte 0x0203A3F0
_08028474: .4byte 0x0203A470
_08028478: .4byte 0x0203A3D8
_0802847C: .4byte 0x0203A85C
_08028480:
	bl BattleUnwind
_08028484:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
