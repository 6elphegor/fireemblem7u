	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPrepItemScreenFace
EndPrepItemScreenFace: @ 0x080929A4
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl UpdatePrepItemScreenFace
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
