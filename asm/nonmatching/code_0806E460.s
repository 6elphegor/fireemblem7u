	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_PrepareBattleTalk
Manim_PrepareBattleTalk: @ 0x0806E460
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetText
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
