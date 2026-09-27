	.include "macro.inc"

	.syntax unified

	thumb_func_start StealMapSelect_Select
StealMapSelect_Select: @ 0x08023044
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080230D4 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r6, #0xd]
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080230D8 @ =0x08B95920
	bl StartMenu
	adds r0, r4, #0
	bl EndTargetSelection
	ldr r0, _080230DC @ =0x020234E4
	ldr r1, _080230E0 @ =0x081960D4
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	movs r4, #0x38
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	ldr r5, _080230E4 @ =0x02022D26
	movs r1, #7
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl PutFace80x72_Core
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080230D4: .4byte 0x0203A85C
_080230D8: .4byte 0x08B95920
_080230DC: .4byte 0x020234E4
_080230E0: .4byte 0x081960D4
_080230E4: .4byte 0x02022D26
