	.include "macro.inc"

	.syntax unified

	thumb_func_start PutTalkBubble
PutTalkBubble: @ 0x08009850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sl, r1
	adds r4, r2, #0
	str r3, [sp, #4]
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r0, _080098A0 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r7, #1
	cmp r5, #0xf
	bgt _0800987A
	movs r7, #0
_0800987A:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009886
	adds r7, #2
_08009886:
	mov r1, sl
	ldr r2, [sp, #4]
	subs r0, r1, r2
	adds r0, #1
	mov sb, r0
	cmp r7, #1
	beq _080098C2
	cmp r7, #1
	bgt _080098A4
	cmp r7, #0
	beq _080098AE
	b _08009906
	.align 2, 0
_080098A0: .4byte 0x02023460
_080098A4:
	cmp r7, #2
	beq _080098E6
	cmp r7, #3
	beq _080098F8
	b _08009906
_080098AE:
	adds r5, #3
	mov r8, r5
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r6, r5, r0
	cmp r6, #0
	bgt _08009906
	movs r6, #1
	b _08009906
_080098C2:
	subs r5, #5
	mov r8, r5
	adds r0, r4, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, r8
	cmp r0, #0x1d
	ble _080098DA
	movs r0, #0x1d
	subs r6, r0, r4
	b _08009906
_080098DA:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r1, r8
	subs r6, r1, r0
	b _08009906
_080098E6:
	movs r6, #9
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	movs r0, #8
	mov r8, r0
	movs r1, #0x10
	mov sl, r1
	b _08009906
_080098F8:
	movs r6, #1
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	mov r8, r4
	movs r0, #0x10
	mov sl, r0
_08009906:
	ldr r5, _08009988 @ =0x08B909B8
	ldr r1, [r5]
	adds r0, r6, #1
	strb r0, [r1, #0xc]
	ldr r1, [r5]
	mov r0, sb
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r1, [sp, #4]
	str r1, [sp]
	movs r0, #1
	adds r1, r6, #0
	mov r2, sb
	adds r3, r4, #0
	bl PutTalkBubbleTm
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08009948
	movs r0, #1
	ands r0, r1
	bl TalkToggleInvertedPalette
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #2
	ldrb r2, [r1]
	eors r0, r2
	strb r0, [r1]
_08009948:
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08009962
	movs r0, #1
	mov r1, r8
	mov r2, sl
	adds r3, r7, #0
	bl PutTalkBubbleTail
_08009962:
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl sub_08009A10
	bl StartOpenTalkBubble
	movs r0, #2
	bl TalkBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009988: .4byte 0x08B909B8
