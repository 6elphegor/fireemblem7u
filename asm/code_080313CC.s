	.include "macro.inc"

	.syntax unified

	thumb_func_start CanActiveUnitUseRescue
CanActiveUnitUseRescue: @ 0x080313CC
	push {lr}
	ldr r0, _080313E4 @ =0x03004690
	ldr r0, [r0]
	bl MakeRescueTargetList
	bl CountTargets
	cmp r0, #0
	beq _080313E0
	movs r0, #1
_080313E0:
	pop {r1}
	bx r1
	.align 2, 0
_080313E4: .4byte 0x03004690
