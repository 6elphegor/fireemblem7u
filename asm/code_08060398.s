	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060398
sub_08060398: @ 0x08060398
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _080603B2
	adds r0, r2, #0
	bl Proc_Break
_080603B2:
	pop {r0}
	bx r0
	.align 2, 0
