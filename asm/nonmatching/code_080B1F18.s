	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B1F18
sub_080B1F18: @ 0x080B1F18
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080B1F2C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
