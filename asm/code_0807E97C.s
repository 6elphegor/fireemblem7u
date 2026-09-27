	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E97C
sub_0807E97C: @ 0x0807E97C
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
