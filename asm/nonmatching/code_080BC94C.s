	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC94C
sub_080BC94C: @ 0x080BC94C
	ldr r0, _080BC95C @ =0x03001620
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BC95C: .4byte 0x03001620
