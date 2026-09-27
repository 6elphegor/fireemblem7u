	.include "macro.inc"

	.syntax unified

	thumb_func_start MaybeCallEndEvent
MaybeCallEndEvent: @ 0x080791D0
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080791EC
	bl ShouldCallEndEvent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080791EC
	bl CallEndEvent
_080791EC:
	pop {r0}
	bx r0
