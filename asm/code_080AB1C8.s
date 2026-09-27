	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB1C8
sub_080AB1C8: @ 0x080AB1C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r2, [r0]
	adds r2, #1
	movs r0, #0x7f
	ands r2, r0
_080AB1D6:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB212
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl StartSoundRoomSong
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB20E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
	movs r0, #1
	b _080AB220
_080AB20E:
	movs r0, #0
	b _080AB220
_080AB212:
	adds r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AB1D6
_080AB220:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
