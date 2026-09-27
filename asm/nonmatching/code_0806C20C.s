	.include "macro.inc"

	.syntax unified

	thumb_func_start MuStepSe_PlaySeA
MuStepSe_PlaySeA: @ 0x0806C20C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x58]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl PlaySeSpacial
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
