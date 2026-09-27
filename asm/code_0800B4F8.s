	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SleepFast
EvtCmd_SleepFast: @ 0x0800B4F8
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrh r2, [r0, #2]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B510
	movs r0, #0
	b _0800B526
_0800B510:
	cmp r2, #0
	ble _0800B516
	subs r2, #1
_0800B516:
	adds r0, r3, #0
	adds r0, #0x50
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r0, #1
	strb r0, [r1]
	movs r0, #2
_0800B526:
	bx lr
