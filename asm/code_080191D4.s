	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackChapterMapGraphics
UnpackChapterMapGraphics: @ 0x080191D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08019230 @ =0x08C9C9C8
	bl GetChapterInfo
	ldrb r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019234 @ =0x06008000
	bl Decompress
	adds r0, r4, #0
	bl GetChapterInfo
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08019212
	adds r0, r4, #0
	bl GetChapterInfo
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019238 @ =0x0600C000
	bl Decompress
_08019212:
	adds r0, r4, #0
	bl GetChapterInfo
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019230: .4byte 0x08C9C9C8
_08019234: .4byte 0x06008000
_08019238: .4byte 0x0600C000
