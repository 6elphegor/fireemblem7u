	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomUi_RestartTitleMusic
SoundRoomUi_RestartTitleMusic: @ 0x080ABD4C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ABD72
	str r0, [sp]
	movs r0, #0x5a
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	bl Proc_Break
_080ABD72:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
