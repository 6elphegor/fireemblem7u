	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080843AC
sub_080843AC: @ 0x080843AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080843D4 @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080843D4: .4byte 0x08CC2A4C
