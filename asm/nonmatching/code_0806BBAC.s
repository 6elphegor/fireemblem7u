	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateMu
UpdateMu: @ 0x0806BBAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl Mu_OnLoop
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
