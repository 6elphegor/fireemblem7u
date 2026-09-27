	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_EndLynCampaign
EvtCmd_EndLynCampaign: @ 0x0800E59C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	bl SetNextGameAction
	adds r0, r4, #0
	bl EventEndBattleMap
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
