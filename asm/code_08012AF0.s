	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_RestoreChapterId
GC_RestoreChapterId: @ 0x08012AF0
	ldr r1, _08012AFC @ =0x0202BBF8
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
_08012AFC: .4byte 0x0202BBF8
