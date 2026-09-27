	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6E2C
sub_080A6E2C: @ 0x080A6E2C
	push {r4, lr}
	ldr r0, _080A6E5C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r4, _080A6E60 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E5C: .4byte 0x02023460
_080A6E60: .4byte 0x0200006C
