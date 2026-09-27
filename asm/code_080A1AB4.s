	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1AB4
sub_080A1AB4: @ 0x080A1AB4
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
