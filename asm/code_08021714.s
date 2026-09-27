	.include "macro.inc"

	.syntax unified

	thumb_func_start BackToUnitMenu_RestartMenu
BackToUnitMenu_RestartMenu: @ 0x08021714
	push {lr}
	ldr r0, _08021730 @ =0x08B95AAC
	ldr r2, _08021734 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	pop {r0}
	bx r0
	.align 2, 0
_08021730: .4byte 0x08B95AAC
_08021734: .4byte 0x0202BBB8
