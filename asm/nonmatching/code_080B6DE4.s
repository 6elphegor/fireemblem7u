	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6DE4
sub_080B6DE4: @ 0x080B6DE4
	push {r4, r5, lr}
	ldr r4, _080B6E20 @ =0x02000818
	ldr r1, _080B6E24 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xa
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x18
	movs r5, #9
_080B6DFC:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B6DFC
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E20: .4byte 0x02000818
_080B6E24: .4byte 0x06011000
