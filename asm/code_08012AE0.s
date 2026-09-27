	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_RememberChapterId
GC_RememberChapterId: @ 0x08012AE0
	ldr r1, _08012AEC @ =0x0202BBF8
	ldrb r1, [r1, #0xe]
	adds r0, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_08012AEC: .4byte 0x0202BBF8
