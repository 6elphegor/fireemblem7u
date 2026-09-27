	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrPopup_Delay
EkrPopup_Delay: @ 0x0806B550
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0806B568
	adds r0, r1, #0
	bl Proc_Break
_0806B568:
	pop {r0}
	bx r0
