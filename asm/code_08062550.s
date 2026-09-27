	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062550
sub_08062550: @ 0x08062550
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08062578
	ldr r0, [r4, #0x60]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08062578:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
