	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GiveItemToPid
EvtCmd_GiveItemToPid: @ 0x0800D988
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r2, [r0, #4]
	ldrh r5, [r0, #8]
	cmp r2, #0
	bne _0800D99C
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r2, [r0]
_0800D99C:
	adds r0, r2, #0
	bl GetUnitFromCharId
	adds r1, r5, #0
	adds r2, r4, #0
	bl EventGiveItem
	pop {r4, r5}
	pop {r1}
	bx r1
