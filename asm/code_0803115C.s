	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803115C
sub_0803115C: @ 0x0803115C
	push {lr}
	sub sp, #4
	bl sub_08004234
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
