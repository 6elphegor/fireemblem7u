	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBoxDialogueSize
SetBoxDialogueSize: @ 0x08083434
	movs r3, #0xf8
	ands r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	strh r3, [r1]
	adds r0, #0x46
	strh r2, [r0]
	bx lr
