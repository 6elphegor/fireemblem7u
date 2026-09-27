	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomUi_80AFCE4
SoundRoomUi_80AFCE4: @ 0x080AC070
	push {r4, lr}
	adds r4, r0, #0
	bl TryDrawSoundRoomSongTitle
	adds r4, #0x3a
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
