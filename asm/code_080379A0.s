	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsUnitEnemyOrInScrList
AiIsUnitEnemyOrInScrList: @ 0x080379A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080379D8 @ =0x030013B8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080379D2
	ldr r0, _080379DC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080379E0
_080379D2:
	movs r0, #1
	b _080379E2
	.align 2, 0
_080379D8: .4byte 0x030013B8
_080379DC: .4byte 0x03004690
_080379E0:
	movs r0, #0
_080379E2:
	pop {r4}
	pop {r1}
	bx r1
