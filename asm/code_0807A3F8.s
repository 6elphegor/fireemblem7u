	.include "macro.inc"

	.syntax unified

	thumb_func_start GmUnitFadeExists
GmUnitFadeExists: @ 0x0807A3F8
	push {lr}
	bl CheckLinkedToFE6
	cmp r0, #0
	beq _0807A404
	movs r0, #1
_0807A404:
	pop {r1}
	bx r1
