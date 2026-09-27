	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemSubMenu_TradeItem
ItemSubMenu_TradeItem: @ 0x080226F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0802271C @ =0x0202BBB8
	ldr r1, _08022720 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	adds r0, #0x3f
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_080223EC
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	adds r1, r5, #0
	bl TradeCommandEffect
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802271C: .4byte 0x0202BBB8
_08022720: .4byte 0x0203A85C
