	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F93C
sub_0805F93C: @ 0x0805F93C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0805F964 @ =0x03002870
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0805F95E
	adds r0, r2, #0
	bl Proc_Break
_0805F95E:
	pop {r0}
	bx r0
	.align 2, 0
_0805F964: .4byte 0x03002870
