	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9E10
sub_080B9E10: @ 0x080B9E10
	push {r4, lr}
	sub sp, #0x14
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r4, [r0, #0x58]
	adds r4, #0x10
	movs r1, #1
	lsls r1, r4
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
