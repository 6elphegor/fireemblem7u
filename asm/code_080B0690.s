	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0690
sub_080B0690: @ 0x080B0690
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x12
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
