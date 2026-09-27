	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D3BC
sub_0807D3BC: @ 0x0807D3BC
	push {lr}
	sub sp, #4
	movs r1, #3
	str r1, [sp]
	movs r1, #0x10
	movs r2, #1
	movs r3, #2
	bl StartUnkTrapAnim
	add sp, #4
	pop {r0}
	bx r0
