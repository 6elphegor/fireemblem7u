	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomSongChange_StartNext
SoundRoomSongChange_StartNext: @ 0x080AAFC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x14]
	adds r1, r4, #0
	adds r1, #0x31
	ldr r0, _080AB008 @ =0x08CE548C
	ldr r0, [r0]
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	movs r2, #0
	bl StartSoundRoomSong
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
	ldr r0, [r5, #0x14]
	bl sub_080AB4EC
	ldr r1, [r5, #0x14]
	bl sub_080AC87C
	adds r4, #0x3f
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB008: .4byte 0x08CE548C
