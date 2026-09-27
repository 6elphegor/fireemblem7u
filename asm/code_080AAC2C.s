	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAC2C
sub_080AAC2C: @ 0x080AAC2C
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	str r1, [sp]
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
