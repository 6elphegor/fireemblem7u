	.include "macro.inc"

	.syntax unified

	thumb_func_start BATTLE_HandleArenaDeathsMaybe
BATTLE_HandleArenaDeathsMaybe: @ 0x0802FA98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FAB4 @ =0x03004690
	ldr r0, [r4]
	bl KillUnitOnArenaDeathMaybe
	ldr r1, [r4]
	adds r0, r5, #0
	bl DropRescueOnDeath
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FAB4: .4byte 0x03004690
