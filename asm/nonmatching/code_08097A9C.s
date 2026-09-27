	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097A9C
sub_08097A9C: @ 0x08097A9C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r4, #0
	bl sub_08097CAC
	ldr r0, _08097B3C @ =0x02012BA0
	ldr r1, _08097B40 @ =0x02023C7E
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_08095CA8
	ldr r0, _08097B44 @ =0x02022EA4
	ldr r1, [r4, #0x2c]
	bl DrawPrepScreenItemIcons
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, _08097B48 @ =PrepItemList_DrawCurrentOwnerText
	movs r1, #2
	adds r2, r4, #0
	bl StartParallelFiniteLoop
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08097B5C
	ldr r0, _08097B4C @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _08097B54
	ldr r2, _08097B50 @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _08097B5A
	.align 2, 0
_08097B3C: .4byte 0x02012BA0
_08097B40: .4byte 0x02023C7E
_08097B44: .4byte 0x02022EA4
_08097B48: .4byte PrepItemList_DrawCurrentOwnerText
_08097B4C: .4byte 0x02012466
_08097B50: .4byte 0x020117E4
_08097B54:
	bl CloseHelpBox
	movs r0, #0xff
_08097B5A:
	strh r0, [r4, #0x36]
_08097B5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
