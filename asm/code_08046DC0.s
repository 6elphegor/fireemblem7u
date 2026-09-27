	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046DC0
sub_08046DC0: @ 0x08046DC0
	push {r4, lr}
	movs r3, #0
	str r3, [r0, #0x58]
	ldr r2, _08046DE0 @ =0x0202BBF8
	ldrb r4, [r2, #0xf]
	lsls r1, r4, #6
	str r1, [r0, #0x5c]
	ldr r0, _08046DE4 @ =0x0203DC9C
	adds r0, #0xa
	ldrb r2, [r2, #0xf]
	adds r0, r2, r0
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046DE0: .4byte 0x0202BBF8
_08046DE4: .4byte 0x0203DC9C
