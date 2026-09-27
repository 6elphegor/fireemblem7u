	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomUi_80AFD48
SoundRoomUi_80AFD48: @ 0x080AC0D0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x3a
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	bl InitSoundRoomShuffleBuffer
	pop {r0}
	bx r0
