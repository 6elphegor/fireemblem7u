	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteNewGameSave
WriteNewGameSave: @ 0x080A06C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x38
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	bl GetSaveWriteAddr
	adds r7, r0, #0
	cmp r5, #0
	bne _080A06E0
	ldr r0, _080A07F4 @ =0x0202BBF8
	ldrb r5, [r0, #0x1b]
_080A06E0:
	movs r0, #0
	bl SetGameTime
	adds r0, r4, #0
	bl InitPlayConfig
	bl InitUnits
	bl ClearSupplyItems
	bl ResetPermanentFlags
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r4, _080A07F4 @ =0x0202BBF8
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _080A07F8 @ =0xFFFFE00F
	ldrh r1, [r4, #0x2c]
	ands r0, r1
	strh r0, [r4, #0x2c]
	add r0, sp, #0x34
	movs r6, #0
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x30
	ldr r2, _080A07FC @ =0x01000008
	bl CpuSet
	ldr r0, [r4, #0x2c]
	ldr r1, _080A0800 @ =0xFF801FFF
	ands r0, r1
	str r0, [r4, #0x2c]
	strb r5, [r4, #0x1b]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x20
	strb r6, [r0]
	cmp r5, #1
	bne _080A0748
	strb r6, [r4, #0xe]
_080A0748:
	cmp r5, #2
	bne _080A0750
	movs r0, #0xc
	strb r0, [r4, #0xe]
_080A0750:
	cmp r5, #3
	bne _080A0758
	movs r0, #0xd
	strb r0, [r4, #0xe]
_080A0758:
	bl GetNewPlaythroughId
	strb r0, [r4, #0x18]
	mov r0, r8
	strb r0, [r4, #0xc]
	bl GetGlobalCompletionCount
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _080A0804 @ =0xFFFFF07F
	ldrh r2, [r4, #0x2e]
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, #0x2e]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	movs r0, #0
	bl SetBonusContentClaimFlags
	adds r0, r7, #0
	bl WriteBonusContentClaimFlags
	mov r0, sp
	adds r0, #0x36
	movs r1, #0
	strh r1, [r0]
	add r4, sp, #0x10
	ldr r2, _080A0808 @ =0x01000012
	adds r1, r4, #0
	bl CpuSet
	adds r6, r4, #0
	adds r4, r7, #0
	adds r4, #0x48
	movs r5, #0x33
_080A07A6:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A07A6
	movs r4, #0
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl WriteSupplyItems
	adds r0, r7, #0
	bl ClearPidChStatsSaveData
	movs r2, #0xd8
	lsls r2, r2, #4
	adds r0, r7, r2
	bl WritePermanentFlags
	ldr r0, _080A080C @ =0x00011217
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, r8
	bl WriteSaveBlockInfo
	mov r0, r8
	bl WriteLastGameSaveId
	add sp, #0x38
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A07F4: .4byte 0x0202BBF8
_080A07F8: .4byte 0xFFFFE00F
_080A07FC: .4byte 0x01000008
_080A0800: .4byte 0xFF801FFF
_080A0804: .4byte 0xFFFFF07F
_080A0808: .4byte 0x01000012
_080A080C: .4byte 0x00011217
