	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenClassIdAt
GetSupportScreenClassIdAt: @ 0x0809B0F8
	ldr r1, _0809B108 @ =0x08CC5798
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_0809B108: .4byte 0x08CC5798
