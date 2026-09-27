	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBgmExt
StartBgmExt: @ 0x080038AC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	ldr r0, [r7]
	bl StartOrChangeBgm
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
