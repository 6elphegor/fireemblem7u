	.include "macro.inc"

	.syntax unified

	thumb_func_start SetMapCursorPosition
SetMapCursorPosition: @ 0x08015A90
	ldr r2, _08015AA4 @ =0x0202BBB8
	strh r0, [r2, #0x14]
	strh r1, [r2, #0x16]
	lsls r0, r0, #4
	strh r0, [r2, #0x1c]
	lsls r1, r1, #4
	strh r1, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r1, [r2, #0x22]
	bx lr
	.align 2, 0
_08015AA4: .4byte 0x0202BBB8
