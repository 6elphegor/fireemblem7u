	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomSongChange_FadeOutPrevious
SoundRoomSongChange_FadeOutPrevious: @ 0x080AAFA0
	push {r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x14]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x78
	bl CallSomeSoundMaybe
	adds r4, #0x3f
	movs r0, #1
	strb r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
