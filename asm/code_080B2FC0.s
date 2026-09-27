	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2FC0
sub_080B2FC0: @ 0x080B2FC0
	ldr r1, _080B2FC8 @ =0x02000000
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_080B2FC8: .4byte 0x02000000
