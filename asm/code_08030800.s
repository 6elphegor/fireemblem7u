	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030800
sub_08030800: @ 0x08030800
	movs r1, #0
	str r1, [r0, #0x34]
	subs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _08030818 @ =0x0202E3D8
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08030818: .4byte 0x0202E3D8
