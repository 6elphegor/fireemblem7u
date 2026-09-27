	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsUnitEnemyAndNotInScrList
AiIsUnitEnemyAndNotInScrList: @ 0x08037958
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037990 @ =0x030013B8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08037998
	ldr r0, _08037994 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037998
	movs r0, #1
	b _0803799A
	.align 2, 0
_08037990: .4byte 0x030013B8
_08037994: .4byte 0x03004690
_08037998:
	movs r0, #0
_0803799A:
	pop {r4}
	pop {r1}
	bx r1
