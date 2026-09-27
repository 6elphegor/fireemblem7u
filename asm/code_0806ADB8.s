	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806ADB8
sub_0806ADB8: @ 0x0806ADB8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806ADD8
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806ADD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
