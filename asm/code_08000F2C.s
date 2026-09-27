	.include "macro.inc"

	.syntax unified

	thumb_func_start SetGameTime
SetGameTime: @ 0x08000F2C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08000F44 @ =0x03000010
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000F44: .4byte 0x03000010
