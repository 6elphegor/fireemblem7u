	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitExpLevel
GetUnitExpLevel: @ 0x08029D7C
	movs r3, #8
	ldrsb r3, [r0, r3]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029D96
	adds r3, #0x14
_08029D96:
	adds r0, r3, #0
	bx lr
	.align 2, 0
