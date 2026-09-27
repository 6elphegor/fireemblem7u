	.include "macro.inc"

	.syntax unified

	thumb_func_start StartEventInternal
StartEventInternal: @ 0x0800AF74
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r6, _0800AF9C @ =0x08B90D88
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0800AFA8
	ldr r2, _0800AFA0 @ =0x03004170
	ldr r1, _0800AFA4 @ =0x03004160
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r2
	str r7, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0800B0E8
	.align 2, 0
_0800AF9C: .4byte 0x08B90D88
_0800AFA0: .4byte 0x03004170
_0800AFA4: .4byte 0x03004160
_0800AFA8:
	ldr r0, _0800AFC0 @ =0x03004160
	strb r4, [r0]
	ldr r0, _0800AFC4 @ =0x03004170
	str r4, [r0]
	cmp r5, #7
	bgt _0800AFC8
	adds r0, r6, #0
	adds r1, r5, #0
	bl Proc_Start
	b _0800AFD0
	.align 2, 0
_0800AFC0: .4byte 0x03004160
_0800AFC4: .4byte 0x03004170
_0800AFC8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0800AFD0:
	adds r4, r0, #0
	str r7, [r4, #0x2c]
	str r7, [r4, #0x30]
	movs r1, #0
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x3c]
	str r1, [r4, #0x48]
	adds r3, r4, #0
	adds r3, #0x5e
	movs r2, #0
	movs r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x50
	strh r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4c
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x68
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _0800B034 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0xc0
	bne _0800B038
	adds r0, r2, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800B038
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	b _0800B03E
	.align 2, 0
_0800B034: .4byte 0x03002870
_0800B038:
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #0
_0800B03E:
	strb r0, [r1]
	ldr r0, _0800B060 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0]
	subs r0, #0x86
	cmp r0, #7
	bhi _0800B0E8
	lsls r0, r0, #2
	ldr r1, _0800B064 @ =_0800B068
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B060: .4byte 0x0202E3F4
_0800B064: .4byte _0800B068
_0800B068: @ jump table
	.4byte _0800B096 @ case 0
	.4byte _0800B0A4 @ case 1
	.4byte _0800B0B2 @ case 2
	.4byte _0800B0E8 @ case 3
	.4byte _0800B088 @ case 4
	.4byte _0800B0C0 @ case 5
	.4byte _0800B0CE @ case 6
	.4byte _0800B0DC @ case 7
_0800B088:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_SilentSkip
	b _0800B0E8
_0800B096:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkip
	b _0800B0E8
_0800B0A4:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipTalk
	b _0800B0E8
_0800B0B2:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipTalkSlow
	b _0800B0E8
_0800B0C0:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipUnlessNewGamePlus
	b _0800B0E8
_0800B0CE:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipTalkSlowUnlessNewGamePlus
	b _0800B0E8
_0800B0DC:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipSlowUnlessNewGamePlus
_0800B0E8:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
