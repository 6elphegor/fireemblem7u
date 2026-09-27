	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1F90
sub_080A1F90: @ 0x080A1F90
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r1, _080A1FB4 @ =0x03005E70
	movs r2, #0xfa
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #2
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1FB4: .4byte 0x03005E70
