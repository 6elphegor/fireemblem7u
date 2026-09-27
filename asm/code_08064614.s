	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08064614
sub_08064614: @ 0x08064614
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08064632
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08064632:
	pop {r4}
	pop {r0}
	bx r0
