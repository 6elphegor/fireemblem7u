	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBonusContentClaimFlags
SetBonusContentClaimFlags: @ 0x080A0588
	ldr r1, _080A0590 @ =0x0203ECC0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0590: .4byte 0x0203ECC0
