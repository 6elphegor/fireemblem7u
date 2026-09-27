	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenPartnerSupportLevel
GetSupportScreenPartnerSupportLevel: @ 0x0809B074
	ldr r2, _0809B088 @ =0x08CC5798
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809B088: .4byte 0x08CC5798
