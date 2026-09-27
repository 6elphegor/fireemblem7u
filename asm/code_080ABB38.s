	.include "macro.inc"

	.syntax unified

	thumb_func_start TryDrawSoundRoomSongTitle
TryDrawSoundRoomSongTitle: @ 0x080ABB38
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r1, [r4]
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABB52
	ldrb r0, [r4]
	bl DrawSoundRoomSongTitle
	b _080ABB5A
_080ABB52:
	movs r0, #1
	rsbs r0, r0, #0
	bl DrawSoundRoomSongTitle
_080ABB5A:
	pop {r4}
	pop {r0}
	bx r0
