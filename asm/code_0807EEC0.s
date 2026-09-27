	.include "macro.inc"

	.syntax unified

	thumb_func_start IsChapterBeyondTheBorders
IsChapterBeyondTheBorders: @ 0x0807EEC0
	movs r1, #0
	ldr r0, _0807EED0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #5
	bne _0807EECC
	movs r1, #1
_0807EECC:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EED0: .4byte 0x0202BBF8
