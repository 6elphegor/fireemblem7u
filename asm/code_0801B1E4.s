	.include "macro.inc"

	.syntax unified

	thumb_func_start Return2or3BySecondParity
Return2or3BySecondParity: @ 0x0801B1E4
	push {r4, lr}
	sub sp, #8
	bl GetGameTime
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl FormatTime
	movs r0, #1
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #3
	cmp r0, #0
	bne _0801B208
	movs r1, #2
_0801B208:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
