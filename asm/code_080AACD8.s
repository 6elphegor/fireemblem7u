	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AACD8
sub_080AACD8: @ 0x080AACD8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, r1, #0
	lsls r4, r2, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _080AACFC @ =0x02020140
	adds r1, r5, #0
	bl Decompress
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AACFC: .4byte 0x02020140
