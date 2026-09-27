	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitClassKillExpBonus
GetUnitClassKillExpBonus: @ 0x08029E08
	movs r3, #0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08029E1E
	movs r3, #0x14
_08029E1E:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _08029E2A
	adds r3, #0x28
_08029E2A:
	adds r0, r3, #0
	bx lr
	.align 2, 0
