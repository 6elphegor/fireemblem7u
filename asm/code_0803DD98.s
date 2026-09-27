	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPlaySoundEffect
SioPlaySoundEffect: @ 0x0803DD98
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _0803DDC8 @ =0x081D5220
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _0803DDCC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803DDBE
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_0803DDBE:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDC8: .4byte 0x081D5220
_0803DDCC: .4byte 0x0202BBF8
