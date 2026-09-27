	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012738
sub_08012738: @ 0x08012738
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0
