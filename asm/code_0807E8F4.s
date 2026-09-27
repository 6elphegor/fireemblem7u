	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E8F4
sub_0807E8F4: @ 0x0807E8F4
	push {lr}
	sub sp, #8
	movs r0, #3
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x68
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
