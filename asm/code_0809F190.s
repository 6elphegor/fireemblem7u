	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveBonusContentData
SaveBonusContentData: @ 0x0809F190
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	bl Checksum16
	adds r4, r5, r4
	strh r0, [r4]
	ldr r0, _0809F1BC @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F1C0 @ =0x00007134
	adds r1, r1, r0
	movs r2, #0xa1
	lsls r2, r2, #2
	adds r0, r5, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F1BC: .4byte 0x08CE3B58
_0809F1C0: .4byte 0x00007134
