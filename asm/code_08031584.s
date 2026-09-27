	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterMapPointer
GetChapterMapPointer: @ 0x08031584
	push {r4, lr}
	ldr r4, _0803159C @ =0x08C9C9C8
	bl GetChapterInfo
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803159C: .4byte 0x08C9C9C8
