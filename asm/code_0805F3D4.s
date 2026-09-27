	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F3D4
sub_0805F3D4: @ 0x0805F3D4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	bne _0805F3F6
	ldr r1, _0805F3FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0805F3F6:
	pop {r0}
	bx r0
	.align 2, 0
_0805F3FC: .4byte 0x0201774C
