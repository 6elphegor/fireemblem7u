	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfySkipText
EvtCmd_GotoIfySkipText: @ 0x0800D5DC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D5F2
	movs r0, #0
	b _0800D5FC
_0800D5F2:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D5FC:
	pop {r1}
	bx r1
