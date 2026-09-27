	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044D14
sub_08044D14: @ 0x08044D14
	ldr r1, _08044D28 @ =0x03001400
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x13
_08044D1C:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08044D1C
	bx lr
	.align 2, 0
_08044D28: .4byte 0x03001400
