	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08053460
sub_08053460: @ 0x08053460
	ldr r0, _080534C0 @ =0x03004830
	str r2, [r0]
	ldr r1, _080534C4 @ =0x02000000
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r7, [r0]
	adds r2, #1
	mov sb, r2
	cmp r7, #0
	bne _08053478
	bl _08053EEA
_08053478:
	movs r0, #0xf0
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r1, r0
	mov r8, r1
	cmp r1, #0
	bne _0805348A
	bl _08053EEA
_0805348A:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	bne _08053498
	bl sub_08053D22
_08053498:
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	bne _080534A2
	bl _08053D18
_080534A2:
	subs r1, r0, #1
	adds r2, r7, #0
	adds r2, #0x15
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x52
	bls _080534B6
	bl _08053D06
_080534B6:
	lsls r0, r1, #2
	ldr r1, _080534C8 @ =_080534CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080534C0: .4byte 0x03004830
_080534C4: .4byte 0x02000000
_080534C8: .4byte _080534CC
_080534CC: @ jump table
	.4byte _08053D06 @ case 0
	.4byte _08053618 @ case 1
	.4byte _0805366C @ case 2
	.4byte _08053680 @ case 3
	.4byte _080536A6 @ case 4
	.4byte _0805372C @ case 5
	.4byte _08053790 @ case 6
	.4byte _08053D06 @ case 7
	.4byte _080537C0 @ case 8
	.4byte _080537C0 @ case 9
	.4byte _080537C0 @ case 10
	.4byte _080537C0 @ case 11
	.4byte _080537C0 @ case 12
	.4byte _0805385A @ case 13
	.4byte _08053D06 @ case 14
	.4byte _08053D06 @ case 15
	.4byte _08053D06 @ case 16
	.4byte _08053D06 @ case 17
	.4byte _08053D06 @ case 18
	.4byte _08053A08 @ case 19
	.4byte _08053A38 @ case 20
	.4byte _08053A4C @ case 21
	.4byte _08053D06 @ case 22
	.4byte _08053D06 @ case 23
	.4byte _08053A60 @ case 24
	.4byte _08053C78 @ case 25
	.4byte _08053A9C @ case 26
	.4byte _08053C78 @ case 27
	.4byte _08053C78 @ case 28
	.4byte _08053C78 @ case 29
	.4byte _08053C78 @ case 30
	.4byte _08053C78 @ case 31
	.4byte _08053C78 @ case 32
	.4byte _08053C78 @ case 33
	.4byte _08053C78 @ case 34
	.4byte _08053C78 @ case 35
	.4byte _08053C78 @ case 36
	.4byte _08053C78 @ case 37
	.4byte _08053B1C @ case 38
	.4byte _08053B32 @ case 39
	.4byte _08053C78 @ case 40
	.4byte _08053C78 @ case 41
	.4byte _08053C78 @ case 42
	.4byte _08053C78 @ case 43
	.4byte _08053B48 @ case 44
	.4byte _08053B5C @ case 45
	.4byte _08053BA6 @ case 46
	.4byte _08053BBC @ case 47
	.4byte _08053BD2 @ case 48
	.4byte _08053BE8 @ case 49
	.4byte _08053BFE @ case 50
	.4byte _08053C78 @ case 51
	.4byte _08053C78 @ case 52
	.4byte _08053C78 @ case 53
	.4byte _08053C78 @ case 54
	.4byte _08053C78 @ case 55
	.4byte _08053C78 @ case 56
	.4byte _08053C12 @ case 57
	.4byte _08053C78 @ case 58
	.4byte _08053C78 @ case 59
	.4byte _08053C78 @ case 60
	.4byte _08053C36 @ case 61
	.4byte _08053C78 @ case 62
	.4byte _08053C78 @ case 63
	.4byte _08053C78 @ case 64
	.4byte _08053C78 @ case 65
	.4byte _08053C78 @ case 66
	.4byte _08053C78 @ case 67
	.4byte _08053C78 @ case 68
	.4byte _08053C78 @ case 69
	.4byte _08053C78 @ case 70
	.4byte _08053C68 @ case 71
	.4byte _08053C78 @ case 72
	.4byte _08053C78 @ case 73
	.4byte _08053C78 @ case 74
	.4byte _08053C78 @ case 75
	.4byte _08053C78 @ case 76
	.4byte _08053C78 @ case 77
	.4byte _08053C70 @ case 78
	.4byte _08053C78 @ case 79
	.4byte _08053D06 @ case 80
	.4byte _08053C86 @ case 81
	.4byte _08053CAA @ case 82
