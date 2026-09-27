	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAnimPosition
GetAnimPosition: @ 0x08054678
	movs r1, #0x80
	lsls r1, r1, #2
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq _08054688
	movs r0, #1
	b _0805468A
_08054688:
	movs r0, #0
_0805468A:
	bx lr
