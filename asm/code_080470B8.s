	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080470B8
sub_080470B8: @ 0x080470B8
	ldr r1, _080470C0 @ =0x0203DCE8
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080470C0: .4byte 0x0203DCE8
