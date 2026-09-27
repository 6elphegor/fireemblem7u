	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalkMsgExt
StartTalkMsgExt: @ 0x0800803C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl StartTalkExt
	pop {r4, r5, r6}
	pop {r1}
	bx r1
