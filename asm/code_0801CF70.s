	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_DisplayUnitMovement
PlayerPhase_DisplayUnitMovement: @ 0x0801CF70
	push {lr}
	bl GetMovementScriptFromPath
	ldr r0, _0801CF90 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl UnitApplyWorkingMovementScript
	ldr r0, _0801CF94 @ =0x02033E00
	bl SetAutoMuMoveScript
	pop {r0}
	bx r0
	.align 2, 0
_0801CF90: .4byte 0x03004690
_0801CF94: .4byte 0x02033E00
