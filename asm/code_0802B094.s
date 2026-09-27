	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_InitItemDisplay
TradeMenu_InitItemDisplay: @ 0x0802B094
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r4, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	bl ResetTextFont
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl TradeMenu_InitItemText
	adds r0, r5, #0
	bl TradeMenu_RefreshItemText
	ldr r0, [r5, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	subs r4, #4
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartFace
	ldr r0, [r5, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb0
	adds r3, r4, #0
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #1
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
