	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807560C
sub_0807560C: @ 0x0807560C
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0x37
	str r0, [sp, #8]
	ldr r0, [r7]
	movs r2, #0xc8
	movs r3, #1
	bl sub_08075528
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
