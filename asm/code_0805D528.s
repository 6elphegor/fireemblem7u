	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D528
sub_0805D528: @ 0x0805D528
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r5, [r2, #0x2e]
	lsls r1, r5, #0x10
	cmp r0, r1
	bne _0805D550
	ldr r0, _0805D558 @ =0x08BBE740
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	strh r4, [r3, #6]
	strh r4, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_0805D550:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D558: .4byte 0x08BBE740
