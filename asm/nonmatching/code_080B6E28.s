	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6E28
sub_080B6E28: @ 0x080B6E28
	push {r4, r5, lr}
	ldr r4, _080B6E54 @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	adds r5, r4, #0
	adds r5, #0x18
	movs r4, #9
_080B6E38:
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B6E38
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E54: .4byte 0x02000818
