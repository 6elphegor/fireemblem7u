	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6E58
sub_080B6E58: @ 0x080B6E58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080B6E80 @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	lsls r5, r5, #3
	adds r4, #0x18
	adds r5, r5, r4
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E80: .4byte 0x02000818
