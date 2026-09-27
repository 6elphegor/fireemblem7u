	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2FB0
sub_080B2FB0: @ 0x080B2FB0
	ldr r0, _080B2FBC @ =0x02000000
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080B2FBC: .4byte 0x02000000
