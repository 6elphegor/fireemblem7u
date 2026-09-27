	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenPartnerClassId
GetSupportScreenPartnerClassId: @ 0x0809B08C
	ldr r2, _0809B0A0 @ =0x08CC5798
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809B0A0: .4byte 0x08CC5798
