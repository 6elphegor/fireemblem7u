	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802E6B0
sub_0802E6B0: @ 0x0802E6B0
	push {r4, lr}
	ldr r4, _0802E6D0 @ =0x0202BBF8
	adds r0, r4, #0
	bl RegisterChapterStats
	bl ComputeChapterRankings
	bl SaveEndgameRankings
	movs r0, #0x20
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E6D0: .4byte 0x0202BBF8
