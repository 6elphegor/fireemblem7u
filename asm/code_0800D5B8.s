	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfySkip
EvtCmd_GotoIfySkip: @ 0x0800D5B8
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #6
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D5CE
	movs r0, #0
	b _0800D5D8
_0800D5CE:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D5D8:
	pop {r1}
	bx r1
