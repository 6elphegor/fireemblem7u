	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSoloBattleAnimType
GetUnitSoloBattleAnimType: @ 0x0802A40C
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0802A41C
	movs r0, #0
	b _0802A42C
_0802A41C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802A42A
	movs r0, #1
	b _0802A42C
_0802A42A:
	movs r0, #3
_0802A42C:
	bx lr
	.align 2, 0
