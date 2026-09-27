	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005018
sub_08005018: @ 0x08005018
	push {r0, r1, r2, r3}
	push {lr}
	sub sp, #0x100
	mov r0, sp
	bl sub_08005134
	add sp, #0x100
	pop {r3}
	add sp, #0x10
	bx r3
