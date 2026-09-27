	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMapSongBgm
StartMapSongBgm: @ 0x08015F84
	push {lr}
	bl GetActiveMapSong
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0
