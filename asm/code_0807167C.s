	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807167C
sub_0807167C: @ 0x0807167C
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xb7
	bl PlaySeSpacial
	ldr r0, _080716CC @ =0x083F4894
	ldr r1, _080716D0 @ =0x06013800
	bl Decompress
	ldr r0, _080716D4 @ =0x083F4BE8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080716D8 @ =0x083ED9E8
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #8
	ldr r3, _080716DC @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080716CC: .4byte 0x083F4894
_080716D0: .4byte 0x06013800
_080716D4: .4byte 0x083F4BE8
_080716D8: .4byte 0x083ED9E8
_080716DC: .4byte 0x000041C0
