	.include "macro.inc"

	.syntax unified

	thumb_func_start StopSoundRoomSong
StopSoundRoomSong: @ 0x080ABB00
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ABB30
	movs r4, #0
	strh r0, [r5, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r5, #0
	adds r0, #0x2f
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
_080ABB30:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
