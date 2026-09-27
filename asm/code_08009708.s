	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08009708
sub_08009708: @ 0x08009708
	push {r4, r5, lr}
	ldr r0, _0800973C @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
_08009714:
	lsls r4, r5, #3
	ldr r0, _08009740 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, #1
	ble _08009714
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800973C: .4byte 0x08B909B8
_08009740: .4byte 0x030000C8
