	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackChapterMapPalette
UnpackChapterMapPalette: @ 0x0801923C
	push {r4, lr}
	ldr r4, _08019264 @ =0x08C9C9C8
	ldr r0, _08019268 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019264: .4byte 0x08C9C9C8
_08019268: .4byte 0x0202BBF8
