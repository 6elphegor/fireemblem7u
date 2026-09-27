	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080315E8
sub_080315E8: @ 0x080315E8
	ldr r1, _080315FC @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080315FC: .4byte 0x0202BBF8
