	.include "macro.inc"

	.syntax unified

	thumb_func_start IsChapterBloodOfPride
IsChapterBloodOfPride: @ 0x0807EED4
	movs r1, #0
	ldr r0, _0807EEE4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #6
	bne _0807EEE0
	movs r1, #1
_0807EEE0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEE4: .4byte 0x0202BBF8
