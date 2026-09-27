	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804F480
sub_0804F480: @ 0x0804F480
	ldr r0, _0804F48C @ =0x0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804F48C: .4byte 0x0201777C
