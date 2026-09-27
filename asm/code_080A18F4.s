	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadTraps
ReadTraps: @ 0x080A18F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A1914 @ =0x03005E70
	movs r0, #0
	bl GetTrap
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	ldr r3, [r4]
	adds r0, r5, #0
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1914: .4byte 0x03005E70
