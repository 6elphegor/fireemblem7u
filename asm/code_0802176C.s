	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenu_ButtonBPressed
ItemMenu_ButtonBPressed: @ 0x0802176C
	push {lr}
	ldr r0, _080217A0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	ldr r0, _080217A4 @ =0x08B95AAC
	ldr r2, _080217A8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	bl HideMoveRangeGraphics
	movs r0, #0x3b
	pop {r1}
	bx r1
	.align 2, 0
_080217A0: .4byte 0x02023C60
_080217A4: .4byte 0x08B95AAC
_080217A8: .4byte 0x0202BBB8
