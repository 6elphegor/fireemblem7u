	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031148
sub_08031148: @ 0x08031148
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0
