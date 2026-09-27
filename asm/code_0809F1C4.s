	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveRankings
SaveRankings: @ 0x0809F1C4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x90
	bl Checksum16
	adds r1, r4, #0
	adds r1, #0x90
	strh r0, [r1]
	ldr r0, _0809F1EC @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F1F0 @ =0x00007044
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x94
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F1EC: .4byte 0x08CE3B58
_0809F1F0: .4byte 0x00007044
