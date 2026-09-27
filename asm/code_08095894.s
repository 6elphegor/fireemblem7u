	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095894
sub_08095894: @ 0x08095894
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
