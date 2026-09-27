	.include "macro.inc"

	.syntax unified

	thumb_func_start IsChapterNightOfFarewells
IsChapterNightOfFarewells: @ 0x0807EEE8
	movs r1, #0
	ldr r0, _0807EEF8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x26
	bne _0807EEF4
	movs r1, #1
_0807EEF4:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEF8: .4byte 0x0202BBF8
