	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B80F0
sub_080B80F0: @ 0x080B80F0
	push {r4, r5, lr}
	ldr r0, _080B8140 @ =0x085DC114
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8144 @ =0x085DC0D4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8148 @ =0x02024460
	ldr r1, _080B814C @ =0x085DBC20
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, _080B8150 @ =0x02023C60
	ldr r1, _080B8154 @ =0x085DC9A4
	ldr r5, _080B8158 @ =0x0000C280
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0x90
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _080B815C @ =0x085DCA20
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0xc
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8140: .4byte 0x085DC114
_080B8144: .4byte 0x085DC0D4
_080B8148: .4byte 0x02024460
_080B814C: .4byte 0x085DBC20
_080B8150: .4byte 0x02023C60
_080B8154: .4byte 0x085DC9A4
_080B8158: .4byte 0x0000C280
_080B815C: .4byte 0x085DCA20
