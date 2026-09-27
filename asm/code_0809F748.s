	.include "macro.inc"

	.syntax unified

	thumb_func_start UnlockSoundRoomSong
UnlockSoundRoomSong: @ 0x0809F748
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F762
	mov r4, sp
	mov r0, sp
	bl LoadAndVerifySoundRoomData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F784
_0809F762:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0809F784
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl WriteSoundRoomSaveData
_0809F784:
	add sp, #0x24
	pop {r4, r5}
	pop {r0}
	bx r0
