	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802E6D4
sub_0802E6D4: @ 0x0802E6D4
	push {lr}
	movs r0, #2
	bl SetNextGameAction
	bl WriteCompletedPlaythroughSaveData
	pop {r0}
	bx r0
