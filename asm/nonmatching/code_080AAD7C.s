	.include "macro.inc"

	.syntax unified

	thumb_func_start CountTotalSoundRoomSongs
CountTotalSoundRoomSongs: @ 0x080AAD7C
	movs r2, #0
	ldr r1, _080AAD8C @ =0x08CE4D28
_080AAD80:
	ldr r0, [r1]
	cmp r0, #0
	blt _080AAD90
	adds r1, #0x10
	adds r2, #1
	b _080AAD80
	.align 2, 0
_080AAD8C: .4byte 0x08CE4D28
_080AAD90:
	adds r0, r2, #0
	bx lr
