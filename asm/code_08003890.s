	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBgm
StartBgm: @ 0x08003890
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7, #4]
	ldr r0, [r7]
	movs r1, #3
	bl StartOrChangeBgm
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
