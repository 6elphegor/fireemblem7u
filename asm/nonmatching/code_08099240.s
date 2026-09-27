	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterDivinationTextIdHectorStory
GetChapterDivinationTextIdHectorStory: @ 0x08099240
	push {r4, lr}
	ldr r4, _08099264 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _08099256
	movs r1, #2
_08099256:
	adds r0, #0x7c
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099264: .4byte 0x0202BBF8
