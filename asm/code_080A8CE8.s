	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadUiSpinningArrowGfx
LoadUiSpinningArrowGfx: @ 0x080A8CE8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, _080A8D40 @ =0x08CE4A40
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080A8D38
	ldr r0, _080A8D44 @ =0x0840DCE4
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r6, #0
	bne _080A8D18
	ldr r0, _080A8D48 @ =0x0840D224
	ldr r2, _080A8D4C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A8D18:
	cmp r6, #1
	bne _080A8D26
	ldr r0, _080A8D50 @ =0x0840D150
	ldr r2, _080A8D4C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A8D26:
	asrs r0, r4, #5
	movs r1, #0xf
	ands r1, r7
	lsls r1, r1, #0xc
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	str r6, [r5, #0x2c]
_080A8D38:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A8D40: .4byte 0x08CE4A40
_080A8D44: .4byte 0x0840DCE4
_080A8D48: .4byte 0x0840D224
_080A8D4C: .4byte 0x06010000
_080A8D50: .4byte 0x0840D150
