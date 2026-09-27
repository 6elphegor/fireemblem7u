	.include "macro.inc"

	.syntax unified

	thumb_func_start ManimWindow_Clear
ManimWindow_Clear: @ 0x0806F7E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetOnHBlankA
	bl ClearUi
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
