	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_CtrlLoop
AtMenu_CtrlLoop: @ 0x0808EA80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _0808EAD4 @ =0x0840F384
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x2c
	mov sl, r1
	lsls r0, r0, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r2, [r4]
	mov r8, r2
	cmp r2, #0
	beq _0808EADC
	ldr r0, _0808EAD8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EBB4
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808EC76
	.align 2, 0
_0808EAD4: .4byte 0x0840F384
_0808EAD8: .4byte 0x08B857F8
_0808EADC:
	ldr r0, _0808EB30 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808EB3C
	ldr r0, _0808EB34 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808EAFC
	ldr r0, _0808EB38 @ =0x0000038A
	bl m4aSongNumStart
_0808EAFC:
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	cmp r0, #3
	bne _0808EB1E
	movs r2, #0x80
	lsls r2, r2, #1
	mov r3, r8
	str r3, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
_0808EB1E:
	adds r1, r6, #0
	adds r1, #0x33
	movs r0, #4
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #8
	bl Proc_Goto
	b _0808EC76
	.align 2, 0
_0808EB30: .4byte 0x08B857F8
_0808EB34: .4byte 0x0202BBF8
_0808EB38: .4byte 0x0000038A
_0808EB3C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808EB68
	movs r0, #1
	strb r0, [r4]
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	movs r0, #0x2c
	adds r1, r7, #0
	bl StartHelpBox
	b _0808EC76
_0808EB68:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808EBB4
	adds r0, r6, #0
	bl CleanupPrepMenuScreen
	ldr r0, _0808EBA4 @ =0x02023578
	ldr r1, _0808EBA8 @ =0x084050D8
	movs r2, #0xcf
	lsls r2, r2, #6
	bl sub_080AACD8
	movs r0, #1
	movs r1, #4
	bl DrawPrepScreenMenuFrameAt
	ldr r0, _0808EBAC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808EB9C
	ldr r0, _0808EBB0 @ =0x0000038B
	bl m4aSongNumStart
_0808EB9C:
	adds r0, r6, #0
	bl Proc_Break
	b _0808EC76
	.align 2, 0
_0808EBA4: .4byte 0x02023578
_0808EBA8: .4byte 0x084050D8
_0808EBAC: .4byte 0x0202BBF8
_0808EBB0: .4byte 0x0000038B
_0808EBB4:
	ldr r0, _0808EC10 @ =0x08B857F8
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r4, [r1, #6]
	ands r0, r4
	adds r5, r6, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _0808EBE6
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808EBE2
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EBE6
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
_0808EBE2:
	subs r0, #1
	strb r0, [r5]
_0808EBE6:
	ldr r7, _0808EC10 @ =0x08B857F8
	ldr r1, [r7]
	movs r0, #0x80
	mov r8, r0
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808EC24
	ldrb r4, [r5]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
	subs r0, #1
	cmp r4, r0
	bge _0808EC14
	ldrb r0, [r5]
	adds r0, #1
	b _0808EC22
	.align 2, 0
_0808EC10: .4byte 0x08B857F8
_0808EC14:
	ldr r1, [r7]
	mov r0, r8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EC24
	movs r0, #0
_0808EC22:
	strb r0, [r5]
_0808EC24:
	ldrb r2, [r5]
	cmp sb, r2
	beq _0808EC76
	lsls r0, r2, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808EC56
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r2, #0
	bl PrepOptionCountToRealIndexByMask
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	mov r0, sl
	adds r1, r7, #0
	bl StartHelpBox
_0808EC56:
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, sl
	adds r1, r7, #0
	movs r2, #7
	bl ShowSysHandCursor
	ldr r0, _0808EC88 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808EC76
	ldr r0, _0808EC8C @ =0x00000386
	bl m4aSongNumStart
_0808EC76:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC88: .4byte 0x0202BBF8
_0808EC8C: .4byte 0x00000386
