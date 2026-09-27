	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F1D4
sub_0807F1D4: @ 0x0807F1D4
	push {lr}
	movs r0, #0
	movs r1, #0x74
	bl UnlockSoundRoomSong
	pop {r0}
	bx r0
	.align 2, 0
