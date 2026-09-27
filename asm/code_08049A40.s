	.include "macro.inc"

	.syntax unified

	thumb_func_start MultiBootWaitCycles
MultiBootWaitCycles: @ 0x08049A40
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _08049A52
	movs r1, #0xd
	cmp r2, #8
	beq _08049A52
	movs r1, #4
_08049A52:
	subs r0, r0, r1
	bgt _08049A52
	bx lr
