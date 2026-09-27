	.include "macro.inc"

	.syntax unified

	thumb_func_start SioHold_Loop
SioHold_Loop: @ 0x0803DB6C
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x38]
	cmp r1, r0
	bge _0803DB84
	ldr r0, [r2, #0x34]
	cmp r1, r0
	ble _0803DB84
	ldr r0, [r2, #0x2c]
	bl DisplayFrozenUiHand
_0803DB84:
	pop {r0}
	bx r0
