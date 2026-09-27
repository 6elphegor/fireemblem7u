	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSoundRoomSong
StartSoundRoomSong: @ 0x080ABAB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080ABAF4
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	movs r0, #1
	strh r0, [r4, #0x2c]
	ldr r1, _080ABAF0 @ =0x08CE4D28
	lsls r0, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	adds r3, r6, #0
	bl CallSomeSoundMaybe
	movs r0, #1
	b _080ABAF6
	.align 2, 0
_080ABAF0: .4byte 0x08CE4D28
_080ABAF4:
	movs r0, #0
_080ABAF6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
