	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AA28
sub_0805AA28: @ 0x0805AA28
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0805AA58
	ldr r1, _0805AA54 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _0805AA74
	.align 2, 0
_0805AA54: .4byte 0x0201774C
_0805AA58:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #8
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_0805AA74:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
