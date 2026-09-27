	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GiveItemToLeader
EvtCmd_GiveItemToLeader: @ 0x0800D9B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #4]
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r5, #0
	adds r2, r4, #0
	bl EventGiveItem
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
