	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080307E0
sub_080307E0: @ 0x080307E0
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x38]
	ldr r1, _080307FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080307FC: .4byte 0x0202E3D8
