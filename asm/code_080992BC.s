	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterDivinationPortrait
GetChapterDivinationPortrait: @ 0x080992BC
	push {lr}
	ldr r0, _080992D4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x82
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080992D4: .4byte 0x0202BBF8
