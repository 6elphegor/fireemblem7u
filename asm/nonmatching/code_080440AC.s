	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080440AC
sub_080440AC: @ 0x080440AC
	push {lr}
	bl SoundVSyncOn_rev01
	pop {r0}
	bx r0
	.align 2, 0
