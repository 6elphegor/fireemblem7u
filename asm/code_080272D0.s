	.include "macro.inc"

	.syntax unified

	thumb_func_start HasSelectTarget
HasSelectTarget: @ 0x080272D0
	push {lr}
	bl _call_via_r1
	bl CountTargets
	cmp r0, #0
	beq _080272E0
	movs r0, #1
_080272E0:
	pop {r1}
	bx r1
