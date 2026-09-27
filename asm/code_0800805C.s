	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalk
StartTalk: @ 0x0800805C
	push {lr}
	movs r3, #0
	bl StartTalkExt
	pop {r1}
	bx r1
