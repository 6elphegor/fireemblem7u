	.include "macro.inc"

	.syntax unified

	thumb_func_start NilsEpilogueOutro_LoadNilsInDragonsGate
NilsEpilogueOutro_LoadNilsInDragonsGate: @ 0x0807F50C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807F56C @ =0x081900E4
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807F570 @ =0x0818F8B0
	ldr r1, _0807F574 @ =0x06005800
	bl Decompress
	ldr r0, _0807F578 @ =0x02023C60
	ldr r1, _0807F57C @ =0x0818FC08
	ldr r2, _0807F580 @ =0x000072C0
	bl TmApplyTsa_thm
	ldr r4, _0807F584 @ =0x0818C004
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807F588 @ =0x02024460
	ldr r1, _0807F58C @ =0x0818F2D4
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _0807F590 @ =0x0818F7B0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl ApplyPaletteExt
	movs r0, #0xc
	bl EnableBgSync
	adds r5, #0x4c
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F56C: .4byte 0x081900E4
_0807F570: .4byte 0x0818F8B0
_0807F574: .4byte 0x06005800
_0807F578: .4byte 0x02023C60
_0807F57C: .4byte 0x0818FC08
_0807F580: .4byte 0x000072C0
_0807F584: .4byte 0x0818C004
_0807F588: .4byte 0x02024460
_0807F58C: .4byte 0x0818F2D4
_0807F590: .4byte 0x0818F7B0
