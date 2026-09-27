	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E95C
sub_0807E95C: @ 0x0807E95C
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
