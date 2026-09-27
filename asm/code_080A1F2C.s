	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1F2C
sub_080A1F2C: @ 0x080A1F2C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r1, _080A1F4C @ =0x03005E70
	ldr r2, _080A1F50 @ =0x000007D4
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0xa0
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F4C: .4byte 0x03005E70
_080A1F50: .4byte 0x000007D4
