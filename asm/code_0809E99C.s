	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E99C
sub_0809E99C: @ 0x0809E99C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0809E9C0 @ =0x03005E70
	bl GetPermanentFlagBits
	adds r5, r0, #0
	bl sub_0807992C
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E9C0: .4byte 0x03005E70
