	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMuMovement
EndMuMovement: @ 0x0806C2FC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
