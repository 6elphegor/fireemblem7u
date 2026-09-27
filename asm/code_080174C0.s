	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080174C0
sub_080174C0: @ 0x080174C0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080174D4 @ =0x08BE222C
	adds r1, r1, r0
	adds r1, #0x21
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080174D4: .4byte 0x08BE222C
