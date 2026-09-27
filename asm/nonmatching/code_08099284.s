	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099284
sub_08099284: @ 0x08099284
	push {lr}
	ldr r0, _0809929C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x80
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0809929C: .4byte 0x0202BBF8
