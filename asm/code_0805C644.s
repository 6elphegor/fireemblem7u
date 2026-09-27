	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805C644
sub_0805C644: @ 0x0805C644
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805C66C
	ldr r0, _0805C674 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805C66C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C674: .4byte 0x0201774C
