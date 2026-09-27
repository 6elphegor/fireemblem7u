	.include "macro.inc"

	.syntax unified

	thumb_func_start Move3rdFireDragon
Move3rdFireDragon: @ 0x0807E870
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
