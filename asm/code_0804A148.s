	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackUnkUiFrame
UnpackUnkUiFrame: @ 0x0804A148
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0804A16C @ =0x081D7B80
	adds r1, r3, #0
	bl Decompress
	ldr r0, _0804A170 @ =0x081D7DD4
	lsls r4, r4, #5
	lsls r5, r5, #5
	adds r1, r4, #0
	adds r2, r5, #0
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A16C: .4byte 0x081D7B80
_0804A170: .4byte 0x081D7DD4
