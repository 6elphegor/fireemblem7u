	.include "macro.inc"

	.syntax unified

	thumb_func_start CountDisplayedSoundRoomSongs
CountDisplayedSoundRoomSongs: @ 0x080AADEC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r2, #0
	movs r4, #0
	ldr r3, _080AAE08 @ =0x08CE4D28
	adds r5, r3, #0
_080AADF8:
	lsls r1, r2, #4
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	bge _080AAE0C
	adds r0, r4, #0
	b _080AAE3A
	.align 2, 0
_080AAE08: .4byte 0x08CE4D28
_080AAE0C:
	adds r0, r3, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AAE32
	asrs r1, r2, #5
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r0, #0x1f
	ands r0, r2
	ldr r1, [r1, #0x40]
	lsrs r1, r0
	movs r0, #1
	ands r1, r0
	adds r0, r2, #1
	cmp r1, #0
	beq _080AAE36
	b _080AAE34
_080AAE32:
	adds r0, r2, #1
_080AAE34:
	adds r4, r0, #0
_080AAE36:
	adds r2, r0, #0
	b _080AADF8
_080AAE3A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
