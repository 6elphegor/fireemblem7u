	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0434
sub_080B0434: @ 0x080B0434
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0
	movs r3, #0
	bl sub_080B0454
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
