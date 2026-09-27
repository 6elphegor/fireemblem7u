	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayMuStepSe
PlayMuStepSe: @ 0x0806C2E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl UpdateMuStepSounds
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
