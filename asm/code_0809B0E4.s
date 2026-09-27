	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenCharIdAt
GetSupportScreenCharIdAt: @ 0x0809B0E4
	ldr r1, _0809B0F4 @ =0x08CC5798
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0809B0F4: .4byte 0x08CC5798
