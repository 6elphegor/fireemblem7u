	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGetOpposingLevel
ArenaGetOpposingLevel: @ 0x0802EBFC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #9
	bl RandNext
	adds r4, r4, r0
	subs r0, r4, #4
	cmp r0, #0
	bgt _0802EC10
	movs r0, #1
_0802EC10:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
