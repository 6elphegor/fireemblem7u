	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807AA24
sub_0807AA24: @ 0x0807AA24
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl StartScreenFlashing
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
