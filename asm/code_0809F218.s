	.include "macro.inc"

	.syntax unified

	thumb_func_start GetNextChapterMode
GetNextChapterMode: @ 0x0809F218
	ldr r0, _0809F220 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	subs r0, #1
	bx lr
	.align 2, 0
_0809F220: .4byte 0x0202BBF8
