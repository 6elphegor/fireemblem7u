	.include "macro.inc"

	.syntax unified

	thumb_func_start PutChapterTitlePalette
PutChapterTitlePalette: @ 0x08082058
	push {lr}
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08082074
	ldr r0, _08082070 @ =0x08402230
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080820C0
	.align 2, 0
_08082070: .4byte 0x08402230
_08082074:
	movs r0, #1
	ands r0, r2
	ldr r3, _080820C4 @ =0x083FE438
	cmp r0, #0
	beq _08082080
	ldr r3, _080820C8 @ =0x083FE2F8
_08082080:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0808208A
	adds r3, #0x40
_0808208A:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08082094
	adds r3, #0x80
_08082094:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0808209E
	adds r3, #0xc0
_0808209E:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080820AC
	movs r0, #0x80
	lsls r0, r0, #1
	adds r3, r3, r0
_080820AC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080820B6
	adds r3, #0x20
_080820B6:
	lsls r1, r1, #5
	adds r0, r3, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_080820C0:
	pop {r0}
	bx r0
	.align 2, 0
_080820C4: .4byte 0x083FE438
_080820C8: .4byte 0x083FE2F8
