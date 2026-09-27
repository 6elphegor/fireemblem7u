	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096668
sub_08096668: @ 0x08096668
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809667A
	b _080967D4
_0809667A:
	ldr r1, _08096698 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _0809668E
	b _08096784
_0809668E:
	cmp r6, #0
	beq _0809669C
	cmp r6, #1
	beq _08096708
	b _08096888
	.align 2, 0
_08096698: .4byte 0x08B857F8
_0809669C:
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _08096768
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _08096768
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _080966F8 @ =sub_08096110
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _080966FC @ =sub_08096160
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl sub_08095C28
	ldr r0, _08096700 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080966EE
	ldr r0, _08096704 @ =0x0000038A
	bl m4aSongNumStart
_080966EE:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08096888
	.align 2, 0
_080966F8: .4byte sub_08096110
_080966FC: .4byte sub_08096160
_08096700: .4byte 0x0202BBF8
_08096704: .4byte 0x0000038A
_08096708:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08096768
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _08096758 @ =sub_08096110
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809675C @ =sub_08096198
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl sub_08095C28
	ldr r0, _08096760 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809674E
	ldr r0, _08096764 @ =0x0000038A
	bl m4aSongNumStart
_0809674E:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08096888
	.align 2, 0
_08096758: .4byte sub_08096110
_0809675C: .4byte sub_08096198
_08096760: .4byte 0x0202BBF8
_08096764: .4byte 0x0000038A
_08096768:
	ldr r0, _08096780 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096776
	b _08096888
_08096776:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08096888
	.align 2, 0
_08096780: .4byte 0x0202BBF8
_08096784:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080967B0
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _080967A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096888
	ldr r0, _080967AC @ =0x0000038B
	bl m4aSongNumStart
	b _08096888
	.align 2, 0
_080967A8: .4byte 0x0202BBF8
_080967AC: .4byte 0x0000038B
_080967B0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080967F4
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _080967D0 @ =0x08CC4B8C
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _08096888
	.align 2, 0
_080967D0: .4byte 0x08CC4B8C
_080967D4:
	ldr r2, _080967F0 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080967F4
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _08096888
	.align 2, 0
_080967F0: .4byte 0x08B857F8
_080967F4:
	ldr r3, [r2]
	movs r1, #0x40
	adds r0, r1, #0
	ldrh r4, [r3, #6]
	ands r0, r4
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _0809681E
	ldrb r0, [r4]
	cmp r0, #0
	beq _08096810
	subs r0, #1
	b _0809681C
_08096810:
	adds r0, r1, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _0809681E
	movs r0, #1
_0809681C:
	strb r0, [r4]
_0809681E:
	ldr r1, [r2]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _08096844
	ldrb r0, [r4]
	cmp r0, #0
	bne _08096836
	adds r0, #1
	b _08096842
_08096836:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096844
	movs r0, #0
_08096842:
	strb r0, [r4]
_08096844:
	ldrb r0, [r4]
	cmp r6, r0
	beq _08096888
	ldr r0, _08096890 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809685C
	ldr r0, _08096894 @ =0x00000386
	bl m4aSongNumStart
_0809685C:
	ldrb r3, [r4]
	lsls r1, r3, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _08096888
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _08096898 @ =0x08CC4B8C
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_08096888:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096890: .4byte 0x0202BBF8
_08096894: .4byte 0x00000386
_08096898: .4byte 0x08CC4B8C
