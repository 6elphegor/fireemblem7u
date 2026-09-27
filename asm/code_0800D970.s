	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GiveItem
EvtCmd_GiveItem: @ 0x0800D970
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #4]
	ldr r0, _0800D984 @ =0x03004690
	ldr r0, [r0]
	bl EventGiveItem
	pop {r1}
	bx r1
	.align 2, 0
_0800D984: .4byte 0x03004690
