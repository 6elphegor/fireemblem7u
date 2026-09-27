	.include "macro.inc"

	.syntax unified

	thumb_func_start AiDoBerserkAction
AiDoBerserkAction: @ 0x080384EC
	push {lr}
	ldr r0, _08038504 @ =AiIsUnitEnemy
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038500
	ldr r0, _08038508 @ =AiIsUnitNonActive
	bl AiAttemptOffensiveAction
_08038500:
	pop {r0}
	bx r0
	.align 2, 0
_08038504: .4byte AiIsUnitEnemy
_08038508: .4byte AiIsUnitNonActive
