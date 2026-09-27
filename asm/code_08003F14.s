	.include "macro.inc"

	.syntax unified

	thumb_func_start PlaySongCore
PlaySongCore: @ 0x08003F14
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	cmp r0, #0x7f
	bgt _08003F32
	ldr r0, [r7]
	bl sub_08003FC0
	movs r0, #0
	ldr r1, [r7]
	bl UnlockSoundRoomSong
_08003F32:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _08003F54
	ldr r0, [r7, #4]
	ldr r1, _08003F50 @ =0x0869D6E0
	ldr r2, [r7]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldr r2, [r1]
	adds r1, r2, #0
	bl MPlayStart_rev01
	b _08003F62
	.align 2, 0
_08003F50: .4byte 0x0869D6E0
_08003F54:
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl m4aSongNumStart
_08003F62:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
