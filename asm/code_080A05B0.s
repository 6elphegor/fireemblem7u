	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadBonusContentClaimFlags
ReadBonusContentClaimFlags: @ 0x080A05B0
	push {lr}
	ldr r2, _080A05C8 @ =0x03005E70
	ldr r1, _080A05CC @ =0x00000D88
	adds r0, r0, r1
	ldr r1, _080A05D0 @ =0x0203ECC0
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_080A05C8: .4byte 0x03005E70
_080A05CC: .4byte 0x00000D88
_080A05D0: .4byte 0x0203ECC0
