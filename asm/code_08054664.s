	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAISLayerId
GetAISLayerId: @ 0x08054664
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq _08054674
	movs r0, #1
	b _08054676
_08054674:
	movs r0, #0
_08054676:
	bx lr
