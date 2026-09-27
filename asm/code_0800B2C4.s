	.include "macro.inc"

	.syntax unified

	thumb_func_start EventDarkenThenFunc_StepDarken
EventDarkenThenFunc_StepDarken: @ 0x0800B2C4
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800B2DC @ =0x03002870
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _0800B2E0
	adds r0, r2, #0
	bl Proc_End
	b _0800B304
	.align 2, 0
_0800B2DC: .4byte 0x03002870
_0800B2E0:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0800B2FE
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0800B2FE:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_0800B304:
	pop {r0}
	bx r0
