	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateGameRankSaveData
GenerateGameRankSaveData: @ 0x0809F388
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	add r0, sp, #4
	movs r1, #0
	mov r8, r1
	mov r2, sb
	strh r2, [r0]
	ldr r2, _0809F494 @ =0x0100000C
	adds r1, r7, #0
	bl CpuSet
	movs r6, #1
	ldrb r0, [r7]
	orrs r0, r6
	strb r0, [r7]
	movs r0, #3
	ands r4, r0
	lsls r4, r4, #3
	movs r0, #0x19
	rsbs r0, r0, #0
	ldrb r3, [r7, #2]
	ands r0, r3
	orrs r0, r4
	ands r5, r6
	lsls r5, r5, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r7, #2]
	bl GetPartyTotalGoldValue
	movs r2, #7
	ands r2, r0
	lsls r2, r2, #5
	movs r1, #0x1f
	ldrb r3, [r7, #7]
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #7]
	lsls r0, r0, #8
	lsrs r0, r0, #0xb
	ldr r1, [r7, #8]
	ldr r2, _0809F498 @ =0xFFE00000
	ands r1, r2
	orrs r1, r0
	str r1, [r7, #8]
	ldr r2, _0809F49C @ =0x0202BBF8
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ands r0, r6
	lsls r0, r0, #6
	movs r1, #0x41
	rsbs r1, r1, #0
	ldrb r3, [r7, #2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #2]
	ldrh r2, [r2, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #7
	ldr r0, _0809F4A0 @ =0xFFFF807F
	ldrh r2, [r7, #2]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #2]
	bl sub_0809FCB0
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	mov r6, sp
	adds r6, #0xa
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl FormatTime
	ldr r1, _0809F4A4 @ =0x000003FF
	ldrh r4, [r4]
	ands r1, r4
	lsls r1, r1, #7
	ldr r0, [r7, #4]
	ldr r2, _0809F4A8 @ =0xFFFE007F
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #4]
	movs r1, #0x3f
	ldrh r5, [r5]
	ands r1, r5
	lsls r1, r1, #1
	movs r0, #0x7f
	rsbs r0, r0, #0
	ldrb r3, [r7, #6]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #6]
	movs r1, #0x3f
	ldrh r6, [r6]
	ands r1, r6
	lsls r1, r1, #7
	ldr r0, _0809F4AC @ =0xFFFFE07F
	ldrh r2, [r7, #6]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #6]
	movs r0, #0x7f
	ldrb r3, [r7, #3]
	ands r0, r3
	strb r0, [r7, #3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r7, #4]
	ands r0, r1
	strb r0, [r7, #4]
	mov r2, r8
	strb r2, [r7, #0x17]
	movs r4, #1
	b _0809F4B8
	.align 2, 0
_0809F494: .4byte 0x0100000C
_0809F498: .4byte 0xFFE00000
_0809F49C: .4byte 0x0202BBF8
_0809F4A0: .4byte 0xFFFF807F
_0809F4A4: .4byte 0x000003FF
_0809F4A8: .4byte 0xFFFE007F
_0809F4AC: .4byte 0xFFFFE07F
_0809F4B0:
	ldrb r0, [r2, #4]
	strb r0, [r7, #0x17]
	b _0809F4E0
_0809F4B6:
	adds r4, #1
_0809F4B8:
	cmp r4, #0x3f
	bgt _0809F4E0
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809F4B6
	ldr r2, [r0]
	cmp r2, #0
	beq _0809F4B6
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0809F4B6
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809F4B0
_0809F4E0:
	movs r5, #1
	movs r3, #0xc
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0x7f
	mov r8, r0
	movs r6, #0x7f
_0809F4EE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0809F548
	ldr r2, [r4]
	cmp r2, #0
	beq _0809F548
	ldr r0, [r4, #0xc]
	ldr r1, _0809F60C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809F548
	ldrb r0, [r2, #4]
	bl PidStatsGetFavval
	cmp r0, sb
	ble _0809F548
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl PidStatsGetFavval
	mov sb, r0
	ldr r0, [r4]
	ldrb r2, [r0, #4]
	movs r1, #1
	ands r1, r2
	lsls r1, r1, #7
	adds r0, r6, #0
	ldrb r3, [r7, #3]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	lsrs r2, r2, #1
	ands r2, r6
	mov r0, r8
	ands r2, r0
	movs r1, #0x80
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r7, #4]
_0809F548:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809F4EE
	bl GetGameTacticsRank
	movs r5, #7
	ands r0, r5
	lsls r0, r0, #4
	movs r1, #0x71
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl GetGameFundsRank
	ands r0, r5
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl GetGameSurvivalRank
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _0809F610 @ =0xFFFFFC7F
	ldrh r2, [r7]
	ands r1, r2
	orrs r1, r0
	strh r1, [r7]
	bl GetGameExpRank
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl GetGameCombatRank
	ands r0, r5
	movs r4, #8
	rsbs r4, r4, #0
	ldrb r1, [r7, #2]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7, #2]
	ldrb r2, [r7]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	ldrh r3, [r7]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x1d
	ldrb r3, [r7, #1]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1d
	lsrs r3, r3, #5
	lsls r4, r4, #0x1d
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl GetOverallRank
	ands r0, r5
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl sub_0809FB70
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _0809F614 @ =0xFFFFF81F
	ldrh r3, [r7, #0xa]
	ands r1, r3
	orrs r1, r0
	strh r1, [r7, #0xa]
	bl GetTacticianName
	adds r1, r0, #0
	mov r0, sl
	bl strcpy
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F60C: .4byte 0x00010004
_0809F610: .4byte 0xFFFFFC7F
_0809F614: .4byte 0xFFFFF81F

	thumb_func_start SaveEndgameRankings
SaveEndgameRankings: @ 0x0809F618
	push {r4, r5, r6, lr}
	sub sp, #0x30
	bl GetNextChapterMode
	adds r6, r0, #0
	ldr r0, _0809F664 @ =0x0202BBF8
	ldrb r0, [r0, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	add r5, sp, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl GenerateGameRankSaveData
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0809F224
	mov r0, sp
	adds r1, r5, #0
	bl JudgeGameRankSaveData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F65A
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl SaveNewRankData
_0809F65A:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F664: .4byte 0x0202BBF8

	thumb_func_start sub_0809F668
sub_0809F668: @ 0x0809F668
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F688 @ =0x01000012
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl WriteSoundRoomSaveData
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
_0809F688: .4byte 0x01000012

	thumb_func_start LoadAndVerifySoundRoomData
LoadAndVerifySoundRoomData: @ 0x0809F68C
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F6D8
	cmp r4, #0
	bne _0809F6A2
	mov r4, sp
_0809F6A2:
	ldr r1, _0809F6CC @ =0x03005E70
	ldr r0, _0809F6D0 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F6D4 @ =0x000070FC
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x20
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x20]
	cmp r4, r0
	bne _0809F6D8
	movs r0, #1
	b _0809F6DA
	.align 2, 0
_0809F6CC: .4byte 0x03005E70
_0809F6D0: .4byte 0x08CE3B58
_0809F6D4: .4byte 0x000070FC
_0809F6D8:
	movs r0, #0
_0809F6DA:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteSoundRoomSaveData
WriteSoundRoomSaveData: @ 0x0809F6E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	bl Checksum16
	strh r0, [r4, #0x20]
	ldr r0, _0809F708 @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F70C @ =0x000070FC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F708: .4byte 0x08CE3B58
_0809F70C: .4byte 0x000070FC

	thumb_func_start IsSoundRoomSongUnlocked
IsSoundRoomSongUnlocked: @ 0x0809F710
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F724
	mov r4, sp
	mov r0, sp
	bl LoadAndVerifySoundRoomData
_0809F724:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809F73E
	movs r0, #0
	b _0809F740
_0809F73E:
	movs r0, #1
_0809F740:
	add sp, #0x24
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start UnlockSoundRoomSong
UnlockSoundRoomSong: @ 0x0809F748
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F762
	mov r4, sp
	mov r0, sp
	bl LoadAndVerifySoundRoomData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F784
_0809F762:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0809F784
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl WriteSoundRoomSaveData
_0809F784:
	add sp, #0x24
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EraseLinkArenaStruct2
EraseLinkArenaStruct2: @ 0x0809F78C
	push {lr}
	sub sp, #0x18
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F7AC @ =0x0100000A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl WriteLinkArenaStruct2
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0809F7AC: .4byte 0x0100000A

	thumb_func_start LoadAndVerfyLinkArenaStruct2
LoadAndVerfyLinkArenaStruct2: @ 0x0809F7B0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F7FC
	cmp r4, #0
	bne _0809F7C6
	mov r4, sp
_0809F7C6:
	ldr r1, _0809F7F0 @ =0x03005E70
	ldr r0, _0809F7F4 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F7F8 @ =0x00007120
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x10
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x10]
	cmp r4, r0
	bne _0809F7FC
	movs r0, #1
	b _0809F7FE
	.align 2, 0
_0809F7F0: .4byte 0x03005E70
_0809F7F4: .4byte 0x08CE3B58
_0809F7F8: .4byte 0x00007120
_0809F7FC:
	movs r0, #0
_0809F7FE:
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteLinkArenaStruct2
WriteLinkArenaStruct2: @ 0x0809F808
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl Checksum16
	strh r0, [r4, #0x10]
	ldr r0, _0809F82C @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F830 @ =0x00007120
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F82C: .4byte 0x08CE3B58
_0809F830: .4byte 0x00007120

	thumb_func_start ModifySaveLinkArenaStruct2A
ModifySaveLinkArenaStruct2A: @ 0x0809F834
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F848
	mov r4, sp
	mov r0, sp
	bl LoadAndVerfyLinkArenaStruct2
_0809F848:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809F862
	movs r0, #0
	b _0809F864
_0809F862:
	movs r0, #1
_0809F864:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start ModifySaveLinkArenaStruct2B
ModifySaveLinkArenaStruct2B: @ 0x0809F86C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F886
	mov r4, sp
	mov r0, sp
	bl LoadAndVerfyLinkArenaStruct2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F8A8
_0809F886:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0809F8A8
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl WriteLinkArenaStruct2
_0809F8A8:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0809F8B0
sub_0809F8B0: @ 0x0809F8B0
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F8E6
	mov r0, sp
	ldrb r3, [r0, #0x13]
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1b
	cmp r0, r4
	beq _0809F8E6
	mov r2, sp
	movs r0, #0x1f
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x13]
	mov r0, sp
	bl WriteGlobalSaveInfo
_0809F8E6:
	adds r0, r4, #0
	bl SetLang
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809F8F4
sub_0809F8F4: @ 0x0809F8F4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F908
	movs r0, #0
	b _0809F91C
_0809F908:
	mov r0, sp
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	bl SetLang
	mov r0, sp
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
_0809F91C:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809F924
sub_0809F924: @ 0x0809F924
	push {lr}
	movs r0, #0
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F936
	bl InitGlobalSaveInfo
_0809F936:
	movs r0, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F946
	bl EraseBonusContentData
_0809F946:
	movs r0, #0
	bl ReadFe6LinkSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F956
	bl ResetFe6LinkSaveInfo
_0809F956:
	movs r0, #0
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F966
	bl EraseSaveRankData
_0809F966:
	movs r0, #0
	bl LoadAndVerifySoundRoomData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F976
	bl sub_0809F668
_0809F976:
	movs r0, #0
	bl LoadAndVerfyLinkArenaStruct2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F986
	bl EraseLinkArenaStruct2
_0809F986:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ClearPidChStatsSaveData
ClearPidChStatsSaveData: @ 0x0809F98C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, _0809FA14 @ =0x0203E7A0
	ldr r2, _0809FA18 @ =0x01000230
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _0809FA1C @ =0x0203EC00
	ldr r2, _0809FA20 @ =0x01000060
	bl CpuSet
	adds r7, r5, #0
	movs r6, #0x86
	lsls r6, r6, #4
	add r6, r8
	adds r4, r7, #0
	movs r5, #0x45
_0809F9C0:
	ldr r0, [r4]
	ldr r1, _0809FA24 @ =0xFF0000FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r6, #0x10
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _0809F9C0
	movs r4, #0xcc
	lsls r4, r4, #4
	add r4, r8
	movs r5, #0x2f
_0809F9EA:
	ldr r0, _0809FA1C @ =0x0203EC00
	adds r1, r4, #0
	movs r2, #4
	bl WriteAndVerifySramFast
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0809F9EA
	ldr r1, _0809FA28 @ =0x0203E79C
	movs r0, #0x86
	lsls r0, r0, #4
	add r0, r8
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA14: .4byte 0x0203E7A0
_0809FA18: .4byte 0x01000230
_0809FA1C: .4byte 0x0203EC00
_0809FA20: .4byte 0x01000060
_0809FA24: .4byte 0xFF0000FF
_0809FA28: .4byte 0x0203E79C

	thumb_func_start ClearPidStats_ret
ClearPidStats_ret: @ 0x0809FA2C
	push {lr}
	ldr r1, _0809FA48 @ =0x0202BBF8
	ldr r0, _0809FA4C @ =0xFFFFE00F
	ldrh r2, [r1, #0x2c]
	ands r0, r2
	strh r0, [r1, #0x2c]
	movs r0, #0
	bl SetGold
	bl ClearPidStats
	pop {r0}
	bx r0
	.align 2, 0
_0809FA48: .4byte 0x0202BBF8
_0809FA4C: .4byte 0xFFFFE00F

	thumb_func_start ClearPidStats
ClearPidStats: @ 0x0809FA50
	push {r4, r5, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r1, _0809FA90 @ =0x0203E7A0
	ldr r2, _0809FA94 @ =0x01000230
	bl CpuSet
	ldr r4, _0809FA98 @ =0x0202BBF8
	ldr r0, [r4, #0x38]
	ldr r1, _0809FA9C @ =0xF00000FF
	ands r0, r1
	str r0, [r4, #0x38]
	movs r0, #0xf
	ldrh r1, [r4, #0x36]
	ands r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x38
	strb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _0809FAA0 @ =0xFFF00000
	ands r0, r1
	str r0, [r4, #0x34]
	bl GetPartyTotalGoldValue
	str r0, [r4, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA90: .4byte 0x0203E7A0
_0809FA94: .4byte 0x01000230
_0809FA98: .4byte 0x0202BBF8
_0809FA9C: .4byte 0xF00000FF
_0809FAA0: .4byte 0xFFF00000

	thumb_func_start ReadPidStats
ReadPidStats: @ 0x0809FAA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FAC4 @ =0x03005E70
	ldr r1, _0809FAC8 @ =0x0203E7A0
	movs r2, #0x8c
	lsls r2, r2, #3
	ldr r3, [r0]
	adds r0, r4, #0
	bl _call_via_r3
	ldr r0, _0809FACC @ =0x0203E79C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FAC4: .4byte 0x03005E70
_0809FAC8: .4byte 0x0203E7A0
_0809FACC: .4byte 0x0203E79C

	thumb_func_start ReadChapterStats
ReadChapterStats: @ 0x0809FAD0
	push {lr}
	ldr r2, _0809FAE4 @ =0x03005E70
	ldr r1, _0809FAE8 @ =0x0203EC00
	ldr r3, [r2]
	movs r2, #0xc0
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_0809FAE4: .4byte 0x03005E70
_0809FAE8: .4byte 0x0203EC00

	thumb_func_start WritePidStats
WritePidStats: @ 0x0809FAEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FB08 @ =0x0203E7A0
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	ldr r0, _0809FB0C @ =0x0203E79C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FB08: .4byte 0x0203E7A0
_0809FB0C: .4byte 0x0203E79C

	thumb_func_start WriteChapterStats
WriteChapterStats: @ 0x0809FB10
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809FB20 @ =0x0203EC00
	movs r2, #0xc0
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_0809FB20: .4byte 0x0203EC00

	thumb_func_start GetChapterStats
GetChapterStats: @ 0x0809FB24
	lsls r0, r0, #2
	ldr r1, _0809FB2C @ =0x0203EC00
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0809FB2C: .4byte 0x0203EC00

	thumb_func_start IsChapterStatsValid
IsChapterStatsValid: @ 0x0809FB30
	ldr r1, _0809FB40 @ =0x0000FF80
	ldrh r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0809FB40: .4byte 0x0000FF80

	thumb_func_start GetNextChapterStatsSlot
GetNextChapterStatsSlot: @ 0x0809FB44
	push {r4, lr}
	movs r0, #0
	bl GetChapterStats
	adds r1, r0, #0
	movs r2, #0
	ldr r3, _0809FB54 @ =0x0000FF80
	b _0809FB5C
	.align 2, 0
_0809FB54: .4byte 0x0000FF80
_0809FB58:
	adds r2, #1
	adds r1, #4
_0809FB5C:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _0809FB58
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809FB70
sub_0809FB70: @ 0x0809FB70
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetChapterStats
	adds r4, r0, #0
	movs r5, #0
	ldr r1, _0809FBB0 @ =0x0000FF80
	adds r0, r1, #0
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0809FBA6
	adds r6, r1, #0
_0809FB8A:
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FB9C
	adds r5, #1
_0809FB9C:
	adds r4, #4
	ldrh r0, [r4]
	ands r0, r6
	cmp r0, #0
	bne _0809FB8A
_0809FBA6:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809FBB0: .4byte 0x0000FF80

	thumb_func_start GetNextChapterStatsEntry
GetNextChapterStatsEntry: @ 0x0809FBB4
	push {lr}
	bl GetNextChapterStatsSlot
	cmp r0, #0
	beq _0809FBCC
	subs r0, #1
	bl GetChapterStats
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	b _0809FBD0
_0809FBCC:
	movs r0, #1
	rsbs r0, r0, #0
_0809FBD0:
	pop {r1}
	bx r1

	thumb_func_start RegisterChapterStats
RegisterChapterStats: @ 0x0809FBD4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetNextChapterStatsSlot
	bl GetChapterStats
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r3, r0, #0
	ldr r0, _0809FC2C @ =0x0000EA60
	cmp r3, r0
	ble _0809FBFA
	adds r3, r0, #0
_0809FBFA:
	ldrh r2, [r4, #0x10]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r2, r0
	ble _0809FC06
	adds r2, r0, #0
_0809FC06:
	movs r1, #0x7f
	ldrb r4, [r4, #0xe]
	ands r1, r4
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r4, [r5]
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	lsls r1, r2, #7
	movs r0, #0x7f
	ldrh r2, [r5]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	strh r3, [r5, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC2C: .4byte 0x0000EA60

	thumb_func_start GetGameTotalTime_unused
GetGameTotalTime_unused: @ 0x0809FC30
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _0809FC54
	movs r7, #0xb4
_0809FC42:
	adds r0, r4, #0
	bl GetChapterStats
	ldrh r0, [r0, #2]
	muls r0, r7, r0
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _0809FC42
_0809FC54:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetGameTotalTurnCount
GetGameTotalTurnCount: @ 0x0809FC5C
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _0809FC80
_0809FC6C:
	adds r0, r4, #0
	bl GetChapterStats
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _0809FC6C
_0809FC80:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start IsChapterPartOfCurrentMode
IsChapterPartOfCurrentMode: @ 0x0809FC88
	adds r1, r0, #0
	ldr r0, _0809FC9C @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _0809FCA0
	cmp r1, #0xb
	bgt _0809FCAC
_0809FC96:
	movs r0, #1
	b _0809FCAE
	.align 2, 0
_0809FC9C: .4byte 0x0202BBF8
_0809FCA0:
	cmp r0, #1
	blt _0809FCAC
	cmp r0, #3
	bgt _0809FCAC
	cmp r1, #0xb
	bgt _0809FC96
_0809FCAC:
	movs r0, #0
_0809FCAE:
	bx lr

	thumb_func_start sub_0809FCB0
sub_0809FCB0: @ 0x0809FCB0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterStatsSlot
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _0809FCE6
_0809FCC0:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FCE0
	movs r0, #0xb4
	ldrh r4, [r4, #2]
	muls r0, r4, r0
	adds r7, r7, r0
_0809FCE0:
	adds r5, #1
	cmp r5, r6
	blt _0809FCC0
_0809FCE6:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetTotalTurnCountUpUntilNow
GetTotalTurnCountUpUntilNow: @ 0x0809FCF0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterStatsSlot
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _0809FD26
_0809FD00:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FD20
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
_0809FD20:
	adds r5, #1
	cmp r5, r6
	blt _0809FD00
_0809FD26:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PidStatsAddBattleAmt
PidStatsAddBattleAmt: @ 0x0809FD30
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0809FD84
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r5, r0, #0
	cmp r0, #0x45
	bhi _0809FD84
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FD84
	lsls r1, r5, #4
	ldr r0, _0809FD8C @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _0809FD84
	ldrh r3, [r2, #0xc]
	lsls r0, r3, #0x12
	lsrs r1, r0, #0x14
	ldr r0, _0809FD90 @ =0x00000F9F
	cmp r1, r0
	bgt _0809FD7A
	adds r0, r1, #1
	ldr r5, _0809FD94 @ =0x00000FFF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _0809FD98 @ =0xFFFFC003
	ands r1, r3
	orrs r1, r0
	strh r1, [r2, #0xc]
_0809FD7A:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #4
	bl PidStatsAddFavval
_0809FD84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD8C: .4byte 0x0203E790
_0809FD90: .4byte 0x00000F9F
_0809FD94: .4byte 0x00000FFF
_0809FD98: .4byte 0xFFFFC003

	thumb_func_start sub_0809FD9C
sub_0809FD9C: @ 0x0809FD9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FDEE
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FDEE
	lsls r1, r4, #4
	ldr r0, _0809FDF4 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _0809FDEE
	movs r3, #3
	adds r0, r3, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r1, r0, #8
	ldrb r0, [r2, #0xb]
	orrs r1, r0
	ldr r0, _0809FDF8 @ =0x000003E7
	cmp r1, r0
	bgt _0809FDE6
	adds r1, #1
	strb r1, [r2, #0xb]
	lsrs r1, r1, #8
	ands r1, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xc]
_0809FDE6:
	adds r0, r5, #0
	movs r1, #0x10
	bl PidStatsAddFavval
_0809FDEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDF4: .4byte 0x0203E790
_0809FDF8: .4byte 0x000003E7

	thumb_func_start PidStatsRecordLoseData
PidStatsRecordLoseData: @ 0x0809FDFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FECC
	cmp r4, #0x45
	bhi _0809FECC
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FECC
	mov r0, r8
	lsls r6, r0, #4
	ldr r0, _0809FED8 @ =0x0203E790
	adds r5, r6, r0
	cmp r5, #0
	beq _0809FECC
	ldr r1, _0809FEDC @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _0809FECC
	ldr r7, _0809FEE0 @ =0x0202BBF8
	ldrb r2, [r7, #0x14]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0809FECC
	ldrb r1, [r1, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0809FECC
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0809FECC
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0809FECC
	ldrb r0, [r5]
	cmp r0, #0xc7
	bhi _0809FECC
	adds r0, #1
	strb r0, [r5]
	movs r1, #0x80
	rsbs r1, r1, #0
	mov r0, r8
	bl PidStatsAddFavval
	bl GetLastSuspendSaveId
	adds r4, r0, #0
	adds r4, #3
	adds r0, r4, #0
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r2, _0809FEE4 @ =0x000019DC
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #1
	bl WriteAndVerifySramFast
	mov r0, sp
	adds r1, r4, #0
	bl ReadSaveBlockInfo
	mov r0, sp
	adds r1, r4, #0
	bl WriteSaveBlockInfo
	ldrb r0, [r7, #0xc]
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r2, #0x85
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #3
	bl WriteAndVerifySramFast
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl ReadSaveBlockInfo
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl WriteSaveBlockInfo
_0809FECC:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FED8: .4byte 0x0203E790
_0809FEDC: .4byte 0x0202BBB8
_0809FEE0: .4byte 0x0202BBF8
_0809FEE4: .4byte 0x000019DC

	thumb_func_start PidStatsRecordDefeatInfo
PidStatsRecordDefeatInfo: @ 0x0809FEE8
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0x45
	bhi _0809FF52
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FF52
	lsls r1, r5, #4
	ldr r0, _0809FF58 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _0809FF52
	ldr r2, _0809FF5C @ =0x0202BBF8
	movs r1, #0xe
	ldrsb r1, [r2, r1]
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ldrb r5, [r3, #5]
	ands r0, r5
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r1, _0809FF60 @ =0x000003FF
	ldrh r2, [r2, #0x10]
	ands r1, r2
	lsls r1, r1, #0xe
	ldr r0, [r3, #4]
	ldr r2, _0809FF64 @ =0xFF003FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #4]
	lsls r2, r6, #0xe
	ldr r0, [r3, #0xc]
	ldr r1, _0809FF68 @ =0xFF803FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #0xc]
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r3, #9]
	ands r0, r1
	orrs r0, r4
	strb r0, [r3, #9]
_0809FF52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF58: .4byte 0x0203E790
_0809FF5C: .4byte 0x0202BBF8
_0809FF60: .4byte 0x000003FF
_0809FF64: .4byte 0xFF003FFF
_0809FF68: .4byte 0xFF803FFF

	thumb_func_start PidStatsAddActAmt
PidStatsAddActAmt: @ 0x0809FF6C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FFA0
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FFA0
	lsls r1, r4, #4
	ldr r0, _0809FFA8 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	beq _0809FFA0
	ldrb r0, [r1, #3]
	cmp r0, #0xc7
	bhi _0809FF98
	adds r0, #1
	strb r0, [r1, #3]
_0809FF98:
	adds r0, r5, #0
	movs r1, #2
	bl PidStatsAddFavval
_0809FFA0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FFA8: .4byte 0x0203E790

	thumb_func_start PidStatsAddStatView
PidStatsAddStatView: @ 0x0809FFAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FFE0
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FFE0
	lsls r1, r4, #4
	ldr r0, _0809FFE8 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	beq _0809FFE0
	ldrb r0, [r1, #4]
	cmp r0, #0xc7
	bhi _0809FFD8
	adds r0, #1
	strb r0, [r1, #4]
_0809FFD8:
	adds r0, r5, #0
	movs r1, #2
	bl PidStatsAddFavval
_0809FFE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FFE8: .4byte 0x0203E790

	thumb_func_start PidStatsAddDeployAmt
PidStatsAddDeployAmt: @ 0x0809FFEC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A0030
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0030
	lsls r1, r4, #4
	ldr r0, _080A0038 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _080A0030
	ldrb r3, [r2, #7]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #0x3b
	bgt _080A0028
	adds r1, r0, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
_080A0028:
	adds r0, r5, #0
	movs r1, #0x40
	bl PidStatsAddFavval
_080A0030:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0038: .4byte 0x0203E790

	thumb_func_start PidStatsAddMove
PidStatsAddMove: @ 0x080A003C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A0090
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0090
	lsls r1, r4, #4
	ldr r0, _080A0098 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _080A0090
	ldrb r4, [r3, #7]
	lsrs r1, r4, #6
	ldrb r2, [r3, #8]
	lsls r0, r2, #2
	orrs r0, r1
	adds r2, r0, r5
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble _080A0076
	adds r2, r0, #0
_080A0076:
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #6
	movs r1, #0x3f
	ands r1, r4
	orrs r1, r0
	strb r1, [r3, #7]
	lsrs r0, r2, #2
	strb r0, [r3, #8]
	adds r0, r6, #0
	movs r1, #2
	bl PidStatsAddFavval
_080A0090:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0098: .4byte 0x0203E790

	thumb_func_start PidStatsAddExpGained
PidStatsAddExpGained: @ 0x080A009C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A00E8
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A00E8
	lsls r1, r4, #4
	ldr r0, _080A00F0 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _080A00E8
	ldr r3, [r2, #8]
	lsls r0, r3, #8
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	movs r1, #0xfa
	lsls r1, r1, #4
	cmp r0, r1
	ble _080A00D2
	adds r0, r1, #0
_080A00D2:
	ldr r1, _080A00F4 @ =0x00000FFF
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, _080A00F8 @ =0xFF000FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r2, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl PidStatsAddFavval
_080A00E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A00F0: .4byte 0x0203E790
_080A00F4: .4byte 0x00000FFF
_080A00F8: .4byte 0xFF000FFF

	thumb_func_start PidStatsSubFavval08
PidStatsSubFavval08: @ 0x080A00FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	rsbs r1, r1, #0
	bl PidStatsAddFavval
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PidStatsSubFavval100
PidStatsSubFavval100: @ 0x080A0110
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080A0120 @ =0xFFFFFF00
	bl PidStatsAddFavval
	pop {r0}
	bx r0
	.align 2, 0
_080A0120: .4byte 0xFFFFFF00

	thumb_func_start PidStatsGetTotalBattleAmt
PidStatsGetTotalBattleAmt: @ 0x080A0124
	push {r4, lr}
	movs r3, #0
	ldr r2, _080A0144 @ =0x0203E7A0
	movs r1, #0x45
_080A012C:
	ldrh r4, [r2, #0xc]
	lsls r0, r4, #0x12
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A012C
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A0144: .4byte 0x0203E7A0

	thumb_func_start PidStatsGetTotalWinAmt
PidStatsGetTotalWinAmt: @ 0x080A0148
	push {r4, r5, lr}
	movs r3, #0
	ldr r0, _080A0174 @ =0x0203E7A0
	movs r4, #3
	adds r1, r0, #0
	adds r1, #0xb
	movs r2, #0x45
_080A0156:
	adds r0, r4, #0
	ldrb r5, [r1, #1]
	ands r0, r5
	lsls r0, r0, #8
	ldrb r5, [r1]
	orrs r0, r5
	adds r3, r3, r0
	adds r1, #0x10
	subs r2, #1
	cmp r2, #0
	bge _080A0156
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0174: .4byte 0x0203E7A0

	thumb_func_start sub_080A0178
sub_080A0178: @ 0x080A0178
	movs r0, #0
	ldr r2, _080A018C @ =0x0203E7A0
	movs r1, #0x45
_080A017E:
	ldrb r3, [r2]
	adds r0, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A017E
	bx lr
	.align 2, 0
_080A018C: .4byte 0x0203E7A0

	thumb_func_start PidStatsGetTotalLevel
PidStatsGetTotalLevel: @ 0x080A0190
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _080A01B8 @ =0x0203E7A0
	movs r4, #0x45
_080A0198:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge _080A0198
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A01B8: .4byte 0x0203E7A0

	thumb_func_start sub_080A01BC
sub_080A01BC: @ 0x080A01BC
	movs r3, #0
	ldr r2, _080A01D8 @ =0x0203E7A0
	movs r1, #0x45
_080A01C2:
	ldr r0, [r2, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A01C2
	adds r0, r3, #0
	bx lr
	.align 2, 0
_080A01D8: .4byte 0x0203E7A0

	thumb_func_start PidStatsGetExpGain
PidStatsGetExpGain: @ 0x080A01DC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A01FC
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A01FC
	lsls r1, r4, #4
	ldr r0, _080A0200 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	bne _080A0204
_080A01FC:
	movs r0, #0
	b _080A020A
	.align 2, 0
_080A0200: .4byte 0x0203E790
_080A0204:
	ldr r0, [r1, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
_080A020A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start PidStatsGetFavval
PidStatsGetFavval: @ 0x080A0210
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A0230
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0230
	lsls r1, r4, #4
	ldr r0, _080A0238 @ =0x0203E790
	adds r0, r1, r0
	cmp r0, #0
	bne _080A023C
_080A0230:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080A0242
	.align 2, 0
_080A0238: .4byte 0x0203E790
_080A023C:
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
_080A0242:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start PidStatsAddFavval
PidStatsAddFavval: @ 0x080A0248
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A02AA
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A02AA
	lsls r1, r4, #4
	ldr r0, _080A0284 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _080A02AA
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	ble _080A028C
	ldr r0, _080A0288 @ =0xFF0000FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xf
	b _080A02A6
	.align 2, 0
_080A0284: .4byte 0x0203E790
_080A0288: .4byte 0xFF0000FF
_080A028C:
	cmp r1, #0
	bge _080A029C
	ldr r0, _080A0298 @ =0xFF0000FF
	ands r2, r0
	str r2, [r3]
	b _080A02AA
	.align 2, 0
_080A0298: .4byte 0xFF0000FF
_080A029C:
	ldr r0, _080A02B0 @ =0x0000FFFF
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, _080A02B4 @ =0xFF0000FF
	ands r0, r2
_080A02A6:
	orrs r0, r1
	str r0, [r3]
_080A02AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A02B0: .4byte 0x0000FFFF
_080A02B4: .4byte 0xFF0000FF

	thumb_func_start PidStatsRecordBattleRes
PidStatsRecordBattleRes: @ 0x080A02B8
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r5, #0
	ldr r4, _080A0314 @ =0x0203A3F0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A02CE
	adds r7, r4, #0
	ldr r5, _080A0318 @ =0x0203A470
_080A02CE:
	ldr r6, _080A0318 @ =0x0203A470
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A02DE
	adds r7, r6, #0
	adds r5, r4, #0
_080A02DE:
	cmp r7, #0
	beq _080A030E
	cmp r5, #0
	beq _080A02F8
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A02F8
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_0809FD9C
_080A02F8:
	cmp r7, #0
	beq _080A030E
	movs r0, #0xc0
	ldrb r1, [r7, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A030E
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl PidStatsRecordLoseData
_080A030E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0314: .4byte 0x0203A3F0
_080A0318: .4byte 0x0203A470

	thumb_func_start IsPlaythroughIdUnique
IsPlaythroughIdUnique: @ 0x080A031C
	push {r4, r5, r6, lr}
	sub sp, #0xac
	adds r6, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r4, #0
	add r1, sp, #0x14
_080A032C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080A0358
	adds r4, #1
	cmp r4, #0xb
	ble _080A032C
	movs r4, #0
	add r5, sp, #0x64
_080A033E:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A035C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ReadGameSavePlaySt
	ldrb r0, [r5, #0x18]
	cmp r0, r6
	bne _080A035C
_080A0358:
	movs r0, #0
	b _080A0364
_080A035C:
	adds r4, #1
	cmp r4, #2
	ble _080A033E
	movs r0, #1
_080A0364:
	add sp, #0xac
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetNewPlaythroughId
GetNewPlaythroughId: @ 0x080A036C
	push {r4, lr}
	movs r4, #1
_080A0370:
	adds r0, r4, #0
	bl IsPlaythroughIdUnique
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0380
	adds r0, r4, #0
	b _080A0386
_080A0380:
	adds r4, #1
	cmp r4, #0xff
	ble _080A0370
_080A0386:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetGlobalCompletionCntByInfo
GetGlobalCompletionCntByInfo: @ 0x080A038C
	movs r2, #0
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x14
_080A0394:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A039E
	adds r2, #1
_080A039E:
	adds r1, #1
	cmp r1, #0xb
	ble _080A0394
	adds r0, r2, #0
	bx lr

	thumb_func_start GetGlobalCompletionCount
GetGlobalCompletionCount: @ 0x080A03A8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A03C0
	mov r0, sp
	bl GetGlobalCompletionCntByInfo
	b _080A03C2
_080A03C0:
	movs r0, #0
_080A03C2:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start RegisterCompletedPlaythrough
RegisterCompletedPlaythrough: @ 0x080A03C8
	push {r4, lr}
	movs r3, #0
	adds r4, r0, #0
	adds r4, #0x14
	adds r2, r4, #0
_080A03D2:
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	beq _080A03F6
	adds r3, #1
	cmp r3, #0xb
	ble _080A03D2
	movs r3, #0
_080A03E2:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A03F0
	strb r1, [r2]
	movs r0, #1
	b _080A03F8
_080A03F0:
	adds r3, #1
	cmp r3, #0xb
	ble _080A03E2
_080A03F6:
	movs r0, #0
_080A03F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SavePlayThroughData
SavePlayThroughData: @ 0x080A0400
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A041A
	bl InitGlobalSaveInfo
	mov r0, sp
	bl ReadGlobalSaveInfo
_080A041A:
	mov r1, sp
	movs r0, #2
	ldrb r2, [r1, #0xe]
	orrs r0, r2
	strb r0, [r1, #0xe]
	mov r0, sp
	bl WriteGlobalSaveInfo
	add sp, #0x64
	pop {r0}
	bx r0

	thumb_func_start sub_080A0430
sub_080A0430: @ 0x080A0430
	push {r4, lr}
	movs r0, #0
	bl GetChapterStats
	adds r4, r0, #0
	bl GetNextChapterStatsSlot
	cmp r0, #0
	beq _080A044C
	movs r0, #0x7f
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _080A0450
_080A044C:
	movs r0, #0
	b _080A0452
_080A0450:
	movs r0, #1
_080A0452:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A0458
sub_080A0458: @ 0x080A0458
	push {lr}
	bl sub_080A0430
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A047C
	ldr r0, _080A0470 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A0474
	movs r0, #0
	b _080A0496
	.align 2, 0
_080A0470: .4byte 0x0202BBF8
_080A0474:
	cmp r0, #3
	bne _080A047C
	movs r0, #2
	b _080A0496
_080A047C:
	ldr r0, _080A0488 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A048C
	movs r0, #1
	b _080A0496
	.align 2, 0
_080A0488: .4byte 0x0202BBF8
_080A048C:
	cmp r0, #3
	beq _080A0494
	movs r0, #4
	b _080A0496
_080A0494:
	movs r0, #3
_080A0496:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteCompletedPlaythroughSaveData
WriteCompletedPlaythroughSaveData: @ 0x080A049C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	bl sub_080A0458
	adds r5, r0, #0
	ldr r7, _080A04E8 @ =0x0202BBF8
	ldrb r0, [r7, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	adds r6, r4, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A04C8
	bl InitGlobalSaveInfo
	mov r0, sp
	bl ReadGlobalSaveInfo
_080A04C8:
	ldrb r1, [r7, #0x18]
	mov r0, sp
	bl RegisterCompletedPlaythrough
	mov r1, sp
	movs r0, #1
	ldrb r2, [r1, #0xe]
	orrs r2, r0
	strb r2, [r1, #0xe]
	cmp r5, #1
	beq _080A050A
	cmp r5, #1
	bgt _080A04EC
	cmp r5, #0
	beq _080A04FA
	b _080A0522
	.align 2, 0
_080A04E8: .4byte 0x0202BBF8
_080A04EC:
	cmp r5, #3
	bgt _080A0522
	cmp r4, #0
	beq _080A051A
	mov r1, sp
	movs r0, #0x80
	b _080A051E
_080A04FA:
	cmp r4, #0
	beq _080A0504
	mov r1, sp
	movs r0, #0x20
	b _080A051E
_080A0504:
	mov r1, sp
	movs r0, #4
	b _080A051E
_080A050A:
	cmp r6, #0
	beq _080A0514
	mov r1, sp
	movs r0, #0x40
	b _080A051E
_080A0514:
	mov r1, sp
	movs r0, #8
	b _080A051E
_080A051A:
	mov r1, sp
	movs r0, #0x10
_080A051E:
	orrs r2, r0
	strb r2, [r1, #0xe]
_080A0522:
	mov r0, sp
	bl WriteGlobalSaveInfo
	cmp r5, #0
	blt _080A0546
	cmp r5, #1
	bgt _080A053A
	movs r0, #0
	movs r1, #0x70
	bl UnlockSoundRoomSong
	b _080A0546
_080A053A:
	cmp r5, #3
	bgt _080A0546
	movs r0, #0
	movs r1, #0x71
	bl UnlockSoundRoomSong
_080A0546:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetPidStats
GetPidStats: @ 0x080A0550
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x45
	bhi _080A0574
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0574
	lsls r0, r4, #4
	ldr r1, _080A0570 @ =0x0203E790
	adds r0, r0, r1
	b _080A0576
	.align 2, 0
_080A0570: .4byte 0x0203E790
_080A0574:
	movs r0, #0
_080A0576:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetBonusContentClaimFlags
GetBonusContentClaimFlags: @ 0x080A057C
	ldr r0, _080A0584 @ =0x0203ECC0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A0584: .4byte 0x0203ECC0

	thumb_func_start SetBonusContentClaimFlags
SetBonusContentClaimFlags: @ 0x080A0588
	ldr r1, _080A0590 @ =0x0203ECC0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0590: .4byte 0x0203ECC0

	thumb_func_start WriteBonusContentClaimFlags
WriteBonusContentClaimFlags: @ 0x080A0594
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A05A8 @ =0x0203ECC0
	ldr r2, _080A05AC @ =0x00000D88
	adds r1, r1, r2
	movs r2, #4
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A05A8: .4byte 0x0203ECC0
_080A05AC: .4byte 0x00000D88

	thumb_func_start ReadBonusContentClaimFlags
ReadBonusContentClaimFlags: @ 0x080A05B0
	push {lr}
	ldr r2, _080A05C8 @ =0x03005E70
	ldr r1, _080A05CC @ =0x00000D88
	adds r0, r0, r1
	ldr r1, _080A05D0 @ =0x0203ECC0
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_080A05C8: .4byte 0x03005E70
_080A05CC: .4byte 0x00000D88
_080A05D0: .4byte 0x0203ECC0

	thumb_func_start WriteLastGameSaveId
WriteLastGameSaveId: @ 0x080A05D4
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r0, sp
	adds r0, #0x62
	strb r4, [r0]
	mov r0, sp
	bl WriteGlobalSaveInfoNoChecksum
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ReadLastGameSaveId
ReadLastGameSaveId: @ 0x080A05F4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0612
	mov r0, sp
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt _080A0612
	cmp r0, #0
	bge _080A0614
_080A0612:
	movs r0, #0
_080A0614:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A061C
sub_080A061C: @ 0x080A061C
	push {r4, r5, lr}
	sub sp, #0x58
	adds r5, r0, #0
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0644
	add r4, sp, #0x10
	movs r0, #3
	adds r1, r4, #0
	bl ReadSuspendSavePlaySt
	ldrb r0, [r4, #0xc]
	cmp r0, r5
	bne _080A0644
	movs r0, #3
	bl InvalidateSuspendSave
_080A0644:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl WriteSaveBlockInfo
	add sp, #0x58
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CopyGameSave
CopyGameSave: @ 0x080A065C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov sb, r1
	bl GetSaveReadAddr
	adds r6, r0, #0
	mov r0, sb
	bl GetSaveWriteAddr
	mov r8, r0
	ldr r0, _080A06B4 @ =0x03005E70
	ldr r4, _080A06B8 @ =0x02020140
	ldr r5, _080A06BC @ =0x00000D8C
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A06C0 @ =0x00011217
	str r0, [sp]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, sb
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A06B4: .4byte 0x03005E70
_080A06B8: .4byte 0x02020140
_080A06BC: .4byte 0x00000D8C
_080A06C0: .4byte 0x00011217

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
	bl sub_0809E9C4
	adds r0, r7, #0
	bl ClearPidChStatsSaveData
	movs r2, #0xd8
	lsls r2, r2, #4
	adds r0, r7, r2
	bl sub_0809E954
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

	thumb_func_start WriteGameSave
WriteGameSave: @ 0x080A0810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	mov sb, r0
	bl GetSaveWriteAddr
	adds r7, r0, #0
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r4, _080A08E0 @ =0x0202BBF8
	mov r0, sb
	strb r0, [r4, #0xc]
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	add r1, sp, #0x10
	mov r8, r1
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #0
	ldr r0, _080A08E4 @ =0x0202BD50
	mov sl, r0
	movs r5, #0x33
_080A0850:
	mov r1, sl
	adds r0, r6, r1
	adds r1, r4, #0
	bl WriteGameSavePackedUnit
	adds r4, #0x24
	adds r6, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A0850
	mov r0, r8
	bl ReadGlobalSaveInfo
	movs r4, #0
	ldr r6, _080A08E4 @ =0x0202BD50
	movs r5, #0x33
_080A0870:
	adds r0, r4, r6
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	mov r1, r8
	bl MetaSave_SetMetCharacter
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A0870
	movs r4, #0
	mov r0, r8
	bl WriteGlobalSaveInfo
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_0809E9C4
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl WritePidStats
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl WriteChapterStats
	adds r0, r7, #0
	bl WriteBonusContentClaimFlags
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809E954
	ldr r0, _080A08E8 @ =0x00011217
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sb
	bl WriteSaveBlockInfo
	mov r0, sb
	bl WriteLastGameSaveId
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A08E0: .4byte 0x0202BBF8
_080A08E4: .4byte 0x0202BD50
_080A08E8: .4byte 0x00011217

	thumb_func_start ReadGameSave
ReadGameSave: @ 0x080A08EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	bl GetSaveReadAddr
	adds r7, r0, #0
	bl ClearMenuOverrides
	ldr r1, _080A0990 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A0912
	movs r0, #3
	bl InvalidateSuspendSave
_080A0912:
	ldr r0, _080A0994 @ =0x03005E70
	ldr r4, _080A0998 @ =0x0202BBF8
	ldr r3, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	mov r0, sb
	strb r0, [r4, #0xc]
	bl InitUnits
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x48
	ldr r1, _080A099C @ =0x0202BD50
	mov r8, r1
	movs r5, #0x33
_080A093C:
	mov r0, r8
	adds r1, r6, r0
	adds r0, r4, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A093C
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_0809E9DC
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809E99C
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl ReadPidStats
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl ReadChapterStats
	adds r0, r7, #0
	bl ReadBonusContentClaimFlags
	mov r0, sb
	bl WriteLastGameSaveId
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0990: .4byte 0x0202BBB8
_080A0994: .4byte 0x03005E70
_080A0998: .4byte 0x0202BBF8
_080A099C: .4byte 0x0202BD50

	thumb_func_start IsSaveValid
IsSaveValid: @ 0x080A09A0
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ReadGameSavePlaySt
ReadGameSavePlaySt: @ 0x080A09B4
	push {r4, lr}
	adds r4, r1, #0
	bl GetSaveReadAddr
	ldr r1, _080A09D0 @ =0x03005E70
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A09D0: .4byte 0x03005E70

	thumb_func_start LoadSavedBonusClaimFlags
LoadSavedBonusClaimFlags: @ 0x080A09D4
	push {lr}
	sub sp, #4
	bl GetSaveReadAddr
	ldr r1, _080A09F4 @ =0x03005E70
	ldr r2, _080A09F8 @ =0x00000D88
	adds r0, r0, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #4
	bl _call_via_r3
	ldr r0, [sp]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080A09F4: .4byte 0x03005E70
_080A09F8: .4byte 0x00000D88

	thumb_func_start sub_080A09FC
sub_080A09FC: @ 0x080A09FC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	bgt _080A0A0A
	movs r0, #0
	b _080A0A0C
_080A0A0A:
	movs r0, #1
_080A0A0C:
	bx lr
	.align 2, 0

	thumb_func_start sub_080A0A10
sub_080A0A10: @ 0x080A0A10
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	bgt _080A0A22
	cmp r0, #0
	ble _080A0A2A
	movs r0, #1
	b _080A0A2C
_080A0A22:
	cmp r0, #0xd
	ble _080A0A2A
	movs r0, #1
	b _080A0A2C
_080A0A2A:
	movs r0, #0
_080A0A2C:
	bx lr
	.align 2, 0

	thumb_func_start IsGameSaveNotFirstChapter
IsGameSaveNotFirstChapter: @ 0x080A0A30
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0A54
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl sub_080A0A10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A0A56
_080A0A54:
	movs r0, #0
_080A0A56:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteGameSavePackedUnit
WriteGameSavePackedUnit: @ 0x080A0A60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	adds r7, r0, #0
	str r1, [sp, #0x6c]
	mov r1, sp
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x14]
	mov r2, sp
	ldr r0, [r7, #4]
	movs r1, #0x7f
	ldrb r0, [r0, #4]
	ands r1, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r4, [r7]
	cmp r4, #0
	bne _080A0AAC
	add r7, sp, #0x24
	adds r0, r7, #0
	bl ClearUnit
	mov r0, sp
	strb r4, [r0, #0x14]
	mov r1, sp
	adds r0, r5, #0
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
_080A0AAC:
	mov r2, sp
	movs r1, #8
	ldrsb r1, [r7, r1]
	movs r5, #0x1f
	mov r8, r5
	mov r6, r8
	ands r1, r6
	lsls r1, r1, #7
	ldr r3, _080A0E6C @ =0xFFFFF07F
	adds r0, r3, #0
	ldrh r4, [r2]
	ands r0, r4
	orrs r0, r1
	strh r0, [r2]
	movs r5, #0x7f
	mov sb, r5
	mov r1, sb
	ldrb r6, [r7, #9]
	ands r1, r6
	lsls r1, r1, #0xc
	ldr r0, [sp]
	ldr r2, _080A0E70 @ =0xFFF80FFF
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	mov r4, sp
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #3
	ldrh r2, [r4, #2]
	ldr r0, _080A0E74 @ =0xFFFFFE07
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x7f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r2, #0x12
	ldrsb r2, [r7, r2]
	movs r5, #0x3f
	ands r2, r5
	lsls r2, r2, #0xc
	ldr r0, [sp, #4]
	ldr r1, _080A0E78 @ =0xFFFC0FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	movs r4, #0x1f
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r6, [r2, #6]
	ands r0, r6
	orrs r0, r1
	strb r0, [r2, #6]
	mov r1, sp
	movs r0, #0x15
	ldrsb r0, [r7, r0]
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #7
	ldrh r6, [r1, #6]
	ands r3, r6
	orrs r3, r0
	strh r3, [r1, #6]
	mov r3, sp
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	movs r6, #0xf
	adds r1, r2, #0
	ands r1, r6
	lsls r1, r1, #4
	mov sl, r1
	adds r0, r6, #0
	ldrb r1, [r3, #7]
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3, #7]
	lsrs r2, r2, #4
	movs r0, #1
	mov ip, r0
	ands r2, r0
	subs r0, #3
	ldrb r1, [r3, #8]
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #8]
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	ands r1, r4
	lsls r1, r1, #1
	movs r2, #0x3f
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	mov r2, sp
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	mov r3, r8
	ands r1, r3
	lsls r1, r1, #6
	ldr r0, _080A0E7C @ =0xFFFFF83F
	ldrh r3, [r2, #8]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #8]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	movs r0, #7
	ldrb r3, [r2, #9]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #9]
	movs r1, #0x1a
	ldrsb r1, [r7, r1]
	ands r1, r4
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r4, [r2, #0xa]
	ands r0, r4
	orrs r0, r1
	strb r0, [r2, #0xa]
	movs r1, #0x1d
	ldrsb r1, [r7, r1]
	mov r0, r8
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A0E80 @ =0xFFFFFC1F
	ldrh r3, [r2, #0xa]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #0xa]
	mov r3, sp
	ldrh r2, [r7, #0x1e]
	adds r1, r2, #0
	ands r1, r5
	lsls r1, r1, #2
	mov r8, r1
	movs r4, #3
	adds r0, r4, #0
	ldrb r1, [r3, #0xb]
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #0xb]
	lsrs r2, r2, #6
	strb r2, [r3, #0xc]
	ldr r3, _080A0E84 @ =0x00003FFF
	adds r1, r3, #0
	ldrh r2, [r7, #0x20]
	ands r1, r2
	lsls r1, r1, #8
	ldr r0, [sp, #0xc]
	ldr r2, _080A0E88 @ =0xFFC000FF
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0xc]
	mov r2, sp
	ldrh r1, [r7, #0x22]
	ldr r0, _080A0E8C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #6
	mov r8, r0
	ldrh r0, [r2, #0xe]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strh r5, [r2, #0xe]
	lsrs r1, r1, #0xa
	ands r1, r6
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r5, [r2, #0x10]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrh r6, [r7, #0x24]
	ands r3, r6
	lsls r3, r3, #4
	ldr r0, [sp, #0x10]
	ldr r1, _080A0E90 @ =0xFFFC000F
	ands r0, r1
	orrs r0, r3
	str r0, [sp, #0x10]
	mov r1, sp
	ldrh r2, [r7, #0x26]
	lsls r0, r2, #2
	ldrh r3, [r1, #0x12]
	ands r4, r3
	orrs r4, r0
	strh r4, [r1, #0x12]
	ldrb r0, [r1, #3]
	mov r5, sb
	ands r5, r0
	strb r5, [r1, #3]
	ldr r6, _080A0E94 @ =0xFFFFF000
	adds r0, r6, #0
	ldrh r4, [r1, #4]
	ands r0, r4
	strh r0, [r1, #4]
	ldr r0, [r7, #0xc]
	movs r1, #4
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	beq _080A0C90
	mov r3, sp
	mov r0, sp
	ldr r2, _080A0E98 @ =0x00000FFF
	mov sl, r2
	ldrh r0, [r0, #4]
	ands r2, r0
	mov r4, ip
	lsrs r1, r4, #1
	lsls r0, r4, #7
	orrs r0, r5
	strb r0, [r3, #3]
	orrs r1, r2
	mov r5, sl
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0C90:
	ldr r0, [r7, #0xc]
	movs r3, #8
	mov sl, r3
	ands r0, r3
	cmp r0, #0
	beq _080A0CD2
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0CD2:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080A0D14
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, r8
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D14:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080A0D56
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, sl
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D56:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080A0D98
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x10
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D98:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _080A0DDA
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x20
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0DDA:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080A0E1C
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x40
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0E1C:
	movs r2, #0
	mov r5, sp
	adds r5, #0x1d
	adds r6, r7, #0
	adds r6, #0x32
	mov r4, sp
	adds r4, #0x15
	adds r3, r7, #0
	adds r3, #0x28
_080A0E2E:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A0E2E
	movs r2, #0
	adds r4, r5, #0
	adds r3, r6, #0
_080A0E42:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A0E42
	mov r0, sp
	ldr r1, [sp, #0x6c]
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x70
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080A0E6A:
	.byte 0x17, 0xE0
_080A0E6C: .4byte 0xFFFFF07F
_080A0E70: .4byte 0xFFF80FFF
_080A0E74: .4byte 0xFFFFFE07
_080A0E78: .4byte 0xFFFC0FFF
_080A0E7C: .4byte 0xFFFFF83F
_080A0E80: .4byte 0xFFFFFC1F
_080A0E84: .4byte 0x00003FFF
_080A0E88: .4byte 0xFFC000FF
_080A0E8C: .4byte 0x000003FF
_080A0E90: .4byte 0xFFFC000F
_080A0E94: .4byte 0xFFFFF000
_080A0E98: .4byte 0x00000FFF

	thumb_func_start LoadSavedUnit
LoadSavedUnit: @ 0x080A0E9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080A10D0 @ =0x03005E70
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0, #0x14]
	bl GetCharacterData
	str r0, [r4]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl GetClassData
	str r0, [r4, #4]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #8]
	ldr r0, [sp]
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x19
	strb r3, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x11]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x12]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x14]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x15]
	mov r1, sp
	ldrb r0, [r1, #7]
	lsrs r2, r0, #4
	movs r5, #1
	adds r0, r5, #0
	ldrb r1, [r1, #8]
	ands r0, r1
	lsls r0, r0, #4
	orrs r0, r2
	strb r0, [r4, #0x16]
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x17]
	mov r0, sp
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x18]
	mov r0, sp
	ldrb r0, [r0, #9]
	lsrs r0, r0, #3
	strb r0, [r4, #0x19]
	mov r0, sp
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1a]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1d]
	mov r0, sp
	ldrb r2, [r0, #0xb]
	lsrs r1, r2, #2
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #6
	orrs r0, r1
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x20]
	mov r1, sp
	ldrh r0, [r1, #0xe]
	lsrs r2, r0, #6
	movs r0, #0xf
	ldrb r1, [r1, #0x10]
	ands r0, r1
	lsls r0, r0, #0xa
	orrs r0, r2
	strh r0, [r4, #0x22]
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x24]
	mov r0, sp
	ldrh r0, [r0, #0x12]
	lsrs r0, r0, #2
	strh r0, [r4, #0x26]
	cmp r3, #0x63
	bls _080A0F90
	movs r0, #0xff
	strb r0, [r4, #9]
_080A0F90:
	movs r0, #0
	str r0, [r4, #0xc]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	ldr r3, _080A10D4 @ =0x00000FFF
	adds r0, r3, #0
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _080A0FB0
	movs r0, #5
	str r0, [r4, #0xc]
_080A0FB0:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080A0FCA
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A0FCA:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A0FE6
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0xc]
_080A0FE6:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080A1002
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r4, #0xc]
_080A1002:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A101E
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
_080A101E:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _080A103A
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A103A:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080A1056
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	orrs r0, r1
	str r0, [r4, #0xc]
_080A1056:
	movs r2, #0
	adds r6, r4, #0
	adds r6, #0x32
	mov r7, sp
	adds r7, #0x1d
	movs r1, #0x39
	adds r1, r1, r4
	mov r8, r1
	adds r5, r4, #0
	adds r5, #0x28
	mov r3, sp
	adds r3, #0x15
_080A106E:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A106E
	movs r2, #0
	adds r5, r6, #0
	adds r3, r7, #0
_080A1082:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1082
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r4, #9]
	cmp r0, #0x7f
	bne _080A10AE
	movs r0, #0xff
	strb r0, [r4, #9]
_080A10AE:
	ldrb r0, [r4, #0x10]
	cmp r0, #0x3f
	bne _080A10B8
	movs r0, #0xff
	strb r0, [r4, #0x10]
_080A10B8:
	ldrb r0, [r4, #0x11]
	cmp r0, #0x3f
	bne _080A10C2
	movs r0, #0xff
	strb r0, [r4, #0x11]
_080A10C2:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A10D0: .4byte 0x03005E70
_080A10D4: .4byte 0x00000FFF

	thumb_func_start InvalidateSuspendSave
InvalidateSuspendSave: @ 0x080A10D8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r4, #0
	bl WriteSaveBlockInfo
	cmp r4, #3
	bne _080A10F8
	mov r0, sp
	movs r1, #4
	bl WriteSaveBlockInfo
_080A10F8:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start WriteSuspendSave
WriteSuspendSave: @ 0x080A1100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	ldr r4, _080A121C @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080A120C
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A120C
	bl GetNextSuspendSaveId
	add r8, r0
	mov r0, r8
	bl GetSaveWriteAddr
	adds r7, r0, #0
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	bl sub_0802F1F8
	ldr r0, _080A1220 @ =0x0203A85C
	adds r1, r7, #0
	adds r1, #0x48
	movs r2, #0x1c
	bl WriteAndVerifySramFast
	ldr r5, _080A1224 @ =0x02020140
	add r0, sp, #0x10
	mov sl, r0
	ldr r6, _080A1228 @ =0x0202BD50
	movs r4, #0x33
_080A115C:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A115C
	movs r1, #0x64
	adds r1, r1, r7
	mov sb, r1
	ldr r6, _080A122C @ =0x0202CEC0
	movs r4, #0x31
_080A1178:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A1178
	ldr r6, _080A1230 @ =0x0202DCD0
	movs r4, #9
_080A118E:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A118E
	movs r4, #0
	ldr r0, _080A1224 @ =0x02020140
	movs r2, #0xb6
	lsls r2, r2, #5
	mov r1, sb
	bl WriteSramFast
	ldr r1, _080A1234 @ =0x00001F1C
	adds r0, r7, r1
	bl sub_0809E954
	ldr r1, _080A1238 @ =0x00001F24
	adds r0, r7, r1
	bl sub_0809E934
	ldr r1, _080A123C @ =0x00001924
	adds r0, r7, r1
	bl sub_0809E9C4
	ldr r1, _080A1240 @ =0x000019EC
	adds r0, r7, r1
	bl WritePidStats
	ldr r1, _080A1244 @ =0x00001E4C
	adds r0, r7, r1
	bl WriteChapterStats
	ldr r1, _080A1248 @ =0x00001724
	adds r0, r7, r1
	bl WriteTraps
	mov r0, sl
	bl GetForceDisabledMenuItems
	ldr r0, _080A124C @ =0x00001F0C
	adds r1, r7, r0
	mov r0, sl
	movs r2, #0x10
	bl WriteAndVerifySramFast
	ldr r0, _080A1250 @ =0x00020509
	str r0, [sp]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, r8
	bl WriteSaveBlockInfo
	ldr r0, _080A1254 @ =0x0202BBB8
	adds r0, #0x3c
	strb r4, [r0]
	bl WriteSwappedSuspendSaveId
_080A120C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A121C: .4byte 0x0202BBF8
_080A1220: .4byte 0x0203A85C
_080A1224: .4byte 0x02020140
_080A1228: .4byte 0x0202BD50
_080A122C: .4byte 0x0202CEC0
_080A1230: .4byte 0x0202DCD0
_080A1234: .4byte 0x00001F1C
_080A1238: .4byte 0x00001F24
_080A123C: .4byte 0x00001924
_080A1240: .4byte 0x000019EC
_080A1244: .4byte 0x00001E4C
_080A1248: .4byte 0x00001724
_080A124C: .4byte 0x00001F0C
_080A1250: .4byte 0x00020509
_080A1254: .4byte 0x0202BBB8

	thumb_func_start ReadSuspendSave
ReadSuspendSave: @ 0x080A1258
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _080A1344 @ =0x0203ECC4
	ldrb r1, [r1]
	adds r0, r1, r0
	bl GetSaveReadAddr
	adds r6, r0, #0
	ldr r5, _080A1348 @ =0x03005E70
	ldr r4, _080A134C @ =0x0202BBF8
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	adds r0, r6, #0
	adds r0, #0x48
	ldr r1, _080A1350 @ =0x0203A85C
	ldr r3, [r5]
	movs r2, #0x1c
	bl _call_via_r3
	bl sub_0802F208
	bl InitUnits
	movs r4, #0
	movs r5, #0
_080A1296:
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, #0x64
	adds r0, r6, r0
	ldr r1, _080A1354 @ =0x0202BD50
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x33
	ble _080A1296
	movs r4, #0
	movs r5, #0
_080A12B2:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r1, _080A1358 @ =0x00000AF4
	adds r0, r0, r1
	adds r0, r6, r0
	ldr r1, _080A135C @ =0x0202CEC0
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x31
	ble _080A12B2
	movs r4, #0
	movs r5, #0
_080A12D0:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r2, _080A1360 @ =0x0000151C
	adds r0, r0, r2
	adds r0, r6, r0
	ldr r1, _080A1364 @ =0x0202DCD0
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #9
	ble _080A12D0
	ldr r1, _080A1368 @ =0x000019EC
	adds r0, r6, r1
	bl ReadPidStats
	ldr r2, _080A136C @ =0x00001E4C
	adds r0, r6, r2
	bl ReadChapterStats
	ldr r1, _080A1370 @ =0x00001924
	adds r0, r6, r1
	bl sub_0809E9DC
	ldr r2, _080A1374 @ =0x00001F1C
	adds r0, r6, r2
	bl sub_0809E99C
	ldr r1, _080A1378 @ =0x00001F24
	adds r0, r6, r1
	bl sub_0809E974
	ldr r2, _080A137C @ =0x00001724
	adds r0, r6, r2
	bl ReadTraps
	ldr r1, _080A1348 @ =0x03005E70
	ldr r2, _080A1380 @ =0x00001F0C
	adds r0, r6, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x10
	bl _call_via_r3
	mov r0, sp
	bl SetForceDisabledMenuItems
	ldr r0, _080A134C @ =0x0202BBF8
	ldrb r0, [r0, #0xc]
	bl LoadSavedBonusClaimFlags
	bl SetBonusContentClaimFlags
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1344: .4byte 0x0203ECC4
_080A1348: .4byte 0x03005E70
_080A134C: .4byte 0x0202BBF8
_080A1350: .4byte 0x0203A85C
_080A1354: .4byte 0x0202BD50
_080A1358: .4byte 0x00000AF4
_080A135C: .4byte 0x0202CEC0
_080A1360: .4byte 0x0000151C
_080A1364: .4byte 0x0202DCD0
_080A1368: .4byte 0x000019EC
_080A136C: .4byte 0x00001E4C
_080A1370: .4byte 0x00001924
_080A1374: .4byte 0x00001F1C
_080A1378: .4byte 0x00001F24
_080A137C: .4byte 0x00001724
_080A1380: .4byte 0x00001F0C

	thumb_func_start IsValidSuspendSave
IsValidSuspendSave: @ 0x080A1384
	push {r4, lr}
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A13C8
	cmp r4, #3
	bne _080A13C8
	ldr r4, _080A13CC @ =0x0203ECC4
	bl GetLastSuspendSaveId
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A13D0
	bl GetNextSuspendSaveId
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A13D0
	movs r0, #0x7f
	strb r0, [r4]
_080A13C8:
	movs r0, #0
	b _080A13D2
	.align 2, 0
_080A13CC: .4byte 0x0203ECC4
_080A13D0:
	movs r0, #1
_080A13D2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ReadSuspendSavePlaySt
ReadSuspendSavePlaySt: @ 0x080A13D8
	push {lr}
	ldr r2, _080A13E8 @ =0x0203ECC4
	ldrb r2, [r2]
	adds r0, r2, r0
	bl ReadGameSavePlaySt
	pop {r0}
	bx r0
	.align 2, 0
_080A13E8: .4byte 0x0203ECC4

	thumb_func_start EncodeSuspendSavePackedUnit
EncodeSuspendSavePackedUnit: @ 0x080A13EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	mov ip, r1
	ldr r0, [r6]
	cmp r0, #0
	bne _080A1406
	strb r0, [r1]
	b _080A1690
_080A1406:
	ldrb r0, [r0, #4]
	mov r1, ip
	strb r0, [r1]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	strb r0, [r1, #1]
	movs r1, #8
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x24
	movs r4, #0x1f
	ands r1, r4
	movs r3, #0x20
	rsbs r3, r3, #0
	adds r0, r3, #0
	ldrb r5, [r2]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6, #9]
	mov r7, ip
	strb r0, [r7, #0x10]
	ldr r0, [r6, #0xc]
	str r0, [r7, #4]
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A16A0 @ =0xFFFFF81F
	ldrh r2, [r7, #0x24]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x24]
	movs r1, #0x3f
	ldrb r5, [r6, #0x11]
	ands r1, r5
	lsls r1, r1, #0xb
	ldr r0, [r7, #0x24]
	ldr r2, _080A16A4 @ =0xFFFE07FF
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x24]
	ldrb r0, [r6, #0x12]
	strb r0, [r7, #0xe]
	ldrb r0, [r6, #0x13]
	strb r0, [r7, #0xf]
	movs r1, #0x14
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x26
	ands r1, r4
	lsls r1, r1, #1
	movs r0, #0x3f
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x15
	ldrsb r1, [r6, r1]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r0, _080A16A8 @ =0xFFFFF83F
	mov r5, ip
	ldrh r5, [r5, #0x26]
	ands r0, r5
	orrs r0, r1
	mov r7, ip
	strh r0, [r7, #0x26]
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	movs r0, #0x27
	add r0, ip
	mov r8, r0
	lsls r1, r1, #3
	movs r5, #7
	mov sb, r5
	movs r0, #7
	mov r7, r8
	ldrb r7, [r7]
	ands r0, r7
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	mov r1, ip
	adds r1, #0x28
	ands r0, r4
	ldrb r5, [r1]
	ands r3, r5
	orrs r3, r0
	strb r3, [r1]
	movs r1, #0x18
	ldrsb r1, [r6, r1]
	ands r1, r2
	lsls r1, r1, #5
	ldr r0, _080A16AC @ =0xFFFFFC1F
	mov r7, ip
	ldrh r7, [r7, #0x28]
	ands r0, r7
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x28]
	movs r1, #0x19
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x29
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r2, #0x1a
	ldrsb r2, [r6, r2]
	movs r3, #0x1f
	ands r2, r3
	lsls r2, r2, #0xf
	mov r4, ip
	ldr r0, [r4, #0x28]
	ldr r1, _080A16B0 @ =0xFFF07FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0x28]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #0x2a
	mov r5, sb
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0x71
	rsbs r0, r0, #0
	ldrb r7, [r4]
	ands r0, r7
	orrs r0, r1
	strb r0, [r4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #7
	ldr r0, _080A16B4 @ =0xFFFFFC7F
	mov r1, ip
	ldrh r1, [r1, #0x2a]
	ands r0, r1
	orrs r0, r2
	mov r2, ip
	strh r0, [r2, #0x2a]
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #1
	ands r1, r5
	lsls r1, r1, #2
	movs r0, #0x1d
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	orrs r0, r1
	lsrs r2, r2, #4
	lsls r2, r2, #5
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldrb r0, [r6, #0x1b]
	mov r7, ip
	strb r0, [r7, #3]
	movs r1, #0x1d
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x2c
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x7f
	ldrb r4, [r6, #0x1c]
	ands r1, r4
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #7
	orrs r1, r0
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	ldr r2, _080A16B8 @ =0x00003FFF
	adds r1, r2, #0
	ldrh r5, [r6, #0x1e]
	ands r1, r5
	movs r0, #6
	ands r0, r3
	lsls r0, r0, #0xd
	orrs r1, r0
	strh r1, [r7, #8]
	adds r1, r2, #0
	ldrh r7, [r6, #0x20]
	ands r1, r7
	movs r0, #0x18
	ands r0, r3
	lsls r0, r0, #0xb
	orrs r1, r0
	mov r0, ip
	strh r1, [r0, #0xa]
	adds r1, r2, #0
	ldrh r4, [r6, #0x22]
	ands r1, r4
	movs r0, #0x60
	ands r0, r3
	lsls r0, r0, #9
	orrs r1, r0
	mov r5, ip
	strh r1, [r5, #0xc]
	ldrh r7, [r6, #0x24]
	ands r2, r7
	lsls r2, r2, #4
	ldr r0, [r5, #0x2c]
	ldr r1, _080A16BC @ =0xFFFC000F
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #0x2c]
	ldrh r0, [r6, #0x26]
	lsls r1, r0, #2
	movs r0, #3
	ldrh r2, [r5, #0x2e]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2e]
	movs r2, #0
	adds r5, #0x1a
	adds r7, r6, #0
	adds r7, #0x32
	movs r3, #0x42
	adds r3, r3, r6
	mov r8, r3
	adds r4, r6, #0
	adds r4, #0x43
	str r4, [sp, #0xc]
	movs r0, #0x21
	add r0, ip
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x44
	str r1, [sp, #0x10]
	movs r3, #0x22
	add r3, ip
	mov sl, r3
	adds r4, #2
	str r4, [sp, #0x14]
	mov r0, ip
	adds r0, #0x23
	str r0, [sp]
	subs r1, #4
	str r1, [sp, #8]
	adds r3, r6, #0
	adds r3, #0x46
	str r3, [sp, #0x18]
	mov r4, ip
	adds r4, #0x31
	str r4, [sp, #4]
	ldrb r1, [r6, #0xa]
	mov r0, sp
	strb r1, [r0, #0x1c]
	subs r4, #0x1f
	subs r3, #0x1e
_080A1638:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A1638
	movs r2, #0
	adds r4, r5, #0
	adds r3, r7, #0
_080A164C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A164C
	mov r2, r8
	ldrb r0, [r2]
	mov r3, ip
	strb r0, [r3, #2]
	ldr r4, [sp, #0xc]
	ldrb r0, [r4]
	mov r5, sb
	strb r0, [r5]
	ldr r7, [sp, #0x10]
	ldrb r0, [r7]
	mov r1, sl
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldr r3, [sp]
	strb r0, [r3]
	ldr r4, [sp, #8]
	ldrh r0, [r4]
	mov r5, ip
	strh r0, [r5, #0x32]
	ldr r7, [sp, #0x18]
	ldrb r0, [r7]
	ldr r1, [sp, #4]
	strb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x1c]
	strb r2, [r5, #0x11]
_080A1690:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A16A0: .4byte 0xFFFFF81F
_080A16A4: .4byte 0xFFFE07FF
_080A16A8: .4byte 0xFFFFF83F
_080A16AC: .4byte 0xFFFFFC1F
_080A16B0: .4byte 0xFFF07FFF
_080A16B4: .4byte 0xFFFFFC7F
_080A16B8: .4byte 0x00003FFF
_080A16BC: .4byte 0xFFFC000F

	thumb_func_start ReadSuspendSavePackedUnit
ReadSuspendSavePackedUnit: @ 0x080A16C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r6, r1, #0
	ldr r1, _080A18D0 @ =0x03005E70
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x34
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0]
	bl GetCharacterData
	str r0, [r6]
	mov r0, sp
	ldrb r0, [r0, #1]
	bl GetClassData
	str r0, [r6, #4]
	add r0, sp, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #8]
	mov r0, sp
	ldrb r0, [r0, #0x10]
	strb r0, [r6, #9]
	ldr r0, [sp, #4]
	str r0, [r6, #0xc]
	mov r0, sp
	ldrh r0, [r0, #0x24]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x10]
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x11]
	mov r0, sp
	ldrb r0, [r0, #0xe]
	strb r0, [r6, #0x12]
	mov r0, sp
	ldrb r0, [r0, #0xf]
	strb r0, [r6, #0x13]
	mov r0, sp
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x14]
	mov r0, sp
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x15]
	mov r0, sp
	adds r0, #0x27
	ldrb r0, [r0]
	lsrs r0, r0, #3
	strb r0, [r6, #0x16]
	add r0, sp, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x28]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x18]
	mov r0, sp
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x19]
	ldr r0, [sp, #0x28]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x1a]
	mov r0, sp
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #0x19
	adds r2, r6, #0
	adds r2, #0x30
	mov r0, sp
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r1, r0, #0x1b
	adds r2, #1
	lsrs r0, r0, #5
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r6, #0x1b]
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r6, #0x1d]
	add r0, sp, #0x30
	ldrb r2, [r0]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r6, #0x1c]
	mov r0, sp
	ldrh r5, [r0, #8]
	ldr r1, _080A18D4 @ =0x00003FFF
	adds r0, r1, #0
	ands r0, r5
	strh r0, [r6, #0x1e]
	mov r0, sp
	ldrh r4, [r0, #0xa]
	adds r0, r1, #0
	ands r0, r4
	strh r0, [r6, #0x20]
	mov r0, sp
	ldrh r3, [r0, #0xc]
	ands r1, r3
	strh r1, [r6, #0x22]
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r6, #0x24]
	mov r0, sp
	ldrh r1, [r0, #0x2e]
	lsrs r0, r1, #2
	strh r0, [r6, #0x26]
	movs r1, #0x80
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r5
	lsrs r0, r0, #0xd
	orrs r0, r1
	adds r1, r2, #0
	ands r1, r4
	lsrs r1, r1, #0xb
	orrs r1, r0
	ands r2, r3
	lsrs r2, r2, #9
	orrs r2, r1
	adds r0, r6, #0
	adds r0, #0x39
	strb r2, [r0]
	movs r2, #0
	movs r0, #0x1a
	add r0, sp
	mov sl, r0
	mov r1, sp
	adds r1, #0x21
	str r1, [sp, #0x34]
	mov r0, sp
	adds r0, #0x22
	str r0, [sp, #0x38]
	adds r1, #2
	str r1, [sp, #0x3c]
	adds r0, #0xf
	str r0, [sp, #0x40]
	adds r4, r6, #0
	adds r4, #0x28
	mov r3, sp
	adds r3, #0x12
_080A182C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A182C
	movs r2, #0
	adds r5, r6, #0
	adds r5, #0x42
	movs r1, #0x43
	adds r1, r1, r6
	mov ip, r1
	adds r7, r6, #0
	adds r7, #0x44
	movs r0, #0x45
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x40
	adds r1, r1, r6
	mov sb, r1
	adds r0, r6, #0
	adds r0, #0x46
	str r0, [sp, #0x44]
	adds r4, r6, #0
	adds r4, #0x32
	mov r3, sl
_080A1862:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1862
	mov r0, sp
	ldrb r0, [r0, #2]
	strb r0, [r5]
	ldr r1, [sp, #0x34]
	ldrb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	ldr r1, [sp, #0x38]
	ldrb r0, [r1]
	strb r0, [r7]
	ldr r1, [sp, #0x3c]
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #0x32]
	mov r1, sb
	strh r0, [r1]
	ldr r1, [sp, #0x40]
	ldrb r0, [r1]
	ldr r1, [sp, #0x44]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #0x11]
	strb r0, [r6, #0xa]
	ldrb r0, [r6, #9]
	cmp r0, #0x7f
	bne _080A18AC
	movs r0, #0xff
	strb r0, [r6, #9]
_080A18AC:
	ldrb r0, [r6, #0x10]
	cmp r0, #0x3f
	bne _080A18B6
	movs r0, #0xff
	strb r0, [r6, #0x10]
_080A18B6:
	ldrb r0, [r6, #0x11]
	cmp r0, #0x3f
	bne _080A18C0
	movs r0, #0xff
	strb r0, [r6, #0x11]
_080A18C0:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A18D0: .4byte 0x03005E70
_080A18D4: .4byte 0x00003FFF

	thumb_func_start WriteTraps
WriteTraps: @ 0x080A18D8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetTrap
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ReadTraps
ReadTraps: @ 0x080A18F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A1914 @ =0x03005E70
	movs r0, #0
	bl GetTrap
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	ldr r3, [r4]
	adds r0, r5, #0
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1914: .4byte 0x03005E70

	thumb_func_start GetLastSuspendSaveId
GetLastSuspendSaveId: @ 0x080A1918
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r0, sp
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A1930
	movs r0, #0
	b _080A1932
_080A1930:
	movs r0, #1
_080A1932:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start GetNextSuspendSaveId
GetNextSuspendSaveId: @ 0x080A1938
	push {lr}
	bl GetLastSuspendSaveId
	adds r1, r0, #0
	movs r0, #1
	subs r0, r0, r1
	pop {r1}
	bx r1

	thumb_func_start WriteSwappedSuspendSaveId
WriteSwappedSuspendSaveId: @ 0x080A1948
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r2, #0
	mov r1, sp
	adds r1, #0x63
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A1960
	movs r2, #1
_080A1960:
	strb r2, [r1]
	mov r0, sp
	bl WriteGlobalSaveInfoNoChecksum
	add sp, #0x64
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SramChecksum32
SramChecksum32: @ 0x080A1970
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _080A1990 @ =0x03005E70
	ldr r4, _080A1994 @ =0x02020140
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl Checksum32_thm
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A1990: .4byte 0x03005E70
_080A1994: .4byte 0x02020140

	thumb_func_start VerifySaveBlockChecksum
VerifySaveBlockChecksum: @ 0x080A1998
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl SramChecksum32
	ldr r1, [r4, #0xc]
	cmp r1, r0
	bne _080A19B4
	movs r0, #1
	b _080A19B6
_080A19B4:
	movs r0, #0
_080A19B6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start PopulateSaveBlockChecksum
PopulateSaveBlockChecksum: @ 0x080A19BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl SramChecksum32
	str r0, [r4, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A19D8
sub_080A19D8: @ 0x080A19D8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080A1AA0 @ =0x0202BD50
	movs r5, #0x33
_080A19E0:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A19F8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A19F8:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A19E0
	ldr r4, _080A1AA4 @ =0x0202CEC0
	movs r5, #0x31
_080A1A04:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A1A1C
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A1A1C:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A1A04
	ldr r4, _080A1AA8 @ =0x0202DCD0
	movs r5, #9
_080A1A28:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A1A40
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A1A40:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A1A28
	bl GetPermanentFlagBits
	adds r4, r0, #0
	bl sub_0807992C
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_08079930
	adds r4, r0, #0
	bl sub_08079938
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	bl GetTrap
	movs r1, #0x80
	lsls r1, r1, #1
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A1AA0: .4byte 0x0202BD50
_080A1AA4: .4byte 0x0202CEC0
_080A1AA8: .4byte 0x0202DCD0

	thumb_func_start sub_080A1AAC
sub_080A1AAC: @ 0x080A1AAC
	sub sp, #8
	add sp, #8
	bx lr
	.align 2, 0

	thumb_func_start sub_080A1AB4
sub_080A1AB4: @ 0x080A1AB4
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A1AC8
sub_080A1AC8: @ 0x080A1AC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	movs r0, #5
	bl GetSaveWriteAddr
	mov r8, r0
	add r0, sp, #0x50
	movs r4, #0
	strh r4, [r0]
	add r5, sp, #0x10
	ldr r2, _080A1BFC @ =0x01000012
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x52
	strh r4, [r0]
	add r4, sp, #0x34
	ldr r2, _080A1C00 @ =0x01000005
	adds r1, r4, #0
	bl CpuSet
	movs r7, #0
	mov sb, r5
	add r0, sp, #0x54
	mov sl, r0
	mov r1, sp
	adds r1, #0x40
	str r1, [sp, #0x58]
	mov r3, sp
	adds r3, #0x44
	str r3, [sp, #0x5c]
	mov r6, r8
_080A1B12:
	movs r0, #0xc8
	muls r0, r7, r0
	adds r0, #0x14
	mov r1, r8
	adds r4, r1, r0
	movs r5, #4
_080A1B1E:
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A1B1E
	add r0, sp, #0x34
	adds r1, r6, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	adds r6, #0xc8
	adds r7, #1
	cmp r7, #9
	ble _080A1B12
	movs r0, #7
	mov r3, sl
	strh r0, [r3]
	movs r1, #0xfa
	lsls r1, r1, #3
	add r1, r8
	mov r0, sl
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r6, [sp, #0x58]
	mov sl, r6
	ldr r0, _080A1C04 @ =0x0840F438
	movs r1, #3
	mov sb, r1
	ldr r5, _080A1C08 @ =0x000007D4
	add r5, r8
	adds r3, r0, #4
	mov r8, r3
	adds r4, r0, #0
	movs r7, #9
_080A1B6C:
	ldrb r3, [r4]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1e
	mov r6, sb
	ands r0, r6
	movs r1, #4
	rsbs r1, r1, #0
	adds r2, r1, #0
	mov r6, sl
	ldrb r6, [r6]
	ands r2, r6
	orrs r2, r0
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #2
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r2, r1
	orrs r2, r0
	movs r1, #0x10
	ands r1, r3
	movs r3, #0x11
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	mov r6, sl
	strb r2, [r6]
	ldr r2, [r4]
	lsrs r2, r2, #5
	lsls r2, r2, #5
	ldr r0, [sp, #0x40]
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0x40]
	mov r0, r8
	ldr r1, [sp, #0x5c]
	bl SioStrCpy
	mov r0, sl
	adds r1, r5, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r5, #0x10
	movs r0, #0x10
	add r8, r0
	adds r4, #0x10
	subs r7, #1
	cmp r7, #0
	bge _080A1B6C
	ldr r0, _080A1C0C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1BFC: .4byte 0x01000012
_080A1C00: .4byte 0x01000005
_080A1C04: .4byte 0x0840F438
_080A1C08: .4byte 0x000007D4
_080A1C0C: .4byte 0x00020112

	thumb_func_start sub_080A1C10
sub_080A1C10: @ 0x080A1C10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r2, _080A1C38 @ =0x03005E70
	movs r1, #0xc8
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	ldrb r0, [r5]
	cmp r0, #0
	beq _080A1C3C
	movs r0, #1
	b _080A1C3E
	.align 2, 0
_080A1C38: .4byte 0x03005E70
_080A1C3C:
	movs r0, #0
_080A1C3E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080A1C44
sub_080A1C44: @ 0x080A1C44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r2, _080A1C78 @ =0x03005E70
	movs r1, #0xc8
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r4, _080A1C7C @ =0x0203ECC8
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0xc8
	bl _call_via_r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A1C80
	adds r0, r4, #0
	adds r1, r5, #0
	bl SioStrCpy
	movs r0, #1
	b _080A1C82
	.align 2, 0
_080A1C78: .4byte 0x03005E70
_080A1C7C: .4byte 0x0203ECC8
_080A1C80:
	movs r0, #0
_080A1C82:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080A1C88
sub_080A1C88: @ 0x080A1C88
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r0, #0xc8
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	ldr r0, _080A1CC0 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CC0: .4byte 0x00020112

	thumb_func_start sub_080A1CC4
sub_080A1CC4: @ 0x080A1CC4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r1, #0
	strh r1, [r0]
	ldr r5, _080A1D0C @ =0x0203ECC8
	ldr r2, _080A1D10 @ =0x01000064
	adds r1, r5, #0
	bl CpuSet
	movs r0, #0xc8
	muls r0, r6, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1D14 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D0C: .4byte 0x0203ECC8
_080A1D10: .4byte 0x01000064
_080A1D14: .4byte 0x00020112

	thumb_func_start sub_080A1D18
sub_080A1D18: @ 0x080A1D18
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	ldr r1, _080A1D84 @ =0x03005E70
	movs r0, #0xc8
	mov r8, r0
	mov r0, r8
	muls r0, r6, r0
	adds r4, r4, r0
	ldr r6, _080A1D88 @ =0x0203ECC8
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xc8
	bl _call_via_r3
	mov r1, r8
	mov r0, sb
	muls r0, r1, r0
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1D8C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D84: .4byte 0x03005E70
_080A1D88: .4byte 0x0203ECC8
_080A1D8C: .4byte 0x00020112

	thumb_func_start sub_080A1D90
sub_080A1D90: @ 0x080A1D90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov sl, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r5, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r6, r0, #0
	ldr r0, _080A1E1C @ =0x03005E70
	mov sb, r0
	movs r4, #0xc8
	mov r7, r8
	muls r7, r4, r7
	adds r0, r5, r7
	mov r1, sb
	ldr r3, [r1]
	ldr r1, _080A1E20 @ =0x0203ECC8
	movs r2, #0xc8
	bl _call_via_r3
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	adds r5, r5, r4
	ldr r1, _080A1E24 @ =0x0203ED90
	mov r8, r1
	mov r0, sb
	ldr r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	adds r4, r6, r4
	ldr r0, _080A1E20 @ =0x0203ECC8
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	adds r6, r6, r7
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1E28 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E1C: .4byte 0x03005E70
_080A1E20: .4byte 0x0203ECC8
_080A1E24: .4byte 0x0203ED90
_080A1E28: .4byte 0x00020112

	thumb_func_start WriteMultiArenaSaveTeam
WriteMultiArenaSaveTeam: @ 0x080A1E2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	movs r0, #0xc8
	muls r4, r0, r4
	adds r1, r5, r4
	adds r0, r6, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	adds r4, #0x14
	adds r5, r5, r4
	mov r4, r8
	movs r6, #4
_080A1E58:
	adds r0, r4, #0
	adds r1, r5, #0
	bl WriteGameSavePackedUnit
	adds r5, #0x24
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _080A1E58
	ldr r0, _080A1E88 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E88: .4byte 0x00020112

	thumb_func_start sub_080A1E8C
sub_080A1E8C: @ 0x080A1E8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #5
	bl GetSaveReadAddr
	adds r7, r0, #0
	ldr r1, _080A1EE0 @ =0x03005E70
	movs r0, #0xc8
	mov r4, r8
	muls r4, r0, r4
	adds r0, r7, r4
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0xa
	bl _call_via_r3
	adds r4, #0x14
	adds r4, r7, r4
	movs r5, #4
_080A1EBA:
	adds r0, r4, #0
	adds r1, r6, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A1EBA
	movs r0, #0xc8
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A1EE4
	movs r0, #1
	b _080A1EE6
	.align 2, 0
_080A1EE0: .4byte 0x03005E70
_080A1EE4:
	movs r0, #0
_080A1EE6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080A1EF0
sub_080A1EF0: @ 0x080A1EF0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r0, _080A1F24 @ =0x000007D4
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xa0
	bl WriteAndVerifySramFast
	ldr r0, _080A1F28 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F24: .4byte 0x000007D4
_080A1F28: .4byte 0x00020112

	thumb_func_start sub_080A1F2C
sub_080A1F2C: @ 0x080A1F2C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r1, _080A1F4C @ =0x03005E70
	ldr r2, _080A1F50 @ =0x000007D4
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0xa0
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F4C: .4byte 0x03005E70
_080A1F50: .4byte 0x000007D4

	thumb_func_start sub_080A1F54
sub_080A1F54: @ 0x080A1F54
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r0, _080A1F8C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F8C: .4byte 0x00020112

	thumb_func_start sub_080A1F90
sub_080A1F90: @ 0x080A1F90
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r1, _080A1FB4 @ =0x03005E70
	movs r2, #0xfa
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #2
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1FB4: .4byte 0x03005E70

	thumb_func_start IsMultiArenaSaveReady
IsMultiArenaSaveReady: @ 0x080A1FB8
	push {r4, lr}
	sub sp, #0xc
	movs r0, #5
	bl sub_080A1AB4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A1FCE
	b _080A1FE6
_080A1FCA:
	movs r0, #1
	b _080A1FE8
_080A1FCE:
	movs r4, #0
_080A1FD0:
	adds r0, r4, #0
	mov r1, sp
	bl sub_080A1C44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080A1FCA
	adds r4, #1
	cmp r4, #9
	ble _080A1FD0
_080A1FE6:
	movs r0, #0
_080A1FE8:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetMinimapConnectKindAt
GetMinimapConnectKindAt: @ 0x080A1FF0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080A2040 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r0, r4
	ldrb r3, [r5]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2010
	movs r2, #1
_080A2010:
	lsls r2, r2, #1
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2020
	adds r2, #1
_080A2020:
	lsls r2, r2, #1
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _080A202A
	adds r2, #1
_080A202A:
	lsls r2, r2, #1
	subs r0, r5, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2036
	adds r2, #1
_080A2036:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2040: .4byte 0x0202E3E0

	thumb_func_start NormalizeSeaMinimapTerrain
NormalizeSeaMinimapTerrain: @ 0x080A2044
	cmp r0, #0x36
	beq _080A2056
	cmp r0, #0x36
	bgt _080A2052
	cmp r0, #0
	beq _080A2056
	b _080A2058
_080A2052:
	cmp r0, #0x3d
	bne _080A2058
_080A2056:
	movs r0, #0x15
_080A2058:
	bx lr
	.align 2, 0

	thumb_func_start GetMinimapSeaKindAt
GetMinimapSeaKindAt: @ 0x080A205C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A20EC @ =0x0202E3E0
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeSeaMinimapTerrain
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeSeaMinimapTerrain
	cmp r0, r7
	bne _080A2092
	movs r4, #1
_080A2092:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeSeaMinimapTerrain
	cmp r0, r7
	bne _080A20AC
	adds r4, #1
_080A20AC:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl NormalizeSeaMinimapTerrain
	cmp r0, r7
	bne _080A20C4
	adds r4, #1
_080A20C4:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl NormalizeSeaMinimapTerrain
	cmp r0, r7
	bne _080A20DE
	adds r4, #1
_080A20DE:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A20EC: .4byte 0x0202E3E0

	thumb_func_start NormalizeWaterMinimapTerrain
NormalizeWaterMinimapTerrain: @ 0x080A20F0
	cmp r0, #0x17
	beq _080A2106
	cmp r0, #0x17
	bgt _080A20FE
	cmp r0, #0
	beq _080A2106
	b _080A2108
_080A20FE:
	cmp r0, #0x1a
	beq _080A2106
	cmp r0, #0x3f
	bne _080A2108
_080A2106:
	movs r0, #0x3c
_080A2108:
	bx lr
	.align 2, 0

	thumb_func_start GetMinimapWaterKindAt
GetMinimapWaterKindAt: @ 0x080A210C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A219C @ =0x0202E3E0
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A2142
	movs r4, #1
_080A2142:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A215C
	adds r4, #1
_080A215C:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A2174
	adds r4, #1
_080A2174:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl NormalizeWaterMinimapTerrain
	cmp r0, r7
	bne _080A218E
	adds r4, #1
_080A218E:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A219C: .4byte 0x0202E3E0

	thumb_func_start GetMinimapRiverKindAt
GetMinimapRiverKindAt: @ 0x080A21A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	ldr r2, _080A2240 @ =0x0202E3E0
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A21CA
	cmp r0, #0x15
	beq _080A21CA
	cmp r0, #0x36
	beq _080A21CA
	cmp r0, #0x16
	beq _080A21CA
	cmp r0, #0x13
	bne _080A21CC
_080A21CA:
	adds r3, #1
_080A21CC:
	lsls r3, r3, #1
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, r1, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A21F0
	cmp r0, #0x15
	beq _080A21F0
	cmp r0, #0x36
	beq _080A21F0
	cmp r0, #0x16
	beq _080A21F0
	cmp r0, #0x13
	bne _080A21F2
_080A21F0:
	adds r3, #1
_080A21F2:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r0, [r0, #1]
	cmp r0, #0x10
	beq _080A2212
	cmp r0, #0x15
	beq _080A2212
	cmp r0, #0x36
	beq _080A2212
	cmp r0, #0x16
	beq _080A2212
	cmp r0, #0x13
	bne _080A2214
_080A2212:
	adds r3, #1
_080A2214:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A2236
	cmp r0, #0x15
	beq _080A2236
	cmp r0, #0x36
	beq _080A2236
	cmp r0, #0x16
	beq _080A2236
	cmp r0, #0x13
	bne _080A2238
_080A2236:
	adds r3, #1
_080A2238:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2240: .4byte 0x0202E3E0

	thumb_func_start GetMinimapCliffKindAt
GetMinimapCliffKindAt: @ 0x080A2244
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080A227C @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, r0, r4
	ldrb r3, [r2]
	subs r0, r2, #1
	ldrb r6, [r0]
	cmp r6, r3
	beq _080A2264
	ldrb r5, [r2, #1]
	cmp r5, r3
	bne _080A229E
_080A2264:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2278
	cmp r2, #0x36
	beq _080A2278
	cmp r2, #0x16
	bne _080A2280
_080A2278:
	movs r0, #4
	b _080A2364
	.align 2, 0
_080A227C: .4byte 0x0202E3E0
_080A2280:
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _080A2292
	cmp r0, #0x36
	beq _080A2292
	cmp r0, #0x16
	bne _080A2296
_080A2292:
	movs r0, #0
	b _080A2364
_080A2296:
	cmp r2, #0xf
	bne _080A2362
	movs r0, #0xc
	b _080A2364
_080A229E:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, r3
	beq _080A22B4
	ldr r0, [r1, #4]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _080A22E4
_080A22B4:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A22C2
	cmp r0, #0x36
	beq _080A22C2
	cmp r0, #0x16
	bne _080A22C6
_080A22C2:
	movs r0, #2
	b _080A2364
_080A22C6:
	adds r1, r6, #0
	cmp r1, #0x15
	beq _080A22D4
	cmp r1, #0x36
	beq _080A22D4
	cmp r1, #0x16
	bne _080A22D8
_080A22D4:
	movs r0, #6
	b _080A2364
_080A22D8:
	cmp r0, #0xf
	bne _080A22E0
	movs r0, #0xd
	b _080A2364
_080A22E0:
	movs r0, #9
	b _080A2364
_080A22E4:
	subs r0, r1, #1
	ldrb r5, [r0]
	cmp r5, r3
	beq _080A22F2
	ldrb r4, [r2, #1]
	cmp r4, r3
	bne _080A2324
_080A22F2:
	subs r0, r2, #1
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2302
	cmp r2, #0x36
	beq _080A2302
	cmp r2, #0x16
	bne _080A2306
_080A2302:
	movs r0, #5
	b _080A2364
_080A2306:
	ldrb r0, [r1, #1]
	cmp r0, #0x15
	beq _080A2314
	cmp r0, #0x36
	beq _080A2314
	cmp r0, #0x16
	bne _080A2318
_080A2314:
	movs r0, #1
	b _080A2364
_080A2318:
	cmp r2, #0xf
	bne _080A2320
	movs r0, #0xe
	b _080A2364
_080A2320:
	movs r0, #0xa
	b _080A2364
_080A2324:
	ldrb r1, [r1, #1]
	cmp r1, r3
	beq _080A2332
	subs r0, r2, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2362
_080A2332:
	adds r1, r4, #0
	cmp r1, #0x15
	beq _080A2340
	cmp r1, #0x36
	beq _080A2340
	cmp r1, #0x16
	bne _080A2344
_080A2340:
	movs r0, #3
	b _080A2364
_080A2344:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A2352
	cmp r0, #0x36
	beq _080A2352
	cmp r0, #0x16
	bne _080A2356
_080A2352:
	movs r0, #7
	b _080A2364
_080A2356:
	cmp r1, #0xf
	bne _080A235E
	movs r0, #0xf
	b _080A2364
_080A235E:
	movs r0, #0xb
	b _080A2364
_080A2362:
	movs r0, #8
_080A2364:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetMinimapStairTileAt
GetMinimapStairTileAt: @ 0x080A236C
	adds r2, r0, #0
	ldr r0, _080A23A4 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldr r0, [r1, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldr r0, [r1]
	adds r1, r2, r0
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldrb r1, [r1, #1]
	cmp r1, #0x2d
	bne _080A23A8
_080A239E:
	movs r0, #0x12
	b _080A23AA
	.align 2, 0
_080A23A4: .4byte 0x0202E3E0
_080A23A8:
	movs r0, #0x11
_080A23AA:
	bx lr

	thumb_func_start GetMinimapDoorTileAt
GetMinimapDoorTileAt: @ 0x080A23AC
	ldr r2, _080A23C4 @ =0x0202E3E0
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	cmp r1, #0x1e
	bne _080A23C8
	movs r0, #0x16
	b _080A23D6
	.align 2, 0
_080A23C4: .4byte 0x0202E3E0
_080A23C8:
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080A23D4
	movs r0, #7
	b _080A23D6
_080A23D4:
	movs r0, #0x17
_080A23D6:
	bx lr

	thumb_func_start GetMinimapBridgeKindAt
GetMinimapBridgeKindAt: @ 0x080A23D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _080A2420 @ =0x0202E3E0
	ldr r0, [r7]
	lsls r6, r1, #2
	adds r2, r6, r0
	ldr r0, [r2]
	adds r0, r4, r0
	ldrb r1, [r0, #1]
	cmp r1, #0x13
	beq _080A241C
	subs r0, #1
	ldrb r3, [r0]
	cmp r3, #0x13
	beq _080A241C
	ldr r0, [r2, #4]
	adds r0, r0, r4
	ldrb r5, [r0]
	cmp r5, #0x13
	beq _080A242C
	subs r0, r2, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x13
	beq _080A242C
	cmp r1, #0x10
	beq _080A242C
	cmp r3, #0x10
	beq _080A242C
	cmp r5, #0x10
	beq _080A241C
	cmp r0, #0x10
	bne _080A2424
_080A241C:
	movs r0, #0x10
	b _080A244C
	.align 2, 0
_080A2420: .4byte 0x0202E3E0
_080A2424:
	cmp r1, #0x16
	beq _080A242C
	cmp r3, #0x16
	bne _080A2430
_080A242C:
	movs r0, #0x18
	b _080A244C
_080A2430:
	ldr r0, [r7]
	adds r1, r6, r0
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _080A244A
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _080A244C
_080A244A:
	movs r0, #0x10
_080A244C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetMinimapTileAt
GetMinimapTileAt: @ 0x080A2454
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _080A2478 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x40
	bls _080A246E
	b _080A263A
_080A246E:
	lsls r0, r0, #2
	ldr r1, _080A247C @ =_080A2480
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A2478: .4byte 0x0202E3E0
_080A247C: .4byte _080A2480
_080A2480: @ jump table
	.4byte _080A263A @ case 0
	.4byte _080A2584 @ case 1
	.4byte _080A2588 @ case 2
	.4byte _080A2594 @ case 3
	.4byte _080A2594 @ case 4
	.4byte _080A2594 @ case 5
	.4byte _080A2598 @ case 6
	.4byte _080A2598 @ case 7
	.4byte _080A259C @ case 8
	.4byte _080A263A @ case 9
	.4byte _080A25A0 @ case 10
	.4byte _080A25A4 @ case 11
	.4byte _080A25A8 @ case 12
	.4byte _080A25AC @ case 13
	.4byte _080A25B0 @ case 14
	.4byte _080A25B0 @ case 15
	.4byte _080A25B4 @ case 16
	.4byte _080A25C0 @ case 17
	.4byte _080A25C4 @ case 18
	.4byte _080A25C8 @ case 19
	.4byte _080A263A @ case 20
	.4byte _080A25DE @ case 21
	.4byte _080A25DE @ case 22
	.4byte _080A25EA @ case 23
	.4byte _080A25EA @ case 24
	.4byte _080A262A @ case 25
	.4byte _080A262A @ case 26
	.4byte _080A262A @ case 27
	.4byte _080A262A @ case 28
	.4byte _080A25EE @ case 29
	.4byte _080A25F2 @ case 30
	.4byte _080A25FC @ case 31
	.4byte _080A2600 @ case 32
	.4byte _080A2600 @ case 33
	.4byte _080A262A @ case 34
	.4byte _080A263A @ case 35
	.4byte _080A263A @ case 36
	.4byte _080A2604 @ case 37
	.4byte _080A260C @ case 38
	.4byte _080A2618 @ case 39
	.4byte _080A2618 @ case 40
	.4byte _080A2618 @ case 41
	.4byte _080A261C @ case 42
	.4byte _080A262A @ case 43
	.4byte _080A262A @ case 44
	.4byte _080A2620 @ case 45
	.4byte _080A262A @ case 46
	.4byte _080A25DE @ case 47
	.4byte _080A263A @ case 48
	.4byte _080A2636 @ case 49
	.4byte _080A263A @ case 50
	.4byte _080A25A8 @ case 51
	.4byte _080A25C8 @ case 52
	.4byte _080A25DE @ case 53
	.4byte _080A25DE @ case 54
	.4byte _080A25A4 @ case 55
	.4byte _080A2594 @ case 56
	.4byte _080A262A @ case 57
	.4byte _080A260C @ case 58
	.4byte _080A2608 @ case 59
	.4byte _080A25D2 @ case 60
	.4byte _080A262A @ case 61
	.4byte _080A25EA @ case 62
	.4byte _080A262A @ case 63
	.4byte _080A262A @ case 64
_080A2584:
	movs r0, #1
	b _080A263C
_080A2588:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapConnectKindAt
	adds r0, #0x40
	b _080A263C
_080A2594:
	movs r0, #2
	b _080A263C
_080A2598:
	movs r0, #3
	b _080A263C
_080A259C:
	movs r0, #4
	b _080A263C
_080A25A0:
	movs r0, #5
	b _080A263C
_080A25A4:
	movs r0, #6
	b _080A263C
_080A25A8:
	movs r0, #8
	b _080A263C
_080A25AC:
	movs r0, #9
	b _080A263C
_080A25B0:
	movs r0, #0xa
	b _080A263C
_080A25B4:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapRiverKindAt
	adds r0, #0x60
	b _080A263C
_080A25C0:
	movs r0, #0xb
	b _080A263C
_080A25C4:
	movs r0, #0x14
	b _080A263C
_080A25C8:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapBridgeKindAt
	b _080A263C
_080A25D2:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapWaterKindAt
	adds r0, #0x30
	b _080A263C
_080A25DE:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapSeaKindAt
	adds r0, #0x30
	b _080A263C
_080A25EA:
	movs r0, #0xc
	b _080A263C
_080A25EE:
	movs r0, #0xd
	b _080A263C
_080A25F2:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapDoorTileAt
	b _080A263C
_080A25FC:
	movs r0, #0xe
	b _080A263C
_080A2600:
	movs r0, #0xf
	b _080A263C
_080A2604:
	movs r0, #0x1a
	b _080A263C
_080A2608:
	movs r0, #0x1b
	b _080A263C
_080A260C:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapCliffKindAt
	adds r0, #0x50
	b _080A263C
_080A2618:
	movs r0, #0x13
	b _080A263C
_080A261C:
	movs r0, #0x3a
	b _080A263C
_080A2620:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapStairTileAt
	b _080A263C
_080A262A:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapConnectKindAt
	adds r0, #0x20
	b _080A263C
_080A2636:
	movs r0, #0x19
	b _080A263C
_080A263A:
	movs r0, #0
_080A263C:
	pop {r1}
	bx r1

	thumb_func_start GetMinimapTerrainCellAt
GetMinimapTerrainCellAt: @ 0x080A2640
	push {lr}
	bl GetMinimapTileAt
	lsls r0, r0, #5
	ldr r1, _080A2650 @ =0x02020140
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080A2650: .4byte 0x02020140

	thumb_func_start GetMinimapObjectCellAt
GetMinimapObjectCellAt: @ 0x080A2654
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080A2688 @ =0x0840F950
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _080A268C @ =0x0202E3DC
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2694
	asrs r0, r0, #6
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080A2690 @ =0x02020140
	adds r0, r0, r1
	b _080A2696
	.align 2, 0
_080A2688: .4byte 0x0840F950
_080A268C: .4byte 0x0202E3DC
_080A2690: .4byte 0x02020140
_080A2694:
	ldr r0, _080A26A0 @ =0x02020140
_080A2696:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A26A0: .4byte 0x02020140

	thumb_func_start DrawMinimapInternal
DrawMinimapInternal: @ 0x080A26A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp]
	cmp r4, #0
	bne _080A26BA
	ldr r4, _080A26CC @ =0x06000020
_080A26BA:
	lsls r0, r4, #0xf
	lsrs r7, r0, #0x14
	ldr r0, [sp]
	cmp r0, #0
	bge _080A26C8
	movs r1, #3
	str r1, [sp]
_080A26C8:
	movs r2, #0
	b _080A289E
	.align 2, 0
_080A26CC: .4byte 0x06000020
_080A26D0:
	movs r6, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, r8
	adds r3, #2
	str r3, [sp, #0xc]
	cmp r6, r0
	blt _080A26E2
	b _080A289C
_080A26E2:
	movs r0, #1
	add r0, r8
	mov sb, r0
	mov r1, r8
	lsrs r0, r1, #0x1f
	add r0, r8
	asrs r0, r0, #1
	lsls r0, r0, #5
	str r0, [sp, #4]
	movs r2, #1
	mov sl, r2
_080A26F8:
	adds r0, r6, #0
	mov r1, r8
	bl GetMinimapTerrainCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl GetMinimapTerrainCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl GetMinimapTerrainCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl GetMinimapTerrainCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A28BC @ =0x02023460
	asrs r2, r6, #0x1f
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r3, [sp]
	lsls r0, r3, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
	ldr r0, _080A28C0 @ =0x0202E3DC
	ldr r1, [r0]
	mov r3, r8
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r0, [r3]
	adds r1, r0, r6
	ldrb r0, [r1]
	str r2, [sp, #8]
	cmp r0, #0
	bne _080A27D6
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _080A27D6
	ldr r0, [r3, #4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A27D6
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _080A288A
_080A27D6:
	adds r0, r6, #0
	mov r1, r8
	bl GetMinimapObjectCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl GetMinimapObjectCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl GetMinimapObjectCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl GetMinimapObjectCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A28C4 @ =0x02022C60
	ldr r2, [sp, #8]
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
_080A288A:
	movs r0, #2
	add sl, r0
	adds r6, #2
	ldr r0, _080A28C8 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r6, r0
	bge _080A289C
	b _080A26F8
_080A289C:
	ldr r2, [sp, #0xc]
_080A289E:
	mov r8, r2
	ldr r1, _080A28C8 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r8, r0
	bge _080A28AC
	b _080A26D0
_080A28AC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A28BC: .4byte 0x02023460
_080A28C0: .4byte 0x0202E3DC
_080A28C4: .4byte 0x02022C60
_080A28C8: .4byte 0x0202E3D8

	thumb_func_start sub_080A28CC
sub_080A28CC: @ 0x080A28CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A2908 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A28E4
	movs r0, #0xe6
	lsls r0, r0, #2
	bl m4aSongNumStart
_080A28E4:
	adds r0, r4, #0
	bl Minimap_InitProcVars
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	bl ApplyMinimapGraphics
	movs r0, #0
	adds r1, r4, #0
	bl DrawMinimapInternal
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2908: .4byte 0x0202BBF8

	thumb_func_start sub_080A290C
sub_080A290C: @ 0x080A290C
	ldr r0, _080A2938 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _080A293C @ =0x02000508
	cmp r1, #0xa0
	bls _080A2924
	ldr r0, _080A2940 @ =0x02000500
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_080A2924:
	ldr r2, _080A2944 @ =0x04000040
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_080A2938: .4byte 0x04000006
_080A293C: .4byte 0x02000508
_080A2940: .4byte 0x02000500
_080A2944: .4byte 0x04000040

	thumb_func_start sub_080A2948
sub_080A2948: @ 0x080A2948
	ldr r2, _080A2958 @ =0x02000500
	ldr r3, [r2]
	ldr r1, _080A295C @ =0x02000504
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_080A2958: .4byte 0x02000500
_080A295C: .4byte 0x02000504

	thumb_func_start sub_080A2960
sub_080A2960: @ 0x080A2960
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A2A60 @ =0x02000500
	ldr r2, _080A2A64 @ =0x02000280
	str r2, [r1]
	ldr r3, _080A2A68 @ =0x02000504
	ldr r4, _080A2A6C @ =0xFFFFFD80
	adds r1, r2, r4
	str r1, [r3]
	ldr r1, _080A2A70 @ =0x02000508
	str r2, [r1]
	ldr r7, _080A2A74 @ =0x03002870
	mov ip, r7
	movs r1, #0x20
	mov r8, r1
	mov r1, r8
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r1, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r3, ip
	strb r1, [r3, #1]
	movs r4, #0x34
	add r4, ip
	mov sb, r4
	movs r4, #1
	mov r7, sb
	ldrb r7, [r7]
	orrs r4, r7
	movs r1, #2
	orrs r4, r1
	movs r6, #4
	orrs r4, r6
	movs r5, #8
	orrs r4, r5
	movs r2, #0x10
	orrs r4, r2
	movs r1, #0x36
	add r1, ip
	mov sl, r1
	movs r3, #2
	rsbs r3, r3, #0
	ldrb r7, [r1]
	ands r3, r7
	movs r1, #3
	rsbs r1, r1, #0
	ands r3, r1
	orrs r3, r6
	orrs r3, r5
	orrs r3, r2
	mov r2, ip
	adds r2, #0x2d
	movs r5, #0
	movs r1, #0xf0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x31
	strb r5, [r1]
	subs r1, #5
	strb r5, [r1]
	adds r2, #3
	movs r1, #0xa0
	strb r1, [r2]
	mov r6, ip
	adds r6, #0x3c
	ldr r1, _080A2A78 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r1, r2
	movs r2, #0xc
	orrs r1, r2
	ldr r2, _080A2A7C @ =0x0000E0FF
	ands r1, r2
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r2, r7, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r2, #0x3d
	mov r1, r8
	ldrb r7, [r2]
	orrs r1, r7
	strb r1, [r2]
	movs r1, #0xc0
	ldrb r2, [r6]
	orrs r1, r2
	strb r1, [r6]
	mov r2, ip
	adds r2, #0x44
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x45
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	mov r7, r8
	orrs r4, r7
	mov r1, sb
	strb r4, [r1]
	subs r2, #0xf
	mov r1, r8
	ldrb r4, [r2]
	orrs r1, r4
	strb r1, [r2]
	orrs r3, r7
	mov r1, sl
	strb r3, [r1]
	adds r0, #0x4c
	strh r5, [r0]
	ldr r0, _080A2A80 @ =sub_080A290C
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A60: .4byte 0x02000500
_080A2A64: .4byte 0x02000280
_080A2A68: .4byte 0x02000504
_080A2A6C: .4byte 0xFFFFFD80
_080A2A70: .4byte 0x02000508
_080A2A74: .4byte 0x03002870
_080A2A78: .4byte 0x0000FFE0
_080A2A7C: .4byte 0x0000E0FF
_080A2A80: .4byte sub_080A290C

	thumb_func_start sub_080A2A84
sub_080A2A84: @ 0x080A2A84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r2, _080A2C24 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r6, [sp, #0x14]
	adds r6, #0x4c
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, #0
	bge _080A2ABC
	adds r1, #3
_080A2ABC:
	asrs r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl Interpolate
	adds r7, r0, #0
	adds r1, r7, #0
	cmp r7, #0
	bge _080A2AE0
	adds r1, r7, #3
_080A2AE0:
	asrs r1, r1, #2
	subs r1, #0x40
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	rsbs r5, r2, #0
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	rsbs r3, r4, #0
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A2C28 @ =0x02000504
	mov sl, r4
	ldr r2, _080A2C2C @ =0x080C5A48
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A2B22:
	mov r0, sb
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A2B22
	mov r3, sl
	ldr r0, [r3]
	bl sub_080133A8
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	bl sub_080A2948
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A2C14
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A2C14:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C24: .4byte 0x03002870
_080A2C28: .4byte 0x02000504
_080A2C2C: .4byte 0x080C5A48

	thumb_func_start sub_080A2C30
sub_080A2C30: @ 0x080A2C30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A2C94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2C46
	ldr r0, _080A2C98 @ =0x00000399
	bl m4aSongNumStart
_080A2C46:
	ldr r2, _080A2C9C @ =0x030028AC
	ldr r0, _080A2CA0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A2CA4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r5, [r2]
	orrs r0, r5
	strb r0, [r2]
	movs r3, #0
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
	ldr r0, _080A2CA8 @ =0x02000500
	ldr r1, _080A2CAC @ =0x02000280
	str r1, [r0]
	ldr r2, _080A2CB0 @ =0x02000504
	ldr r5, _080A2CB4 @ =0xFFFFFD80
	adds r0, r1, r5
	str r0, [r2]
	ldr r0, _080A2CB8 @ =0x02000508
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	strh r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C94: .4byte 0x0202BBF8
_080A2C98: .4byte 0x00000399
_080A2C9C: .4byte 0x030028AC
_080A2CA0: .4byte 0x0000FFE0
_080A2CA4: .4byte 0x0000E0FF
_080A2CA8: .4byte 0x02000500
_080A2CAC: .4byte 0x02000280
_080A2CB0: .4byte 0x02000504
_080A2CB4: .4byte 0xFFFFFD80
_080A2CB8: .4byte 0x02000508

	thumb_func_start sub_080A2CBC
sub_080A2CBC: @ 0x080A2CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r2, _080A2E60 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r6, [sp, #0x14]
	adds r6, #0x4c
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, #0
	bge _080A2CF4
	adds r1, #3
_080A2CF4:
	asrs r1, r1, #2
	movs r0, #4
	subs r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x46
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	bl Interpolate
	adds r7, r0, #0
	cmp r7, #0
	bge _080A2D1A
	adds r0, r7, #3
_080A2D1A:
	asrs r0, r0, #2
	movs r1, #0x40
	subs r1, r1, r0
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	rsbs r5, r2, #0
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	rsbs r3, r4, #0
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A2E64 @ =0x02000504
	mov sl, r4
	ldr r2, _080A2E68 @ =0x080C5A48
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A2D5E:
	mov r0, sb
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A2D5E
	mov r3, sl
	ldr r0, [r3]
	bl sub_080133A8
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	bl sub_080A2948
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A2E50
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A2E50:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E60: .4byte 0x03002870
_080A2E64: .4byte 0x02000504
_080A2E68: .4byte 0x080C5A48

	thumb_func_start ApplyMinimapGraphics
ApplyMinimapGraphics: @ 0x080A2E6C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080A2E76
	movs r4, #3
_080A2E76:
	ldr r0, _080A2E9C @ =0x0840F4D8
	ldr r1, _080A2EA0 @ =0x02020140
	bl Decompress
	ldr r0, _080A2EA4 @ =0x0840F8B0
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A2EA8 @ =0x0840F8D0
	adds r1, r4, #1
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E9C: .4byte 0x0840F4D8
_080A2EA0: .4byte 0x02020140
_080A2EA4: .4byte 0x0840F8B0
_080A2EA8: .4byte 0x0840F8D0

	thumb_func_start InitMinimapFlashPalette
InitMinimapFlashPalette: @ 0x080A2EAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A2F2C @ =0x0200050C
	ldr r0, _080A2F30 @ =0x02020140
	str r0, [r1]
	movs r2, #1
	ldr r0, _080A2F34 @ =0x02022860
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
	mov sb, r1
_080A2EC8:
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r5, r0, #0
	mov r1, r8
	ands r5, r1
	asrs r4, r0, #5
	ands r4, r1
	asrs r3, r0, #0xa
	ands r3, r1
	adds r0, r2, #1
	mov ip, r0
	lsls r6, r2, #1
	movs r7, #7
_080A2EE8:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r6, r0
	lsls r1, r3, #0xa
	lsls r2, r4, #5
	adds r1, r1, r2
	adds r1, r1, r5
	strh r1, [r0]
	adds r5, #3
	cmp r5, #0x1f
	ble _080A2F00
	movs r5, #0x1f
_080A2F00:
	adds r4, #3
	cmp r4, #0x1f
	ble _080A2F08
	movs r4, #0x1f
_080A2F08:
	adds r3, #3
	cmp r3, #0x1f
	ble _080A2F10
	movs r3, #0x1f
_080A2F10:
	adds r6, #0x20
	subs r7, #1
	cmp r7, #0
	bge _080A2EE8
	mov r2, ip
	cmp r2, #0xf
	ble _080A2EC8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2F2C: .4byte 0x0200050C
_080A2F30: .4byte 0x02020140
_080A2F34: .4byte 0x02022860

	thumb_func_start sub_080A2F38
sub_080A2F38: @ 0x080A2F38
	push {lr}
	sub sp, #0x10
	ldr r1, _080A2F6C @ =0x0840F953
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	add r0, sp
	ldr r1, _080A2F70 @ =0x0200050C
	ldrb r0, [r0]
	lsls r2, r0, #5
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A2F6C: .4byte 0x0840F953
_080A2F70: .4byte 0x0200050C

	thumb_func_start sub_080A2F74
sub_080A2F74: @ 0x080A2F74
	push {lr}
	sub sp, #0x20
	ldr r1, _080A2FB0 @ =0x0840F963
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	bl GetGameTime
	movs r1, #0x1f
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r3, [r0]
	adds r3, #0x10
	ldr r2, _080A2FB4 @ =0x02022860
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0x87
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
_080A2FB0: .4byte 0x0840F963
_080A2FB4: .4byte 0x02022860

	thumb_func_start Minimap_PutViewport
Minimap_PutViewport: @ 0x080A2FB8
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _080A2FFC @ =0x0840F984
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	ldr r3, _080A3000 @ =0x0202BBB8
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _080A2FD4
	adds r1, #3
_080A2FD4:
	asrs r1, r1, #2
	ldr r0, [r4, #0x3c]
	adds r2, r0, r1
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080A2FE4
	adds r0, #3
_080A2FE4:
	asrs r0, r0, #2
	ldr r1, [r4, #0x40]
	adds r1, r1, r0
	adds r0, r2, #0
	mov r2, sp
	movs r3, #0
	bl PutOamHiRam
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2FFC: .4byte 0x0840F984
_080A3000: .4byte 0x0202BBB8

	thumb_func_start sub_080A3004
sub_080A3004: @ 0x080A3004
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _080A3074 @ =0x0202E3D8
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r1, r0, #2
	movs r0, #0xa0
	subs r0, r0, r1
	asrs r4, r0, #1
	cmp r1, #0x90
	ble _080A3048
	adds r4, r1, #0
	subs r4, #0x90
	ldr r1, _080A3078 @ =0x0202BBB8
	ldrh r2, [r1, #0xe]
	lsls r0, r2, #0x10
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	bl __divsi3
	muls r0, r4, r0
	cmp r0, #0
	bge _080A3042
	ldr r1, _080A307C @ =0x0000FFFF
	adds r0, r0, r1
_080A3042:
	asrs r4, r0, #0x10
	movs r0, #8
	subs r4, r0, r4
_080A3048:
	str r5, [r6, #0x3c]
	str r4, [r6, #0x40]
	rsbs r5, r5, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3074: .4byte 0x0202E3D8
_080A3078: .4byte 0x0202BBB8
_080A307C: .4byte 0x0000FFFF

	thumb_func_start sub_080A3080
sub_080A3080: @ 0x080A3080
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r1, _080A3140 @ =0x0202BBB8
	movs r0, #0xc
	ldrsh r4, [r1, r0]
	movs r2, #0xe
	ldrsh r5, [r1, r2]
	movs r2, #0xf
	adds r0, r4, #0
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	bne _080A310A
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _080A310A
	str r0, [r3, #0x2c]
	str r0, [r3, #0x30]
	ldr r2, _080A3144 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080A30C2
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r3, #0x2c]
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A30C2:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r2, [r1, #4]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _080A30DC
	movs r0, #8
	str r0, [r3, #0x2c]
	adds r2, r3, #0
	adds r2, #0x4a
	movs r0, #1
	strh r0, [r2]
_080A30DC:
	movs r0, #0x40
	ldrh r6, [r6, #4]
	ands r0, r6
	cmp r0, #0
	beq _080A30F4
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r3, #0x30]
	adds r2, r3, #0
	adds r2, #0x4a
	movs r0, #1
	strh r0, [r2]
_080A30F4:
	movs r0, #0x80
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080A310A
	movs r0, #8
	str r0, [r3, #0x30]
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A310A:
	ldr r0, [r3, #0x2c]
	adds r4, r4, r0
	ldr r0, [r3, #0x30]
	adds r5, r5, r0
	cmp r4, #0
	bge _080A3118
	movs r4, #0
_080A3118:
	adds r1, r7, #0
	movs r2, #0x28
	ldrsh r0, [r1, r2]
	cmp r4, r0
	ble _080A3124
	adds r4, r0, #0
_080A3124:
	cmp r5, #0
	bge _080A312A
	movs r5, #0
_080A312A:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	cmp r5, r0
	ble _080A3134
	adds r5, r0, #0
_080A3134:
	strh r4, [r7, #0xc]
	strh r5, [r7, #0xe]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3140: .4byte 0x0202BBB8
_080A3144: .4byte 0x08B857F8

	thumb_func_start Minimap_InitProcVars
Minimap_InitProcVars: @ 0x080A3148
	adds r2, r0, #0
	adds r2, #0x4a
	movs r1, #0
	strh r1, [r2]
	ldr r2, _080A3164 @ =0x0202E3D8
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
_080A3164: .4byte 0x0202E3D8

	thumb_func_start Minimap_AdjustCursorOnClose
Minimap_AdjustCursorOnClose: @ 0x080A3168
	push {lr}
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080A3196
	ldr r1, _080A31A0 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080A3180
	adds r0, #0xf
_080A3180:
	asrs r0, r0, #4
	adds r0, #7
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bge _080A318E
	adds r1, #0xf
_080A318E:
	asrs r1, r1, #4
	adds r1, #5
	bl SetMapCursorPosition
_080A3196:
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080A31A0: .4byte 0x0202BBB8

	thumb_func_start sub_080A31A4
sub_080A31A4: @ 0x080A31A4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080A2F38
	adds r0, r4, #0
	bl sub_080A2F74
	adds r0, r4, #0
	bl sub_080A3004
	adds r0, r4, #0
	bl Minimap_PutViewport
	adds r0, r4, #0
	bl sub_080A3080
	ldr r0, _080A3208 @ =0x08B857F8
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #2
	ldrh r0, [r0, #4]
	ands r3, r0
	cmp r3, #0
	beq _080A3218
	ldr r2, _080A320C @ =0x030028AC
	ldr r0, _080A3210 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080A3214 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	movs r0, #8
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	b _080A3244
	.align 2, 0
_080A3208: .4byte 0x08B857F8
_080A320C: .4byte 0x030028AC
_080A3210: .4byte 0x0000FFE0
_080A3214: .4byte 0x0000E0FF
_080A3218:
	ldr r2, _080A326C @ =0x030028AC
	ldr r0, _080A3270 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A3274 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
_080A3244:
	ldr r0, _080A3278 @ =0x0202BBB8
	ldr r0, [r0, #0xc]
	ldr r1, _080A327C @ =0x000F000F
	ands r0, r1
	cmp r0, #0
	bne _080A3264
	ldr r0, _080A3280 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A3264
	adds r0, r4, #0
	bl Proc_Break
_080A3264:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A326C: .4byte 0x030028AC
_080A3270: .4byte 0x0000FFE0
_080A3274: .4byte 0x0000E0FF
_080A3278: .4byte 0x0202BBB8
_080A327C: .4byte 0x000F000F
_080A3280: .4byte 0x08B857F8

	thumb_func_start sub_080A3284
sub_080A3284: @ 0x080A3284
	push {lr}
	ldr r0, _080A3294 @ =0x08CE3B6C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080A3294: .4byte 0x08CE3B6C

	thumb_func_start DrawMinimap
DrawMinimap: @ 0x080A3298
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080A32CC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080A32D0 @ =0x02023460
	movs r1, #0
	bl TmFill
	adds r0, r5, #0
	bl InitChapterPreviewMap
	adds r0, r4, #0
	bl ApplyMinimapGraphics
	adds r0, r6, #0
	adds r1, r4, #0
	bl DrawMinimapInternal
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A32CC: .4byte 0x02022C60
_080A32D0: .4byte 0x02023460

	thumb_func_start SaveMenuOnHBlank
SaveMenuOnHBlank: @ 0x080A32D4
	push {lr}
	ldr r0, _080A3310 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080A32E6
	movs r2, #0
_080A32E6:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080A3342
	ldr r3, _080A3314 @ =0x02000000
	ldrb r0, [r3]
	cmp r2, r0
	bhs _080A3328
	ldr r0, _080A3318 @ =0x04000050
	movs r1, #0xc1
	strh r1, [r0]
	ldrb r0, [r3]
	cmp r0, #0
	beq _080A331C
	adds r1, r0, #0
	subs r0, r1, r2
	lsls r0, r0, #4
	bl __divsi3
	adds r1, r0, #0
	b _080A331E
	.align 2, 0
_080A3310: .4byte 0x04000006
_080A3314: .4byte 0x02000000
_080A3318: .4byte 0x04000050
_080A331C:
	movs r1, #0
_080A331E:
	ldr r0, _080A3324 @ =0x04000054
	strh r1, [r0]
	b _080A3342
	.align 2, 0
_080A3324: .4byte 0x04000054
_080A3328:
	ldr r1, _080A3348 @ =0x04000050
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080A334C @ =0x04000052
	ldr r1, _080A3350 @ =0x02000001
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_080A3342:
	pop {r0}
	bx r0
	.align 2, 0
_080A3348: .4byte 0x04000050
_080A334C: .4byte 0x04000052
_080A3350: .4byte 0x02000001

	thumb_func_start SaveMenu_HandleExtraMiscOption
SaveMenu_HandleExtraMiscOption: @ 0x080A3354
	push {lr}
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start SaveMenuIndexToValidBitfile
SaveMenuIndexToValidBitfile: @ 0x080A336C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A337A:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A3394
	cmp r5, r3
	bne _080A3392
	adds r0, r1, #0
	lsls r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080A339C
_080A3392:
	adds r3, #1
_080A3394:
	adds r2, #1
	cmp r2, #7
	ble _080A337A
	movs r0, #0xff
_080A339C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaveMenuGetBitfileByMask
SaveMenuGetBitfileByMask: @ 0x080A33A4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A33B4:
	adds r0, r5, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A33D0
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A33CE
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	b _080A33D8
_080A33CE:
	adds r3, #1
_080A33D0:
	adds r2, #1
	cmp r2, #7
	ble _080A33B4
	movs r0, #0xff
_080A33D8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BitfileToIndex
BitfileToIndex: @ 0x080A33E0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	movs r3, #1
_080A33E8:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _080A33F8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _080A3400
_080A33F8:
	adds r1, #1
	cmp r1, #7
	ble _080A33E8
	movs r0, #0xff
_080A3400:
	bx lr
	.align 2, 0

	thumb_func_start SaveMenu_StartHelpBox
SaveMenu_StartHelpBox: @ 0x080A3404
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A341A
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A3428
_080A341A:
	bl CloseHelpBox
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	b _080A3464
_080A3428:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0x10
	beq _080A3440
	cmp r1, #0x10
	bgt _080A343C
	cmp r1, #2
	beq _080A3440
	b _080A3464
_080A343C:
	cmp r1, #0x20
	bne _080A3464
_080A3440:
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3464
	adds r4, #0x3e
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A3464
	ldr r0, _080A346C @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r2, _080A3470 @ =0x000003B2
	movs r0, #0x30
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	movs r0, #1
	strb r0, [r4]
_080A3464:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A346C: .4byte 0x06013800
_080A3470: .4byte 0x000003B2

	thumb_func_start sub_080A3474
sub_080A3474: @ 0x080A3474
	push {r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3488
	movs r0, #0
	b _080A350E
_080A3488:
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r1, sp
	adds r1, #0x2b
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	bne _080A34B8
	ldr r1, _080A34B4 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	movs r0, #1
	b _080A350E
	.align 2, 0
_080A34B4: .4byte 0x0202BBF8
_080A34B8:
	ldr r2, _080A34D8 @ =0x0202BBF8
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r5, [r1]
	orrs r0, r5
	strb r0, [r1]
	add r0, sp, #0x20
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A34DC
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	b _080A34E0
	.align 2, 0
_080A34D8: .4byte 0x0202BBF8
_080A34DC:
	bl SetTacticianName
_080A34E0:
	ldr r2, _080A3518 @ =0x0202BBF8
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #0x1f
	adds r3, r2, #0
	adds r3, #0x2c
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r5, [r3]
	ands r0, r5
	orrs r0, r1
	strb r0, [r3]
	ldrb r4, [r4]
	lsrs r1, r4, #4
	adds r2, #0x2b
	lsls r1, r1, #4
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
_080A350E:
	add sp, #0x48
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A3518: .4byte 0x0202BBF8

	thumb_func_start SaveMenuPostChapterHandleHelpBox
SaveMenuPostChapterHandleHelpBox: @ 0x080A351C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	movs r6, #8
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A35C6
	adds r0, r2, #0
	adds r0, #0x40
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r0, #8
	bne _080A3554
	ldr r0, _080A3550 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf9
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A35B0
	bl CloseHelpBox
	movs r0, #7
	strb r0, [r5]
	b _080A35B0
	.align 2, 0
_080A3550: .4byte 0x08B857F8
_080A3554:
	ldr r0, _080A3588 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A35B0
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	bl sub_080A3474
	cmp r0, #0
	bne _080A3590
	ldr r0, _080A358C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A35B0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A35B0
	.align 2, 0
_080A3588: .4byte 0x08B857F8
_080A358C: .4byte 0x0202BBF8
_080A3590:
	cmp r0, #0
	blt _080A35B0
	cmp r0, #2
	bgt _080A35B0
	ldr r0, _080A35CC @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldrb r4, [r4]
	lsls r1, r4, #5
	adds r1, #0x2c
	ldr r2, _080A35D0 @ =0x0000FFFF
	movs r0, #0x48
	bl StartItemHelpBox
	strb r6, [r5]
_080A35B0:
	adds r1, r5, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A35C6
	cmp r0, r6
	bge _080A35C0
	subs r0, #1
	strb r0, [r1]
_080A35C0:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A35D4
_080A35C6:
	movs r0, #0
	b _080A35D6
	.align 2, 0
_080A35CC: .4byte 0x06013800
_080A35D0: .4byte 0x0000FFFF
_080A35D4:
	movs r0, #1
_080A35D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SaveMenuPutChapterTitle
SaveMenuPutChapterTitle: @ 0x080A35DC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xac
	lsls r0, r0, #4
	bl PutChapterTitleBG
	movs r4, #0
	ldr r6, _080A360C @ =0x0001FFFF
	movs r5, #0xb4
	lsls r5, r5, #9
_080A35F0:
	adds r0, r7, #0
	adds r0, #0x37
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A3610
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	ldrb r1, [r1]
	bl PutChapterTitleGfx
	b _080A361E
	.align 2, 0
_080A360C: .4byte 0x0001FFFF
_080A3610:
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl PutChapterTitleGfx
_080A361E:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #2
	ble _080A35F0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080A3630
sub_080A3630: @ 0x080A3630
	push {lr}
	ldr r0, _080A36A4 @ =0x08CE3C0C
	bl InitBgs
	bl ResetText
	ldr r2, _080A36A8 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x3f
	ldrb r1, [r2, #0x15]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	movs r0, #3
	ldrb r3, [r2, #0xc]
	orrs r0, r3
	strb r0, [r2, #0xc]
	adds r1, #0x1d
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	strb r0, [r2, #0x10]
	adds r0, r1, #0
	ldrb r3, [r2, #0x14]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_080A36A4: .4byte 0x08CE3C0C
_080A36A8: .4byte 0x03002870

	thumb_func_start ProcSaveMenu_InitScreen
ProcSaveMenu_InitScreen: @ 0x080A36AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A3888 @ =0x0840F9A0
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r4, _080A388C @ =0x08418E44
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A3890 @ =0x02022C60
	ldr r1, _080A3894 @ =0x0840FA00
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _080A3898 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r2, r5, #0
	bl ApplyPaletteExt
	ldr r0, _080A389C @ =0x084139F0
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A38A0 @ =0x08413A10
	ldr r1, _080A38A4 @ =0x02000004
	movs r2, #2
	bl sub_080A5130
	movs r0, #0xf
	bl EnableBgSync
	mov r0, r8
	adds r0, #0x29
	movs r4, #0
	strb r4, [r0]
	ldr r2, _080A38A8 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x35
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A38AC @ =0x084120A0
	ldr r1, _080A38B0 @ =0x06010800
	bl Decompress
	mov r0, r8
	adds r0, #0x36
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3d
	strb r4, [r0]
	bl sub_080A5FD0
	movs r7, #0
	ldr r2, _080A38B4 @ =0x080C5A48
	mov sl, r2
	mov sb, r5
_080A375E:
	ldr r1, _080A38B8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080A38B8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r7, #1
	cmp r7, #3
	ble _080A375E
	mov r1, r8
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #5
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3e
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	ldr r1, _080A38BC @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A38C0 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A38C4 @ =SaveMenuOnHBlank
	bl SetOnHBlankA
	ldr r4, _080A38C8 @ =0x0840FEB4
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A38CC @ =0x02024460
	ldr r1, _080A38D0 @ =0x08411F34
	movs r2, #0
	movs r3, #5
	bl sub_08001F3C
	movs r0, #8
	bl EnableBgSync
	movs r7, #0
	mov r4, r8
	adds r4, #0x2c
_080A381E:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	bl sub_080A6398
	adds r7, #1
	cmp r7, #3
	ble _080A381E
	ldrb r0, [r4]
	bl sub_080A649C
	bl sub_080A5EF0
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080A38A8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080A38D4 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	mov r0, r8
	bl SaveMenuPutChapterTitle
	mov r0, r8
	bl StartSaveDraw
	mov r2, r8
	str r0, [r2, #0x58]
	mov r0, r8
	bl StartSpinRotation
	mov r1, r8
	str r0, [r1, #0x5c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3888: .4byte 0x0840F9A0
_080A388C: .4byte 0x08418E44
_080A3890: .4byte 0x02022C60
_080A3894: .4byte 0x0840FA00
_080A3898: .4byte 0x084138F0
_080A389C: .4byte 0x084139F0
_080A38A0: .4byte 0x08413A10
_080A38A4: .4byte 0x02000004
_080A38A8: .4byte 0x03002870
_080A38AC: .4byte 0x084120A0
_080A38B0: .4byte 0x06010800
_080A38B4: .4byte 0x080C5A48
_080A38B8: .4byte 0x080C5AC8
_080A38BC: .4byte 0x02000000
_080A38C0: .4byte 0x02000001
_080A38C4: .4byte SaveMenuOnHBlank
_080A38C8: .4byte 0x0840FEB4
_080A38CC: .4byte 0x02024460
_080A38D0: .4byte 0x08411F34
_080A38D4: .4byte 0x02022860

	thumb_func_start SaveMenu_LoadExtraMenuGraphics
SaveMenu_LoadExtraMenuGraphics: @ 0x080A38D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080A3908 @ =0x084130A4
	ldr r1, _080A390C @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl sub_080A602C
	adds r6, r5, #0
	adds r6, #0x42
	ldrh r0, [r6]
	cmp r0, #0x20
	bne _080A3910
	movs r0, #0x20
	adds r1, r5, #0
	bl SaveMenuGetValidMenuAmt
	adds r1, r5, #0
	adds r1, #0x2b
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x2e
	b _080A393E
	.align 2, 0
_080A3908: .4byte 0x084130A4
_080A390C: .4byte 0x06013800
_080A3910:
	adds r4, r5, #0
	adds r4, #0x2e
	movs r1, #0
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0x2b
	strb r1, [r2]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x16
	ldrb r0, [r0]
	ldrb r1, [r2]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
_080A393E:
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A394C
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
_080A394C:
	ldrb r4, [r4]
	cmp r4, #5
	bne _080A395A
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
_080A395A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SaveMenuInit
SaveMenuInit: @ 0x080A3960
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl ReadLastGameSaveId
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SaveMenuInitUnused
SaveMenuInitUnused: @ 0x080A39A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl ReadLastGameSaveId
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SaveMenu_080A465C
SaveMenu_080A465C: @ 0x080A39E8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_080A39F8
sub_080A39F8: @ 0x080A39F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080A3A28 @ =0x08B857F8
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080A3A40
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A3A2C
	subs r0, #1
	b _080A3A5E
	.align 2, 0
_080A3A28: .4byte 0x08B857F8
_080A3A2C:
	adds r0, r2, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A3A9A
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	b _080A3A5E
_080A3A40:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A3A9A
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A3A7C
	adds r0, r2, #1
_080A3A5E:
	strb r0, [r1]
	ldr r0, _080A3A74 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3A9A
	ldr r0, _080A3A78 @ =0x00000386
	bl m4aSongNumStart
	b _080A3A9A
	.align 2, 0
_080A3A74: .4byte 0x0202BBF8
_080A3A78: .4byte 0x00000386
_080A3A7C:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A3A9A
	strb r4, [r1]
	ldr r0, _080A3AF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3A9A
	ldr r0, _080A3AF8 @ =0x00000386
	bl m4aSongNumStart
_080A3A9A:
	ldr r0, _080A3AFC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A3AAA
	b _080A3C3C
_080A3AAA:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x42
	strh r0, [r4]
	ldr r0, _080A3AF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3AD6
	ldr r0, _080A3B00 @ =0x0000038A
	bl m4aSongNumStart
_080A3AD6:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bls _080A3AE8
	b _080A3C68
_080A3AE8:
	lsls r0, r0, #2
	ldr r1, _080A3B04 @ =_080A3B08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A3AF4: .4byte 0x0202BBF8
_080A3AF8: .4byte 0x00000386
_080A3AFC: .4byte 0x08B857F8
_080A3B00: .4byte 0x0000038A
_080A3B04: .4byte _080A3B08
_080A3B08: @ jump table
	.4byte _080A3B88 @ case 0
	.4byte _080A3B94 @ case 1
	.4byte _080A3C68 @ case 2
	.4byte _080A3BAC @ case 3
	.4byte _080A3C68 @ case 4
	.4byte _080A3C68 @ case 5
	.4byte _080A3C68 @ case 6
	.4byte _080A3BC4 @ case 7
	.4byte _080A3C68 @ case 8
	.4byte _080A3C68 @ case 9
	.4byte _080A3C68 @ case 10
	.4byte _080A3C68 @ case 11
	.4byte _080A3C68 @ case 12
	.4byte _080A3C68 @ case 13
	.4byte _080A3C68 @ case 14
	.4byte _080A3BDC @ case 15
	.4byte _080A3C68 @ case 16
	.4byte _080A3C68 @ case 17
	.4byte _080A3C68 @ case 18
	.4byte _080A3C68 @ case 19
	.4byte _080A3C68 @ case 20
	.4byte _080A3C68 @ case 21
	.4byte _080A3C68 @ case 22
	.4byte _080A3C68 @ case 23
	.4byte _080A3C68 @ case 24
	.4byte _080A3C68 @ case 25
	.4byte _080A3C68 @ case 26
	.4byte _080A3C68 @ case 27
	.4byte _080A3C68 @ case 28
	.4byte _080A3C68 @ case 29
	.4byte _080A3C68 @ case 30
	.4byte _080A3C1E @ case 31
_080A3B88:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	subs r0, #0x13
	strb r1, [r0]
	b _080A3BFC
_080A3B94:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BAC:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BC4:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BDC:
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #1
	bl SaveMenuModifySaveSlot
	strb r0, [r4]
	bl sub_0809E9FC
	cmp r0, #0
	bne _080A3C06
	movs r0, #0
	movs r1, #0
	bl SaveMenu_SetDifficultyChoice
_080A3BFC:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080A3C68
_080A3C06:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A3C68
_080A3C1E:
	adds r1, r5, #0
	adds r1, #0x34
	adds r0, r5, #0
	adds r0, #0x33
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r2, r0
	blo _080A3C32
	movs r0, #0
	strb r0, [r1]
_080A3C32:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080A3C68
_080A3C3C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A3C68
	ldr r0, _080A3C70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3C56
	ldr r0, _080A3C74 @ =0x0000038B
	bl m4aSongNumStart
_080A3C56:
	adds r0, r5, #0
	movs r1, #0x12
	bl Proc_Goto
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_080A3C68:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3C70: .4byte 0x0202BBF8
_080A3C74: .4byte 0x0000038B

	thumb_func_start SaveMenuWriteNewGame
SaveMenuWriteNewGame: @ 0x080A3C78
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #1
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r4, [r1]
	rsbs r0, r4, #0
	orrs r0, r4
	lsrs r1, r0, #0x1f
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A3C96
	movs r2, #2
_080A3C96:
	cmp r0, #2
	bne _080A3C9C
	movs r2, #3
_080A3C9C:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl WriteNewGameSave
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A3CAC
sub_080A3CAC: @ 0x080A3CAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A3D5C
	ldr r0, _080A3CE4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3CCC
	ldr r0, _080A3CE8 @ =0x0000038A
	bl m4aSongNumStart
_080A3CCC:
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A3D32
	cmp r0, #8
	bgt _080A3CEC
	cmp r0, #2
	beq _080A3D44
	cmp r0, #4
	beq _080A3D00
	b _080A3D54
	.align 2, 0
_080A3CE4: .4byte 0x0202BBF8
_080A3CE8: .4byte 0x0000038A
_080A3CEC:
	cmp r0, #0x20
	beq _080A3D44
	cmp r0, #0x20
	bgt _080A3CFA
	cmp r0, #0x10
	beq _080A3D44
	b _080A3D54
_080A3CFA:
	cmp r0, #0x40
	beq _080A3D36
	b _080A3D54
_080A3D00:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080A3D1C
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl SaveMenuTryMoveSaveSlotCursor
	b _080A3E88
_080A3D1C:
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	bl CopyGameSave
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080A3E88
_080A3D32:
	movs r0, #2
	b _080A3D38
_080A3D36:
	movs r0, #1
_080A3D38:
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl SaveMenuDrawSubSelBox
	b _080A3D54
_080A3D44:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl SaveMenuDrawSubSelBox
_080A3D54:
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
	b _080A3E88
_080A3D5C:
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r0, [r5]
	cmp r0, #0x10
	beq _080A3DC8
	cmp r0, #0x10
	bgt _080A3D74
	cmp r0, #2
	beq _080A3D9A
	cmp r0, #8
	beq _080A3DD4
	b _080A3E7A
_080A3D74:
	cmp r0, #0x20
	beq _080A3D7E
	cmp r0, #0x40
	beq _080A3E24
	b _080A3E7A
_080A3D7E:
	cmp r1, #1
	bne _080A3E08
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl ReadGameSave
	adds r0, r4, #0
	movs r1, #0xe
	b _080A3DE6
_080A3D9A:
	cmp r1, #1
	bne _080A3E08
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _080A3DC0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3DB8
	ldr r0, _080A3DC4 @ =0x0000038A
	bl m4aSongNumStart
_080A3DB8:
	adds r0, r4, #0
	bl SaveMenu_HandleExtraMiscOption
	b _080A3E7A
	.align 2, 0
_080A3DC0: .4byte 0x0202BBF8
_080A3DC4: .4byte 0x0000038A
_080A3DC8:
	cmp r1, #1
	bne _080A3E08
	adds r0, r4, #0
	bl SaveMenuWriteNewGame
	b _080A3E32
_080A3DD4:
	cmp r1, #1
	bne _080A3E08
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_080A061C
	adds r0, r4, #0
	movs r1, #6
_080A3DE6:
	bl Proc_Goto
	ldr r0, _080A3E00 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E04 @ =0x0000038A
	bl m4aSongNumStart
	b _080A3E7A
	.align 2, 0
_080A3E00: .4byte 0x0202BBF8
_080A3E04: .4byte 0x0000038A
_080A3E08:
	ldr r0, _080A3E1C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E20 @ =0x0000038B
	bl m4aSongNumStart
	b _080A3E7A
	.align 2, 0
_080A3E1C: .4byte 0x0202BBF8
_080A3E20: .4byte 0x0000038B
_080A3E24:
	cmp r1, #1
	bne _080A3E54
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl WriteGameSave
_080A3E32:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A3E50 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	movs r0, #0xe0
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A3E7A
	.align 2, 0
_080A3E50: .4byte 0x0202BBF8
_080A3E54:
	adds r0, r4, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080A3E90 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E94 @ =0x0000038B
	bl m4aSongNumStart
_080A3E7A:
	adds r0, r4, #0
	movs r1, #0
	bl SaveMenuDrawSubSelBox
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
_080A3E88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3E90: .4byte 0x0202BBF8
_080A3E94: .4byte 0x0000038B

	thumb_func_start sub_080A3E98
sub_080A3E98: @ 0x080A3E98
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r0, r5, #0
	bl SaveMenuPostChapterHandleHelpBox
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3EB2
	b _080A40E4
_080A3EB2:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080A3F0C
	ldr r0, _080A3ED4 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A3ED8
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	b _080A3EE4
	.align 2, 0
_080A3ED4: .4byte 0x08B857F8
_080A3ED8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A3F70
	adds r0, r5, #0
	movs r1, #1
_080A3EE4:
	bl SaveMenuTryMoveSaveSlotCursor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3F70
	ldr r0, _080A3F04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F70
	ldr r0, _080A3F08 @ =0x00000386
	bl m4aSongNumStart
	b _080A3F70
	.align 2, 0
_080A3F04: .4byte 0x0202BBF8
_080A3F08: .4byte 0x00000386
_080A3F0C:
	ldr r0, _080A3F3C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A3F48
	cmp r1, #1
	beq _080A3F70
	movs r0, #1
	strb r0, [r4]
	ldr r0, _080A3F40 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F34
	ldr r0, _080A3F44 @ =0x00000387
	bl m4aSongNumStart
_080A3F34:
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
	b _080A3F70
	.align 2, 0
_080A3F3C: .4byte 0x08B857F8
_080A3F40: .4byte 0x0202BBF8
_080A3F44: .4byte 0x00000387
_080A3F48:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A3F70
	cmp r1, #2
	beq _080A3F70
	movs r0, #2
	strb r0, [r4]
	ldr r0, _080A3FA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F6A
	ldr r0, _080A3FA8 @ =0x00000387
	bl m4aSongNumStart
_080A3F6A:
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
_080A3F70:
	ldr r0, _080A3FAC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A4060
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A4028
	cmp r0, #8
	bgt _080A3FB6
	cmp r0, #2
	beq _080A3FCA
	cmp r0, #2
	bgt _080A3FB0
	cmp r0, #1
	beq _080A3FE8
	b _080A40E4
	.align 2, 0
_080A3FA4: .4byte 0x0202BBF8
_080A3FA8: .4byte 0x00000387
_080A3FAC: .4byte 0x08B857F8
_080A3FB0:
	cmp r0, #4
	beq _080A4028
	b _080A40E4
_080A3FB6:
	cmp r0, #0x40
	beq _080A4028
	cmp r0, #0x40
	bgt _080A3FC4
	cmp r0, #0x10
	beq _080A400C
	b _080A40E4
_080A3FC4:
	cmp r0, #0x80
	beq _080A3FD6
	b _080A40E4
_080A3FCA:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A4028
	b _080A3FE8
_080A3FD6:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A3FE8
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
_080A3FE8:
	ldr r0, _080A4004 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3FFA
	ldr r0, _080A4008 @ =0x0000038A
	bl m4aSongNumStart
_080A3FFA:
	adds r0, r5, #0
	bl SaveMenu_HandleExtraMiscOption
	b _080A40E4
	.align 2, 0
_080A4004: .4byte 0x0202BBF8
_080A4008: .4byte 0x0000038A
_080A400C:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4038
	ldr r0, _080A4030 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4028
	ldr r0, _080A4034 @ =0x0000038A
	bl m4aSongNumStart
_080A4028:
	adds r0, r5, #0
	bl sub_080A3CAC
	b _080A40E4
	.align 2, 0
_080A4030: .4byte 0x0202BBF8
_080A4034: .4byte 0x0000038A
_080A4038:
	adds r0, r5, #0
	bl SaveMenuWriteNewGame
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A405C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A40E4
	movs r0, #0xe0
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A40E4
	.align 2, 0
_080A405C: .4byte 0x0202BBF8
_080A4060:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A40E4
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	ldr r0, _080A4098 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4080
	ldr r0, _080A409C @ =0x0000038B
	bl m4aSongNumStart
_080A4080:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A40A0
	adds r0, r5, #0
	movs r1, #0
	bl SaveMenuDrawSubSelBox
	adds r0, r5, #0
	bl SaveMenu_StartHelpBox
	b _080A40E4
	.align 2, 0
_080A4098: .4byte 0x0202BBF8
_080A409C: .4byte 0x0000038B
_080A40A0:
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A40B8
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A40E4
_080A40B8:
	adds r4, r5, #0
	adds r4, #0x42
	movs r0, #0xc0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080A40DC
	adds r0, r5, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	b _080A40E4
_080A40DC:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080A40E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A40EC
sub_080A40EC: @ 0x080A40EC
	push {lr}
	bl sub_080A3CAC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SaveMenuRegisterSlotSelected
SaveMenuRegisterSlotSelected: @ 0x080A40F8
	adds r3, r0, #0
	adds r3, #0x2e
	movs r2, #0
	movs r1, #6
	strb r1, [r3]
	adds r0, #0x29
	strb r2, [r0]
	bx lr

	thumb_func_start sub_080A4108
sub_080A4108: @ 0x080A4108
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	cmp r0, #8
	bne _080A4180
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_080A6398
	movs r0, #4
	adds r1, r7, #0
	bl sub_080A6398
	ldrb r1, [r4]
	adds r0, r7, #0
	adds r0, #0x37
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080A415C
	lsls r0, r1, #0xb
	movs r1, #0xb4
	lsls r1, r1, #9
	adds r0, r0, r1
	ldr r1, _080A4158 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	ldrb r1, [r2]
	bl PutChapterTitleGfx
	b _080A4172
	.align 2, 0
_080A4158: .4byte 0x0001FFFF
_080A415C:
	lsls r0, r1, #0xb
	movs r2, #0xb4
	lsls r2, r2, #9
	adds r0, r0, r2
	ldr r1, _080A417C @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl PutChapterTitleGfx
_080A4172:
	ldrb r0, [r4]
	bl sub_080A649C
	b _080A4248
	.align 2, 0
_080A417C: .4byte 0x0001FFFF
_080A4180:
	cmp r0, #0x20
	bne _080A41F6
	adds r0, r7, #0
	bl sub_080A602C
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _080A41AA
	adds r0, r7, #0
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A4248
_080A41AA:
	cmp r0, #0x40
	bne _080A41B8
	adds r0, r7, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080A4248
_080A41B8:
	adds r0, r7, #0
	bl sub_080A6220
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4248
	adds r2, r7, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A41DC
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A41EC
_080A41DC:
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	strb r0, [r4]
_080A41EC:
	adds r0, r7, #0
	movs r1, #5
	bl Proc_Goto
	b _080A4248
_080A41F6:
	cmp r0, #0x30
	bne _080A4248
	adds r0, r7, #0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x2d
	movs r0, #0xff
	strb r0, [r2]
	strb r1, [r3]
	adds r0, r7, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, #5
	ldrb r0, [r0]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, _080A4240 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4236
	ldr r0, _080A4244 @ =0x0000038B
	bl m4aSongNumStart
_080A4236:
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _080A43CC
	.align 2, 0
_080A4240: .4byte 0x0202BBF8
_080A4244: .4byte 0x0000038B
_080A4248:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0x10
	bne _080A42C0
	ldr r4, _080A42BC @ =0x080C5A48
	movs r3, #0x80
	adds r3, r3, r4
	mov sb, r3
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	b _080A4338
	.align 2, 0
_080A42BC: .4byte 0x080C5A48
_080A42C0:
	cmp r1, #7
	bhi _080A4348
	ldr r4, _080A4344 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, r6, r1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	adds r1, r6, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r6, r6, r1
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
_080A4338:
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _080A43C4
	.align 2, 0
_080A4344: .4byte 0x080C5A48
_080A4348:
	cmp r1, #0xf
	bhi _080A43C4
	ldr r4, _080A43DC @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, #0xe0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r1, #0xe0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_080A43C4:
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A43CC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A43DC: .4byte 0x080C5A48

	thumb_func_start sub_080A43E0
sub_080A43E0: @ 0x080A43E0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0x24
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A4422
	adds r0, r5, #0
	bl Proc_Break
_080A4422:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4428
sub_080A4428: @ 0x080A4428
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #4
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A446A
	ldr r0, _080A4470 @ =0x084130A4
	ldr r1, _080A4474 @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl Proc_Break
_080A446A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4470: .4byte 0x084130A4
_080A4474: .4byte 0x06013800

	thumb_func_start sub_080A4478
sub_080A4478: @ 0x080A4478
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r1, #0xdc
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A44B8
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A44B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A44C0
sub_080A44C0: @ 0x080A44C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A44FC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080A44FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A4504
sub_080A4504: @ 0x080A4504
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xc
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	adds r1, #0x24
	subs r0, #0x17
	strb r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A454E
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_080A454E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4554
sub_080A4554: @ 0x080A4554
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xd
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r0, #0xdc
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, #0x24
	subs r1, #0x17
	strb r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A4598
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A4598:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A45A0
sub_080A45A0: @ 0x080A45A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r7, [r2]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A45E4 @ =0x08B857F8
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A45E8
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A45DE
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A4612
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
_080A45DE:
	subs r0, #1
	strb r0, [r2]
	b _080A4612
	.align 2, 0
_080A45E4: .4byte 0x08B857F8
_080A45E8:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A4612
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A4606
	adds r0, r1, #1
	strb r0, [r2]
	b _080A4612
_080A4606:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A4612
	strb r5, [r2]
_080A4612:
	adds r0, r4, #0
	adds r0, #0x34
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r7, r0
	beq _080A4630
	ldr r0, _080A4680 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4630
	ldr r0, _080A4684 @ =0x00000386
	bl m4aSongNumStart
_080A4630:
	ldr r0, _080A4688 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A4712
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	ldrb r1, [r5]
	bl SaveMenuIndexToValidBitfile
	adds r5, r4, #0
	adds r5, #0x35
	movs r6, #0
	strb r0, [r5]
	ldr r0, _080A4680 @ =0x0202BBF8
	adds r7, r0, #0
	adds r7, #0x41
	ldrb r1, [r7]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _080A4666
	ldr r0, _080A468C @ =0x0000038A
	bl m4aSongNumStart
_080A4666:
	adds r0, r4, #0
	adds r0, #0x29
	strb r6, [r0]
	ldrb r0, [r5]
	cmp r0, #8
	beq _080A46DE
	cmp r0, #8
	bgt _080A4690
	cmp r0, #2
	beq _080A46D4
	cmp r0, #4
	beq _080A46E8
	b _080A4702
	.align 2, 0
_080A4680: .4byte 0x0202BBF8
_080A4684: .4byte 0x00000386
_080A4688: .4byte 0x08B857F8
_080A468C: .4byte 0x0000038A
_080A4690:
	cmp r0, #0x20
	beq _080A4698
	cmp r0, #0x40
	bne _080A4702
_080A4698:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A474C
	ldrb r7, [r7]
	lsls r0, r7, #0x1e
	cmp r0, #0
	blt _080A46C4
	ldr r0, _080A46D0 @ =0x0000038A
	bl m4aSongNumStart
_080A46C4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080A473A
	.align 2, 0
_080A46D0: .4byte 0x0000038A
_080A46D4:
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	b _080A46F2
_080A46DE:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x29
	b _080A46F0
_080A46E8:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x30
_080A46F0:
	movs r1, #0xc0
_080A46F2:
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A473A
_080A4702:
	adds r0, r4, #0
	bl SaveMenu_HandleExtraMiscOption
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080A473A
_080A4712:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A473A
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r0, _080A4744 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A473A
	ldr r0, _080A4748 @ =0x0000038B
	bl m4aSongNumStart
_080A473A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4744: .4byte 0x0202BBF8
_080A4748: .4byte 0x0000038B

	thumb_func_start sub_080A474C
sub_080A474C: @ 0x080A474C
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r4, [r2]
	cmp r4, #2
	bls _080A475E
	movs r0, #0
	strb r0, [r2]
_080A475E:
	cmp r1, #0
	bne _080A4766
_080A4762:
	movs r0, #1
	b _080A47AE
_080A4766:
	cmp r1, #0
	ble _080A4778
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080A4774
	adds r0, #1
	b _080A4784
_080A4774:
	movs r0, #0
	b _080A4784
_080A4778:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A4782
	movs r0, #2
	b _080A4784
_080A4782:
	subs r0, #1
_080A4784:
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r4, r0
	beq _080A47AC
	ldr r0, _080A47A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4762
	ldr r0, _080A47A8 @ =0x00000386
	bl m4aSongNumStart
	b _080A4762
	.align 2, 0
_080A47A4: .4byte 0x0202BBF8
_080A47A8: .4byte 0x00000386
_080A47AC:
	movs r0, #0
_080A47AE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A47B4
sub_080A47B4: @ 0x080A47B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A47E4 @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBoxExt_Unk
	ldr r0, _080A47E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A47DE
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080A47DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A47E4: .4byte 0x06013800
_080A47E8: .4byte 0x0202BBF8

	thumb_func_start sub_080A47EC
sub_080A47EC: @ 0x080A47EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A4820 @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _080A4824 @ =0x00000103
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A481A
	ldr r0, _080A4828 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4810
	ldr r0, _080A482C @ =0x00000391
	bl m4aSongNumStart
_080A4810:
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_080A481A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4820: .4byte 0x08B857F8
_080A4824: .4byte 0x00000103
_080A4828: .4byte 0x0202BBF8
_080A482C: .4byte 0x00000391

	thumb_func_start sub_080A4830
sub_080A4830: @ 0x080A4830
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080A484C @ =0x08CE3C24
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A484C: .4byte 0x08CE3C24

	thumb_func_start sub_080A4850
sub_080A4850: @ 0x080A4850
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x36
	ldrb r1, [r3]
	cmp r1, #0
	bne _080A4896
	ldr r0, _080A4880 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A4884
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_080A474C
	b _080A48EE
	.align 2, 0
_080A4880: .4byte 0x08B857F8
_080A4884:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A48EE
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A474C
	b _080A48EE
_080A4896:
	ldr r0, _080A48C0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A48CC
	cmp r1, #1
	beq _080A48EE
	movs r0, #1
	strb r0, [r3]
	ldr r0, _080A48C4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A48EE
	ldr r0, _080A48C8 @ =0x00000387
	bl m4aSongNumStart
	b _080A48EE
	.align 2, 0
_080A48C0: .4byte 0x08B857F8
_080A48C4: .4byte 0x0202BBF8
_080A48C8: .4byte 0x00000387
_080A48CC:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A48EE
	cmp r1, #2
	beq _080A48EE
	movs r0, #2
	strb r0, [r3]
	ldr r0, _080A4930 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A48EE
	ldr r0, _080A4934 @ =0x00000387
	bl m4aSongNumStart
_080A48EE:
	ldr r0, _080A4938 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A49AC
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _080A4946
	cmp r0, #0x40
	bne _080A49FE
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	adds r0, r3, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A493C
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4966
	b _080A4990
	.align 2, 0
_080A4930: .4byte 0x0202BBF8
_080A4934: .4byte 0x00000387
_080A4938: .4byte 0x08B857F8
_080A493C:
	movs r2, #0xed
	lsls r2, r2, #3
	movs r0, #0x40
	movs r1, #0x30
	b _080A499E
_080A4946:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A4998
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A4990
_080A4966:
	adds r0, r2, #0
	bl ReadGameSave
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	ldr r0, _080A4988 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A49FE
	ldr r0, _080A498C @ =0x0000038A
	bl m4aSongNumStart
	b _080A49FE
	.align 2, 0
_080A4988: .4byte 0x0202BBF8
_080A498C: .4byte 0x0000038A
_080A4990:
	adds r0, r4, #0
	bl sub_080A3CAC
	b _080A49FE
_080A4998:
	ldr r2, _080A49A8 @ =0x00000767
	movs r0, #0x2e
	movs r1, #0x38
_080A499E:
	adds r3, r4, #0
	bl sub_080A4830
	b _080A49FE
	.align 2, 0
_080A49A8: .4byte 0x00000767
_080A49AC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A49FE
	ldr r0, _080A49E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A49C6
	ldr r0, _080A49E4 @ =0x0000038B
	bl m4aSongNumStart
_080A49C6:
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r5, [r0]
	cmp r5, #0
	beq _080A49E8
	adds r0, r4, #0
	movs r1, #0
	bl SaveMenuDrawSubSelBox
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
	b _080A49FE
	.align 2, 0
_080A49E0: .4byte 0x0202BBF8
_080A49E4: .4byte 0x0000038B
_080A49E8:
	ldr r0, _080A4A04 @ =0x084130A4
	ldr r1, _080A4A08 @ =0x06013800
	bl Decompress
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_080A49FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4A04: .4byte 0x084130A4
_080A4A08: .4byte 0x06013800

	thumb_func_start sub_080A4A0C
sub_080A4A0C: @ 0x080A4A0C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	movs r2, #2
	bl StartSqMask
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4A24
sub_080A4A24: @ 0x080A4A24
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A4A32
	bl EndSpriteAnimProc
_080A4A32:
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r2, [r5]
	cmp r2, #0x20
	bne _080A4A60
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A4AD6
	movs r0, #6
	bl SetNextGameAction
	b _080A4AD6
_080A4A60:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080A4AD6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080A4A98
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _080A4A90
	movs r0, #0xb
	bl SetNextGameAction
	b _080A4AD6
_080A4A90:
	movs r0, #5
	bl SetNextGameAction
	b _080A4AD6
_080A4A98:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A4AAE
	movs r0, #3
	bl ReadSuspendSave
	movs r0, #4
	bl SetNextGameAction
	b _080A4AD6
_080A4AAE:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0
	beq _080A4AC8
	adds r4, #0x2c
	ldrb r0, [r4]
	bl ReadGameSave
	ldrb r0, [r4]
	adds r0, #1
	bl SetNextGameAction
	b _080A4AD6
_080A4AC8:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A4AD6
	movs r0, #0
	bl SetNextGameAction
_080A4AD6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4ADC
sub_080A4ADC: @ 0x080A4ADC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0x20
	strh r0, [r1]
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A4B04
	bl EndSpriteAnimProc
_080A4B04:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #4
	beq _080A4B30
	cmp r0, #4
	bgt _080A4B18
	cmp r0, #2
	beq _080A4B28
	b _080A4B40
_080A4B18:
	cmp r0, #8
	beq _080A4B38
	cmp r0, #0x20
	bne _080A4B40
	adds r0, r4, #0
	bl sub_080ADAF8
	b _080A4B40
_080A4B28:
	adds r0, r4, #0
	bl sub_080AC2AC
	b _080A4B40
_080A4B30:
	adds r0, r4, #0
	bl sub_0809BE68
	b _080A4B40
_080A4B38:
	ldr r0, _080A4B48 @ =0x08CC51D0
	adds r1, r4, #0
	bl Proc_StartBlocking
_080A4B40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B48: .4byte 0x08CC51D0

	thumb_func_start SaveMenuPostExtraMiscScreen
SaveMenuPostExtraMiscScreen: @ 0x080A4B4C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #4
	beq _080A4B72
	cmp r1, #4
	bgt _080A4B62
	cmp r1, #2
	beq _080A4B72
	b _080A4B78
_080A4B62:
	cmp r1, #8
	beq _080A4B72
	cmp r1, #0x20
	bne _080A4B78
	movs r1, #0xb
	bl Proc_Goto
	b _080A4B78
_080A4B72:
	movs r1, #0xa
	bl Proc_Goto
_080A4B78:
	pop {r0}
	bx r0

	thumb_func_start sub_080A4B7C
sub_080A4B7C: @ 0x080A4B7C
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r2, _080A4BD4 @ =0x03002870
	movs r0, #0x20
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080A4BD4: .4byte 0x03002870

	thumb_func_start sub_080A4BD8
sub_080A4BD8: @ 0x080A4BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r4, [r0]
	adds r4, #1
	strb r4, [r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080A4BF6
	adds r0, #0xff
_080A4BF6:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080A4C30 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x50
	subs r0, r0, r2
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r2, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080A4C2A
	adds r0, r5, #0
	bl Proc_Break
_080A4C2A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4C30: .4byte 0x03002870

	thumb_func_start sub_080A4C34
sub_080A4C34: @ 0x080A4C34
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r4, [r0]
	adds r4, #1
	strb r4, [r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080A4C52
	adds r0, #0xff
_080A4C52:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080A4C90 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080A4C8A
	adds r0, r5, #0
	bl Proc_Break
_080A4C8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4C90: .4byte 0x03002870

	thumb_func_start sub_080A4C94
sub_080A4C94: @ 0x080A4C94
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080A4D2C @ =0x02023460
	movs r1, #0
	bl TmFill
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A4D30 @ =0x084130A4
	ldr r1, _080A4D34 @ =0x06013800
	bl Decompress
	ldr r0, _080A4D38 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080A4D3C @ =0x084120A0
	ldr r1, _080A4D40 @ =0x06010800
	bl Decompress
	ldr r0, _080A4D44 @ =0x02022C60
	ldr r1, _080A4D48 @ =0x0840FA00
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r1, _080A4D4C @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A4D50 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	bl sub_080A5EF0
	adds r0, r4, #0
	bl SaveMenuPutChapterTitle
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_080A649C
	movs r0, #0xc
	bl Proc_UnblockEachMarked
	movs r0, #0xd
	bl Proc_UnblockEachMarked
	movs r0, #3
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	beq _080A4D24
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xdc
	strb r0, [r1]
_080A4D24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4D2C: .4byte 0x02023460
_080A4D30: .4byte 0x084130A4
_080A4D34: .4byte 0x06013800
_080A4D38: .4byte 0x084138F0
_080A4D3C: .4byte 0x084120A0
_080A4D40: .4byte 0x06010800
_080A4D44: .4byte 0x02022C60
_080A4D48: .4byte 0x0840FA00
_080A4D4C: .4byte 0x02000000
_080A4D50: .4byte 0x02000001

	thumb_func_start sub_080A4D54
sub_080A4D54: @ 0x080A4D54
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	cmp r1, #3
	bne _080A4D68
	movs r1, #2
	bl Proc_Goto
	b _080A4D6E
_080A4D68:
	movs r1, #5
	bl Proc_Goto
_080A4D6E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A4D74
sub_080A4D74: @ 0x080A4D74
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A4D8E
	movs r0, #0xc0
	movs r1, #8
	bl StartHelpPromptSprite
_080A4D8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A4D94
sub_080A4D94: @ 0x080A4D94
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #0x20
	bne _080A4DA4
	bl sub_080A511C
_080A4DA4:
	pop {r0}
	bx r0

	thumb_func_start sub_080A4DA8
sub_080A4DA8: @ 0x080A4DA8
	push {lr}
	bl EndHelpPromptSprite
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartMainMenu
StartMainMenu: @ 0x080A4DB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4DE4 @ =0x08CE3C54
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x42
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	adds r0, #0x35
	strb r2, [r0]
	ldr r2, _080A4DE8 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080A4DE4: .4byte 0x08CE3C54
_080A4DE8: .4byte 0x0202BBF8

	thumb_func_start sub_080A4DEC
sub_080A4DEC: @ 0x080A4DEC
	push {lr}
	adds r2, r0, #0
	ldr r1, _080A4E08 @ =0x0202BBB8
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A4E04
	adds r0, r2, #0
	movs r1, #0x14
	bl Proc_Goto
_080A4E04:
	pop {r0}
	bx r0
	.align 2, 0
_080A4E08: .4byte 0x0202BBB8

	thumb_func_start sub_080A4E0C
sub_080A4E0C: @ 0x080A4E0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4E1C @ =0x08CE3F24
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A4E1C: .4byte 0x08CE3F24

	thumb_func_start sub_080A4E20
sub_080A4E20: @ 0x080A4E20
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4E30 @ =0x08CE4034
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A4E30: .4byte 0x08CE4034

	thumb_func_start SaveMenu_SetDifficultyChoice
SaveMenu_SetDifficultyChoice: @ 0x080A4E34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080A4E54 @ =0x08CE3C54
	bl Proc_Find
	cmp r0, #0
	beq _080A4E4E
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	adds r0, #0x3d
	strb r5, [r0]
_080A4E4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E54: .4byte 0x08CE3C54
