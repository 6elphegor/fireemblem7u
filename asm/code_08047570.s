	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047570
sub_08047570: @ 0x08047570
	ldr r2, _08047590 @ =0x03002870
	movs r0, #0
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08047590: .4byte 0x03002870
