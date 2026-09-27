	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalkMsg
StartTalkMsg: @ 0x0800801C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartTalkExt
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
