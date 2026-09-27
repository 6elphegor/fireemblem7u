	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLinkedTargets
GetLinkedTargets: @ 0x0804B15C
	push {lr}
	bl GetFurthestTargetDistance
	cmp r0, #2
	bgt _0804B16C
	bl GetLinkedTargetsNear
	b _0804B170
_0804B16C:
	bl GetLinkedTargetsFar
_0804B170:
	pop {r1}
	bx r1
