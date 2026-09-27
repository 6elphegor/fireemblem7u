	.include "macro.inc"

	.syntax unified

	thumb_func_start IsChapterInOccupationsShadow
IsChapterInOccupationsShadow: @ 0x0807EEAC
	movs r1, #0
	ldr r0, _0807EEBC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #4
	bne _0807EEB8
	movs r1, #1
_0807EEB8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEBC: .4byte 0x0202BBF8