_08053618:
	ldr r0, _08053624 @ =0x02000024
	ldr r0, [r0]
	cmp r0, #1
	bne _08053628
	ldr r0, [r7, #0x24]
	b _08053D04
	.align 2, 0
_08053624: .4byte 0x02000024
_08053628:
	ldrh r1, [r7, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08053634
	b _08053D00
_08053634:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805363E
	b _08053D06
_0805363E:
	bl CheckEkrHitDone
	cmp r0, #1
	beq _08053648
	b _08053D06
_08053648:
	ldr r0, _08053668 @ =0x0000FFF2
	ldrh r2, [r7, #0x10]
	ands r0, r2
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	bl sub_08050808
	cmp r0, #0
	bne _08053660
	b _08053D06
_08053660:
	movs r0, #0
	bl sub_08050814
	b _08053D06
	.align 2, 0
_08053668: .4byte 0x0000FFF2
_0805366C:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08053678
	b _08053D06
_08053678:
	ldr r0, _0805367C @ =0x0000FFFE
	b _08053CFC
	.align 2, 0
_0805367C: .4byte 0x0000FFFE
_08053680:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080536A2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _080536A2
	adds r0, r7, #0
	bl NewEfxSpecalEffect
_080536A2:
	ldrh r1, [r7, #0x10]
	b _08053CEE
_080536A6:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080536BC
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_080536BC:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080536C8
	b _08053D06
_080536C8:
	ldr r1, _08053724 @ =0x0000FFDF
	ands r1, r2
	ldr r0, _08053728 @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r5, #9
	movs r6, #0
	orrs r1, r5
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r4, r8
	adds r0, r4, #0
	bl CheckRoundMiss
	ldr r2, [sp]
	cmp r0, #1
	beq _08053704
	b _08053D06
_08053704:
	cmp r2, #0
	bne _0805370A
	b _08053D06
_0805370A:
	ldrh r0, [r2, #0x10]
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISLayerId
	cmp r0, #0
	beq _0805371E
	b _08053D06
_0805371E:
	adds r0, r4, #0
	b _0805384A
	.align 2, 0
_08053724: .4byte 0x0000FFDF
_08053728: .4byte 0x0000FFBF
_0805372C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053742
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_08053742:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _0805374E
	b _08053D06
_0805374E:
	ldr r1, _08053788 @ =0x0000FFDF
	ands r1, r2
	ldr r0, _0805378C @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r0, #9
	orrs r1, r0
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805376E
	b _08053D06
_0805376E:
	adds r0, r7, #0
	bl StartSpellAnimation
	bl sub_08050808
	cmp r0, #0
	bne _0805377E
	b _08053D06
_0805377E:
	movs r0, #2
	bl sub_08050814
	b _08053D06
	.align 2, 0
_08053788: .4byte 0x0000FFDF
_0805378C: .4byte 0x0000FFBF
_08053790:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	cmp r2, #0
	bne _0805379E
	b _08053D06
_0805379E:
	str r2, [sp]
	bl GetAnimNextRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp]
	cmp r8, r0
	bne _080537B6
	b _08053D06
_080537B6:
	movs r0, #2
	ldrh r3, [r2, #0x10]
	orrs r0, r3
	strh r0, [r2, #0x10]
	b _08053D06
_080537C0:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _080537CC
	b _08053D06
_080537CC:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl CheckRoundMiss
	ldr r2, [sp]
	cmp r0, #0
	bne _0805382E
	adds r0, r2, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r0, #2
	beq _0805382E
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _08053824
	adds r0, r2, #0
	bl NewEfxChillEffect
	b _0805382C
_08053824:
	adds r0, r2, #0
	str r2, [sp]
	bl NewEfxPierceCritical
_0805382C:
	ldr r2, [sp]
_0805382E:
	cmp r2, #0
	bne _08053834
	b _08053D06
_08053834:
	movs r0, #9
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_0805384A:
	bl CheckRoundMiss
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	b _08053D06
_0805385A:
	adds r0, r7, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _0805389C @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r6, [r0]
	ldrb r0, [r7, #0x12]
	ldr r2, [sp]
	cmp r0, #9
	bls _08053890
	b _08053D06
_08053890:
	lsls r0, r0, #2
	ldr r1, _080538A0 @ =_080538A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805389C: .4byte 0x02000000
_080538A0: .4byte _080538A4
_080538A4: @ jump table
	.4byte _080538CC @ case 0
	.4byte _080538CC @ case 1
	.4byte _080538CC @ case 2
	.4byte _080538CC @ case 3
	.4byte _080539D0 @ case 4
	.4byte _080539D0 @ case 5
	.4byte _080539DE @ case 6
	.4byte _080539DE @ case 7
	.4byte _080539DE @ case 8
	.4byte _080538CC @ case 9
_080538CC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _080538D6
	b _080539D0
_080538D6:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	movs r1, #4
	ldr r2, [sp]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldr r1, _0805392C @ =0x081D8594
	ldr r0, _08053930 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _08053934 @ =0x081D856C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	ldr r2, [sp]
	cmp r0, #0
	bne _0805393C
	ldr r0, _08053938 @ =0x0200005C
	b _0805393E
	.align 2, 0
_0805392C: .4byte 0x081D8594
_08053930: .4byte 0x0203E02C
_08053934: .4byte 0x081D856C
_08053938: .4byte 0x0200005C
_0805393C:
	ldr r0, _080539BC @ =0x02000060
_0805393E:
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #9
	ldr r0, _080539C0 @ =0x0200F1C8
	adds r1, r1, r0
	adds r1, r4, r1
	ldr r0, [r1, #4]
	ldr r2, [sp]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r6, #0x30]
	ldr r0, _080539C4 @ =0x000057F0
	adds r4, r4, r0
	str r4, [r6, #0x3c]
	ldr r4, _080539C8 @ =0x0203E0B0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [sp]
	cmp r0, #0
	bne _080539F2
	ldr r4, _080539CC @ =0x0201FB10
	adds r0, r2, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r2, [sp]
	ldr r0, [r2, #0x28]
	cmp r1, r0
	beq _080539F2
	adds r0, r2, #0
	bl NewEkrChienCHR
	ldr r2, [sp]
	adds r0, r2, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [sp]
	ldr r1, [r2, #0x28]
	str r1, [r0]
	b _080539F2
	.align 2, 0
_080539BC: .4byte 0x02000060
_080539C0: .4byte 0x0200F1C8
_080539C4: .4byte 0x000057F0
_080539C8: .4byte 0x0203E0B0
_080539CC: .4byte 0x0201FB10
_080539D0:
	ldr r1, _08053A00 @ =0x081D8594
	ldr r0, _08053A04 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
_080539DE:
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
_080539F2:
	adds r0, r2, #0
	bl AnimScrAdvance
	adds r0, r6, #0
	bl AnimScrAdvance
	b _08053D18
	.align 2, 0
_08053A00: .4byte 0x081D8594
_08053A04: .4byte 0x0203E02C
_08053A08:
	ldrh r2, [r7, #0x10]
	movs r1, #0x20
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _08053A1C
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r7, #0x10]
	b _08053D06
_08053A1C:
	ldr r1, _08053A30 @ =0x02017758
	ldr r0, [r1]
	cmp r0, #1
	beq _08053A26
	b _08053D06
_08053A26:
	movs r0, #0
	str r0, [r1]
	ldr r0, _08053A34 @ =0x0000FFDF
	ands r0, r2
	b _08053CFE
	.align 2, 0
_08053A30: .4byte 0x02017758
_08053A34: .4byte 0x0000FFDF
_08053A38:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053A44
	b _08053D06
_08053A44:
	movs r0, #3
	bl NewEfxQuake
	b _08053D06
_08053A4C:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053A58
	b _08053D06
_08053A58:
	movs r0, #0
	bl NewEfxQuake
	b _08053D06
_08053A60:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08053A6C
	b _08053D06
_08053A6C:
	ldr r0, _08053A94 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	ldr r0, _08053A98 @ =0x0000F3FF
	ldrh r1, [r7, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #8]
	movs r0, #0x8c
	strh r0, [r7, #0xa]
	bl AnimSort
	b _08053D06
	.align 2, 0
_08053A94: .4byte 0x0000FFFE
_08053A98: .4byte 0x0000F3FF
_08053A9C:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053AA8
	b _08053D06
_08053AA8:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	cmp r2, #0
	beq _08053ADA
	movs r0, #9
	ldrh r3, [r2, #0x10]
	orrs r0, r3
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl CheckRoundMiss
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r2, [sp]
_08053ADA:
	adds r0, r2, #0
	str r2, [sp]
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08053AEC
	b _08053D06
_08053AEC:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _08053B14
	adds r0, r2, #0
	bl NewEfxChillEffect
	b _08053D06
_08053B14:
	adds r0, r7, #0
	bl NewEfxNormalEffect
	b _08053D06
_08053B1C:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053B28
	b _08053D06
_08053B28:
	adds r0, r7, #0
	movs r1, #0
	bl NewEfxYushaSpinShield
	b _08053D06
_08053B32:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053B3E
	b _08053D06
_08053B3E:
	adds r0, r7, #0
	movs r1, #1
	bl NewEfxYushaSpinShield
	b _08053D06
_08053B48:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053B54
	b _08053D06
_08053B54:
	adds r0, r7, #0
	bl NewEfxHurtmutEff00
	b _08053D06
_08053B5C:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08053B7C
	b _08053D00
_08053B7C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08053B8A
	b _08053CEE
_08053B8A:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053B9C
	b _08053D06
_08053B9C:
	adds r0, r7, #0
	movs r1, #0
	bl NewEfxChillAnime
	b _08053D06
_08053BA6:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053BB2
	b _08053D06
_08053BB2:
	adds r0, r7, #0
	movs r1, #0
	bl NewEfxMagfcast
	b _08053D06
_08053BBC:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053BC8
	b _08053D06
_08053BC8:
	adds r0, r7, #0
	movs r1, #1
	bl NewEfxMagfcast
	b _08053D06
_08053BD2:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053BDE
	b _08053D06
_08053BDE:
	adds r0, r7, #0
	movs r1, #0
	bl NewEfxSunakemuri
	b _08053D06
_08053BE8:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08053BF4
	b _08053D06
_08053BF4:
	adds r0, r7, #0
	movs r1, #1
	bl NewEfxSunakemuri
	b _08053D06
_08053BFE:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	movs r1, #2
	bl NewEfxSunakemuri
	b _08053D06
_08053C12:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053CEE
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	bl NewEfxKingPika
	b _08053D06
_08053C36:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08053C44
	b _080536A2
_08053C44:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08053C5A
	movs r0, #1
	bl sub_08050814
_08053C5A:
	adds r0, r7, #0
	bl NewEfxDrsmmoya
	adds r0, r7, #0
	bl NewEfxspdquake
	b _080536A2
_08053C68:
	adds r0, r7, #0
	bl NewEfxMantBatabata
	b _08053D06
_08053C70:
	adds r0, r7, #0
	bl NewEfxLokmsuna
	b _08053D06
_08053C78:
	subs r0, r3, #1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl EfxPlaySEwithCmdCtrl
	b _08053D06
_08053C86:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053CEE
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	bl NewEfxFlashFX
	b _08053D06
_08053CAA:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08053D00
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053CEE
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	movs r1, #1
	bl NewEfxChillAnime
	b _08053D06
_08053CEE:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08053D06
	ldr r0, _08053D10 @ =0x0000FFDF
	ands r0, r1
	ldr r1, _08053D14 @ =0x0000FFBF
_08053CFC:
	ands r0, r1
_08053CFE:
	strh r0, [r7, #0x10]
_08053D00:
	ldr r0, [r7, #0x20]
	adds r0, #4
_08053D04:
	str r0, [r7, #0x20]
_08053D06:
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	bl _08053498
	.align 2, 0
_08053D10: .4byte 0x0000FFDF
_08053D14: .4byte 0x0000FFBF
_08053D18:
	movs r0, #0xe7
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r0, r1
	strh r0, [r7, #0xc]

	non_word_aligned_thumb_func_start sub_08053D22
sub_08053D22: @ 0x08053D22
	movs r0, #0x80
	lsls r0, r0, #6
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08053D88
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08053D7E
	ldr r4, _08053DD8 @ =0x0203E0B0
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _08053D7E
	movs r0, #0x80
	lsls r0, r0, #7
	ldrh r3, [r7, #0x10]
	ands r0, r3
	cmp r0, #0
	bne _08053D7E
	ldr r4, _08053DDC @ =0x0201FB10
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq _08053D7E
	adds r0, r7, #0
	bl RegisterAISSheetGraphics
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r7, #0x28]
	str r1, [r0]
_08053D7E:
	movs r0, #0xd7
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r0, r1
	strh r0, [r7, #0xc]
_08053D88:
	movs r0, #0x80
	lsls r0, r0, #7
	mov r2, r8
	ands r2, r0
	cmp r2, #0
	bne _08053D9E
	ldr r0, _08053DE0 @ =0x02000024
	ldr r0, [r0]
	cmp r0, #1
	beq _08053D9E
	b _08053EEA
_08053D9E:
	ldrh r1, [r7, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08053E24
	adds r0, r7, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _08053DEC
	ldr r6, _08053DE4 @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r4, _08053DE8 @ =0x0000FFFD
	b _08053E5C
	.align 2, 0
_08053DD8: .4byte 0x0203E0B0
_08053DDC: .4byte 0x0201FB10
_08053DE0: .4byte 0x02000024
_08053DE4: .4byte 0x02000000
_08053DE8: .4byte 0x0000FFFD
_08053DEC:
	ldr r5, _08053E1C @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [r0]
	ldr r4, _08053E20 @ =0x0000FFFD
	adds r0, r4, #0
	ldrh r1, [r2, #0x10]
	ands r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r6, [r0]
	ldrh r2, [r6, #0x10]
	ands r4, r2
	strh r4, [r6, #0x10]
	b _08053EEA
	.align 2, 0
_08053E1C: .4byte 0x02000000
_08053E20: .4byte 0x0000FFFD
_08053E24:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08053EB0
	adds r0, r7, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _08053EEA
	ldr r6, _08053EA8 @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r4, _08053EAC @ =0x00007FFF
_08053E5C:
	adds r0, r4, #0
	ldr r2, [sp]
	ldrh r3, [r2, #0x10]
	ands r0, r3
	movs r5, #4
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r6, [r0]
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldrh r0, [r6, #0x10]
	ands r4, r0
	orrs r4, r5
	strh r4, [r6, #0x10]
	ldr r2, [sp]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	bl AnimScrAdvance
	adds r0, r6, #0
	bl AnimScrAdvance
	b _08053EEA
	.align 2, 0
_08053EA8: .4byte 0x02000000
_08053EAC: .4byte 0x00007FFF
_08053EB0:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08053EEA
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r2, [r7, #0xe]
	lsls r0, r2, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _08053EEA
	adds r0, r7, #0
	bl GetAnimPosition
	ldr r1, _08053F04 @ =0x0201FAF8
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_08053EEA:
	mov r2, sb
	cmp r2, #3
	bhi _08053EF4
	bl sub_08053460
_08053EF4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053F04: .4byte 0x0201FAF8
