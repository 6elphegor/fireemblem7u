	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6CC0
sub_080A6CC0: @ 0x080A6CC0
	push {lr}
	bl ReadLastGameSaveId
	bl WriteGameSave
	pop {r0}
	bx r0
	.align 2, 0
