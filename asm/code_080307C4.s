	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080307C4
sub_080307C4: @ 0x080307C4
	movs r1, #0
	str r1, [r0, #0x34]
	movs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _080307DC @ =0x0202E3D8
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080307DC: .4byte 0x0202E3D8
