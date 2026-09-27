	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_HidePid
EvtCmd_HidePid: @ 0x0800E16C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r1}
	bx r1
