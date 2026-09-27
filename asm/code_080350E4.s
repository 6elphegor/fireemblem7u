	.include "macro.inc"

	.syntax unified

	thumb_func_start StartAiTargetCursor
StartAiTargetCursor: @ 0x080350E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08035108 @ =0x08B96F7C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035108: .4byte 0x08B96F7C
