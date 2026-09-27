	.include "macro.inc"

	.syntax unified

	thumb_func_start CountSecretSoundRoomSongs
CountSecretSoundRoomSongs: @ 0x080AAD94
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0
	ldr r0, _080AADB0 @ =0x08CE4D28
	adds r5, r0, #0
	adds r5, #8
	adds r2, r0, #0
_080AADA2:
	lsls r1, r3, #4
	ldr r0, [r2]
	cmp r0, #0
	bge _080AADB4
	adds r0, r4, #0
	b _080AADC4
	.align 2, 0
_080AADB0: .4byte 0x08CE4D28
_080AADB4:
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080AADBE
	adds r4, #1
_080AADBE:
	adds r2, #0x10
	adds r3, #1
	b _080AADA2
_080AADC4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
