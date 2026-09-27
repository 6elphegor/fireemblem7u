	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080492EC
sub_080492EC: @ 0x080492EC
	ldr r2, _080492FC @ =0x0203DC9C
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r2, #6]
	movs r0, #0x17
	bx lr
	.align 2, 0
_080492FC: .4byte 0x0203DC9C
