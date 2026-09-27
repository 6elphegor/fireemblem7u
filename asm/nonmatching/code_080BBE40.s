	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBE40
sub_080BBE40: @ 0x080BBE40
	ldr r0, _080BBE4C @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BBE4C: .4byte 0x03001620
