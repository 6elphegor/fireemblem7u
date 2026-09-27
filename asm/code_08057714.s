	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057714
sub_08057714: @ 0x08057714
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057740 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057744 @ =0x08BA1854
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057748 @ =0x081E806A
	str r1, [r0, #0x48]
	ldr r1, _0805774C @ =0x081EE054
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057740: .4byte 0x0201774C
_08057744: .4byte 0x08BA1854
_08057748: .4byte 0x081E806A
_0805774C: .4byte 0x081EE054
