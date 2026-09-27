	.include "macro.inc"

	.syntax unified

	thumb_func_start Move2ndFireDragon
Move2ndFireDragon: @ 0x0807E854
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
