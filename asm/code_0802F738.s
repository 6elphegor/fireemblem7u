	.include "macro.inc"

	.syntax unified

	thumb_func_start DeathDropSpriteAnim_ExecAnyTrap
DeathDropSpriteAnim_ExecAnyTrap: @ 0x0802F738
	push {lr}
	ldr r1, [r0, #0x2c]
	bl ExecTrapAfterDeathDrop
	pop {r0}
	bx r0
