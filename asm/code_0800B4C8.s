	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_Sleep
EvtCmd_Sleep: @ 0x0800B4C8
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrh r2, [r0, #2]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B4E0
	movs r0, #0
	b _0800B4F4
_0800B4E0:
	cmp r2, #0
	ble _0800B4E6
	subs r2, #1
_0800B4E6:
	adds r0, r3, #0
	adds r0, #0x50
	movs r1, #0
	strh r2, [r0]
	subs r0, #2
	strb r1, [r0]
	movs r0, #2
_0800B4F4:
	bx lr
	.align 2, 0
