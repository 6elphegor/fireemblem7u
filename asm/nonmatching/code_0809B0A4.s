	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenPartnerIsAlive
GetSupportScreenPartnerIsAlive: @ 0x0809B0A4
	ldr r2, _0809B0BC @ =0x08CC5798
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_0809B0BC: .4byte 0x08CC5798
