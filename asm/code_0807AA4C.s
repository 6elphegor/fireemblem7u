	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807AA4C
sub_0807AA4C: @ 0x0807AA4C
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0x80
	lsls r1, r1, #2
	str r1, [sp]
	subs r1, #0xc0
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
