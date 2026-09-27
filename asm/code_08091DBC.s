	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091DBC
sub_08091DBC: @ 0x08091DBC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _08091DCE
	b _08091EEA
_08091DCE:
	ldr r0, _08091DE8 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08091DEC
	adds r0, r6, #0
	bl Proc_Break
	b _08091EF0
	.align 2, 0
_08091DE8: .4byte 0x08B857F8
_08091DEC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08091E7C
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2a
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08091E22
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _08091E22
	ldrb r0, [r4]
	adds r0, #1
	b _08091E26
_08091E22:
	ldrb r0, [r4]
	subs r0, #1
_08091E26:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _08091E74 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091EF0
	ldr r0, _08091E78 @ =0x0000038A
	bl m4aSongNumStart
	b _08091EF0
	.align 2, 0
_08091E74: .4byte 0x0202BBF8
_08091E78: .4byte 0x0000038A
_08091E7C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08091EA8
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	ldr r0, _08091EA0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091EF0
	ldr r0, _08091EA4 @ =0x0000038B
	bl m4aSongNumStart
	b _08091EF0
	.align 2, 0
_08091EA0: .4byte 0x0202BBF8
_08091EA4: .4byte 0x0000038B
_08091EA8:
	adds r0, r6, #0
	bl sub_08091AD8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091EEA
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08091EF8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r4, _08091EFC @ =0x02012A20
	ldr r5, _08091F00 @ =0x02022EA4
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
_08091EEA:
	adds r0, r6, #0
	bl sub_08091C48
_08091EF0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091EF8: .4byte 0x00000503
_08091EFC: .4byte 0x02012A20
_08091F00: .4byte 0x02022EA4
