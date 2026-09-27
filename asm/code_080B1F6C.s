	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackUiVArrowGfx
UnpackUiVArrowGfx: @ 0x080B1F6C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080B1FA4 @ =0x0840D150
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _080B1FA8 @ =0x06010000
	adds r1, r2, r3
	bl Decompress
	ldr r0, _080B1FAC @ =0x08405B0C
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1FA4: .4byte 0x0840D150
_080B1FA8: .4byte 0x06010000
_080B1FAC: .4byte 0x08405B0C
