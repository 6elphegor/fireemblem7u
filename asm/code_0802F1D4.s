	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaSetFallbackWeaponsMaybe
ArenaSetFallbackWeaponsMaybe: @ 0x0802F1D4
	push {r4, lr}
	ldr r4, _0802F1F4 @ =0x0203A7F4
	ldr r0, [r4]
	adds r1, r4, #0
	adds r1, #0x1a
	bl ArenaSetFallbackWeaponForUnit
	ldr r0, [r4, #4]
	adds r4, #0x1c
	adds r1, r4, #0
	bl ArenaSetFallbackWeaponForUnit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F1F4: .4byte 0x0203A7F4
