	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBonusContentClaimFlags
GetBonusContentClaimFlags: @ 0x080A057C
	ldr r0, _080A0584 @ =0x0203ECC0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A0584: .4byte 0x0203ECC0
