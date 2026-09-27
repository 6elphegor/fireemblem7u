	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteBonusContentClaimFlags
WriteBonusContentClaimFlags: @ 0x080A0594
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A05A8 @ =0x0203ECC0
	ldr r2, _080A05AC @ =0x00000D88
	adds r1, r1, r2
	movs r2, #4
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A05A8: .4byte 0x0203ECC0
_080A05AC: .4byte 0x00000D88
