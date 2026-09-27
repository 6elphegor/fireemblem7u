	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkByTactRank
EvtCmd_TalkByTactRank: @ 0x0800BBC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BBE4 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BBE8
	movs r0, #0
	b _0800BC4E
	.align 2, 0
_0800BBE4: .4byte 0x0000FFFD
_0800BBE8:
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #4
	bhi _0800BC2C
	lsls r0, r0, #2
	ldr r1, _0800BBFC @ =_0800BC00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BBFC: .4byte _0800BC00
_0800BC00: @ jump table
	.4byte _0800BC14 @ case 0
	.4byte _0800BC1A @ case 1
	.4byte _0800BC20 @ case 2
	.4byte _0800BC26 @ case 3
	.4byte _0800BC2C @ case 4
_0800BC14:
	bl GetGameTacticsRank
	b _0800BC30
_0800BC1A:
	bl GetGameSurvivalRank
	b _0800BC30
_0800BC20:
	bl GetGameExpRank
	b _0800BC30
_0800BC26:
	bl GetGameCombatRank
	b _0800BC30
_0800BC2C:
	bl GetGameFundsRank
_0800BC30:
	movs r1, #0
	cmp r0, #2
	bgt _0800BC3E
	movs r1, #1
	cmp r0, #1
	bgt _0800BC3E
	movs r1, #2
_0800BC3E:
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
_0800BC4E:
	pop {r4, r5}
	pop {r1}
	bx r1
