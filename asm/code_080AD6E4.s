	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AD6E4
sub_080AD6E4: @ 0x080AD6E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r4, [r6]
	ldr r0, _080AD714 @ =0x08B857F8
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AD72C
	adds r0, r5, #0
	bl sub_080AD660
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD718
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080AD7A6
	.align 2, 0
_080AD714: .4byte 0x08B857F8
_080AD718:
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080AD728 @ =0x00000764
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartBonusClaimHelpBox
	b _080AD7A6
	.align 2, 0
_080AD728: .4byte 0x00000764
_080AD72C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AD758
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080AD750 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD7A6
	ldr r0, _080AD754 @ =0x0000038B
	bl m4aSongNumStart
	b _080AD7A6
	.align 2, 0
_080AD750: .4byte 0x0202BBF8
_080AD754: .4byte 0x0000038B
_080AD758:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AD764
	subs r4, #1
_080AD764:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AD76E
	adds r4, #1
_080AD76E:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080AD7A6
	cmp r4, #0
	blt _080AD7A6
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r4, r0
	bge _080AD7A6
	ldr r0, _080AD7AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD794
	ldr r0, _080AD7B0 @ =0x00000386
	bl m4aSongNumStart
_080AD794:
	strb r4, [r6]
	lsls r1, r4, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x58
	movs r2, #8
	bl ShowSysHandCursor
_080AD7A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AD7AC: .4byte 0x0202BBF8
_080AD7B0: .4byte 0x00000386
