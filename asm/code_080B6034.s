	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6034
sub_080B6034: @ 0x080B6034
	push {r4, lr}
	adds r4, r0, #0
	bl ClearTalk
	ldr r0, _080B6078 @ =0x085D0A40
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B607C @ =0x085D0AC0
	ldr r1, _080B6080 @ =0x06008000
	bl Decompress
	ldr r0, _080B6084 @ =0x02024460
	ldr r1, _080B6088 @ =0x085D5B38
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0xb4
	str r0, [r4, #0x30]
	movs r0, #0x60
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6078: .4byte 0x085D0A40
_080B607C: .4byte 0x085D0AC0
_080B6080: .4byte 0x06008000
_080B6084: .4byte 0x02024460
_080B6088: .4byte 0x085D5B38
