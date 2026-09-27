	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_808F0EC
CgText_808F0EC: @ 0x08087BC0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl CgText_ClearSpriteText
	adds r0, r5, #0
	adds r0, #0x54
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	bl SetTextFontGlyphs
	adds r1, r5, #0
	adds r1, #0x59
	strb r4, [r1]
	adds r2, r5, #0
	adds r2, #0x5a
	strb r4, [r2]
	ldr r0, [r5, #0x2c]
	bl GetCgTextDimensions
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl RestartCgTextInterpreter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
