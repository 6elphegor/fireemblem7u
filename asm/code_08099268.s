	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterDivinationTextIdBeginning
GetChapterDivinationTextIdBeginning: @ 0x08099268
	push {lr}
	ldr r0, _08099280 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099280: .4byte 0x0202BBF8
