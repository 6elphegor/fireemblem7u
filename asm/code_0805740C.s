	.include "macro.inc"

	.syntax unified

	thumb_func_start efxShooterOBJ_Loop
efxShooterOBJ_Loop: @ 0x0805740C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08057432
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08057438 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057432:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057438: .4byte 0x0201774C
