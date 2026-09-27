	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAC10
sub_080AAC10: @ 0x080AAC10
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
