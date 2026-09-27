	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_DisplayRoundAnim
Manim_DisplayRoundAnim: @ 0x0806E5D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl Manim_GetRoundProcScript
	adds r1, r0, #0
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
