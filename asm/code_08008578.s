	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkToggleInvertedPalette
TalkToggleInvertedPalette: @ 0x08008578
	push {lr}
	cmp r0, #0
	beq _0800859C
	ldr r0, _08008594 @ =0x08194774
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08008598 @ =0x08194754
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080085B0
	.align 2, 0
_08008594: .4byte 0x08194774
_08008598: .4byte 0x08194754
_0800859C:
	ldr r0, _080085B4 @ =0x083FBFD0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080085B8 @ =0x08194674
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_080085B0:
	pop {r0}
	bx r0
	.align 2, 0
_080085B4: .4byte 0x083FBFD0
_080085B8: .4byte 0x08194674
