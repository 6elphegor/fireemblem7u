	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SleepText
EvtCmd_SleepText: @ 0x0800B528
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r2, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	bne _0800B544
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0800B548
_0800B544:
	movs r0, #0
	b _0800B556
_0800B548:
	cmp r1, #0
	ble _0800B54E
	subs r1, #1
_0800B54E:
	adds r0, r2, #0
	adds r0, #0x50
	strh r1, [r0]
	movs r0, #2
_0800B556:
	bx lr
