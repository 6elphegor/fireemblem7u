	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080992A0
sub_080992A0: @ 0x080992A0
	push {lr}
	ldr r0, _080992B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x83
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080992B8: .4byte 0x0202BBF8
