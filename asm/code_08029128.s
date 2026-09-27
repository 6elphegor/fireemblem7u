	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleCheckBraveEffect
BattleCheckBraveEffect: @ 0x08029128
	ldr r0, [r0, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08029148
	ldr r0, _08029144 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	b _0802914A
	.align 2, 0
_08029144: .4byte 0x0203A50C
_08029148:
	movs r0, #0
_0802914A:
	bx lr
