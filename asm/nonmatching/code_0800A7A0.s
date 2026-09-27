	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800A7A0
sub_0800A7A0: @ 0x0800A7A0
	ldr r0, _0800A7B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0800A7B8
	movs r0, #0
	b _0800A7BA
	.align 2, 0
_0800A7B4: .4byte 0x08B857F8
_0800A7B8:
	movs r0, #1
_0800A7BA:
	bx lr
