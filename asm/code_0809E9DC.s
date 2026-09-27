	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E9DC
sub_0809E9DC: @ 0x0809E9DC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0809E9F8 @ =0x03005E70
	bl GetConvoyItemArray
	adds r1, r0, #0
	ldr r3, [r4]
	adds r0, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E9F8: .4byte 0x03005E70
