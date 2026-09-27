	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080096D4
sub_080096D4: @ 0x080096D4
	push {r4, lr}
	ldr r0, _08009700 @ =0x08B909B8
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r4, _08009704 @ =0x030000D0
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009700: .4byte 0x08B909B8
_08009704: .4byte 0x030000D0
