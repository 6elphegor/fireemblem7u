	.include "macro.inc"

	.syntax unified

	thumb_func_start PutSioErrorMessage
PutSioErrorMessage: @ 0x08086668
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x7c
	add r5, sp, #0x18
	bl ResetText
	bl InitTalkTextFont
	add r7, sp, #8
	add r0, sp, #0x10
	mov r8, r0
	mov r4, sp
	movs r6, #2
_08086684:
	adds r0, r4, #0
	movs r1, #0x16
	bl InitText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _08086684
	movs r1, #0
	str r1, [r5, #0x30]
	mov r0, sp
	str r0, [r5, #0x34]
	str r7, [r5, #0x38]
	mov r0, r8
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, _080866F4 @ =0x0000074F
	bl DecodeMsg
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl HelpBoxDrawOneLineExt
	ldr r4, _080866F8 @ =0x02022DE8
	mov r0, sp
	adds r1, r4, #0
	bl PutText
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r7, #0
	bl PutText
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	add sp, #0x7c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080866F4: .4byte 0x0000074F
_080866F8: .4byte 0x02022DE8

	thumb_func_start OnMain_SioError
OnMain_SioError: @ 0x080866FC
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl InitBgs
	bl m4aSoundInit
	bl Proc_Init
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r5, _080867AC @ =0x03002870
	movs r0, #1
	ldrb r1, [r5, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	strh r4, [r5, #0x38]
	bl SyncDispIo
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _080867B0 @ =0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080867B4 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	bl PutSioErrorMessage
	ldr r0, _080867B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808679C
	movs r0, #0x7b
	bl m4aSongNumStart
_0808679C:
	ldr r0, _080867BC @ =OnMain_SioErrorWait
	bl SetMainFunc
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080867AC: .4byte 0x03002870
_080867B0: .4byte 0x01000008
_080867B4: .4byte 0x06008000
_080867B8: .4byte 0x0202BBF8
_080867BC: .4byte OnMain_SioErrorWait

	thumb_func_start StartSioErrorScreen
StartSioErrorScreen: @ 0x080867C0
	push {lr}
	ldr r1, _080867E8 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _080867EC @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080867F0 @ =OnVBlank_SioError
	bl SetOnVBlank
	ldr r0, _080867F4 @ =OnMain_SioError
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_080867E8: .4byte 0x04000004
_080867EC: .4byte 0x04000208
_080867F0: .4byte OnVBlank_SioError
_080867F4: .4byte OnMain_SioError

	thumb_func_start StartChapterStatusHelpBox
StartChapterStatusHelpBox: @ 0x080867F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08086814 @ =0x06014800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r0, _08086818 @ =0x08CE5D74
	adds r1, r4, #0
	bl StartMovingHelpBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086814: .4byte 0x06014800
_08086818: .4byte 0x08CE5D74

	thumb_func_start GetStatusSceenLeaderUnit
GetStatusSceenLeaderUnit: @ 0x0808681C
	push {r4, lr}
	movs r4, #1
_08086820:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08086836
	ldr r0, [r1]
	cmp r0, #0
	beq _08086836
	adds r0, r1, #0
	b _0808683E
_08086836:
	adds r4, #1
	cmp r4, #0x3f
	ble _08086820
	movs r0, #0
_0808683E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08086844
sub_08086844: @ 0x08086844
	push {r4, lr}
	movs r4, #0x81
_08086848:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08086870
	ldr r1, [r2]
	cmp r1, #0
	beq _08086870
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08086870
	adds r0, r2, #0
	b _08086878
_08086870:
	adds r4, #1
	cmp r4, #0xbf
	ble _08086848
	movs r0, #0
_08086878:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CountEnemyBossUnits
CountEnemyBossUnits: @ 0x08086880
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08086886:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080868AA
	ldr r1, [r0]
	cmp r1, #0
	beq _080868AA
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080868AA
	adds r5, #1
_080868AA:
	adds r4, #1
	cmp r4, #0xbf
	ble _08086886
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CountUnitsByFaction
CountUnitsByFaction: @ 0x080868B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _080868E4
_080868C2:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080868E0
	ldr r0, [r1]
	cmp r0, #0
	beq _080868E0
	ldr r0, [r1, #0xc]
	ldr r1, _080868F4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080868E0
	adds r6, #1
_080868E0:
	adds r4, #1
	adds r0, r5, #0
_080868E4:
	adds r0, #0x40
	cmp r4, r0
	blt _080868C2
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080868F4: .4byte 0x0001000C

	thumb_func_start sub_080868F8
sub_080868F8: @ 0x080868F8
	push {r4, r5, lr}
	bl GetGameTime
	lsrs r1, r0, #1
	movs r2, #0x1f
	ands r1, r2
	ldr r0, _08086958 @ =0x08403974
	adds r0, #0x5e
	ldrh r4, [r0]
	ldr r5, _0808695C @ =0x02022B56
	cmp r1, #0x10
	ble _08086918
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	subs r1, r1, r0
_08086918:
	movs r3, #0x1f
	adds r0, r4, #0
	ands r0, r2
	movs r2, #0x10
	subs r2, r2, r1
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #4
	ands r1, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r4, #0
	ands r0, r3
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r4, r3
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	strh r1, [r5]
	strh r1, [r5, #0x20]
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086958: .4byte 0x08403974
_0808695C: .4byte 0x02022B56

	thumb_func_start sub_08086960
sub_08086960: @ 0x08086960
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	cmp r1, #0
	beq _0808697E
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808697E
_08086970:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808697E
	cmp r0, #1
	bne _08086982
	adds r0, r1, #1
	b _0808698E
_0808697E:
	movs r0, #0
	b _0808698E
_08086982:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	b _08086970
_0808698E:
	add sp, #4
	pop {r1}
	bx r1

	thumb_func_start UpdateUnitSpritePal
UpdateUnitSpritePal: @ 0x08086994
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080869BC
	movs r0, #0
	str r0, [sp]
	ldr r1, _080869B4 @ =0x02022C00
	ldr r2, _080869B8 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _080869C0
	.align 2, 0
_080869B4: .4byte 0x02022C00
_080869B8: .4byte 0x01000008
_080869BC:
	bl ApplyUnitSpritePalettes
_080869C0:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080869C8
sub_080869C8: @ 0x080869C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	bl InitBgs
	ldr r7, _08086AE0 @ =0x03002870
	movs r4, #4
	rsbs r4, r4, #0
	adds r2, r4, #0
	ldrb r0, [r7, #0x10]
	ands r2, r0
	movs r1, #1
	mov ip, r1
	mov r6, ip
	orrs r2, r6
	adds r1, r4, #0
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r5, #2
	orrs r1, r5
	movs r3, #3
	ldrb r6, [r7, #0x18]
	orrs r3, r6
	adds r0, r4, #0
	ldrb r6, [r7, #0xc]
	ands r0, r6
	strb r0, [r7, #0xc]
	ands r2, r4
	mov r0, ip
	orrs r2, r0
	strb r2, [r7, #0x10]
	ands r1, r4
	orrs r1, r5
	strb r1, [r7, #0x14]
	ands r3, r4
	orrs r3, r5
	strb r3, [r7, #0x18]
	bl ResetText
	movs r5, #0
	movs r0, #0
	mov r1, r8
	strh r0, [r1, #0x3c]
	mov r0, r8
	adds r0, #0x3e
	strb r5, [r0]
	subs r0, #0x14
	strb r5, [r0]
	ldr r4, _08086AE4 @ =0x0000FFFE
	ldr r2, _08086AE8 @ =0x0000FFFC
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	ldr r2, _08086AEC @ =0x0000FFEC
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	ldr r0, _08086AF0 @ =0x084032B4
	movs r1, #0x20
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _08086AF4 @ =0x08402FF0
	ldr r1, _08086AF8 @ =0x06005800
	bl Decompress
	ldr r0, _08086AFC @ =0x02023C60
	ldr r1, _08086B00 @ =0x08403314
	movs r2, #0x96
	lsls r2, r2, #5
	bl sub_080AACD8
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	movs r0, #0xf
	bl EnableBgSync
	mov r0, r8
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	bl GetStatusSceenLeaderUnit
	mov r4, r8
	str r0, [r4, #0x34]
	movs r0, #0
	bl CountUnitsByFaction
	mov r1, r8
	adds r1, #0x2f
	strb r0, [r1]
	bl GetGlobalCompletionCount
	mov r1, r8
	adds r1, #0x2b
	strb r0, [r1]
	ldr r2, [r4, #0x34]
	ldr r1, [r2, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08086B04
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	mov r1, r8
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	b _08086B0A
	.align 2, 0
_08086AE0: .4byte 0x03002870
_08086AE4: .4byte 0x0000FFFE
_08086AE8: .4byte 0x0000FFFC
_08086AEC: .4byte 0x0000FFEC
_08086AF0: .4byte 0x084032B4
_08086AF4: .4byte 0x08402FF0
_08086AF8: .4byte 0x06005800
_08086AFC: .4byte 0x02023C60
_08086B00: .4byte 0x08403314
_08086B04:
	mov r0, r8
	adds r0, #0x29
	strb r5, [r0]
_08086B0A:
	bl CountEnemyBossUnits
	cmp r0, #0
	beq _08086B1C
	bl sub_08086844
	mov r6, r8
	str r0, [r6, #0x38]
	b _08086B20
_08086B1C:
	mov r1, r8
	str r0, [r1, #0x38]
_08086B20:
	movs r0, #0x80
	bl CountUnitsByFaction
	mov r1, r8
	adds r1, #0x30
	strb r0, [r1]
	bl ApplyUnitSpritePalettes
	mov r4, r8
	adds r4, #0x34
	movs r5, #1
_08086B36:
	ldr r0, [r4]
	cmp r0, #0
	beq _08086B44
	bl GetUnitSMSId
	bl UseUnitSprite
_08086B44:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08086B36
	bl ForceSyncUnitSpriteSheet
	ldr r6, _08086C04 @ =0x03002870
	movs r0, #0x20
	ldrb r2, [r6, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x48
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x34
	movs r1, #1
	ldrb r0, [r4]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r5, #4
	orrs r0, r5
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r4]
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r4, [r0]
	orrs r1, r4
	movs r4, #3
	rsbs r4, r4, #0
	ands r1, r4
	orrs r1, r5
	orrs r1, r3
	orrs r1, r2
	strb r1, [r0]
	mov r0, r8
	movs r1, #0
	movs r2, #0xe
	bl StartMuralBackgroundAlt
	ldr r0, _08086C08 @ =0x08403A08
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #0xc0
	movs r1, #0xe
	mov r2, r8
	bl StartHelpPromptSprite
	ldr r0, _08086C0C @ =0x08CC3000
	mov r1, r8
	bl Proc_Start
	mov r0, r8
	bl NewSysBlackBoxHandler
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	ands r0, r4
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r6, #1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086C04: .4byte 0x03002870
_08086C08: .4byte 0x08403A08
_08086C0C: .4byte 0x08CC3000

	thumb_func_start sub_08086C10
sub_08086C10: @ 0x08086C10
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08086CA0 @ =0x020040CC
	ldr r0, _08086CA4 @ =0x02022F12
	movs r1, #3
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	adds r0, #8
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	cmp r4, #0
	bne _08086C40
	b _08086D78
_08086C40:
	ldr r0, [r4, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08086CAC
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x80
	bl Text_SetCursor
	ldr r4, _08086CA8 @ =0x0000127C
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #1
	bl UpdateUnitSpritePal
	b _08086DC4
	.align 2, 0
_08086CA0: .4byte 0x020040CC
_08086CA4: .4byte 0x02022F12
_08086CA8: .4byte 0x0000127C
_08086CAC:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x88
	bl Text_SetCursor
	movs r1, #8
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _08086D04
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	ldr r0, _08086D00 @ =0x0000127C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b _08086D1A
	.align 2, 0
_08086D00: .4byte 0x0000127C
_08086D04:
	adds r0, r5, #0
	movs r1, #0xa8
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
_08086D1A:
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _08086D40
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	ldr r0, _08086D3C @ =0x0000127C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b _08086D56
	.align 2, 0
_08086D3C: .4byte 0x0000127C
_08086D40:
	adds r0, r5, #0
	movs r1, #0xc0
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
_08086D56:
	adds r0, r4, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08086D74 @ =0x02022F12
	movs r2, #0xa0
	lsls r2, r2, #2
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl PutFaceChibi
	movs r0, #0
	bl UpdateUnitSpritePal
	b _08086DC4
	.align 2, 0
_08086D74: .4byte 0x02022F12
_08086D78:
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x80
	bl Text_SetCursor
	ldr r4, _08086E2C @ =0x0000127C
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
_08086DC4:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0xb1
	bl Text_SetCursor
	ldr r0, _08086E30 @ =0x000012B0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	ldr r2, _08086E34 @ =0x030028AC
	ldr r0, _08086E38 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _08086E3C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x3f
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #0x40
	orrs r1, r0
	movs r3, #0
	movs r0, #7
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r3, [r2, #0xa]
	subs r0, #0x28
	ands r1, r0
	strb r1, [r2]
	ldrb r1, [r2, #1]
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086E2C: .4byte 0x0000127C
_08086E30: .4byte 0x000012B0
_08086E34: .4byte 0x030028AC
_08086E38: .4byte 0x0000FFE0
_08086E3C: .4byte 0x0000E0FF

	thumb_func_start sub_08086E40
sub_08086E40: @ 0x08086E40
	ldr r2, _08086E5C @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_08086E5C: .4byte 0x03002870

	thumb_func_start ChapterStatus_SetupFont
ChapterStatus_SetupFont: @ 0x08086E60
	push {r4, lr}
	ldr r0, _08086E9C @ =0x08194674
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08086EA0 @ =0x020040D4
	ldr r1, _08086EA4 @ =0x06017800
	adds r0, r4, #0
	movs r2, #0x1a
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	subs r4, #8
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086E9C: .4byte 0x08194674
_08086EA0: .4byte 0x020040D4
_08086EA4: .4byte 0x06017800

	thumb_func_start sub_08086EA8
sub_08086EA8: @ 0x08086EA8
	push {r4, lr}
	ldr r4, _08086EE4 @ =0x02022FA0
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r4, #0
	adds r0, #0x18
	ldr r1, _08086EE8 @ =0x0202BBF8
	ldrh r2, [r1, #0x10]
	movs r1, #2
	bl PutNumber
	adds r4, #0x96
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086EE4: .4byte 0x02022FA0
_08086EE8: .4byte 0x0202BBF8

	thumb_func_start sub_08086EEC
sub_08086EEC: @ 0x08086EEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08086F48 @ =0x08CC2E88
	bl InitTextList
	adds r0, r6, #0
	bl ChapterStatus_SetupFont
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08086C10
	ldr r4, _08086F4C @ =0x02023608
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	ldr r0, _08086F50 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08086F54
	adds r0, r4, #0
	adds r0, #0xa
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _08086F64
	.align 2, 0
_08086F48: .4byte 0x08CC2E88
_08086F4C: .4byte 0x02023608
_08086F50: .4byte 0x0202BBF8
_08086F54:
	adds r0, r4, #0
	adds r0, #0xc
	adds r1, r6, #0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
_08086F64:
	adds r7, r6, #0
	adds r7, #0x2c
	movs r0, #1
	strb r0, [r7]
	ldr r0, _08086FE4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8c
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
	ldr r0, _08086FE8 @ =0x020040BC
	mov r8, r0
	movs r0, #0x70
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	subs r1, #2
	mov r0, r8
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl sub_08086960
	adds r5, r0, #0
	cmp r5, #0
	beq _08086FC4
	mov r4, r8
	adds r4, #8
	movs r0, #0x6e
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #2
	strb r0, [r7]
_08086FC4:
	ldrb r7, [r7]
	cmp r7, #2
	bne _08086FF0
	ldr r4, _08086FEC @ =0x02022E62
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	mov r0, r8
	adds r0, #8
	adds r4, #0x80
	adds r1, r4, #0
	bl PutText
	b _08086FF8
	.align 2, 0
_08086FE4: .4byte 0x0202BBF8
_08086FE8: .4byte 0x020040BC
_08086FEC: .4byte 0x02022E62
_08086FF0:
	ldr r1, _08087024 @ =0x02022EA2
	mov r0, r8
	bl PutText
_08086FF8:
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808700E
	ldr r0, _08087028 @ =0x02022C92
	ldrb r2, [r1]
	adds r2, #1
	movs r1, #2
	bl PutNumberOrBlank
_0808700E:
	bl sub_08086EA8
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087024: .4byte 0x02022EA2
_08087028: .4byte 0x02022C92

	thumb_func_start sub_0808702C
sub_0808702C: @ 0x0808702C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r7, [r3]
	adds r4, r5, #0
	adds r4, #0x3e
	movs r0, #0
	strb r0, [r4]
	ldr r1, _0808705C @ =0x08B857F8
	ldr r6, [r1]
	ldrh r2, [r6, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08087060
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl StartChapterStatusHelpBox
	b _0808713A
	.align 2, 0
_0808705C: .4byte 0x08B857F8
_08087060:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080870B8
	ldrb r3, [r3]
	lsls r1, r3, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _08087094
	ldr r0, [r2, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08087094
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	bl SetStatScreenLastUnitId
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_08087094:
	ldr r0, _080870B0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080870A6
	ldr r0, _080870B4 @ =0x0000038A
	bl m4aSongNumStart
_080870A6:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0808713A
	.align 2, 0
_080870B0: .4byte 0x0202BBF8
_080870B4: .4byte 0x0000038A
_080870B8:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080870E4
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080870DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808713A
	ldr r0, _080870E0 @ =0x0000038B
	bl m4aSongNumStart
	b _0808713A
	.align 2, 0
_080870DC: .4byte 0x0202BBF8
_080870E0: .4byte 0x0000038B
_080870E4:
	movs r0, #0x20
	ldrh r6, [r6, #6]
	ands r0, r6
	cmp r0, #0
	beq _080870F8
	ldrb r0, [r3]
	cmp r0, #0
	beq _080870F8
	subs r0, #1
	strb r0, [r3]
_080870F8:
	ldr r1, [r1]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _08087112
	ldrb r0, [r4]
	cmp r0, #0
	bne _08087112
	adds r0, #1
	strb r0, [r4]
_08087112:
	ldrb r0, [r4]
	cmp r0, r7
	beq _0808713A
	ldr r0, _08087140 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808712A
	ldr r0, _08087144 @ =0x00000386
	bl m4aSongNumStart
_0808712A:
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08086C10
_0808713A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087140: .4byte 0x0202BBF8
_08087144: .4byte 0x00000386

	thumb_func_start ChapterStatus_OnEnd
ChapterStatus_OnEnd: @ 0x08087148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087170 @ =0x08CC3000
	bl Proc_EndEach
	bl EndHelpPromptSprite
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808716A
	ldr r0, [r4, #0x34]
	ldr r1, [r0, #0xc]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0xc]
_0808716A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087170: .4byte 0x08CC3000

	thumb_func_start ChapterStatus_FocusLeaderUnit
ChapterStatus_FocusLeaderUnit: @ 0x08087174
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087186
	ldr r0, _0808718C @ =0x08B9367C
	bl Proc_StartBlocking
_08087186:
	pop {r0}
	bx r0
	.align 2, 0
_0808718C: .4byte 0x08B9367C

	thumb_func_start NewChapterStatusScreen
NewChapterStatusScreen: @ 0x08087190
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _080871B0
	ldr r0, _080871AC @ =0x08CC2EA0
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	b _080871BC
	.align 2, 0
_080871AC: .4byte 0x08CC2EA0
_080871B0:
	ldr r0, _080871C4 @ =0x08CC2EA0
	movs r1, #3
	bl Proc_Start
	adds r0, #0x3f
	strb r4, [r0]
_080871BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080871C4: .4byte 0x08CC2EA0

	thumb_func_start StartChapterStatusScreen_FromPrep
StartChapterStatusScreen_FromPrep: @ 0x080871C8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080871DC @ =0x08CC2F58
	bl Proc_StartBlocking
	adds r0, #0x3f
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080871DC: .4byte 0x08CC2F58

	thumb_func_start sub_080871E0
sub_080871E0: @ 0x080871E0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	bl ApplySystemObjectsGraphics
	ldr r0, _08087294 @ =0x08403914
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _08087298 @ =0x08403974
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _0808729C @ =0x08403410
	ldr r1, _080872A0 @ =0x06016000
	bl Decompress
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #2
	bl SysBlackBoxSetGfx
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808723A
	ldr r2, _080872A4 @ =0x00000405
	movs r0, #3
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #7
	movs r3, #0x17
	bl EnableSysBlackBox
_0808723A:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808725A
	ldr r2, _080872A8 @ =0x00000404
	movs r0, #2
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0xc2
	movs r3, #5
	bl EnableSysBlackBox
_0808725A:
	ldr r2, _080872AC @ =0x0000044E
	movs r0, #6
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0x84
	movs r3, #0xd
	bl EnableSysBlackBox
	movs r0, #0x80
	movs r1, #0x13
	bl PutChapterTitlePalette
	movs r4, #0xb8
	lsls r4, r4, #4
	ldr r0, _080872B0 @ =0x0202BBF8
	bl GetChapterTitle
	adds r1, r0, #0
	adds r0, r4, #0
	bl PutChapterTitleGfx
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087294: .4byte 0x08403914
_08087298: .4byte 0x08403974
_0808729C: .4byte 0x08403410
_080872A0: .4byte 0x06016000
_080872A4: .4byte 0x00000405
_080872A8: .4byte 0x00000404
_080872AC: .4byte 0x0000044E
_080872B0: .4byte 0x0202BBF8

	thumb_func_start sub_080872B4
sub_080872B4: @ 0x080872B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080872D8
	ldr r3, _08087430 @ =0x08CC2FD8
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #9
	bl PutSprite
_080872D8:
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r2, [r5]
	movs r0, #0x34
	adds r1, r2, #0
	muls r1, r0, r1
	adds r1, #0x80
	ldr r3, _08087434 @ =0x08CC2E6C
	movs r0, #0xf
	ands r2, r0
	lsls r2, r2, #0xc
	str r2, [sp]
	movs r0, #4
	movs r2, #0x1c
	bl PutSprite
	ldr r3, _08087438 @ =0x08CC2DF8
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x8a
	movs r2, #0x83
	bl PutSprite
	ldr r3, _0808743C @ =0x08CC2E0E
	str r4, [sp]
	movs r0, #4
	movs r1, #0x8b
	movs r2, #0x26
	bl PutSprite
	ldr r3, _08087440 @ =0x08CC2E1C
	str r4, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x26
	bl PutSprite
	ldr r3, _08087444 @ =0x08CC2E2A
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x6a
	bl PutSprite
	ldr r3, _08087448 @ =0x08CC2E46
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x7a
	bl PutSprite
	ldr r3, _0808744C @ =0x08CC2E4E
	str r4, [sp]
	movs r0, #4
	movs r1, #0x63
	movs r2, #0x7c
	bl PutSprite
	ldr r3, _08087450 @ =0x08CC2E32
	str r4, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x30
	bl PutSprite
	adds r7, r5, #0
	movs r0, #0x34
	adds r0, r0, r6
	mov r8, r0
	adds r6, #0x2b
	mov sb, r6
	ldr r6, _08087454 @ =0x0000A3C0
	movs r5, #0xa0
	movs r4, #1
_0808736E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x56
	ldr r3, _08087458 @ =0x08B905F8
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808736E
	ldr r3, _0808745C @ =0x08CC2E56
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x5f
	bl PutSprite
	ldr r3, _08087458 @ =0x08B905F8
	ldr r0, _08087460 @ =0x0000A3D0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb4
	movs r2, #0x61
	bl PutSprite
	ldr r3, _08087464 @ =0x08CC2E5E
	str r4, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x6c
	bl PutSprite
	ldr r6, _08087468 @ =0x0000A3D4
	movs r5, #0x9c
	movs r4, #1
_080873BA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x6e
	ldr r3, _08087458 @ =0x08B905F8
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080873BA
	ldr r4, _0808746C @ =0x02023086
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl PutTime
	movs r0, #1
	bl EnableBgSync
	ldrb r7, [r7]
	lsls r0, r7, #2
	add r0, r8
	ldr r3, [r0]
	cmp r3, #0
	beq _08087400
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x52
	bl PutUnitSprite
_08087400:
	bl SyncUnitSpriteSheet
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808741C
	ldr r3, _08087470 @ =0x08CC2E06
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd4
	movs r2, #3
	bl PutSprite
_0808741C:
	bl sub_080868F8
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087430: .4byte 0x08CC2FD8
_08087434: .4byte 0x08CC2E6C
_08087438: .4byte 0x08CC2DF8
_0808743C: .4byte 0x08CC2E0E
_08087440: .4byte 0x08CC2E1C
_08087444: .4byte 0x08CC2E2A
_08087448: .4byte 0x08CC2E46
_0808744C: .4byte 0x08CC2E4E
_08087450: .4byte 0x08CC2E32
_08087454: .4byte 0x0000A3C0
_08087458: .4byte 0x08B905F8
_0808745C: .4byte 0x08CC2E56
_08087460: .4byte 0x0000A3D0
_08087464: .4byte 0x08CC2E5E
_08087468: .4byte 0x0000A3D4
_0808746C: .4byte 0x02023086
_08087470: .4byte 0x08CC2E06

	thumb_func_start SetCgTextFlags
SetCgTextFlags: @ 0x08087474
	ldr r3, _08087484 @ =0x0203E738
	lsls r0, r0, #0xa
	ldr r1, [r3, #0x48]
	ldr r2, _08087488 @ =0x000003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x48]
	bx lr
	.align 2, 0
_08087484: .4byte 0x0203E738
_08087488: .4byte 0x000003FF

	thumb_func_start SetCgTextFlag
SetCgTextFlag: @ 0x0808748C
	push {r4, lr}
	ldr r4, _080874AC @ =0x0203E738
	ldr r3, [r4, #0x48]
	lsrs r2, r3, #0xa
	ldr r1, _080874B0 @ =0x003FFFFF
	ands r1, r0
	orrs r2, r1
	lsls r2, r2, #0xa
	ldr r0, _080874B4 @ =0x000003FF
	ands r0, r3
	orrs r0, r2
	str r0, [r4, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080874AC: .4byte 0x0203E738
_080874B0: .4byte 0x003FFFFF
_080874B4: .4byte 0x000003FF

	thumb_func_start ClearCgTextFlag
ClearCgTextFlag: @ 0x080874B8
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _080874D4 @ =0x003FFFFF
	eors r0, r4
	ands r0, r1
	bl SetCgTextFlags
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080874D4: .4byte 0x003FFFFF

	thumb_func_start GetCgTextFlags
GetCgTextFlags: @ 0x080874D8
	ldr r0, _080874E0 @ =0x0203E738
	ldr r0, [r0, #0x48]
	lsrs r0, r0, #0xa
	bx lr
	.align 2, 0
_080874E0: .4byte 0x0203E738

	thumb_func_start SetCgTextBlendControl
SetCgTextBlendControl: @ 0x080874E4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x20
	orrs r1, r2
	ldr r2, _08087500 @ =0x0203E738
	lsls r1, r1, #8
	adds r1, #0x40
	adds r0, r0, r1
	adds r2, #0x4c
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087500: .4byte 0x0203E738

	thumb_func_start GetCgTextBlendControl
GetCgTextBlendControl: @ 0x08087504
	ldr r0, _0808750C @ =0x0203E738
	adds r0, #0x4c
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0808750C: .4byte 0x0203E738

	thumb_func_start SetCgTextBlendAlpha
SetCgTextBlendAlpha: @ 0x08087510
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _08087524 @ =0x0203E738
	lsrs r1, r1, #8
	adds r0, r0, r1
	adds r2, #0x4e
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087524: .4byte 0x0203E738

	thumb_func_start GetCgTextBlendAlpha
GetCgTextBlendAlpha: @ 0x08087528
	ldr r0, _08087530 @ =0x0203E738
	adds r0, #0x4e
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08087530: .4byte 0x0203E738

	thumb_func_start sub_08087534
sub_08087534: @ 0x08087534
	push {r4, r5, lr}
	ldr r0, _08087594 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa0
	bls _08087546
	movs r4, #0
_08087546:
	ldr r0, _08087598 @ =0x0203E738
	adds r5, r0, #0
	adds r5, #0x48
	ldrb r1, [r5]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x18
	subs r0, #0x20
	cmp r4, r0
	bne _08087568
	bl GetCgTextBlendControl
	ldr r1, _0808759C @ =0x04000050
	strh r0, [r1]
	bl GetCgTextBlendAlpha
	ldr r1, _080875A0 @ =0x04000052
	strh r0, [r1]
_08087568:
	cmp r4, #0
	beq _0808757A
	ldrh r5, [r5]
	lsls r0, r5, #0x16
	lsrs r0, r0, #0x1b
	lsls r0, r0, #3
	adds r0, #4
	cmp r4, r0
	bne _0808758E
_0808757A:
	ldr r2, _0808759C @ =0x04000050
	ldr r1, _080875A4 @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_0808758E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087594: .4byte 0x04000006
_08087598: .4byte 0x0203E738
_0808759C: .4byte 0x04000050
_080875A0: .4byte 0x04000052
_080875A4: .4byte 0x030028AC

	thumb_func_start sub_080875A8
sub_080875A8: @ 0x080875A8
	push {r4, r5, r6, lr}
	sub sp, #0x40
	adds r2, r0, #0
	add r3, sp, #0x18
	ldr r1, [r2, #0x2c]
	adds r6, r3, #0
	ldrb r0, [r1]
	cmp r0, #0x80
	bne _08087676
	ldrb r0, [r1, #1]
	cmp r0, #0x23
	bne _08087676
	adds r0, r1, #2
	str r0, [r2, #0x2c]
	add r5, sp, #0x38
	adds r4, r2, #0
	adds r4, #0x61
	ldrb r1, [r1, #2]
	cmp r1, #1
	beq _080875E2
_080875D0:
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0]
	strb r1, [r3]
	adds r1, r0, #1
	str r1, [r2, #0x2c]
	adds r3, #1
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _080875D0
_080875E2:
	ldr r0, [r2, #0x2c]
	adds r0, #1
	str r0, [r2, #0x2c]
	movs r0, #0
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #9
	bl SetCgTextFlag
	ldr r1, _08087630 @ =0x06017800
	mov r0, sp
	movs r2, #0x12
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r6, #0
	bl GetStringTextLen
	adds r1, r0, #0
	cmp r1, #0x30
	ble _08087634
	subs r0, #0x29
	cmp r0, #0
	bge _0808762C
	adds r0, #7
_0808762C:
	asrs r0, r0, #3
	b _08087636
	.align 2, 0
_08087630: .4byte 0x06017800
_08087634:
	movs r0, #0
_08087636:
	strb r0, [r4]
	ldrb r0, [r4]
	adds r0, #6
	lsls r0, r0, #3
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	ldr r0, _08087680 @ =0x08194674
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08087684 @ =0x0819D20C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08087688 @ =0x0819D174
	ldr r1, _0808768C @ =0x06017A00
	bl Decompress
_08087676:
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087680: .4byte 0x08194674
_08087684: .4byte 0x0819D20C
_08087688: .4byte 0x0819D174
_0808768C: .4byte 0x06017A00

	thumb_func_start sub_08087690
sub_08087690: @ 0x08087690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bl GetCgTextFlags
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080876CA
	bl GetCgTextFlags
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	subs r0, #1
	b _080876CE
_080876CA:
	bl GetTextPrintDelay
_080876CE:
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x60
	movs r2, #0
	strb r2, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r1, #0x7f
	cmp r0, #0
	beq _080876E8
	movs r1, #1
_080876E8:
	adds r0, r6, #0
	adds r0, #0x53
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	adds r0, r6, #0
	bl sub_080875A8
	adds r0, r6, #0
	adds r0, #0x5b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	movs r0, #0x5c
	adds r0, r0, r6
	mov sb, r0
	cmp r1, #0
	blt _0808771A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808774C
_0808771A:
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r6, #0x2c]
	add r2, sp, #8
	add r1, sp, #4
	bl sub_08087EFC
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp, #4]
	adds r0, r1, #7
	cmp r0, #0
	bge _0808773A
	adds r0, #7
_0808773A:
	asrs r0, r0, #3
	strb r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08087746
	adds r0, #7
_08087746:
	asrs r0, r0, #3
	mov r1, sb
	strb r0, [r1]
_0808774C:
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808775A
	b _080878AC
_0808775A:
	movs r2, #0x58
	adds r2, r2, r6
	mov r8, r2
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrb r5, [r2]
	subs r0, r5, r0
	subs r0, #1
	str r0, [sp, #0x10]
	bl GetCgTextFlags
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080877F8
	adds r5, r6, #0
	adds r5, #0x57
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r5]
	subs r0, r1, r0
	subs r0, #2
	str r0, [sp, #0xc]
	bl GetCgTextFlags
	movs r2, #0xc0
	lsls r2, r2, #8
	mov sl, r2
	ands r0, r2
	lsrs r0, r0, #0xe
	movs r3, #0
	ldrsb r3, [r7, r3]
	ldrb r7, [r5]
	subs r1, r7, r3
	subs r1, #2
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r7, r8
	ldrb r2, [r7]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl PutTalkBubbleTm
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808786A
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #3
	cmp r1, #0
	beq _080877DC
	movs r4, #5
_080877DC:
	bl GetCgTextFlags
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	subs r1, #1
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl PutTalkBubbleTail
	b _0808786A
_080877F8:
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	adds r0, #1
	str r0, [sp, #0xc]
	bl GetCgTextFlags
	movs r1, #0xc0
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	adds r1, #1
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r3, r8
	ldrb r2, [r3]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	movs r3, #0
	ldrsb r3, [r7, r3]
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl PutTalkBubbleTm
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808786A
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #2
	cmp r1, #0
	beq _08087852
	movs r4, #5
_08087852:
	bl GetCgTextFlags
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl PutTalkBubbleTail
_0808786A:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _080878A6
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	ldr r7, [sp, #0x10]
	lsls r1, r7, #6
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x61
	ldrb r1, [r1]
	adds r1, #6
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
_080878A6:
	movs r0, #0xf
	bl EnableBgSync
_080878AC:
	adds r0, r6, #0
	bl sub_08087EAC
	ldr r0, _08087920 @ =sub_08088098
	adds r1, r6, #0
	bl StartParallelWorker
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r5, #0
	cmp r0, #0
	blt _080878FE
_080878D6:
	lsls r0, r5, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r4, r4, r0
	ldr r0, [r4]
	bl InitSpriteText
	ldr r0, [r4]
	movs r1, #0xb
	bl Text_SetColor
	adds r5, #1
	mov r7, sb
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	ble _080878D6
_080878FE:
	adds r0, r6, #0
	bl CgText_ClearSpriteText
	movs r0, #0
	bl SetTextFont
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087924
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _08087A04
	.align 2, 0
_08087920: .4byte sub_08088098
_08087924:
	bl GetCgTextFlags
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08087942
	movs r0, #0x10
	movs r1, #1
	bl SetCgTextBlendAlpha
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0808794A
_08087942:
	movs r0, #0
	movs r1, #0x10
	bl SetCgTextBlendAlpha
_0808794A:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08087978
	ldr r4, _08087974 @ =0x0203E738
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #5
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r5, [r2]
	ands r0, r5
	b _08087992
	.align 2, 0
_08087974: .4byte 0x0203E738
_08087978:
	ldr r4, _08087A2C @ =0x0203E738
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
_08087992:
	orrs r0, r1
	strb r0, [r2]
	mov r0, sb
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r3, #0x1f
	mov r8, r3
	mov r5, r8
	ands r1, r5
	lsls r1, r1, #5
	ldr r0, _08087A30 @ =0xFFFFFC1F
	ldrh r7, [r2]
	ands r0, r7
	orrs r0, r1
	strh r0, [r2]
	bl GetCgTextFlags
	movs r6, #0xc0
	lsls r6, r6, #8
	ands r0, r6
	lsrs r0, r0, #0xe
	movs r4, #1
	adds r5, r4, #0
	lsls r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetCgTextFlags
	ands r0, r6
	lsrs r0, r0, #0xe
	lsls r4, r0
	mov r0, r8
	eors r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetCgTextBlendControl
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _08087A04
	movs r0, #0
	bl SetOnHBlankB
	ldr r0, _08087A34 @ =sub_08087534
	bl SetOnHBlankB
_08087A04:
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087A2C: .4byte 0x0203E738
_08087A30: .4byte 0xFFFFFC1F
_08087A34: .4byte sub_08087534

	thumb_func_start CgText_InitBlendAmt
CgText_InitBlendAmt: @ 0x08087A38
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start CgText_LoopFadeIn
CgText_LoopFadeIn: @ 0x08087A40
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _08087A5E
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08087A60
_08087A5E:
	movs r1, #1
_08087A60:
	adds r0, r2, #0
	bl SetCgTextBlendAlpha
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08087A76
	adds r0, r4, #0
	bl Proc_Break
_08087A76:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CgText_InitFadeOut
CgText_InitFadeOut: @ 0x08087A7C
	push {r4, lr}
	adds r4, r0, #0
	bl CgText_ClearSpriteText
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	bl EndCgTextInterpreter
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087AB0
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08087AB8
_08087AB0:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0x10
	strb r0, [r1]
_08087AB8:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08087AD0
	ldr r0, _08087AD8 @ =0x08B907C0
	bl Proc_Find
	bl StartFaceFadeOut
_08087AD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087AD8: .4byte 0x08B907C0

	thumb_func_start CgText_LoopFadeOut
CgText_LoopFadeOut: @ 0x08087ADC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _08087AFA
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08087AFC
_08087AFA:
	movs r1, #1
_08087AFC:
	adds r0, r2, #0
	bl SetCgTextBlendAlpha
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0
	bne _08087B1A
	movs r0, #0x80
	lsls r0, r0, #9
	bl ClearCgTextFlag
	adds r0, r4, #0
	bl Proc_Break
_08087B1A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08087B20
sub_08087B20: @ 0x08087B20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087B54 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08087B4E
	bl GetCgTextFlags
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _08087B4E
	bl sub_0800F08C
	bl EndCgTextInterpreter
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08087B4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087B54: .4byte 0x08B857F8

	thumb_func_start CgText_808F084
CgText_808F084: @ 0x08087B58
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r1, [r1]
	subs r1, #1
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r4, #0x5c
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #1
	movs r1, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xf
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CgText_OnEnd
CgText_OnEnd: @ 0x08087B98
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	adds r0, r4, #0
	bl CgText_808F084
	movs r0, #0
	bl SetOnHBlankB
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CgText_808F0EC
CgText_808F0EC: @ 0x08087BC0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl CgText_ClearSpriteText
	adds r0, r5, #0
	adds r0, #0x54
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	bl SetTextFontGlyphs
	adds r1, r5, #0
	adds r1, #0x59
	strb r4, [r1]
	adds r2, r5, #0
	adds r2, #0x5a
	strb r4, [r2]
	ldr r0, [r5, #0x2c]
	bl GetCgTextDimensions
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl RestartCgTextInterpreter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartCgText
StartCgText: @ 0x08087BFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, _08087C50 @ =0x08CC306C
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08087C5E
	ldr r0, [sp, #0x2c]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl _08088074
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08087C3A
	bl MsgExpand
	str r0, [r4, #0x2c]
_08087C3A:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08087C54
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08087D28
	.align 2, 0
_08087C50: .4byte 0x08CC306C
_08087C54:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08087D28
_08087C5E:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _08087C6E
	adds r0, r6, #0
	ldr r1, [sp, #0x38]
	bl Proc_StartBlocking
	b _08087C76
_08087C6E:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Start
_08087C76:
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	bl SetCgTextFlags
	bl ClearAllTalkFlags
	ldr r0, _08087D38 @ =0x0203E738
	str r0, [r4, #0x30]
	adds r3, r4, #0
	adds r3, #0x57
	adds r6, r4, #0
	adds r6, #0x58
	movs r1, #0x5b
	adds r1, r1, r4
	mov ip, r1
	movs r1, #0x5c
	adds r1, r1, r4
	mov r8, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov sb, r1
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, #0x40
	adds r1, r4, #0
	adds r1, #0x48
_08087CAC:
	str r0, [r1]
	subs r0, #8
	subs r1, #4
	cmp r1, r2
	bge _08087CAC
	mov r0, sl
	strb r0, [r3]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r6]
	mov r0, sp
	ldrb r1, [r0, #4]
	mov r0, ip
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #8]
	mov r0, r8
	strb r1, [r0]
	str r7, [r4, #0x4c]
	cmp r5, #0
	bge _08087CD8
	movs r5, #5
_08087CD8:
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	cmp r7, #0
	bne _08087CE8
	ldr r7, _08087D3C @ =0x06013000
_08087CE8:
	ldr r0, [r4, #0x30]
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFont
	ldr r0, _08087D40 @ =0x081946D4
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r6
	lsls r1, r5, #0xc
	adds r0, r0, r1
	mov r1, sb
	strh r0, [r1]
	ldr r0, [sp, #0x2c]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl _08088074
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08087D28
	bl MsgExpand
	str r0, [r4, #0x2c]
_08087D28:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087D38: .4byte 0x0203E738
_08087D3C: .4byte 0x06013000
_08087D40: .4byte 0x081946D4

	thumb_func_start EndCgText
EndCgText: @ 0x08087D44
	push {lr}
	ldr r0, _08087D54 @ =0x08CC306C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08087D54: .4byte 0x08CC306C

	thumb_func_start sub_08087D58
sub_08087D58: @ 0x08087D58
	push {lr}
	ldr r0, _08087D68 @ =0x08CC306C
	bl Proc_Find
	cmp r0, #0
	bne _08087D6C
	movs r0, #0
	b _08087D6E
	.align 2, 0
_08087D68: .4byte 0x08CC306C
_08087D6C:
	movs r0, #1
_08087D6E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08087D74
sub_08087D74: @ 0x08087D74
	push {lr}
	ldr r0, _08087D8C @ =0x08CC306C
	bl Proc_Find
	cmp r0, #0
	beq _08087D86
	movs r1, #0
	bl Proc_Goto
_08087D86:
	pop {r0}
	bx r0
	.align 2, 0
_08087D8C: .4byte 0x08CC306C

	thumb_func_start CgText_ClearSpriteText
CgText_ClearSpriteText: @ 0x08087D90
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _08087DD4
_08087DAE:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _08087DAE
_08087DD4:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08087DE0
sub_08087DE0: @ 0x08087DE0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _08087E24
_08087DFE:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl Text_SetCursor
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _08087DFE
_08087E24:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetCgTextDimensions
GetCgTextDimensions: @ 0x08087E2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r6, #0
	ldrb r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_08087E44:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _08087E66
	cmp r0, #4
	bge _08087E78
	cmp r0, #1
	beq _08087E7C
	cmp r0, #1
	bgt _08087E5C
	cmp r0, #0
	beq _08087E98
	b _08087E88
_08087E5C:
	cmp r0, #2
	beq _08087E78
	cmp r0, #3
	beq _08087E98
	b _08087E88
_08087E66:
	cmp r0, #0x19
	ble _08087E70
	cmp r0, #0x80
	beq _08087E84
	b _08087E88
_08087E70:
	cmp r0, #0x18
	bge _08087E98
	cmp r0, #0x16
	blt _08087E88
_08087E78:
	adds r4, #1
	b _08087E44
_08087E7C:
	adds r4, #1
	adds r5, #0x10
	movs r6, #0
	b _08087E44
_08087E84:
	adds r4, #2
	b _08087E44
_08087E88:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r6, r6, r0
	b _08087E44
_08087E98:
	mov r0, r8
	strb r6, [r0]
	strb r5, [r7]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08087EAC
sub_08087EAC: @ 0x08087EAC
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08087EF4
	bl GetCgTextFlags
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08087EDA
	adds r1, r4, #0
	adds r1, #0x57
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r2, [r1]
	ldrb r0, [r0]
	subs r0, r2, r0
	subs r0, #1
	b _08087EE2
_08087EDA:
	adds r1, r4, #0
	adds r1, #0x57
	ldrb r0, [r1]
	adds r0, #2
_08087EE2:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r2, [r0]
	ldrb r1, [r1]
	subs r1, r2, r1
	strb r1, [r0]
_08087EF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08087EFC
sub_08087EFC: @ 0x08087EFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r5, #0
	movs r6, #0x10
	str r5, [r1]
	str r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_08087F18:
	ldrb r2, [r4]
	cmp r2, #0x19
	bhi _08087FA4
	lsls r0, r2, #2
	ldr r1, _08087F28 @ =_08087F2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08087F28: .4byte _08087F2C
_08087F2C: @ jump table
	.4byte _08087F96 @ case 0
	.4byte _08087F96 @ case 1
	.4byte _08087F96 @ case 2
	.4byte _08087F94 @ case 3
	.4byte _08087FA4 @ case 4
	.4byte _08087FA4 @ case 5
	.4byte _08087FA4 @ case 6
	.4byte _08087FA4 @ case 7
	.4byte _08087FA4 @ case 8
	.4byte _08087FA4 @ case 9
	.4byte _08087FA4 @ case 10
	.4byte _08087FA4 @ case 11
	.4byte _08087FA4 @ case 12
	.4byte _08087FA4 @ case 13
	.4byte _08087FA4 @ case 14
	.4byte _08087FA4 @ case 15
	.4byte _08087FA4 @ case 16
	.4byte _08087FA4 @ case 17
	.4byte _08087FA4 @ case 18
	.4byte _08087FA4 @ case 19
	.4byte _08087FA4 @ case 20
	.4byte _08087FA4 @ case 21
	.4byte _08087FA4 @ case 22
	.4byte _08087FA4 @ case 23
	.4byte _08087F96 @ case 24
	.4byte _08087F96 @ case 25
_08087F94:
	adds r5, #8
_08087F96:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bge _08087FA0
	str r5, [r1]
_08087FA0:
	movs r5, #0
	ldrb r2, [r4]
_08087FA4:
	cmp r2, #0x19
	bhi _08088030
	lsls r0, r2, #2
	ldr r1, _08087FB4 @ =_08087FB8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08087FB4: .4byte _08087FB8
_08087FB8: @ jump table
	.4byte _08088024 @ case 0
	.4byte _08088020 @ case 1
	.4byte _08088024 @ case 2
	.4byte _08088030 @ case 3
	.4byte _08088030 @ case 4
	.4byte _08088030 @ case 5
	.4byte _08088030 @ case 6
	.4byte _08088030 @ case 7
	.4byte _08088030 @ case 8
	.4byte _08088030 @ case 9
	.4byte _08088030 @ case 10
	.4byte _08088030 @ case 11
	.4byte _08088030 @ case 12
	.4byte _08088030 @ case 13
	.4byte _08088030 @ case 14
	.4byte _08088030 @ case 15
	.4byte _08088030 @ case 16
	.4byte _08088030 @ case 17
	.4byte _08088030 @ case 18
	.4byte _08088030 @ case 19
	.4byte _08088030 @ case 20
	.4byte _08088030 @ case 21
	.4byte _08088030 @ case 22
	.4byte _08088030 @ case 23
	.4byte _08088020 @ case 24
	.4byte _08088020 @ case 25
_08088020:
	adds r6, #0x10
	b _08088030
_08088024:
	ldr r0, [r7]
	cmp r0, r6
	bge _0808802C
	str r6, [r7]
_0808802C:
	movs r6, #0
	ldrb r2, [r4]
_08088030:
	adds r0, r2, #0
	cmp r0, #7
	bgt _08088040
	cmp r0, #1
	bge _0808804E
	cmp r0, #0
	beq _08088066
	b _08088056
_08088040:
	cmp r2, #0x16
	blt _08088056
	cmp r2, #0x19
	ble _0808804E
	cmp r2, #0x80
	beq _08088052
	b _08088056
_0808804E:
	adds r4, #1
	b _08087F18
_08088052:
	adds r4, #2
	b _08087F18
_08088056:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _08087F18
_08088066:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088074:
	ldrb r1, [r0]
	cmp r1, #0
	beq _08088080
	cmp r1, #0x80
	beq _08088084
	b _08088090
_08088080:
	movs r0, #0
	b _08088094
_08088084:
	adds r0, #1
	ldrb r1, [r0]
	cmp r1, #0x20
	bne _08088090
	movs r0, #1
	b _08088094
_08088090:
	adds r0, #1
	b _08088074
_08088094:
	bx lr
	.align 2, 0

	thumb_func_start sub_08088098
sub_08088098: @ 0x08088098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r0, r0, #3
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #0x1f
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r1, [sp, #8]
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _08088118
	cmp r1, r0
	bhi _080880F0
	cmp r1, #0
	beq _080880FE
	b _0808815A
_080880F0:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _08088130
	cmp r1, r2
	beq _08088148
	b _0808815A
_080880FE:
	ldr r0, _08088114 @ =0x03002870
	mov r1, r8
	ldrh r2, [r0, #0x1c]
	subs r1, r1, r2
	mov r8, r1
	mov r3, sb
	ldrh r0, [r0, #0x1e]
	subs r3, r3, r0
	mov sb, r3
	b _0808815A
	.align 2, 0
_08088114: .4byte 0x03002870
_08088118:
	ldr r0, _0808812C @ =0x03002870
	mov r4, r8
	ldrh r7, [r0, #0x20]
	subs r4, r4, r7
	mov r8, r4
	mov r1, sb
	ldrh r0, [r0, #0x22]
	subs r1, r1, r0
	mov sb, r1
	b _0808815A
	.align 2, 0
_0808812C: .4byte 0x03002870
_08088130:
	ldr r0, _08088144 @ =0x03002870
	mov r2, r8
	ldrh r3, [r0, #0x24]
	subs r2, r2, r3
	mov r8, r2
	mov r4, sb
	ldrh r0, [r0, #0x26]
	subs r4, r4, r0
	mov sb, r4
	b _0808815A
	.align 2, 0
_08088144: .4byte 0x03002870
_08088148:
	ldr r0, _0808821C @ =0x03002870
	mov r7, r8
	ldrh r1, [r0, #0x28]
	subs r7, r7, r1
	mov r8, r7
	mov r2, sb
	ldrh r0, [r0, #0x2a]
	subs r2, r2, r0
	mov sb, r2
_0808815A:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	adds r3, r6, #0
	adds r3, #0x5c
	str r3, [sp, #0x14]
	adds r4, r6, #0
	adds r4, #0x50
	str r4, [sp, #0xc]
	adds r7, r6, #0
	adds r7, #0x5b
	str r7, [sp, #0x10]
	cmp r1, #0
	beq _08088210
	mov r1, r8
	subs r1, #0x10
	ldr r0, _08088220 @ =0x000001FF
	ands r1, r0
	mov r4, sb
	subs r4, #0x18
	movs r2, #0xff
	ands r2, r4
	ldr r3, _08088224 @ =0x08CC3020
	ldr r0, _08088228 @ =0x000013D0
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	movs r5, #0
	adds r0, r6, #0
	adds r0, #0x61
	adds r7, r4, #0
	adds r6, r0, #0
	mov r0, r8
	subs r0, #8
	str r0, [sp, #0x18]
	movs r1, #0x14
	rsbs r1, r1, #0
	add r1, sb
	mov sl, r1
	ldrb r2, [r6]
	cmp r5, r2
	bge _080881D6
	mov r4, r8
	adds r4, #0x10
_080881B8:
	ldr r1, _08088220 @ =0x000001FF
	ands r1, r4
	ldr r0, _08088228 @ =0x000013D0
	str r0, [sp]
	movs r0, #0
	movs r2, #0xff
	ands r2, r7
	ldr r3, _0808822C @ =0x08CC3048
	bl PutSpriteExt
	adds r4, #8
	adds r5, #1
	ldrb r3, [r6]
	cmp r5, r3
	blt _080881B8
_080881D6:
	lsls r1, r5, #3
	adds r1, #0x10
	add r1, r8
	ldr r5, _08088220 @ =0x000001FF
	ands r1, r5
	movs r4, #0xff
	ands r7, r4
	ldr r3, _08088230 @ =0x08CC3034
	ldr r0, _08088228 @ =0x000013D0
	str r0, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	ldr r6, [sp, #0x18]
	ands r6, r5
	str r6, [sp, #0x18]
	mov r7, sl
	ands r7, r4
	mov sl, r7
	ldr r3, _08088234 @ =0x08CC305C
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	mov r2, sl
	bl PutSpriteExt
_08088210:
	movs r5, #0
	ldr r1, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _0808828E
	.align 2, 0
_0808821C: .4byte 0x03002870
_08088220: .4byte 0x000001FF
_08088224: .4byte 0x08CC3020
_08088228: .4byte 0x000013D0
_0808822C: .4byte 0x08CC3048
_08088230: .4byte 0x08CC3034
_08088234: .4byte 0x08CC305C
_08088238:
	movs r2, #0
	str r2, [sp, #4]
	adds r4, r5, #1
	b _08088272
_08088240:
	ldr r3, [sp, #4]
	lsls r1, r3, #5
	add r1, r8
	ldr r0, _080882C4 @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #4
	add r2, sb
	movs r0, #0xff
	ands r2, r0
	lsls r0, r3, #2
	ldr r6, [sp, #0xc]
	ldrh r6, [r6]
	adds r0, r6, r0
	lsls r3, r5, #6
	adds r0, r0, r3
	ldr r7, [sp, #8]
	adds r0, r0, r7
	str r0, [sp]
	movs r0, #2
	ldr r3, _080882C8 @ =0x08B905F8
	bl PutSpriteExt
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
_08088272:
	ldr r1, [sp, #0x10]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808827E
	adds r0, #3
_0808827E:
	asrs r0, r0, #2
	ldr r2, [sp, #4]
	cmp r2, r0
	blt _08088240
	adds r5, r4, #0
	ldr r3, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r3, r0]
_0808828E:
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	blt _08088238
	movs r0, #3
	ldr r4, [sp, #0x10]
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _08088336
	ldr r6, [sp, #0x10]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _080882B2
	adds r0, r1, #3
_080882B2:
	asrs r0, r0, #2
	lsls r6, r0, #2
	lsls r0, r0, #5
	add r8, r0
	movs r5, #0
	ldr r7, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r7, r0]
	b _0808832C
	.align 2, 0
_080882C4: .4byte 0x000001FF
_080882C8: .4byte 0x08B905F8
_080882CC:
	movs r0, #0
	str r0, [sp, #4]
	adds r4, r5, #1
	b _08088306
_080882D4:
	ldr r2, [sp, #4]
	lsls r1, r2, #3
	add r1, r8
	ldr r0, _08088374 @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #4
	add r2, sb
	movs r0, #0xff
	ands r2, r0
	ldr r3, [sp, #0xc]
	ldrh r3, [r3]
	adds r0, r3, r6
	ldr r7, [sp, #4]
	adds r0, r0, r7
	lsls r3, r5, #6
	adds r0, r0, r3
	ldr r3, [sp, #8]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08088378 @ =0x08B905D0
	bl PutSpriteExt
	adds r7, #1
	str r7, [sp, #4]
_08088306:
	ldr r0, [sp, #0x10]
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08088314
	adds r0, r1, #3
_08088314:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _080882D4
	adds r5, r4, #0
	ldr r2, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r2, r0]
_0808832C:
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	blt _080882CC
_08088336:
	ldr r3, [sp, #4]
	lsls r1, r3, #5
	add r1, r8
	ldr r0, _08088374 @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #4
	add r2, sb
	movs r0, #0xff
	ands r2, r0
	ldr r3, _0808837C @ =0x08B905F8
	ldr r4, [sp, #4]
	lsls r0, r4, #2
	ldr r6, [sp, #0xc]
	ldrh r6, [r6]
	adds r0, r6, r0
	lsls r4, r5, #6
	adds r0, r0, r4
	ldr r7, [sp, #8]
	adds r0, r0, r7
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088374: .4byte 0x000001FF
_08088378: .4byte 0x08B905D0
_0808837C: .4byte 0x08B905F8

	thumb_func_start sub_08088380
sub_08088380: @ 0x08088380
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _080883C4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080883C8
	bl GetCgTextFlags
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _080883C8
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x7f
	mov sl, r0
	b _080883FA
	.align 2, 0
_080883C4: .4byte 0x08B857F8
_080883C8:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080883EE
	subs r0, r2, #1
	strb r0, [r1]
	b _0808891E
_080883DC:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _0808890C
_080883EE:
	adds r0, r6, #0
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x60
_080883FA:
	str r1, [sp, #0xc]
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r2, #0
	mov sb, r2
	cmp sb, sl
	blt _08088422
	b _0808890C
_08088422:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _0808842E
	b _0808887A
_0808842E:
	lsls r0, r1, #2
	ldr r1, _08088438 @ =_0808843C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088438: .4byte _0808843C
_0808843C: @ jump table
	.4byte _080886F0 @ case 0
	.4byte _0808871E @ case 1
	.4byte _08088796 @ case 2
	.4byte _080887D8 @ case 3
	.4byte _0808874A @ case 4
	.4byte _08088756 @ case 5
	.4byte _08088762 @ case 6
	.4byte _0808876E @ case 7
	.4byte _0808887A @ case 8
	.4byte _0808887A @ case 9
	.4byte _0808887A @ case 10
	.4byte _0808887A @ case 11
	.4byte _0808887A @ case 12
	.4byte _0808887A @ case 13
	.4byte _0808887A @ case 14
	.4byte _0808887A @ case 15
	.4byte _0808887A @ case 16
	.4byte _0808887A @ case 17
	.4byte _0808887A @ case 18
	.4byte _0808887A @ case 19
	.4byte _0808887A @ case 20
	.4byte _0808887A @ case 21
	.4byte _0808877A @ case 22
	.4byte _08088788 @ case 23
	.4byte _08088640 @ case 24
	.4byte _080886A0 @ case 25
	.4byte _0808887A @ case 26
	.4byte _0808887A @ case 27
	.4byte _0808887A @ case 28
	.4byte _0808887A @ case 29
	.4byte _0808887A @ case 30
	.4byte _0808887A @ case 31
	.4byte _0808887A @ case 32
	.4byte _0808887A @ case 33
	.4byte _0808887A @ case 34
	.4byte _0808887A @ case 35
	.4byte _0808887A @ case 36
	.4byte _0808887A @ case 37
	.4byte _0808887A @ case 38
	.4byte _0808887A @ case 39
	.4byte _0808887A @ case 40
	.4byte _0808887A @ case 41
	.4byte _0808887A @ case 42
	.4byte _0808887A @ case 43
	.4byte _0808887A @ case 44
	.4byte _0808887A @ case 45
	.4byte _0808887A @ case 46
	.4byte _0808887A @ case 47
	.4byte _0808887A @ case 48
	.4byte _0808887A @ case 49
	.4byte _0808887A @ case 50
	.4byte _0808887A @ case 51
	.4byte _0808887A @ case 52
	.4byte _0808887A @ case 53
	.4byte _0808887A @ case 54
	.4byte _0808887A @ case 55
	.4byte _0808887A @ case 56
	.4byte _0808887A @ case 57
	.4byte _0808887A @ case 58
	.4byte _0808887A @ case 59
	.4byte _0808887A @ case 60
	.4byte _0808887A @ case 61
	.4byte _0808887A @ case 62
	.4byte _0808887A @ case 63
	.4byte _0808887A @ case 64
	.4byte _0808887A @ case 65
	.4byte _0808887A @ case 66
	.4byte _0808887A @ case 67
	.4byte _0808887A @ case 68
	.4byte _0808887A @ case 69
	.4byte _0808887A @ case 70
	.4byte _0808887A @ case 71
	.4byte _0808887A @ case 72
	.4byte _0808887A @ case 73
	.4byte _0808887A @ case 74
	.4byte _0808887A @ case 75
	.4byte _0808887A @ case 76
	.4byte _0808887A @ case 77
	.4byte _0808887A @ case 78
	.4byte _0808887A @ case 79
	.4byte _0808887A @ case 80
	.4byte _0808887A @ case 81
	.4byte _0808887A @ case 82
	.4byte _0808887A @ case 83
	.4byte _0808887A @ case 84
	.4byte _0808887A @ case 85
	.4byte _0808887A @ case 86
	.4byte _0808887A @ case 87
	.4byte _0808887A @ case 88
	.4byte _0808887A @ case 89
	.4byte _0808887A @ case 90
	.4byte _0808887A @ case 91
	.4byte _0808887A @ case 92
	.4byte _0808887A @ case 93
	.4byte _0808887A @ case 94
	.4byte _0808887A @ case 95
	.4byte _0808887A @ case 96
	.4byte _0808887A @ case 97
	.4byte _0808887A @ case 98
	.4byte _0808887A @ case 99
	.4byte _0808887A @ case 100
	.4byte _0808887A @ case 101
	.4byte _0808887A @ case 102
	.4byte _0808887A @ case 103
	.4byte _0808887A @ case 104
	.4byte _0808887A @ case 105
	.4byte _0808887A @ case 106
	.4byte _0808887A @ case 107
	.4byte _0808887A @ case 108
	.4byte _0808887A @ case 109
	.4byte _0808887A @ case 110
	.4byte _0808887A @ case 111
	.4byte _0808887A @ case 112
	.4byte _0808887A @ case 113
	.4byte _0808887A @ case 114
	.4byte _0808887A @ case 115
	.4byte _0808887A @ case 116
	.4byte _0808887A @ case 117
	.4byte _0808887A @ case 118
	.4byte _0808887A @ case 119
	.4byte _0808887A @ case 120
	.4byte _0808887A @ case 121
	.4byte _0808887A @ case 122
	.4byte _0808887A @ case 123
	.4byte _0808887A @ case 124
	.4byte _0808887A @ case 125
	.4byte _0808887A @ case 126
	.4byte _0808887A @ case 127
	.4byte _0808885A @ case 128
_08088640:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08088698 @ =0x08CC310C
	cmp r1, #0
	beq _0808865C
	ldr r5, _0808869C @ =0x08CC3104
_0808865C:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
_08088684:
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r5, #0
	bl StartYesNoChoice
_08088690:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _080887CE
	.align 2, 0
_08088698: .4byte 0x08CC310C
_0808869C: .4byte 0x08CC3104
_080886A0:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _080886E8 @ =0x08CC310C
	cmp r1, #0
	beq _080886BC
	ldr r5, _080886EC @ =0x08CC3104
_080886BC:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #2
	b _08088684
	.align 2, 0
_080886E8: .4byte 0x08CC310C
_080886EC: .4byte 0x08CC3104
_080886F0:
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808870C
	movs r0, #4
	bl ClearCgTextFlag
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _08088714
_0808870C:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_08088714:
	mov r0, r8
	movs r1, #0x63
	bl Proc_Goto
	b _080887CE
_0808871E:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	adds r3, r6, #0
	adds r3, #0x54
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r2, #1
	adds r0, r6, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08088742
	b _080883DC
_08088742:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _08088902
_0808874A:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #8
	strb r0, [r1]
	b _08088690
_08088756:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #0x10
	strb r0, [r1]
	b _08088690
_08088762:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #0x20
	strb r0, [r1]
	b _08088690
_0808876E:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #0x40
	strb r0, [r1]
	b _08088690
_0808877A:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldr r0, _08088784 @ =0x0000FFF7
	ands r7, r0
	b _08088902
	.align 2, 0
_08088784: .4byte 0x0000FFF7
_08088788:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	movs r0, #8
	orrs r7, r0
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	b _08088902
_08088796:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldrb r2, [r2, #1]
	cmp r2, #1
	bne _080887A4
	adds r0, #1
	str r0, [r6, #0x2c]
_080887A4:
	bl GetCgTextFlags
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _080887BA
	mov r0, r8
	movs r1, #2
	bl Proc_Goto
	b _080887CE
_080887BA:
	adds r0, r6, #0
	adds r0, #0x54
	ldrb r1, [r0]
	adds r1, #1
	adds r0, #0xb
	strb r1, [r0]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
_080887CE:
	ldr r0, _080887D4 @ =0x0000FFEF
	ands r7, r0
	b _0808890C
	.align 2, 0
_080887D4: .4byte 0x0000FFEF
_080887D8:
	ldr r0, _08088820 @ =0x0000FFEF
	ands r7, r0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08088824
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	bl StartTalkWaitForInputUnk
	b _0808884E
	.align 2, 0
_08088820: .4byte 0x0000FFEF
_08088824:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	mov r0, r8
	bl StartTalkWaitForInput
_0808884E:
	adds r1, r5, #0
	adds r2, r4, #0
	ldr r0, [r6, #0x2c]
	bl GetCgTextDimensions
	b _0808890C
_0808885A:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	ldrb r1, [r1, #1]
	cmp r1, #0x21
	bne _08088872
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #1
	ldrb r2, [r1]
	subs r0, r0, r2
	strb r0, [r1]
_08088872:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _08088902
_0808887A:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808889E
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xc
	bl Text_SetColor
	b _080888B6
_0808889E:
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xb
	bl Text_SetColor
_080888B6:
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _080888DC
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _08088902
_080888DC:
	bl GetCgTextFlags
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _08088902
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	bne _08088902
	ldr r0, _08088930 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088902
	ldr r0, _08088934 @ =0x0000038E
	bl m4aSongNumStart
_08088902:
	movs r2, #1
	add sb, r2
	cmp sb, sl
	bge _0808890C
	b _08088422
_0808890C:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	bl SetTextFont
	movs r0, #0
	adds r1, r7, #0
	bl SetFaceDispById
_0808891E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088930: .4byte 0x0202BBF8
_08088934: .4byte 0x0000038E

	thumb_func_start sub_08088938
sub_08088938: @ 0x08088938
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r1
	mov ip, r2
	adds r4, r0, #0
	movs r6, #0
	cmp r6, ip
	bge _08088994
_0808894E:
	adds r1, r4, #0
	movs r2, #0
	adds r0, r6, #1
	mov sb, r0
	cmp r2, r8
	bge _08088988
	mov r7, ip
	subs r7, #1
	mov sl, r2
_08088960:
	adds r5, r2, #1
	movs r3, #6
_08088964:
	ldr r0, [r1, #4]
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08088964
	cmp r6, r7
	bne _08088976
	mov r0, sl
	b _08088980
_08088976:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0]
_08088980:
	stm r1!, {r0}
	adds r2, r5, #0
	cmp r2, r8
	blt _08088960
_08088988:
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	mov r6, sb
	cmp r6, ip
	blt _0808894E
_08088994:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080889A4
sub_080889A4: @ 0x080889A4
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_080889AC
sub_080889AC: @ 0x080889AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x14]
	adds r6, r5, #0
	adds r6, #0x54
	movs r2, #0
	ldrsb r2, [r6, r2]
	adds r2, #1
	lsls r2, r2, #1
	ldr r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x5b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08088938
	adds r0, r7, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r4, r5, #0
	adds r4, #0x5f
	ldrb r2, [r4]
	lsls r0, r2, #4
	cmp r1, r0
	bne _08088A26
	adds r0, r5, #0
	bl sub_08087DE0
	ldrb r0, [r4]
	subs r0, #1
	ldrb r1, [r6]
	subs r0, r1, r0
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x59
	mov r2, r8
	strb r2, [r1]
	subs r4, #5
	strb r2, [r4]
	ldr r0, [r5, #0x2c]
	adds r2, r4, #0
	bl GetCgTextDimensions
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldrb r1, [r4]
	adds r0, r1, r0
	strb r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
_08088A26:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CgTextInterpreter_808FF9C
CgTextInterpreter_808FF9C: @ 0x08088A30
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl CgText_ClearSpriteText
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r1, #5
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x5a
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl GetCgTextDimensions
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RestartCgTextInterpreter
RestartCgTextInterpreter: @ 0x08088A58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08088A78 @ =0x08CC3114
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088A78: .4byte 0x08CC3114

	thumb_func_start EndCgTextInterpreter
EndCgTextInterpreter: @ 0x08088A7C
	push {lr}
	ldr r0, _08088A8C @ =0x08CC3114
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08088A8C: .4byte 0x08CC3114

	thumb_func_start sub_08088A90
sub_08088A90: @ 0x08088A90
	push {lr}
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08088AA2
	movs r0, #0
	b _08088AA4
_08088AA2:
	movs r0, #1
_08088AA4:
	pop {r1}
	bx r1

	thumb_func_start sub_08088AA8
sub_08088AA8: @ 0x08088AA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08088AD4 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _08088AE0
	ldr r0, _08088AD8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088ACE
	ldr r0, _08088ADC @ =0x0000038B
	bl m4aSongNumStart
_08088ACE:
	movs r0, #0
	b _08088B00
	.align 2, 0
_08088AD4: .4byte 0x08B857F8
_08088AD8: .4byte 0x0202BBF8
_08088ADC: .4byte 0x0000038B
_08088AE0:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08088B14
	ldr r0, _08088B0C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088AFC
	ldr r0, _08088B10 @ =0x0000038A
	bl m4aSongNumStart
_08088AFC:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
_08088B00:
	bl SetTalkChoiceResult
	adds r0, r4, #0
	bl Proc_Break
	b _08088B7A
	.align 2, 0
_08088B0C: .4byte 0x0202BBF8
_08088B10: .4byte 0x0000038A
_08088B14:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08088B36
	ldrh r2, [r4, #0x2a]
	cmp r2, #2
	bne _08088B36
	ldr r0, _08088B80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088B34
	ldr r0, _08088B84 @ =0x00000387
	bl m4aSongNumStart
_08088B34:
	strh r6, [r4, #0x2a]
_08088B36:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08088B5E
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	bne _08088B5E
	ldr r0, _08088B80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088B5A
	ldr r0, _08088B84 @ =0x00000387
	bl m4aSongNumStart
_08088B5A:
	movs r0, #2
	strh r0, [r4, #0x2a]
_08088B5E:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl PutUiHand
_08088B7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088B80: .4byte 0x0202BBF8
_08088B84: .4byte 0x00000387

	thumb_func_start StartYesNoChoice
StartYesNoChoice: @ 0x08088B88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x24]
	ldr r0, [r5]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x10
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, [r5, #4]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x38
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, _08088BE4 @ =0x08CC3174
	adds r1, r7, #0
	bl Proc_StartBlocking
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x2a]
	adds r4, #0x10
	strh r4, [r0, #0x2c]
	mov r2, sb
	strh r2, [r0, #0x2e]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088BE4: .4byte 0x08CC3174

	thumb_func_start sub_08088BE8
sub_08088BE8: @ 0x08088BE8
	push {r4, r5, lr}
	ldr r0, _08088C54 @ =0x0200D668
	bl InitUnitStack
	movs r5, #1
_08088BF2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08088C16
	ldr r0, [r4]
	cmp r0, #0
	beq _08088C16
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08088C16
	adds r0, r4, #0
	bl PushUnit
_08088C16:
	adds r5, #1
	cmp r5, #0x3f
	ble _08088BF2
	movs r5, #1
_08088C1E:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08088C42
	ldr r0, [r4]
	cmp r0, #0
	beq _08088C42
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08088C42
	adds r0, r4, #0
	bl PushUnit
_08088C42:
	adds r5, #1
	cmp r5, #0x3f
	ble _08088C1E
	bl LoadPlayerUnitsFromUnitStack
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088C54: .4byte 0x0200D668

	thumb_func_start sub_08088C58
sub_08088C58: @ 0x08088C58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _08088CD0 @ =0x08CC347C
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	mov r1, r8
	adds r2, r7, #0
	bl PutSpriteExt
	movs r5, #0
	subs r0, r6, #1
	cmp r5, r0
	bge _08088CAC
	mov r4, r8
	adds r4, #8
_08088C8E:
	ldr r0, _08088CD0 @ =0x08CC347C
	ldr r3, [r0, #4]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #1
	subs r0, r6, #1
	cmp r5, r0
	blt _08088C8E
_08088CAC:
	lsls r1, r5, #4
	add r1, r8
	adds r1, #8
	ldr r0, _08088CD0 @ =0x08CC347C
	ldr r3, [r0, #8]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088CD0: .4byte 0x08CC347C

	thumb_func_start sub_08088CD4
sub_08088CD4: @ 0x08088CD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08088D30 @ =0x02023CC8
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _08088D34 @ =0x0200D660
	adds r0, r4, #0
	bl ClearText
	movs r3, #0
	ldr r0, _08088D38 @ =0x08CC3578
	mov r8, r0
	adds r5, r4, #0
	mov sb, r8
_08088CFE:
	movs r2, #0
	lsls r1, r3, #3
	adds r6, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	mov r0, sb
	adds r0, #4
	adds r4, r1, r0
	add r1, r8
_08088D10:
	ldrb r0, [r1]
	cmp r0, r7
	bne _08088D68
	cmp r3, #5
	bne _08088D3C
	cmp r2, #0
	beq _08088D3C
	adds r1, r2, #0
	adds r1, #0x6f
	ldr r0, _08088D30 @ =0x02023CC8
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _08088D72
	.align 2, 0
_08088D30: .4byte 0x02023CC8
_08088D34: .4byte 0x0200D660
_08088D38: .4byte 0x08CC3578
_08088D3C:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	ldr r1, _08088D64 @ =0x02023CC8
	bl PutText
	b _08088D72
	.align 2, 0
_08088D64: .4byte 0x02023CC8
_08088D68:
	adds r4, #0x10
	adds r1, #0x10
	adds r2, #1
	cmp r2, #8
	ble _08088D10
_08088D72:
	adds r3, r6, #0
	cmp r3, #9
	ble _08088CFE
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08088D8C
sub_08088D8C: @ 0x08088D8C
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08088DB0 @ =0x0200E66C
_08088D92:
	ldr r0, [r1]
	cmp r0, r3
	beq _08088DBC
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _08088D92
	movs r2, #0
	ldr r1, _08088DB0 @ =0x0200E66C
_08088DA4:
	ldr r0, [r1]
	cmp r0, #0xff
	bne _08088DB4
	str r3, [r1]
	b _08088DBC
	.align 2, 0
_08088DB0: .4byte 0x0200E66C
_08088DB4:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _08088DA4
_08088DBC:
	bx lr
	.align 2, 0

	thumb_func_start sub_08088DC0
sub_08088DC0: @ 0x08088DC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r3, _08088E74 @ =0x0200E668
	movs r2, #0xff
	add r1, sp, #0x1c
_08088DD2:
	str r2, [r1]
	subs r1, #4
	cmp r1, sp
	bge _08088DD2
	cmp r0, #0
	ble _08088DE0
	subs r0, #1
_08088DE0:
	movs r6, #0
	ldrb r3, [r3]
	cmp r0, r3
	bge _08088E26
	ldr r1, _08088E78 @ =0x0200CBF0
	adds r5, r0, #0
	mov r7, sp
	lsls r0, r5, #2
	adds r4, r0, r1
_08088DF2:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08088E12
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	str r0, [r7]
_08088E12:
	adds r5, #1
	adds r7, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #7
	bgt _08088E26
	ldr r0, _08088E74 @ =0x0200E668
	ldrb r0, [r0]
	cmp r5, r0
	blt _08088DF2
_08088E26:
	movs r6, #0
	ldr r7, _08088E7C @ =0x0200E66C
	mov r8, r7
_08088E2C:
	lsls r1, r6, #2
	mov r2, r8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r4, r1, #0
	adds r6, #1
	cmp r0, #0xff
	beq _08088E64
	movs r5, #0
	adds r1, r0, #0
	mov r2, sp
	movs r3, #7
_08088E44:
	ldr r0, [r2]
	cmp r0, r1
	bne _08088E4C
	movs r5, #1
_08088E4C:
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08088E44
	cmp r5, #0
	bne _08088E64
	adds r4, r4, r7
	ldr r0, [r4]
	bl ClearIcon
	movs r0, #0xff
	str r0, [r4]
_08088E64:
	cmp r6, #7
	ble _08088E2C
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088E74: .4byte 0x0200E668
_08088E78: .4byte 0x0200CBF0
_08088E7C: .4byte 0x0200E66C

	thumb_func_start sub_08088E80
sub_08088E80: @ 0x08088E80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsrs r0, r0, #0x1b
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r4, #0
	bne _08088EE8
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08088ED0
	ldr r2, _08088EC4 @ =0x02023C60
	ldr r0, _08088EC8 @ =0xFFFFF368
	adds r1, r3, r0
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _08088ECC @ =0xFFFFF36E
	adds r1, r3, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	b _08088F2A
	.align 2, 0
_08088EC4: .4byte 0x02023C60
_08088EC8: .4byte 0xFFFFF368
_08088ECC: .4byte 0xFFFFF36E
_08088ED0:
	ldr r1, _08088EE4 @ =0x02023C60
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	strh r2, [r0]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	strh r2, [r0]
	b _08088F2A
	.align 2, 0
_08088EE4: .4byte 0x02023C60
_08088EE8:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08088F18
	ldr r2, _08088F0C @ =0x02023C60
	ldr r4, _08088F10 @ =0xFFFFF768
	adds r0, r3, r4
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _08088F14 @ =0xFFFFF76E
	adds r0, r3, r1
	movs r3, #0xbd
	lsls r3, r3, #1
	adds r1, r2, r3
	b _08088F28
	.align 2, 0
_08088F0C: .4byte 0x02023C60
_08088F10: .4byte 0xFFFFF768
_08088F14: .4byte 0xFFFFF76E
_08088F18:
	ldr r1, _08088F38 @ =0x02023C60
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r2, r1, r4
	strh r0, [r2]
	movs r2, #0xbd
	lsls r2, r2, #1
	adds r1, r1, r2
_08088F28:
	strh r0, [r1]
_08088F2A:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088F38: .4byte 0x02023C60

	thumb_func_start sub_08088F3C
sub_08088F3C: @ 0x08088F3C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r1, #0
	beq _08088F7E
	bl PrepGetLatestCharId
	b _08088F82
_08088F54:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r3, [r4, #0x3e]
	b _0808902C
_08088F5E:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r1, [r4, #0x3e]
	b _0808902C
_08088F68:
	subs r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _0808902C
_08088F72:
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	strh r7, [r4, #0x3e]
	b _0808902C
_08088F7E:
	bl GetLastStatScreenUnitId
_08088F82:
	adds r1, r0, #0
	movs r3, #0
	ldr r0, _08088FBC @ =0x0200E668
	ldrb r6, [r0]
	mov sb, r0
	cmp r3, r6
	bge _0808902C
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0x2c
	adds r0, r0, r4
	mov ip, r0
	movs r5, #0x40
	rsbs r5, r5, #0
	movs r7, #0x10
	rsbs r7, r7, #0
	ldr r2, _08088FC0 @ =0x0200CBF0
_08088FA6:
	mov r0, r8
	cmp r0, #0
	beq _08088FC4
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r1
	beq _08088FD2
	b _08089020
	.align 2, 0
_08088FBC: .4byte 0x0200E668
_08088FC0: .4byte 0x0200CBF0
_08088FC4:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _08089020
_08088FD2:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r3, [r0]
	cmp r3, #0
	beq _08088F54
	mov r0, sb
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r3, r0
	bne _08088FFE
	cmp r2, #6
	bls _08088F5E
	movs r0, #5
	mov r1, ip
	strb r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	b _0808902C
_08088FFE:
	ldrh r2, [r4, #0x3e]
	lsrs r1, r2, #4
	adds r0, r1, #0
	cmp r3, r0
	ble _0808900E
	adds r0, #5
	cmp r3, r0
	blt _08088F68
_0808900E:
	cmp r2, r7
	bgt _08088F72
	cmp r2, r5
	bge _0808902C
	movs r0, #4
	mov r1, ip
	strb r0, [r1]
	strh r5, [r4, #0x3e]
	b _0808902C
_08089020:
	adds r5, #0x10
	adds r7, #0x10
	adds r2, #4
	adds r3, #1
	cmp r3, r6
	blt _08088FA6
_0808902C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08089038
sub_08089038: @ 0x08089038
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080890DC
	ldr r0, _080890D8 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0xf0
	strb r3, [r0]
	subs r1, #1
	movs r0, #0x98
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	ldrb r3, [r1]
	orrs r0, r3
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x35
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r7, [r6]
	ands r0, r7
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r5
	strb r0, [r6]
	mov r5, ip
	adds r5, #0x36
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r4
	orrs r1, r3
	orrs r1, r2
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	b _0808913C
	.align 2, 0
_080890D8: .4byte 0x03002870
_080890DC:
	ldr r1, _08089144 @ =0x03002870
	mov ip, r1
	movs r0, #0x20
	ldrb r3, [r1, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r6, ip
	strb r0, [r6, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r1, #4
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
_0808913C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089144: .4byte 0x03002870

	thumb_func_start sub_08089148
sub_08089148: @ 0x08089148
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllMus
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	bl EndGreenText
	ldr r2, _08089188 @ =0x03002870
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
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808918C
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	b _08089192
	.align 2, 0
_08089188: .4byte 0x03002870
_0808918C:
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
_08089192:
	ldr r1, _080891CC @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	ldr r1, _080891D0 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r2, r4, #0
	adds r2, #0x32
	ldrb r2, [r2]
	adds r0, r2, r0
	strb r0, [r1, #0x1a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080891CC: .4byte 0x0200CBF0
_080891D0: .4byte 0x0202BBF8

	thumb_func_start sub_080891D4
sub_080891D4: @ 0x080891D4
	push {lr}
	bl sub_08089794
	ldr r2, _080891FC @ =0x03002870
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
	pop {r0}
	bx r0
	.align 2, 0
_080891FC: .4byte 0x03002870

	thumb_func_start sub_08089200
sub_08089200: @ 0x08089200
	ldr r2, _0808921C @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_0808921C: .4byte 0x03002870

	thumb_func_start sub_08089220
sub_08089220: @ 0x08089220
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	adds r0, #0x3a
	strb r1, [r0]
	subs r0, #0xa
	strb r1, [r0]
	adds r0, r4, #0
	bl StartMenuScrollBar
	str r0, [r4, #0x34]
	movs r0, #0xe0
	movs r1, #0x40
	bl PutMenuScrollBarAt
	ldr r0, [r4, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08089278 @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	movs r0, #0xe4
	lsls r0, r0, #7
	movs r1, #1
	bl InitMenuScrollBarImg
	bl ForceSyncUnitSpriteSheet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089278: .4byte 0x0200E668

	thumb_func_start sub_0808927C
sub_0808927C: @ 0x0808927C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _080892C8 @ =0x0840F348
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _080892D0
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r5, [r4]
	lsrs r0, r5, #3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _080892CC @ =0x08CC3488
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0xb8
	bl PutSpriteExt
	b _080892F6
	.align 2, 0
_080892C8: .4byte 0x0840F348
_080892CC: .4byte 0x08CC3488
_080892D0:
	ldr r1, _0808936C @ =0x000020B8
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r2, [r4]
	lsrs r0, r2, #3
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _08089370 @ =0x08CC3488
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	bl PutSpriteExt
_080892F6:
	str r4, [sp, #0x14]
	ldr r1, _08089374 @ =0x08CC3550
	ldr r0, [r6, #0x2c]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x90
	lsls r5, r5, #8
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0x20
	movs r2, #8
	bl PutSpriteExt
	ldr r3, _08089378 @ =0x08CC3490
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xa0
	movs r2, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _0808937C @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	ldr r4, [r6, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bls _08089384
	ldr r1, _08089380 @ =0x08CC3578
	adds r3, r4, #0
	adds r3, #0x2d
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r5, [r2]
	lsls r0, r5, #3
	adds r0, r0, r5
	ldrb r3, [r3]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, #0x28
	bl PutUiHand
	b _0808939A
	.align 2, 0
_0808936C: .4byte 0x000020B8
_08089370: .4byte 0x08CC3488
_08089374: .4byte 0x08CC3550
_08089378: .4byte 0x08CC3490
_0808937C: .4byte 0x0200E668
_08089380: .4byte 0x08CC3578
_08089384:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x40
	ldr r3, _080893E8 @ =0x08CC3498
	str r5, [sp]
	movs r0, #0xd
	movs r1, #4
	bl PutSpriteExt
_0808939A:
	ldr r1, [r6, #0x2c]
	ldrh r0, [r6, #0x38]
	ldrh r2, [r1, #0x3e]
	cmp r0, r2
	bne _080893AC
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _080893F4
_080893AC:
	ldr r0, _080893EC @ =0x02022860
	ldr r1, _080893F0 @ =0x02012970
	ldrh r1, [r1, #0x10]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r1, [r0]
	bl EnablePalSync
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r2, [sp, #0x18]
	mov r8, r0
	cmp r1, #0
	bne _08089430
	movs r0, #1
	bl sub_08089038
	movs r0, #1
	mov r4, r8
	strb r0, [r4]
	b _08089430
	.align 2, 0
_080893E8: .4byte 0x08CC3498
_080893EC: .4byte 0x02022860
_080893F0: .4byte 0x02012970
_080893F4:
	ldr r2, _080894D8 @ =0x02022860
	ldr r3, _080894DC @ =0x02012970
	adds r4, r6, #0
	adds r4, #0x3c
	ldrb r5, [r4]
	lsrs r0, r5, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	adds r0, r6, #0
	adds r0, #0x3a
	str r4, [sp, #0x18]
	mov r8, r0
	ldrb r2, [r0]
	cmp r2, #1
	bne _08089430
	movs r0, #0
	bl sub_08089038
	movs r0, #0
	mov r3, r8
	strb r0, [r3]
_08089430:
	bl SyncUnitSpriteSheet
	ldrh r0, [r6, #0x38]
	lsrs r7, r0, #4
	movs r1, #0xf
	ands r0, r1
	rsbs r0, r0, #0
	mov sl, r0
	movs r5, #0
	ldr r0, _080894E0 @ =0x0200E668
	movs r4, #0x30
	adds r4, r4, r6
	mov sb, r4
	ldrb r0, [r0]
	cmp r7, r0
	bge _08089482
	ldr r1, _080894E4 @ =0x0200CBF0
	adds r4, r7, #0
	lsls r0, r7, #2
	adds r0, r0, r1
	str r0, [sp, #0x1c]
_0808945A:
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, [sp, #0x1c]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl PutUnitSprite
	adds r4, #1
	adds r5, #1
	cmp r5, #5
	bgt _08089482
	ldr r0, _080894E0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808945A
_08089482:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	beq _080894AE
	adds r3, r5, r7
	ldr r0, _080894E0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bge _080894AE
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, _080894E4 @ =0x0200CBF0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl PutUnitSprite
_080894AE:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	adds r2, r0, #0
	adds r2, #0x2e
	ldrb r1, [r1]
	ldrb r2, [r2]
	cmp r1, r2
	bhs _080894E8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _080894E8
	mov r3, sb
	ldrb r1, [r3]
	movs r0, #1
	movs r2, #1
	bl sub_08088E80
	b _080894F4
	.align 2, 0
_080894D8: .4byte 0x02022860
_080894DC: .4byte 0x02012970
_080894E0: .4byte 0x0200E668
_080894E4: .4byte 0x0200CBF0
_080894E8:
	mov r4, sb
	ldrb r1, [r4]
	movs r0, #1
	movs r2, #0
	bl sub_08088E80
_080894F4:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	cmp r1, #1
	bls _08089516
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08089516
	mov r5, sb
	ldrb r1, [r5]
	movs r0, #0
	movs r2, #1
	bl sub_08088E80
	b _08089522
_08089516:
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_08088E80
_08089522:
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #5
	bls _08089536
	movs r0, #0
	strb r0, [r1]
_08089536:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [sp, #0x18]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08089558
sub_08089558: @ 0x08089558
	bx lr
	.align 2, 0

	thumb_func_start sub_0808955C
sub_0808955C: @ 0x0808955C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [r7, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0808957A
	mov r1, r8
	adds r1, #0x3b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808957A:
	ldr r5, _0808965C @ =0x0200C8F0
	ldr r4, _08089660 @ =0x0200E668
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r7, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl BattleGenerateUiStats
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r3, _08089664 @ =0x0203A3F0
	adds r0, r3, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r0, #1
	movs r2, #0xff
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #4]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #8]
	adds r0, r7, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	cmp r6, r5
	bge _08089606
_080895F0:
	adds r0, r7, #0
	adds r1, r4, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089600
	adds r6, #1
_08089600:
	adds r4, #1
	cmp r4, r5
	blt _080895F0
_08089606:
	cmp r6, #3
	ble _08089620
	mov r5, r8
	adds r5, #0x2e
	ldrb r4, [r5]
	subs r0, r6, #1
	movs r1, #3
	bl __divsi3
	adds r0, #6
	cmp r4, r0
	bge _08089620
	strb r0, [r5]
_08089620:
	ldr r4, _0808965C @ =0x0200C8F0
	ldr r3, _08089660 @ =0x0200E668
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r6, [r0, #0xa]
	ldr r0, _08089668 @ =0x0200CBF0
	ldrb r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r0, r7, #0
	bl GetUnitSMSId
	bl UseUnitSprite
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808965C: .4byte 0x0200C8F0
_08089660: .4byte 0x0200E668
_08089664: .4byte 0x0203A3F0
_08089668: .4byte 0x0200CBF0

	thumb_func_start sub_0808966C
sub_0808966C: @ 0x0808966C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _080896C0 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _080896C8
	ldr r0, _080896C4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	adds r0, #0x40
	cmp r5, r0
	bge _08089704
_0808968C:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080896B2
	ldr r0, [r4]
	cmp r0, #0
	beq _080896B2
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080896B2
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0808955C
_080896B2:
	adds r5, #1
	ldr r0, _080896C4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r0, #0x40
	cmp r5, r0
	blt _0808968C
	b _08089704
	.align 2, 0
_080896C0: .4byte 0x0200E668
_080896C4: .4byte 0x0202BBF8
_080896C8:
	ldr r0, _080896D0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _080896FE
	.align 2, 0
_080896D0: .4byte 0x0202BBF8
_080896D4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080896F8
	ldr r0, [r2]
	cmp r0, #0
	beq _080896F8
	ldr r0, [r2, #0xc]
	ldr r1, _0808970C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080896F8
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_0808955C
_080896F8:
	adds r4, #1
	ldr r0, _08089710 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
_080896FE:
	adds r0, #0x40
	cmp r4, r0
	blt _080896D4
_08089704:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808970C: .4byte 0x0001000C
_08089710: .4byte 0x0202BBF8

	thumb_func_start sub_08089714
sub_08089714: @ 0x08089714
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08089758 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808975C
	movs r5, #1
_0808972A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08089750
	ldr r0, [r4]
	cmp r0, #0
	beq _08089750
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089750
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0808955C
_08089750:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808972A
	b _08089788
	.align 2, 0
_08089758: .4byte 0x0200E668
_0808975C:
	movs r4, #1
_0808975E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08089782
	ldr r0, [r2]
	cmp r0, #0
	beq _08089782
	ldr r0, [r2, #0xc]
	ldr r1, _08089790 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08089782
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_0808955C
_08089782:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808975E
_08089788:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089790: .4byte 0x0001000C

	thumb_func_start sub_08089794
sub_08089794: @ 0x08089794
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	ldr r2, _08089878 @ =0x03002870
	movs r6, #1
	ldrb r0, [r2, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnVMatch
	movs r0, #0
	bl InitBgs
	bl ResetText
	bl ResetTextFont
	bl ClearIcons
	bl ApplyUnitSpritePalettes
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _0808987C @ =0x02022BC0
	ldr r2, _08089880 @ =0x01000008
	add r0, sp, #4
	bl CpuFastSet
	bl ApplySystemObjectsGraphics
	mov r0, r8
	bl StartGreenText
	mov r0, r8
	adds r0, #0x3b
	strb r4, [r0]
	subs r0, #0xd
	movs r5, #6
	strb r5, [r0]
	mov r0, r8
	bl sub_08089714
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08089828
	mov r0, r8
	adds r0, #0x2a
	mov r1, r8
	adds r1, #0x32
	str r1, [sp, #0x18]
	mov r2, r8
	adds r2, #0x29
	str r2, [sp, #0xc]
	movs r1, #0x2f
	add r1, r8
	mov sl, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080898A0
_08089828:
	ldr r4, _08089884 @ =0x0202BBF8
	ldrb r1, [r4, #0x1a]
	mov r3, r8
	adds r3, #0x34
	mov r2, r8
	adds r2, #0x32
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _0808984C
	lsrs r0, r1, #7
	ands r0, r6
	adds r2, #1
	strb r0, [r2]
	strb r0, [r3]
	movs r0, #0x7f
	ands r1, r0
	ldr r6, [sp, #0x18]
	strb r1, [r6]
_0808984C:
	mov r0, r8
	adds r0, #0x29
	str r0, [sp, #0xc]
	movs r0, #0x2f
	add r0, r8
	mov sl, r0
	ldr r1, [sp, #0xc]
	ldrb r1, [r1]
	cmp r1, #4
	beq _08089896
	ldrb r0, [r0]
	cmp r0, #0
	beq _08089896
	ldrb r4, [r4, #0x19]
	lsrs r1, r4, #4
	cmp r1, #0
	beq _08089896
	cmp r1, #6
	bls _08089888
	mov r2, sl
	strb r5, [r2]
	b _0808988C
	.align 2, 0
_08089878: .4byte 0x03002870
_0808987C: .4byte 0x02022BC0
_08089880: .4byte 0x01000008
_08089884: .4byte 0x0202BBF8
_08089888:
	mov r6, sl
	strb r1, [r6]
_0808988C:
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	adds r1, #0x36
	strb r0, [r1]
_08089896:
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl SortUnitList
_080898A0:
	ldr r0, _0808997C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r4, _08089980 @ =0x02023460
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _08089984 @ =0x02023C60
	movs r1, #0
	bl TmFill
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl UnpackUiWindowFrameGraphics
	ldr r0, _08089988 @ =0x0840D3F8
	ldr r1, _0808998C @ =0x06014800
	bl Decompress
	ldr r0, _08089990 @ =0x0840DCE4
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08090F30
	ldr r1, _08089994 @ =0x0840D304
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl sub_080AACD8
	movs r4, #0
	mov r6, r8
	adds r6, #0x2e
	str r6, [sp, #0x14]
	mov r0, r8
	adds r0, #0x39
	str r0, [sp, #8]
	mov r1, r8
	adds r1, #0x2b
	str r1, [sp, #0x10]
	ldr r6, _08089998 @ =0x0200D5A8
	movs r2, #0x10
	adds r2, r2, r6
	mov sb, r2
	adds r5, r6, #0
	movs r7, #0
_0808990C:
	lsls r0, r4, #3
	ldr r1, _0808999C @ =0x0200D570
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r0, r6, #0
	adds r0, #8
	adds r0, r7, r0
	movs r1, #7
	bl InitText
	mov r0, sb
	movs r1, #5
	bl InitText
	movs r0, #0x18
	add sb, r0
	adds r5, #0x18
	adds r7, #0x18
	adds r4, #1
	cmp r4, #6
	ble _0808990C
	ldr r0, _080899A0 @ =0x0200D650
	movs r1, #4
	bl InitText
	ldr r0, _080899A4 @ =0x0200D658
	movs r1, #0x14
	bl InitText
	ldr r0, _080899A8 @ =0x0200D660
	movs r1, #4
	bl InitText
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	bl sub_08088CD4
	ldr r2, [sp, #0xc]
	ldrb r2, [r2]
	cmp r2, #4
	bne _080899AC
	mov r0, r8
	movs r1, #0
	bl sub_08088F3C
	movs r0, #0
	ldr r6, [sp, #0xc]
	strb r0, [r6]
	b _080899BC
	.align 2, 0
_0808997C: .4byte 0x02022C60
_08089980: .4byte 0x02023460
_08089984: .4byte 0x02023C60
_08089988: .4byte 0x0840D3F8
_0808998C: .4byte 0x06014800
_08089990: .4byte 0x0840DCE4
_08089994: .4byte 0x0840D304
_08089998: .4byte 0x0200D5A8
_0808999C: .4byte 0x0200D570
_080899A0: .4byte 0x0200D650
_080899A4: .4byte 0x0200D658
_080899A8: .4byte 0x0200D660
_080899AC:
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	cmp r0, #1
	bne _080899BC
	mov r0, r8
	movs r1, #1
	bl sub_08088F3C
_080899BC:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x3c]
	ldr r6, [sp, #0x10]
	strb r1, [r6]
	ldr r4, _08089A10 @ =0x0200D650
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, _08089A14 @ =0x000010F2
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08089A18 @ =0x02023DA6
	adds r0, r4, #0
	bl PutText
	ldr r1, _08089A1C @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_080899FE:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _080899FE
	mov r0, r8
	ldrh r0, [r0, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _08089A3E
	.align 2, 0
_08089A10: .4byte 0x0200D650
_08089A14: .4byte 0x000010F2
_08089A18: .4byte 0x02023DA6
_08089A1C: .4byte 0x0200E66C
_08089A20:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	ldr r2, _08089B58 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	mov r6, r8
	ldrh r6, [r6, #0x3e]
	lsrs r0, r6, #4
	adds r0, #6
_08089A3E:
	cmp r4, r0
	bge _08089A4A
	ldr r0, _08089B5C @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089A20
_08089A4A:
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #1
	bl sub_0808AC90
	ldr r7, _08089B60 @ =0x03002870
	movs r0, #0x20
	ldrb r6, [r7, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r5, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x34
	movs r0, #1
	mov sb, r0
	ldrb r0, [r2]
	mov r1, sb
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r1, #8
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r2]
	ands r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, r8
	ldrh r2, [r0, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	orrs r0, r4
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	mov r2, sb
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	ldr r0, _08089B64 @ =0x0840D224
	ldr r1, _08089B68 @ =0x02023960
	bl Decompress
	ldr r0, _08089B6C @ =0x08405B0C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08089B70 @ =0x08CC3404
	mov r1, r8
	bl Proc_Start
	mov r1, r8
	str r0, [r1, #0x40]
	ldr r2, [sp, #8]
	ldrb r2, [r2]
	cmp r2, #1
	bne _08089B74
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089B74
	movs r0, #0
	movs r1, #0xa
	bl StartPrepMuralBackground
	mov r6, r8
	str r0, [r6, #0x44]
	b _08089B82
	.align 2, 0
_08089B58: .4byte 0x02022C60
_08089B5C: .4byte 0x0200E668
_08089B60: .4byte 0x03002870
_08089B64: .4byte 0x0840D224
_08089B68: .4byte 0x02023960
_08089B6C: .4byte 0x08405B0C
_08089B70: .4byte 0x08CC3404
_08089B74:
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	mov r1, r8
	str r0, [r1, #0x44]
_08089B82:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UnitList_Init
UnitList_Init: @ 0x08089B9C
	push {lr}
	adds r3, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	adds r0, #8
	movs r2, #1
	strb r2, [r0]
	subs r0, #5
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #3
	bne _08089BC8
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _08089BCE
_08089BC8:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
_08089BCE:
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #0
	strb r0, [r2]
	movs r2, #0
	strh r1, [r3, #0x3e]
	adds r1, r3, #0
	adds r1, #0x32
	movs r0, #1
	strb r0, [r1]
	subs r1, #8
	strb r2, [r1]
	adds r1, #9
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_08089794
	pop {r0}
	bx r0

	thumb_func_start sub_08089C00
sub_08089C00: @ 0x08089C00
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x3a
	adds r6, r5, #0
	adds r6, #0x3b
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bls _08089C88
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _08089C50
_08089C32:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08089C78 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_08089C50:
	cmp r4, r0
	bge _08089C5C
	ldr r0, _08089C7C @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089C32
_08089C5C:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, _08089C80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089C9C
	ldr r0, _08089C84 @ =0x0000038A
	bl m4aSongNumStart
	b _08089C9C
	.align 2, 0
_08089C78: .4byte 0x02022C60
_08089C7C: .4byte 0x0200E668
_08089C80: .4byte 0x0202BBF8
_08089C84: .4byte 0x0000038A
_08089C88:
	ldr r0, _08089CA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089C9C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08089C9C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089CA4: .4byte 0x0202BBF8

	thumb_func_start sub_08089CA8
sub_08089CA8: @ 0x08089CA8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089D30
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	adds r6, r5, #0
	adds r6, #0x3b
	b _08089CF8
_08089CDA:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08089D20 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_08089CF8:
	cmp r4, r0
	bge _08089D04
	ldr r0, _08089D24 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089CDA
_08089D04:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, _08089D28 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089D44
	ldr r0, _08089D2C @ =0x0000038B
	bl m4aSongNumStart
	b _08089D44
	.align 2, 0
_08089D20: .4byte 0x02022C60
_08089D24: .4byte 0x0200E668
_08089D28: .4byte 0x0202BBF8
_08089D2C: .4byte 0x0000038B
_08089D30:
	ldr r0, _08089D4C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089D44
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08089D44:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089D4C: .4byte 0x0202BBF8

	thumb_func_start sub_08089D50
sub_08089D50: @ 0x08089D50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldr r1, _08089D7C @ =0x0200CBF0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08089D84
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _08089D80 @ =0x000003B1
	b _08089DAE
	.align 2, 0
_08089D7C: .4byte 0x0200CBF0
_08089D80: .4byte 0x000003B1
_08089D84:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08089DC6
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089DBC
	adds r0, r5, #0
	bl sub_08090DB0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089DBC
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _08089DB8 @ =0x000003AD
_08089DAE:
	movs r0, #0
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _08089DCE
	.align 2, 0
_08089DB8: .4byte 0x000003AD
_08089DBC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08089C00
	b _08089DCE
_08089DC6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08089CA8
_08089DCE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08089DD4
sub_08089DD4: @ 0x08089DD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r1, #0
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08089E08
	ldr r0, _08089E04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089E62
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08089E62
	.align 2, 0
_08089E04: .4byte 0x0202BBF8
_08089E08:
	ldr r4, [r6, #0xc]
	movs r5, #0xc0
	lsls r5, r5, #8
	adds r0, r4, #0
	ands r0, r5
	lsrs r1, r0, #0xe
	adds r0, r1, r2
	adds r0, #3
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #0xe
	ldr r0, _08089E44 @ =0xFFFF3FFF
	ands r4, r0
	orrs r4, r1
	str r4, [r6, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _08089E50
	ldr r0, _08089E48 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089E62
	ldr r0, _08089E4C @ =0x0000038A
	bl m4aSongNumStart
	b _08089E62
	.align 2, 0
_08089E44: .4byte 0xFFFF3FFF
_08089E48: .4byte 0x0202BBF8
_08089E4C: .4byte 0x0000038A
_08089E50:
	ldr r0, _08089E68 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089E62
	ldr r0, _08089E6C @ =0x0000038B
	bl m4aSongNumStart
_08089E62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089E68: .4byte 0x0202BBF8
_08089E6C: .4byte 0x0000038B

	thumb_func_start sub_08089E70
sub_08089E70: @ 0x08089E70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _08089E98 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _08089E9C
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #2
	b _08089EA2
	.align 2, 0
_08089E98: .4byte 0x08B857F8
_08089E9C:
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
_08089EA2:
	strb r0, [r1]
	mov r8, r1
	mov r0, ip
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _08089EC4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0808A206
_08089EC4:
	movs r1, #1
	mov sb, r1
	mov r6, sb
	ands r6, r4
	cmp r6, #0
	beq _08089F34
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	beq _08089EEC
	cmp r0, #1
	bgt _08089EE4
	cmp r0, #0
	beq _08089EF4
	b _0808A206
_08089EE4:
	cmp r0, #3
	bne _08089EEA
	b _08089FEA
_08089EEA:
	b _0808A206
_08089EEC:
	adds r0, r5, #0
	bl sub_08089D50
	b _0808A206
_08089EF4:
	ldr r1, _08089F28 @ =0x0200CBF0
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SetStatScreenLastUnitId
	ldr r0, _08089F2C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089F20
	ldr r0, _08089F30 @ =0x0000038A
	bl m4aSongNumStart
_08089F20:
	adds r0, r5, #0
	bl Proc_Break
	b _0808A206
	.align 2, 0
_08089F28: .4byte 0x0200CBF0
_08089F2C: .4byte 0x0202BBF8
_08089F30: .4byte 0x0000038A
_08089F34:
	ldrh r1, [r3, #6]
	movs r2, #0x20
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _08089FCC
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _08089F88
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne _08089F58
	b _0808A206
_08089F58:
	ldr r1, _08089F80 @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_08089DD4
	ldrb r1, [r4]
	ldr r2, _08089F84 @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r6, [sp]
	b _0808A00C
	.align 2, 0
_08089F80: .4byte 0x0200CBF0
_08089F84: .4byte 0x02022C60
_08089F88:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _08089F94
	b _0808A206
_08089F94:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	ldr r0, _08089FC4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08089FBA
	b _0808A206
_08089FBA:
	ldr r0, _08089FC8 @ =0x0000038F
	bl m4aSongNumStart
	b _0808A206
	.align 2, 0
_08089FC4: .4byte 0x0202BBF8
_08089FC8: .4byte 0x0000038F
_08089FCC:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0808A064
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A01C
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	bne _08089FEA
	b _0808A206
_08089FEA:
	ldr r1, _0808A014 @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r2, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl sub_08089DD4
	ldrb r1, [r4]
	ldr r2, _0808A018 @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r7, [sp]
_0808A00C:
	adds r0, r5, #0
	bl sub_0808AD00
	b _0808A206
	.align 2, 0
_0808A014: .4byte 0x0200CBF0
_0808A018: .4byte 0x02022C60
_0808A01C:
	adds r0, r5, #0
	adds r0, #0x2f
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0808A02E
	b _0808A206
_0808A02E:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r0, _0808A05C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A050
	ldr r0, _0808A060 @ =0x0000038F
	bl m4aSongNumStart
_0808A050:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0808A206
	.align 2, 0
_0808A05C: .4byte 0x0202BBF8
_0808A060: .4byte 0x0000038F
_0808A064:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0808A084
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r3, #4]
	ands r0, r1
	cmp r0, #0
	beq _0808A14E
	adds r0, r7, #0
	ldrh r3, [r3, #0x10]
	ands r0, r3
	cmp r0, #0
	beq _0808A14E
_0808A084:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r0, [r6]
	cmp r0, #0
	bne _0808A0BC
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A098
	b _0808A206
_0808A098:
	ldr r0, _0808A0B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A0AA
	ldr r0, _0808A0B8 @ =0x00000386
	bl m4aSongNumStart
_0808A0AA:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #3
	strb r0, [r1]
	b _0808A206
	.align 2, 0
_0808A0B4: .4byte 0x0202BBF8
_0808A0B8: .4byte 0x00000386
_0808A0BC:
	subs r0, #1
	strb r0, [r6]
	ldr r0, _0808A13C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A0D2
	ldr r0, _0808A140 @ =0x00000386
	bl m4aSongNumStart
_0808A0D2:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bhi _0808A148
	ldrh r2, [r5, #0x3e]
	lsrs r0, r2, #4
	cmp r0, #0
	beq _0808A148
	cmp r1, #0
	bne _0808A0F4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #1
	strb r0, [r4]
_0808A0F4:
	ldrh r3, [r5, #0x3e]
	lsrs r1, r3, #4
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808A144 @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	mov r0, sb
	str r0, [sp]
	adds r0, r5, #0
	bl sub_0808AD00
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r1, [r1]
	lsls r2, r1, #2
	ldrh r3, [r5, #0x3e]
	subs r2, r3, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrb r0, [r4]
	cmp r0, #0
	bne _0808A206
	b _0808A202
	.align 2, 0
_0808A13C: .4byte 0x0202BBF8
_0808A140: .4byte 0x00000386
_0808A144: .4byte 0x02022C60
_0808A148:
	ldrb r0, [r4]
	subs r0, #1
	b _0808A204
_0808A14E:
	mov r0, ip
	ldr r2, [r0]
	movs r1, #0x80
	adds r0, r1, #0
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r0, #0
	bne _0808A174
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r3, [r2, #4]
	ands r0, r3
	cmp r0, #0
	beq _0808A206
	adds r0, r1, #0
	ldrh r2, [r2, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _0808A206
_0808A174:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r1, [r6]
	ldr r7, _0808A1F0 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808A206
	adds r0, r1, #1
	strb r0, [r6]
	ldr r0, _0808A1F4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A19A
	ldr r0, _0808A1F8 @ =0x00000386
	bl m4aSongNumStart
_0808A19A:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bne _0808A200
	ldrb r1, [r6]
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	beq _0808A200
	ldrh r2, [r5, #0x3e]
	lsrs r1, r2, #4
	adds r1, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808A1FC @ =0x02022C60
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	adds r0, r5, #0
	bl sub_0808AD00
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	mov r3, r8
	ldrb r3, [r3]
	lsls r2, r3, #2
	ldrh r0, [r5, #0x3e]
	adds r2, r0, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	b _0808A206
	.align 2, 0
_0808A1F0: .4byte 0x0200E668
_0808A1F4: .4byte 0x0202BBF8
_0808A1F8: .4byte 0x00000386
_0808A1FC: .4byte 0x02022C60
_0808A200:
	ldrb r0, [r4]
_0808A202:
	adds r0, #1
_0808A204:
	strb r0, [r4]
_0808A206:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0808A214
sub_0808A214: @ 0x0808A214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	ldr r2, _0808A248 @ =0x08B857F8
	cmp r0, #0
	beq _0808A24C
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808A24C
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808A4F4
	.align 2, 0
_0808A248: .4byte 0x08B857F8
_0808A24C:
	ldr r1, [r2]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808A338
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808A338
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x2a
	movs r0, #1
	strb r0, [r2]
	ldr r0, _0808A2D4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	mov r8, r1
	cmp r0, #0
	blt _0808A286
	ldr r0, _0808A2D8 @ =0x0000038A
	bl m4aSongNumStart
_0808A286:
	ldr r1, _0808A2DC @ =0x08CC3578
	adds r6, r7, #0
	adds r6, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r2, [r5]
	lsls r0, r2, #3
	adds r0, r0, r2
	ldrb r3, [r6]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r4, r8
	strb r0, [r4]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl SortUnitList
	lsls r0, r0, #0x18
	mov sb, r4
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	adds r3, r7, #0
	adds r3, #0x35
	str r3, [sp, #8]
	cmp r0, #0
	beq _0808A30C
	movs r4, #0
	b _0808A2F8
	.align 2, 0
_0808A2D4: .4byte 0x0202BBF8
_0808A2D8: .4byte 0x0000038A
_0808A2DC: .4byte 0x08CC3578
_0808A2E0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r5]
	movs r0, #1
	str r0, [sp]
	adds r0, r7, #0
	ldr r2, _0808A330 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	cmp r4, #5
	bgt _0808A300
_0808A2F8:
	ldr r0, _0808A334 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A2E0
_0808A300:
	ldrh r0, [r7, #0x3e]
	bl sub_08088DC0
	movs r0, #1
	bl EnableBgSync
_0808A30C:
	mov r4, sb
	ldrb r0, [r4]
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r6]
	ldr r2, [sp, #8]
	strb r0, [r2]
	mov r3, r8
	ldrb r3, [r3]
	ldr r4, [sp, #4]
	cmp r3, r4
	bne _0808A326
	b _0808A4F4
_0808A326:
	mov r6, r8
	ldrb r0, [r6]
	bl sub_08088CD4
	b _0808A4F4
	.align 2, 0
_0808A330: .4byte 0x02022C60
_0808A334: .4byte 0x0200E668
_0808A338:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808A378
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r4, [r0]
	cmp r4, #0
	bne _0808A378
	ldr r0, _0808A370 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A360
	ldr r0, _0808A374 @ =0x00000386
	bl m4aSongNumStart
_0808A360:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	strb r4, [r0]
	b _0808A4F4
	.align 2, 0
_0808A370: .4byte 0x0202BBF8
_0808A374: .4byte 0x00000386
_0808A378:
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	movs r0, #0x20
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0808A412
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	subs r1, #6
	ldrb r0, [r1]
	adds r6, r1, #0
	cmp r0, #0
	bne _0808A40C
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0808A3A6
	b _0808A4F4
_0808A3A6:
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A3B2
	b _0808A4F4
_0808A3B2:
	ldr r0, _0808A400 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A3C4
	ldr r0, _0808A404 @ =0x0000038F
	bl m4aSongNumStart
_0808A3C4:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r4, #8
	ldr r2, _0808A408 @ =0x08CC3578
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0808A3FA
	adds r0, r1, r2
	adds r1, r0, #0
	adds r1, #0x80
_0808A3EC:
	subs r1, #0x10
	subs r4, #1
	cmp r4, #0
	ble _0808A3FA
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0808A3EC
_0808A3FA:
	strb r4, [r6]
	b _0808A47C
	.align 2, 0
_0808A400: .4byte 0x0202BBF8
_0808A404: .4byte 0x0000038F
_0808A408: .4byte 0x08CC3578
_0808A40C:
	subs r0, #1
	strb r0, [r1]
	b _0808A496
_0808A412:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0808A4B4
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r0, [r2]
	cmp r0, #8
	beq _0808A448
	ldr r0, _0808A488 @ =0x08CC3578
	ldrb r3, [r2]
	adds r3, #1
	ldrb r6, [r5]
	lsls r1, r6, #3
	adds r1, r1, r6
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _0808A494
_0808A448:
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r5, [r5]
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0808A4F4
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _0808A4F4
	strb r4, [r2]
	ldr r0, _0808A48C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A472
	ldr r0, _0808A490 @ =0x0000038F
	bl m4aSongNumStart
_0808A472:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808A47C:
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0808A4F4
	.align 2, 0
_0808A488: .4byte 0x08CC3578
_0808A48C: .4byte 0x0202BBF8
_0808A490: .4byte 0x0000038F
_0808A494:
	strb r3, [r2]
_0808A496:
	ldr r0, _0808A4AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A4F4
	ldr r0, _0808A4B0 @ =0x00000387
	bl m4aSongNumStart
	b _0808A4F4
	.align 2, 0
_0808A4AC: .4byte 0x0202BBF8
_0808A4B0: .4byte 0x00000387
_0808A4B4:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808A4F4
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808A4F4
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0808A504 @ =0x08CC3578
	adds r3, r7, #0
	adds r3, #0x2d
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808A4F4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A504: .4byte 0x08CC3578

	thumb_func_start sub_0808A508
sub_0808A508: @ 0x0808A508
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	cmp r0, #1
	beq _0808A53E
	cmp r0, #1
	bgt _0808A524
	cmp r0, #0
	beq _0808A52E
	b _0808A5A0
_0808A524:
	cmp r0, #2
	beq _0808A570
	cmp r0, #3
	beq _0808A536
	b _0808A5A0
_0808A52E:
	adds r0, r4, #0
	bl sub_08089E70
	b _0808A5A0
_0808A536:
	adds r0, r4, #0
	bl sub_0808A214
	b _0808A5A0
_0808A53E:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	adds r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808A5A0
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_08088DC0
	b _0808A5A0
_0808A570:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	subs r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808A5A0
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_08088DC0
_0808A5A0:
	ldr r0, _0808A60C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	cmp r0, #0
	beq _0808A5D6
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808A5DC
	ldr r0, _0808A610 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A5CA
	ldr r0, _0808A614 @ =0x0000038B
	bl m4aSongNumStart
_0808A5CA:
	movs r0, #0
	bl SetStatScreenLastUnitId
	adds r0, r4, #0
	bl Proc_Break
_0808A5D6:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808A604
_0808A5DC:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r6, r3
	beq _0808A604
	ldr r2, _0808A618 @ =0x08CC3578
	adds r0, #9
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808A604:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A60C: .4byte 0x08B857F8
_0808A610: .4byte 0x0202BBF8
_0808A614: .4byte 0x0000038B
_0808A618: .4byte 0x08CC3578

	thumb_func_start sub_0808A61C
sub_0808A61C: @ 0x0808A61C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A644
	ldr r1, _0808A6C4 @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl sub_08088BE8
_0808A644:
	ldr r2, _0808A6C8 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r2, #0x1a]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0808A66E
	lsls r1, r1, #4
	movs r0, #0xf
	ldrb r3, [r2, #0x19]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x19]
_0808A66E:
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0808A67E
	bl Proc_End
_0808A67E:
	bl EndGreenText
	ldr r0, _0808A6CC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0808A6D0 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0808A6D4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	ldr r2, _0808A6D8 @ =0x03002870
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
	bl ResetTextFont
	bl ClearIcons
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6C4: .4byte 0x0200CBF0
_0808A6C8: .4byte 0x0202BBF8
_0808A6CC: .4byte 0x02022C60
_0808A6D0: .4byte 0x02023460
_0808A6D4: .4byte 0x02023C60
_0808A6D8: .4byte 0x03002870

	thumb_func_start sub_0808A6DC
sub_0808A6DC: @ 0x0808A6DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0808A700 @ =0x0200CCF0
	movs r1, #0x1f
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	cmp r4, r0
	bge _0808A72E
	ldr r0, _0808A704 @ =0x0200E668
	adds r6, r5, #0
	adds r6, #0x2f
	b _0808A728
	.align 2, 0
_0808A700: .4byte 0x0200CCF0
_0808A704: .4byte 0x0200E668
_0808A708:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A764 @ =0x0200CCF0
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
	cmp r4, r0
	bge _0808A72E
	ldr r0, _0808A768 @ =0x0200E668
_0808A728:
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A708
_0808A72E:
	ldr r4, _0808A76C @ =0x0200D4F0
	adds r0, r4, #0
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r6, r5, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	adds r0, r4, #0
	bl UnitList_DrawColumnNames
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x3c]
	ldrb r0, [r6]
	adds r2, r5, #0
	adds r2, #0x37
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A764: .4byte 0x0200CCF0
_0808A768: .4byte 0x0200E668
_0808A76C: .4byte 0x0200D4F0

	thumb_func_start sub_0808A770
sub_0808A770: @ 0x0808A770
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, _0808A7D0 @ =0x08CC342C
	ldrh r2, [r5, #0x3c]
	adds r0, r2, r0
	ldrb r2, [r1]
	ldrb r0, [r0]
	adds r0, r2, r0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808A79C
	movs r0, #0x14
	strb r0, [r1]
_0808A79C:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r3, #0
	str r1, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x36
	str r0, [sp, #8]
	movs r1, #0x2f
	adds r1, r1, r5
	mov sl, r1
	ldr r2, [sp, #0xc]
	str r2, [sp, #4]
_0808A7B6:
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	mov r0, sl
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808A7D4
	ldr r1, [sp, #4]
	ldrb r1, [r1]
	adds r0, r1, r3
	cmp r0, #0x14
	bgt _0808A7DC
	b _0808A7E2
	.align 2, 0
_0808A7D0: .4byte 0x08CC342C
_0808A7D4:
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	cmp r3, r0
	bge _0808A7E0
_0808A7DC:
	movs r1, #0
	b _0808A7E8
_0808A7E0:
	subs r0, r3, r0
_0808A7E2:
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0808A7E8:
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	lsls r6, r1, #1
	adds r1, r3, #1
	mov sb, r1
	cmp r4, r0
	bge _0808A82C
	movs r2, #0x1f
	mov r8, r2
	ldr r0, _0808A8A8 @ =0x02022C60
	mov ip, r0
	ldr r7, _0808A8AC @ =0x0200CCF0
	adds r2, r6, #0
_0808A806:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #5
	adds r1, #8
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, ip
	lsls r0, r0, #6
	adds r0, r2, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808A806
_0808A82C:
	ldr r0, _0808A8B0 @ =0x02023C60
	ldr r1, _0808A8B4 @ =0x0200D4F0
	adds r2, r6, r1
	adds r1, r3, #0
	adds r1, #0xa8
	movs r4, #1
	lsls r1, r1, #1
	adds r1, r1, r0
_0808A83C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0808A83C
	mov r3, sb
	cmp r3, #0x13
	ble _0808A7B6
	movs r0, #5
	bl EnableBgSync
	ldr r2, [sp, #0xc]
	ldrb r2, [r2]
	cmp r2, #0x13
	bls _0808A910
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _0808A8B8 @ =0x02023DB0
	movs r1, #0x16
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808A8BC @ =0x02022C70
	movs r1, #0x16
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	adds r4, r5, #0
	adds r4, #0x32
	adds r6, r5, #0
	adds r6, #0x2e
	ldr r1, _0808A8C0 @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_0808A88E:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0808A88E
	bl ClearIcons
	ldrb r0, [r4]
	bl sub_08088CD4
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808A8E0
	.align 2, 0
_0808A8A8: .4byte 0x02022C60
_0808A8AC: .4byte 0x0200CCF0
_0808A8B0: .4byte 0x02023C60
_0808A8B4: .4byte 0x0200D4F0
_0808A8B8: .4byte 0x02023DB0
_0808A8BC: .4byte 0x02022C70
_0808A8C0: .4byte 0x0200E66C
_0808A8C4:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A920 @ =0x0200CCF0
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808A8E0:
	cmp r4, r0
	bge _0808A8EC
	ldr r0, _0808A924 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A8C4
_0808A8EC:
	ldr r0, _0808A928 @ =0x0200D4F0
	mov r2, sl
	ldrb r1, [r2]
	bl UnitList_DrawColumnNames
	ldrb r0, [r6]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #0
	bl sub_0808AC90
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	bl Proc_Break
_0808A910:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A920: .4byte 0x0200CCF0
_0808A924: .4byte 0x0200E668
_0808A928: .4byte 0x0200D4F0

	thumb_func_start sub_0808A92C
sub_0808A92C: @ 0x0808A92C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov r2, r8
	adds r2, #0x38
	ldr r0, _0808AA14 @ =0x08CC3432
	mov r1, r8
	ldrh r1, [r1, #0x3c]
	adds r0, r1, r0
	ldrb r3, [r2]
	ldrb r0, [r0]
	adds r0, r3, r0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808A95A
	movs r0, #0x14
	strb r0, [r2]
_0808A95A:
	mov r5, r8
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	mov r0, r8
	adds r0, #0x36
	mov r1, r8
	adds r1, #0x37
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0808AA28
	movs r5, #0
	str r2, [sp]
	ldrb r6, [r2]
	cmp r5, r6
	blt _0808A97E
	b _0808AAC0
_0808A97E:
	str r2, [sp, #8]
_0808A980:
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r4, r7, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	movs r1, #8
	adds r1, r1, r5
	mov ip, r1
	adds r5, #1
	mov sl, r5
	cmp r4, r0
	bge _0808A9DA
	str r6, [sp, #4]
	lsls r1, r1, #1
	str r1, [sp, #0xc]
	movs r2, #0x1f
	mov sb, r2
_0808A9A6:
	adds r3, r4, #0
	mov r5, sb
	ands r3, r5
	lsls r1, r3, #5
	ldr r2, [sp, #4]
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	subs r0, r2, r7
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0808AA18 @ =0x02022C60
	adds r1, r1, r0
	lsls r0, r3, #6
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	ldr r3, _0808AA1C @ =0x0200CCF0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	mov r5, r8
	ldrh r5, [r5, #0x3e]
	lsrs r0, r5, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808A9A6
_0808A9DA:
	ldr r7, _0808AA20 @ =0x02023C60
	mov sb, r7
	adds r5, r6, #0
	mov r1, ip
	lsls r0, r1, #1
	ldr r3, _0808AA24 @ =0x0200D4F0
	adds r2, r0, r3
	movs r3, #0xa0
	movs r4, #1
_0808A9EC:
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	subs r0, r5, r6
	adds r0, r3, r0
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r2]
	strh r1, [r0]
	adds r2, #0x40
	adds r3, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808A9EC
	mov r5, sl
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	cmp r5, r7
	blt _0808A980
	b _0808AAC0
	.align 2, 0
_0808AA14: .4byte 0x08CC3432
_0808AA18: .4byte 0x02022C60
_0808AA1C: .4byte 0x0200CCF0
_0808AA20: .4byte 0x02023C60
_0808AA24: .4byte 0x0200D4F0
_0808AA28:
	movs r5, #0
	str r2, [sp]
	ldrb r0, [r2]
	cmp r5, r0
	bge _0808AAC0
	str r2, [sp, #8]
_0808AA34:
	mov r1, r8
	ldrh r1, [r1, #0x3e]
	lsrs r4, r1, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	adds r2, r5, #1
	mov sl, r2
	cmp r4, r0
	bge _0808AA8A
	mov ip, r6
	movs r3, #0x1f
	mov sb, r3
_0808AA50:
	adds r3, r4, #0
	mov r7, sb
	ands r3, r7
	lsls r2, r3, #5
	adds r2, #8
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r0, _0808AAE4 @ =0x02022C60
	adds r2, r2, r0
	str r2, [sp, #0xc]
	mov r2, ip
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	subs r0, r2, r1
	lsls r0, r0, #1
	lsls r1, r3, #6
	adds r0, r0, r1
	ldr r2, _0808AAE8 @ =0x0200CCF0
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	adds r4, #1
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r0, r7, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808AA50
_0808AA8A:
	movs r4, #0
	ldr r0, _0808AAEC @ =0x0200D4F0
	mov ip, r0
	adds r3, r6, #0
	adds r0, r5, #0
	adds r0, #0xa8
	lsls r0, r0, #1
	ldr r1, _0808AAF0 @ =0x02023C60
	adds r2, r0, r1
_0808AA9C:
	ldr r5, [sp, #8]
	ldrb r5, [r5]
	subs r0, r3, r5
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #1
	ble _0808AA9C
	mov r5, sl
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	cmp r5, r6
	blt _0808AA34
_0808AAC0:
	movs r0, #5
	bl EnableBgSync
	ldr r7, [sp]
	ldrb r7, [r7]
	cmp r7, #0x13
	bls _0808AAD4
	mov r0, r8
	bl Proc_Break
_0808AAD4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAE4: .4byte 0x02022C60
_0808AAE8: .4byte 0x0200CCF0
_0808AAEC: .4byte 0x0200D4F0
_0808AAF0: .4byte 0x02023C60

	thumb_func_start StartUnitListScreenField
StartUnitListScreenField: @ 0x0808AAF4
	push {lr}
	ldr r0, _0808AB08 @ =0x08CC3194
	movs r1, #3
	bl Proc_Start
	adds r0, #0x39
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0808AB08: .4byte 0x08CC3194

	thumb_func_start StartUnitListScreenPrepMenu
StartUnitListScreenPrepMenu: @ 0x0808AB0C
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808AB24
	ldr r0, _0808AB20 @ =0x08CC32A4
	movs r1, #3
	bl Proc_Start
	b _0808AB2A
	.align 2, 0
_0808AB20: .4byte 0x08CC32A4
_0808AB24:
	ldr r0, _0808AB48 @ =0x08CC32A4
	bl Proc_StartBlocking
_0808AB2A:
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808AB4C
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #5
	b _0808AB54
	.align 2, 0
_0808AB48: .4byte 0x08CC32A4
_0808AB4C:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x3a
_0808AB54:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartUnitListScreenForSoloAnim
StartUnitListScreenForSoloAnim: @ 0x0808AB64
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808AB7C
	ldr r0, _0808AB78 @ =0x08CC336C
	movs r1, #3
	bl Proc_Start
	b _0808AB82
	.align 2, 0
_0808AB78: .4byte 0x08CC336C
_0808AB7C:
	ldr r0, _0808AB90 @ =0x08CC336C
	bl Proc_StartBlocking
_0808AB82:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808AB90: .4byte 0x08CC336C

	thumb_func_start StartUnitListScreenUnk
StartUnitListScreenUnk: @ 0x0808AB94
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808ABAC
	ldr r0, _0808ABA8 @ =0x08CC32A4
	movs r1, #3
	bl Proc_Start
	b _0808ABB2
	.align 2, 0
_0808ABA8: .4byte 0x08CC32A4
_0808ABAC:
	ldr r0, _0808ABC0 @ =0x08CC32A4
	bl Proc_StartBlocking
_0808ABB2:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808ABC0: .4byte 0x08CC32A4

	thumb_func_start UnitList_DrawColumnNames
UnitList_DrawColumnNames: @ 0x0808ABC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r7, #0
	adds r6, #0x12
	adds r0, r6, #0
	movs r1, #0x13
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808AC0C @ =0x0200D658
	mov r8, r0
	bl ClearText
	cmp r4, #5
	bne _0808AC10
	movs r5, #0
	adds r4, r6, #0
_0808ABF2:
	adds r1, r5, #0
	adds r1, #0x70
	adds r0, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #4
	adds r5, #1
	cmp r5, #7
	ble _0808ABF2
	b _0808AC74
	.align 2, 0
_0808AC0C: .4byte 0x0200D658
_0808AC10:
	movs r5, #1
	ldr r3, _0808AC88 @ =0x08CC3578
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r2, r1, #0
	adds r2, #0x10
	adds r0, r2, r3
	ldrb r0, [r0, #8]
	adds r7, #0x10
	mov sb, r7
	cmp r0, #0
	beq _0808AC6C
	mov r7, r8
	mov r8, r3
	adds r0, r1, r3
	adds r4, r0, #0
	adds r4, #0x10
	adds r6, r2, #0
_0808AC36:
	ldrb r1, [r4, #8]
	subs r1, #0x40
	adds r0, r7, #0
	bl Text_SetCursor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #4
	adds r0, r6, r0
	ldr r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #1
	cmp r5, #8
	bgt _0808AC6C
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0808AC36
_0808AC6C:
	ldr r0, _0808AC8C @ =0x0200D658
	mov r1, sb
	bl PutText
_0808AC74:
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC88: .4byte 0x08CC3578
_0808AC8C: .4byte 0x0200D658

	thumb_func_start sub_0808AC90
sub_0808AC90: @ 0x0808AC90
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	cmp r5, #0
	beq _0808ACCC
	ldr r4, _0808ACC8 @ =0x02023CD4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
	adds r0, r4, #2
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	b _0808ACDE
	.align 2, 0
_0808ACC8: .4byte 0x02023CD4
_0808ACCC:
	ldr r0, _0808ACF8 @ =0x02023492
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
_0808ACDE:
	cmp r7, #0
	beq _0808ACEA
	ldr r0, _0808ACFC @ =0x02023DA0
	adds r1, r5, #0
	bl UnitList_DrawColumnNames
_0808ACEA:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808ACF8: .4byte 0x02023492
_0808ACFC: .4byte 0x02023DA0

	thumb_func_start sub_0808AD00
sub_0808AD00: @ 0x0808AD00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x24]
	mov sl, r2
	ldr r4, [sp, #0x78]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	lsls r0, r7, #1
	str r0, [sp, #0x30]
	movs r0, #0x1f
	ldr r1, [sp, #0x30]
	ands r1, r0
	str r1, [sp, #0x30]
	ldr r1, _0808AD9C @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sb, r0
	cmp r4, #0
	beq _0808ADDA
	ldr r2, [sp, #0x2c]
	lsls r4, r2, #3
	ldr r0, _0808ADA0 @ =0x0200D570
	adds r5, r4, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne _0808ADA4
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808ADA4
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808ADA4
	adds r0, r5, #0
	movs r1, #4
	bl Text_SetColor
	b _0808ADAE
	.align 2, 0
_0808AD9C: .4byte 0x0200CBF0
_0808ADA0: .4byte 0x0200D570
_0808ADA4:
	ldr r0, _0808AE24 @ =0x0200D570
	add r0, r8
	mov r1, sb
	bl Text_SetColor
_0808ADAE:
	ldr r4, _0808AE24 @ =0x0200D570
	add r4, r8
	ldr r1, _0808AE28 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r3, [sp, #0x30]
	lsls r1, r3, #6
	add r1, sl
	adds r1, #6
	adds r0, r4, #0
	bl PutText
_0808ADDA:
	ldr r4, [sp, #0x2c]
	lsls r5, r4, #1
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r6, _0808AE2C @ =0x0200D5A8
	adds r0, r0, r6
	bl ClearText
	adds r0, r6, #0
	adds r0, #8
	add r0, r8
	bl ClearText
	ldr r0, [sp, #0x30]
	lsls r4, r0, #6
	mov r1, sl
	adds r1, r1, r4
	str r1, [sp, #0x34]
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0x18
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	str r4, [sp, #0x54]
	str r5, [sp, #0x50]
	ldr r2, [sp, #0x28]
	cmp r2, #5
	bls _0808AE1A
	b _0808B448
_0808AE1A:
	lsls r0, r2, #2
	ldr r1, _0808AE30 @ =_0808AE34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808AE24: .4byte 0x0200D570
_0808AE28: .4byte 0x0200CBF0
_0808AE2C: .4byte 0x0200D5A8
_0808AE30: .4byte _0808AE34
_0808AE34: @ jump table
	.4byte _0808AE4C @ case 0
	.4byte _0808AFC0 @ case 1
	.4byte _0808B084 @ case 2
	.4byte _0808B1A2 @ case 3
	.4byte _0808B2B8 @ case 4
	.4byte _0808B3E8 @ case 5
_0808AE4C:
	ldr r0, _0808AEC0 @ =0x0200CBF0
	lsls r6, r7, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r5, r3, r4
	lsls r5, r5, #3
	ldr r4, _0808AEC4 @ =0x0200D5A8
	adds r0, r5, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	bl PutDrawText
	adds r4, #8
	adds r5, r5, r4
	mov r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetColor
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	str r6, [sp, #0x4c]
	cmp r0, #0
	bne _0808AECC
	ldr r0, _0808AEC8 @ =0x0000127F
	bl DecodeMsg
	adds r1, r7, #0
	adds r1, #0x22
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	b _0808AF2A
	.align 2, 0
_0808AEC0: .4byte 0x0200CBF0
_0808AEC4: .4byte 0x0200D5A8
_0808AEC8: .4byte 0x0000127F
_0808AECC:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r1, r7, #0
	adds r1, #0x22
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	adds r4, r7, #0
	adds r4, #0x1e
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl sub_08088D8C
_0808AF2A:
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r3, r4
	lsls r0, r0, #3
	ldr r1, _0808AF60 @ =0x0200D5B8
	adds r5, r0, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0808AF64 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r4, r0
	beq _0808AF72
	cmp r4, r0
	bhi _0808AF68
	cmp r4, #0
	beq _0808AFA0
	b _0808B5B6
	.align 2, 0
_0808AF60: .4byte 0x0200D5B8
_0808AF64: .4byte 0x0200CBF0
_0808AF68:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	beq _0808AF7C
	b _0808B5B6
_0808AF72:
	ldr r0, _0808AF78 @ =0x00001274
	b _0808AF7E
	.align 2, 0
_0808AF78: .4byte 0x00001274
_0808AF7C:
	ldr r0, _0808AF9C @ =0x00001275
_0808AF7E:
	bl DecodeMsg
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #8
	bl PutDrawText
	b _0808B5B6
	.align 2, 0
_0808AF9C: .4byte 0x00001275
_0808AFA0:
	ldr r0, _0808AFBC @ =0x00001276
	bl DecodeMsg
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
	b _0808B5B6
	.align 2, 0
_0808AFBC: .4byte 0x00001276
_0808AFC0:
	ldr r1, _0808B07C @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808B080 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x10
	mov r8, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #0
	bl PutDrawText
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B006
	movs r1, #1
_0808B006:
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #8
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r4, #0
	adds r3, #0x28
	movs r1, #2
	mov r2, sb
	cmp r2, #0
	beq _0808B022
	movs r1, #1
_0808B022:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r2, [r0, #9]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r5, r4, #0
	adds r5, #0x2e
	movs r7, #2
	mov r3, sb
	cmp r3, #0
	beq _0808B03C
	movs r7, #1
_0808B03C:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, r8
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #0x34
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B066
	movs r5, #1
_0808B066:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	b _0808B5B6
	.align 2, 0
_0808B07C: .4byte 0x0200CBF0
_0808B080: .4byte 0x0200D5A8
_0808B084:
	ldr r5, [sp, #0x54]
	add r5, sl
	movs r1, #0x12
	adds r1, r1, r5
	mov r8, r1
	ldr r1, _0808B190 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x14]
	ldrb r2, [r1, #0x14]
	cmp r0, r2
	bne _0808B0A6
	movs r6, #4
_0808B0A6:
	adds r0, r1, #0
	bl GetUnitPower
	adds r2, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x15]
	ldrb r3, [r1, #0x15]
	cmp r0, r3
	bne _0808B0CC
	movs r6, #4
_0808B0CC:
	adds r0, r1, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x1e
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x16]
	ldrb r2, [r1, #0x16]
	cmp r0, r2
	bne _0808B0F2
	movs r6, #4
_0808B0F2:
	adds r0, r1, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x24
	ldr r0, [r4]
	ldr r0, [r0]
	movs r6, #2
	ldrb r3, [r0, #0x19]
	cmp r3, #0x1e
	bne _0808B114
	movs r6, #4
_0808B114:
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x2a
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x17]
	ldrb r2, [r1, #0x17]
	cmp r0, r2
	bne _0808B138
	movs r6, #4
_0808B138:
	adds r0, r1, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x30
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x18]
	ldrb r3, [r1, #0x18]
	cmp r0, r3
	bne _0808B15E
	movs r6, #4
_0808B15E:
	adds r0, r1, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0808B194
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _0808B5B6
	.align 2, 0
_0808B190: .4byte 0x0200CBF0
_0808B194:
	adds r0, r5, #0
	adds r0, #0x34
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _0808B5B6
_0808B1A2:
	ldr r0, _0808B1E4 @ =0x0200CBF0
	lsls r4, r7, #2
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	str r4, [sp, #0x4c]
	cmp r5, #0
	bne _0808B1F0
	ldr r0, _0808B1E8 @ =0x0000127F
	bl DecodeMsg
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808B1EC @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x14
	mov r2, sb
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	b _0808B254
	.align 2, 0
_0808B1E4: .4byte 0x0200CBF0
_0808B1E8: .4byte 0x0000127F
_0808B1EC: .4byte 0x0200D5A8
_0808B1F0:
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r5, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808B2B0 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x14
	mov r2, sb
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	adds r4, #0x10
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl sub_08088D8C
_0808B254:
	ldr r5, [sp, #0x54]
	add r5, sl
	adds r3, r5, #0
	adds r3, #0x24
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808B266
	movs r1, #1
_0808B266:
	ldr r0, _0808B2B4 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	movs r6, #4
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r5, #0
	adds r3, #0x2c
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B286
	movs r1, #1
_0808B286:
	ldr r0, [r4]
	movs r6, #6
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r1, r5, #0
	adds r1, #0x34
	movs r3, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B2A0
	movs r3, #1
_0808B2A0:
	ldr r0, [r4]
	movs r4, #8
	ldrsh r2, [r0, r4]
	adds r0, r1, #0
	adds r1, r3, #0
	bl PutNumberOrBlank
	b _0808B5B6
	.align 2, 0
_0808B2B0: .4byte 0x0200D5A8
_0808B2B4: .4byte 0x0200CBF0
_0808B2B8:
	ldr r0, _0808B2F8 @ =0x0200CBF0
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r5, [r2, #0xc]
	movs r0, #0x10
	ands r5, r0
	str r1, [sp, #0x4c]
	cmp r5, #0
	beq _0808B300
	adds r0, r2, #0
	bl sub_08018CC0
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, _0808B2FC @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	b _0808B328
	.align 2, 0
_0808B2F8: .4byte 0x0200CBF0
_0808B2FC: .4byte 0x0200D5B0
_0808B300:
	ldr r0, _0808B3D8 @ =0x0000127D
	bl DecodeMsg
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808B3DC @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
_0808B328:
	mov r8, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r3, r7, #0
	adds r3, #0x14
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808B33C
	movs r1, #1
_0808B33C:
	ldr r0, _0808B3E0 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B368
	movs r5, #1
_0808B368:
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r5, r7, #0
	adds r5, #0x20
	movs r6, #2
	mov r1, sb
	cmp r1, #0
	beq _0808B398
	movs r6, #1
_0808B398:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitStatusName
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x2c]
	adds r0, r2, r3
	lsls r0, r0, #3
	ldr r1, _0808B3E4 @ =0x0200D5A8
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x2e
	mov r6, r8
	mov r2, sb
	orrs r6, r2
	lsrs r2, r6, #0x1f
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	bl PutDrawText
	b _0808B5B6
	.align 2, 0
_0808B3D8: .4byte 0x0000127D
_0808B3DC: .4byte 0x0200D5B0
_0808B3E0: .4byte 0x0200CBF0
_0808B3E4: .4byte 0x0200D5A8
_0808B3E8:
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _0808B440 @ =0x0200CBF0
	adds r7, r3, r0
	ldr r5, [sp, #0x54]
	add r5, sl
_0808B3F4:
	add r1, sp, #8
	ldr r0, _0808B444 @ =0x0840F358
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetWeaponLevelFromExp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #2
	adds r0, #0x14
	adds r3, r5, r0
	movs r1, #2
	cmp r4, #6
	bne _0808B424
	movs r1, #4
_0808B424:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #8
	ldr r2, [r0]
	adds r0, r3, #0
	bl PutSpecialChar
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _0808B3F4
	b _0808B5B6
	.align 2, 0
_0808B440: .4byte 0x0200CBF0
_0808B444: .4byte 0x0840F358
_0808B448:
	ldr r1, [sp, #0x28]
	subs r1, #6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	movs r4, #0
	str r4, [sp, #0x3c]
	ldr r1, _0808B500 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSupporterCount
	str r0, [sp, #0x40]
	adds r0, r6, #0
	adds r0, #0x10
	add r0, r8
	bl ClearText
	movs r6, #0
	ldr r0, [sp, #0x40]
	cmp r4, r0
	bge _0808B56E
	adds r7, r5, #0
	mov r1, r8
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x48]
	mov r3, sb
	rsbs r3, r3, #0
	mov r0, sb
	orrs r3, r0
	mov r8, r3
_0808B490:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B562
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	cmp r1, r2
	blo _0808B558
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportUnit
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0808B508
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808B504 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r3, [sp, #0x48]
	adds r1, r3, r1
	str r5, [sp]
	str r2, [sp, #4]
	mov r3, r8
	lsrs r2, r3, #0x1f
	movs r3, #0
	bl PutDrawText
	b _0808B546
	.align 2, 0
_0808B500: .4byte 0x0200CBF0
_0808B504: .4byte 0x0200D5A8
_0808B508:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808B554 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #1
	movs r3, #0
	bl PutDrawText
_0808B546:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _0808B56E
	b _0808B562
	.align 2, 0
_0808B554: .4byte 0x0200D5A8
_0808B558:
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
_0808B562:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x40]
	cmp r6, r3
	blt _0808B490
_0808B56E:
	cmp r4, #2
	bhi _0808B5B6
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r5, r0, #3
	ldr r7, [sp, #0x54]
	add r7, sl
	mov r2, sb
	rsbs r6, r2, #0
	orrs r6, r2
_0808B584:
	ldr r0, _0808B5CC @ =0x0000127D
	bl DecodeMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808B5D0 @ =0x0200D5A8
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	adds r1, r7, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	lsrs r2, r6, #0x1f
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0808B584
_0808B5B6:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B5CC: .4byte 0x0000127D
_0808B5D0: .4byte 0x0200D5A8

	thumb_func_start SortUnitList_GetUnitSoloAnimation
SortUnitList_GetUnitSoloAnimation: @ 0x0808B5D4
	ldr r0, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	bx lr
	.align 2, 0

	thumb_func_start SortUnitList
SortUnitList: @ 0x0808B5E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x68
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls _0808B602
	bl _0808D9F0
_0808B602:
	lsls r0, r0, #2
	ldr r1, _0808B60C @ =_0808B610
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B60C: .4byte _0808B610
_0808B610: @ jump table
	.4byte _0808B690 @ case 0
	.4byte _0808B994 @ case 1
	.4byte _0808B888 @ case 2
	.4byte _0808BA98 @ case 3
	.4byte _0808BB94 @ case 4
	.4byte _0808BC9C @ case 5
	.4byte _0808BDA4 @ case 6
	.4byte _0808BEB0 @ case 7
	.4byte _0808BFB8 @ case 8
	.4byte _0808C0C0 @ case 9
	.4byte _0808C1CC @ case 10
	.4byte _0808C2D4 @ case 11
	.4byte _0808C644 @ case 12
	.4byte _0808C74C @ case 13
	.4byte _0808C958 @ case 14
	.4byte _0808CA4C @ case 15
	.4byte _0808CB40 @ case 16
	.4byte _0808CC34 @ case 17
	.4byte _0808C3DC @ case 18
	.4byte _0808C538 @ case 19
	.4byte _0808CD64 @ case 20
	.4byte _0808CE70 @ case 21
	.4byte _0808CFFC @ case 22
	.4byte _0808D100 @ case 23
	.4byte _0808D204 @ case 24
	.4byte _0808D300 @ case 25
	.4byte _0808D3FC @ case 26
	.4byte _0808D4F8 @ case 27
	.4byte _0808D5F4 @ case 28
	.4byte _0808D6F0 @ case 29
	.4byte _0808D7EC @ case 30
	.4byte _0808D8E4 @ case 31
_0808B690:
	cmp r2, #0
	bne _0808B78C
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, _0808B784 @ =0x0200E668
	mov sl, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808B706
	adds r4, r3, #0
	mov sb, r4
	ldr r6, _0808B788 @ =0x0200CBF0
	mov ip, r6
_0808B6AE:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B6F8
	mov r8, ip
_0808B6C0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808B6EA
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
_0808B6EA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808B6C0
_0808B6F8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B6AE
_0808B706:
	movs r1, #0
	ldr r7, _0808B784 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808B77E
	mov sl, r7
_0808B714:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B770
	ldr r4, _0808B788 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808B72E:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bhs _0808B75E
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x40]
_0808B75E:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808B72E
_0808B770:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808B784 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B714
_0808B77E:
	ldr r7, [sp, #0x40]
	bl _0808D95C
	.align 2, 0
_0808B784: .4byte 0x0200E668
_0808B788: .4byte 0x0200CBF0
_0808B78C:
	movs r0, #0
	str r0, [sp, #0x44]
	movs r1, #0
	ldr r2, _0808B880 @ =0x0200E668
	mov sl, r2
	ldrb r0, [r2]
	subs r0, #1
	ldr r3, [sp, #0x44]
	cmp r3, r0
	bge _0808B800
	adds r4, r2, #0
	mov sb, r4
	ldr r6, _0808B884 @ =0x0200CBF0
	mov ip, r6
_0808B7A8:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B7F2
	mov r8, ip
_0808B7BA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808B7E4
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
_0808B7E4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808B7BA
_0808B7F2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B7A8
_0808B800:
	movs r1, #0
	ldr r7, _0808B880 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808B878
	mov sl, r7
_0808B80E:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B86A
	ldr r4, _0808B884 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808B828:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bls _0808B858
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x44]
_0808B858:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808B828
_0808B86A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808B880 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B80E
_0808B878:
	ldr r7, [sp, #0x44]
	bl _0808D95C
	.align 2, 0
_0808B880: .4byte 0x0200E668
_0808B884: .4byte 0x0200CBF0
_0808B888:
	cmp r2, #0
	bne _0808B910
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808B908 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808B8A2
	bl _0808D9DE
_0808B8A2:
	adds r4, r3, #0
	mov sb, r4
_0808B8A6:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B8F6
	ldr r0, _0808B90C @ =0x0200CBF0
	mov r8, r0
_0808B8BA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _0808B8E8
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808B8E8:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808B8BA
_0808B8F6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808B8A6
	bl _0808D9DE
	.align 2, 0
_0808B908: .4byte 0x0200E668
_0808B90C: .4byte 0x0200CBF0
_0808B910:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808B98C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808B924
	bl _0808D9DE
_0808B924:
	adds r3, r2, #0
	mov sb, r3
_0808B928:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B978
	ldr r6, _0808B990 @ =0x0200CBF0
	mov r8, r6
_0808B93C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0808B96A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808B96A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808B93C
_0808B978:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808B928
	bl _0808D9DE
	.align 2, 0
_0808B98C: .4byte 0x0200E668
_0808B990: .4byte 0x0200CBF0
_0808B994:
	cmp r2, #0
	bne _0808BA18
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BA10 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808B9AC
	bl _0808D9DE
_0808B9AC:
	adds r4, r3, #0
	mov sb, r4
_0808B9B0:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B9FC
	ldr r0, _0808BA14 @ =0x0200CBF0
	mov r8, r0
_0808B9C4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808B9EE
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808B9EE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808B9C4
_0808B9FC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808B9B0
	bl _0808D9DE
	.align 2, 0
_0808BA10: .4byte 0x0200E668
_0808BA14: .4byte 0x0200CBF0
_0808BA18:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808BA90 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BA2C
	bl _0808D9DE
_0808BA2C:
	adds r3, r2, #0
	mov sb, r3
_0808BA30:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808BA7C
	ldr r6, _0808BA94 @ =0x0200CBF0
	mov r8, r6
_0808BA44:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808BA6E
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808BA6E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808BA44
_0808BA7C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808BA30
	bl _0808D9DE
	.align 2, 0
_0808BA90: .4byte 0x0200E668
_0808BA94: .4byte 0x0200CBF0
_0808BA98:
	cmp r2, #0
	bne _0808BB18
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BB10 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BAB0
	bl _0808D9DE
_0808BAB0:
	adds r4, r3, #0
	mov sb, r4
_0808BAB4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808BAFC
	ldr r0, _0808BB14 @ =0x0200CBF0
	mov r8, r0
_0808BAC8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bls _0808BAEE
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808BAEE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808BAC8
_0808BAFC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808BAB4
	bl _0808D9DE
	.align 2, 0
_0808BB10: .4byte 0x0200E668
_0808BB14: .4byte 0x0200CBF0
_0808BB18:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808BB8C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BB2C
	bl _0808D9DE
_0808BB2C:
	adds r3, r2, #0
	mov sb, r3
_0808BB30:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808BB78
	ldr r6, _0808BB90 @ =0x0200CBF0
	mov r8, r6
_0808BB44:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bhs _0808BB6A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808BB6A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808BB44
_0808BB78:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808BB30
	bl _0808D9DE
	.align 2, 0
_0808BB8C: .4byte 0x0200E668
_0808BB90: .4byte 0x0200CBF0
_0808BB94:
	cmp r2, #0
	bne _0808BC18
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BC10 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BBAA
	bl _0808D8CE
_0808BBAA:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BBFC
	ldr r2, _0808BC14 @ =0x0200CBF0
	mov sb, r2
_0808BBBC:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	ble _0808BBEC
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808BBEC:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BC10 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808BBBC
_0808BBFC:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BC10 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BBAA
	bl _0808D8CE
	.align 2, 0
_0808BC10: .4byte 0x0200E668
_0808BC14: .4byte 0x0200CBF0
_0808BC18:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808BC94 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BC2C
	bl _0808D95A
_0808BC2C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BC7E
	ldr r0, _0808BC98 @ =0x0200CBF0
	mov sb, r0
_0808BC3E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	bge _0808BC6E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808BC6E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BC94 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808BC3E
_0808BC7E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BC94 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BC2C
	bl _0808D95A
	.align 2, 0
_0808BC94: .4byte 0x0200E668
_0808BC98: .4byte 0x0200CBF0
_0808BC9C:
	cmp r2, #0
	bne _0808BD24
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808BD1C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BCB4
	bl _0808D9DE
_0808BCB4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BD06
	ldr r1, _0808BD20 @ =0x0200CBF0
	mov sb, r1
_0808BCC6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	ble _0808BCF6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808BCF6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BD1C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808BCC6
_0808BD06:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BD1C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BCB4
	bl _0808D9DE
	.align 2, 0
_0808BD1C: .4byte 0x0200E668
_0808BD20: .4byte 0x0200CBF0
_0808BD24:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808BD9C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BD36
	bl _0808D8CE
_0808BD36:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BD88
	ldr r2, _0808BDA0 @ =0x0200CBF0
	mov sb, r2
_0808BD48:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	bge _0808BD78
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808BD78:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BD9C @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808BD48
_0808BD88:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BD9C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BD36
	bl _0808D8CE
	.align 2, 0
_0808BD9C: .4byte 0x0200E668
_0808BDA0: .4byte 0x0200CBF0
_0808BDA4:
	cmp r2, #0
	bne _0808BE2C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808BE24 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BDBC
	bl _0808D95A
_0808BDBC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BE0E
	ldr r0, _0808BE28 @ =0x0200CBF0
	mov sb, r0
_0808BDCE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	ble _0808BDFE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808BDFE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BE24 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808BDCE
_0808BE0E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BE24 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BDBC
	bl _0808D95A
	.align 2, 0
_0808BE24: .4byte 0x0200E668
_0808BE28: .4byte 0x0200CBF0
_0808BE2C:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808BEA8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BE40
	bl _0808D9DE
_0808BE40:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BE92
	ldr r1, _0808BEAC @ =0x0200CBF0
	mov sb, r1
_0808BE52:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	bge _0808BE82
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808BE82:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BEA8 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808BE52
_0808BE92:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BEA8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BE40
	bl _0808D9DE
	.align 2, 0
_0808BEA8: .4byte 0x0200E668
_0808BEAC: .4byte 0x0200CBF0
_0808BEB0:
	cmp r2, #0
	bne _0808BF34
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BF2C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BEC6
	bl _0808D8CE
_0808BEC6:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BF18
	ldr r2, _0808BF30 @ =0x0200CBF0
	mov sb, r2
_0808BED8:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	ble _0808BF08
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808BF08:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BF2C @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808BED8
_0808BF18:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BF2C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BEC6
	bl _0808D8CE
	.align 2, 0
_0808BF2C: .4byte 0x0200E668
_0808BF30: .4byte 0x0200CBF0
_0808BF34:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808BFB0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BF48
	bl _0808D95A
_0808BF48:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BF9A
	ldr r0, _0808BFB4 @ =0x0200CBF0
	mov sb, r0
_0808BF5A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	bge _0808BF8A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808BF8A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BFB0 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808BF5A
_0808BF9A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BFB0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BF48
	bl _0808D95A
	.align 2, 0
_0808BFB0: .4byte 0x0200E668
_0808BFB4: .4byte 0x0200CBF0
_0808BFB8:
	cmp r2, #0
	bne _0808C040
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C038 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BFD0
	bl _0808D9DE
_0808BFD0:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C022
	ldr r1, _0808C03C @ =0x0200CBF0
	mov sb, r1
_0808BFE2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	ble _0808C012
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C012:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C038 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808BFE2
_0808C022:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C038 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BFD0
	bl _0808D9DE
	.align 2, 0
_0808C038: .4byte 0x0200E668
_0808C03C: .4byte 0x0200CBF0
_0808C040:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C0B8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C052
	bl _0808D8CE
_0808C052:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C0A4
	ldr r2, _0808C0BC @ =0x0200CBF0
	mov sb, r2
_0808C064:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	bge _0808C094
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C094:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C0B8 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C064
_0808C0A4:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C0B8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C052
	bl _0808D8CE
	.align 2, 0
_0808C0B8: .4byte 0x0200E668
_0808C0BC: .4byte 0x0200CBF0
_0808C0C0:
	cmp r2, #0
	bne _0808C148
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808C140 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C0D8
	bl _0808D95A
_0808C0D8:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C12A
	ldr r0, _0808C144 @ =0x0200CBF0
	mov sb, r0
_0808C0EA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	ble _0808C11A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C11A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C140 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C0EA
_0808C12A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C140 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C0D8
	bl _0808D95A
	.align 2, 0
_0808C140: .4byte 0x0200E668
_0808C144: .4byte 0x0200CBF0
_0808C148:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808C1C4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C15C
	bl _0808D9DE
_0808C15C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C1AE
	ldr r1, _0808C1C8 @ =0x0200CBF0
	mov sb, r1
_0808C16E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	bge _0808C19E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C19E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C1C4 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C16E
_0808C1AE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C1C4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C15C
	bl _0808D9DE
	.align 2, 0
_0808C1C4: .4byte 0x0200E668
_0808C1C8: .4byte 0x0200CBF0
_0808C1CC:
	cmp r2, #0
	bne _0808C250
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C248 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C1E2
	bl _0808D8CE
_0808C1E2:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C234
	ldr r2, _0808C24C @ =0x0200CBF0
	mov sb, r2
_0808C1F4:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	ble _0808C224
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C224:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C248 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C1F4
_0808C234:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C248 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C1E2
	bl _0808D8CE
	.align 2, 0
_0808C248: .4byte 0x0200E668
_0808C24C: .4byte 0x0200CBF0
_0808C250:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C2CC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C264
	bl _0808D95A
_0808C264:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C2B6
	ldr r0, _0808C2D0 @ =0x0200CBF0
	mov sb, r0
_0808C276:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	bge _0808C2A6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C2A6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C2CC @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C276
_0808C2B6:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C2CC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C264
	bl _0808D95A
	.align 2, 0
_0808C2CC: .4byte 0x0200E668
_0808C2D0: .4byte 0x0200CBF0
_0808C2D4:
	cmp r2, #0
	bne _0808C35C
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C354 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C2EC
	bl _0808D9DE
_0808C2EC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C33E
	ldr r1, _0808C358 @ =0x0200CBF0
	mov sb, r1
_0808C2FE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	ble _0808C32E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C32E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C354 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C2FE
_0808C33E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C354 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C2EC
	bl _0808D9DE
	.align 2, 0
_0808C354: .4byte 0x0200E668
_0808C358: .4byte 0x0200CBF0
_0808C35C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C3D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C36E
	bl _0808D8CE
_0808C36E:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C3C0
	ldr r2, _0808C3D8 @ =0x0200CBF0
	mov sb, r2
_0808C380:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	bge _0808C3B0
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C3B0:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C3D4 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C380
_0808C3C0:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C3D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C36E
	bl _0808D8CE
	.align 2, 0
_0808C3D4: .4byte 0x0200E668
_0808C3D8: .4byte 0x0200CBF0
_0808C3DC:
	cmp r2, #0
	bne _0808C48C
	movs r7, #0
	str r7, [sp, #0x48]
	movs r1, #0
	ldr r3, _0808C484 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808C47C
	adds r4, r3, #0
	mov sl, r4
_0808C3F4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808C46C
	ldr r7, _0808C488 @ =0x0200CBF0
	mov ip, r7
_0808C408:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble _0808C45A
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
_0808C45A:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C408
_0808C46C:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C484 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C3F4
_0808C47C:
	ldr r3, [sp, #0x48]
	bl _0808CD4E
	.align 2, 0
_0808C484: .4byte 0x0200E668
_0808C488: .4byte 0x0200CBF0
_0808C48C:
	movs r4, #0
	str r4, [sp, #0x4c]
	movs r1, #0
	ldr r6, _0808C530 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r4, r0
	bge _0808C528
	adds r7, r6, #0
	mov sl, r7
_0808C4A0:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	mov sb, r0
	cmp r2, r1
	bge _0808C518
	ldr r4, _0808C534 @ =0x0200CBF0
	mov ip, r4
_0808C4B4:
	adds r6, r2, #1
	mov r8, r6
	lsls r0, r6, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge _0808C506
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x4c]
_0808C506:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C4B4
_0808C518:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C530 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C4A0
_0808C528:
	ldr r3, [sp, #0x4c]
	bl _0808CD4E
	.align 2, 0
_0808C530: .4byte 0x0200E668
_0808C534: .4byte 0x0200CBF0
_0808C538:
	cmp r2, #0
	bne _0808C5C0
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r3, _0808C5B8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C550
	bl _0808D95A
_0808C550:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C5A2
	ldr r6, _0808C5BC @ =0x0200CBF0
	mov sb, r6
_0808C562:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble _0808C592
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C592:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C5B8 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C562
_0808C5A2:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C5B8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C550
	bl _0808D95A
	.align 2, 0
_0808C5B8: .4byte 0x0200E668
_0808C5BC: .4byte 0x0200CBF0
_0808C5C0:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808C63C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C5D4
	bl _0808D9DE
_0808C5D4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C626
	ldr r1, _0808C640 @ =0x0200CBF0
	mov sb, r1
_0808C5E6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge _0808C616
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C616:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C63C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C5E6
_0808C626:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C63C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C5D4
	bl _0808D9DE
	.align 2, 0
_0808C63C: .4byte 0x0200E668
_0808C640: .4byte 0x0200CBF0
_0808C644:
	cmp r2, #0
	bne _0808C6C8
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C6C0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C65A
	bl _0808D8CE
_0808C65A:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C6AC
	ldr r2, _0808C6C4 @ =0x0200CBF0
	mov sb, r2
_0808C66C:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge _0808C69C
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C69C:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C6C0 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C66C
_0808C6AC:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C6C0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C65A
	bl _0808D8CE
	.align 2, 0
_0808C6C0: .4byte 0x0200E668
_0808C6C4: .4byte 0x0200CBF0
_0808C6C8:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C744 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C6DC
	bl _0808D95A
_0808C6DC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C72E
	ldr r0, _0808C748 @ =0x0200CBF0
	mov sb, r0
_0808C6EE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble _0808C71E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C71E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C744 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C6EE
_0808C72E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C744 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C6DC
	bl _0808D95A
	.align 2, 0
_0808C744: .4byte 0x0200E668
_0808C748: .4byte 0x0200CBF0
_0808C74C:
	cmp r2, #0
	beq _0808C752
	b _0808C854
_0808C752:
	movs r0, #0
	str r0, [sp, #0x50]
	movs r4, #0
	ldr r0, _0808C790 @ =0x0200E668
	ldrb r0, [r0]
	cmp r2, r0
	bhs _0808C78A
	ldr r5, _0808C794 @ =0x0200CBF0
_0808C762:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808C790 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808C762
_0808C78A:
	movs r4, #0
	b _0808C842
	.align 2, 0
_0808C790: .4byte 0x0200E668
_0808C794: .4byte 0x0200CBF0
_0808C798:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x58]
	cmp r6, r1
	bge _0808C83C
	ldr r3, _0808C7E4 @ =0x0200CBF0
	mov sl, r3
_0808C7AA:
	adds r0, r6, #1
	mov r4, sp
	adds r4, r4, r0
	mov r8, r4
	mov r7, sp
	adds r5, r7, r6
	ldrb r4, [r4]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bls _0808C7E8
	adds r1, r2, #0
	strb r4, [r5]
	mov r0, r8
	strb r1, [r0]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	mov r4, sb
	lsls r1, r4, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r6, #1
	str r6, [sp, #0x50]
	b _0808C82A
	.align 2, 0
_0808C7E4: .4byte 0x0200CBF0
_0808C7E8:
	cmp r3, r2
	bne _0808C82A
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls _0808C82A
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r4, #1
	str r4, [sp, #0x50]
_0808C82A:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808C850 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x58]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808C7AA
_0808C83C:
	ldr r1, [sp, #0x58]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808C842:
	ldr r1, _0808C850 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808C798
	ldr r2, [sp, #0x50]
	b _0808C946
	.align 2, 0
_0808C850: .4byte 0x0200E668
_0808C854:
	movs r3, #0
	str r3, [sp, #0x54]
	movs r4, #0
	ldr r0, _0808C890 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0808C88C
	ldr r5, _0808C894 @ =0x0200CBF0
_0808C864:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r6, sp
	adds r1, r6, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808C890 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808C864
_0808C88C:
	movs r4, #0
	b _0808C93A
	.align 2, 0
_0808C890: .4byte 0x0200E668
_0808C894: .4byte 0x0200CBF0
_0808C898:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x5c]
	cmp r6, r1
	bge _0808C934
	ldr r7, _0808C8DC @ =0x0200CBF0
	mov sl, r7
_0808C8AA:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bhs _0808C8E0
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	b _0808C91E
	.align 2, 0
_0808C8DC: .4byte 0x0200CBF0
_0808C8E0:
	cmp r3, r2
	bne _0808C922
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhs _0808C922
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
_0808C91E:
	movs r4, #1
	str r4, [sp, #0x54]
_0808C922:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808C954 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x5c]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808C8AA
_0808C934:
	ldr r1, [sp, #0x5c]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808C93A:
	ldr r1, _0808C954 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808C898
	ldr r2, [sp, #0x54]
_0808C946:
	cmp r2, #0
	bne _0808C94E
	bl _0808D9F0
_0808C94E:
	movs r0, #1
	bl _0808D9F2
	.align 2, 0
_0808C954: .4byte 0x0200E668
_0808C958:
	cmp r2, #0
	bne _0808C9D4
	movs r3, #0
	mov ip, r3
	movs r1, #0
	ldr r4, _0808C9CC @ =0x0200E668
	ldrb r0, [r4]
	subs r0, #1
	cmp r2, r0
	bge _0808C9C6
	adds r6, r4, #0
	mov sl, r6
_0808C970:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sl
	ldrb r7, [r7]
	subs r1, r7, r0
	mov sb, r0
	cmp r2, r1
	bge _0808C9B6
	mov r8, sb
_0808C982:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _0808C9D0 @ =0x0200CBF0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808C9A6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808C9A6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808C982
_0808C9B6:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808C9CC @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C970
_0808C9C6:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808C9CC: .4byte 0x0200E668
_0808C9D0: .4byte 0x0200CBF0
_0808C9D4:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808CA44 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808CA3E
	adds r3, r2, #0
	mov sl, r3
_0808C9E8:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CA2E
	mov r8, sb
_0808C9FA:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CA48 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808CA1E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CA1E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808C9FA
_0808CA2E:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CA44 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C9E8
_0808CA3E:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CA44: .4byte 0x0200E668
_0808CA48: .4byte 0x0200CBF0
_0808CA4C:
	cmp r2, #0
	bne _0808CAC8
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808CAC0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808CABA
	adds r4, r3, #0
	mov sl, r4
_0808CA64:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CAAA
	mov r8, sb
_0808CA76:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CAC4 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808CA9A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CA9A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CA76
_0808CAAA:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CAC0 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CA64
_0808CABA:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CAC0: .4byte 0x0200E668
_0808CAC4: .4byte 0x0200CBF0
_0808CAC8:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808CB38 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808CB32
	adds r3, r2, #0
	mov sl, r3
_0808CADC:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CB22
	mov r8, sb
_0808CAEE:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CB3C @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808CB12
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CB12:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CAEE
_0808CB22:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CB38 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CADC
_0808CB32:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CB38: .4byte 0x0200E668
_0808CB3C: .4byte 0x0200CBF0
_0808CB40:
	cmp r2, #0
	bne _0808CBBC
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808CBB4 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808CBAE
	adds r4, r3, #0
	mov sl, r4
_0808CB58:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CB9E
	mov r8, sb
_0808CB6A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CBB8 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808CB8E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CB8E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CB6A
_0808CB9E:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CBB4 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CB58
_0808CBAE:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CBB4: .4byte 0x0200E668
_0808CBB8: .4byte 0x0200CBF0
_0808CBBC:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808CC2C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808CC26
	adds r3, r2, #0
	mov sl, r3
_0808CBD0:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CC16
	mov r8, sb
_0808CBE2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CC30 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808CC06
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CC06:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CBE2
_0808CC16:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CC2C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CBD0
_0808CC26:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CC2C: .4byte 0x0200E668
_0808CC30: .4byte 0x0200CBF0
_0808CC34:
	cmp r2, #0
	bne _0808CCC8
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808CCC0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CC4A
	b _0808CD4C
_0808CC4A:
	adds r4, r3, #0
	mov sl, r4
_0808CC4E:
	movs r3, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r3, r1
	bge _0808CCAE
	ldr r7, _0808CCC4 @ =0x0200CBF0
	mov sb, r7
_0808CC62:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble _0808CC9E
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808CC9E:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808CC62
_0808CCAE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CCC0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CC4E
	b _0808CD4C
	.align 2, 0
_0808CCC0: .4byte 0x0200E668
_0808CCC4: .4byte 0x0200CBF0
_0808CCC8:
	movs r4, #0
	mov ip, r4
	movs r1, #0
	ldr r6, _0808CD5C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp ip, r0
	bge _0808CD4C
	adds r7, r6, #0
	mov sl, r7
_0808CCDC:
	movs r3, #0
	adds r0, r1, #1
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r3, r1
	bge _0808CD3C
	ldr r4, _0808CD60 @ =0x0200CBF0
	mov sb, r4
_0808CCF0:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _0808CD2C
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808CD2C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808CCF0
_0808CD3C:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CD5C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CCDC
_0808CD4C:
	mov r3, ip
_0808CD4E:
	cmp r3, #0
	bne _0808CD56
	bl _0808D9F0
_0808CD56:
	movs r0, #1
	bl _0808D9F2
	.align 2, 0
_0808CD5C: .4byte 0x0200E668
_0808CD60: .4byte 0x0200CBF0
_0808CD64:
	cmp r2, #0
	bne _0808CDEC
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r6, _0808CDE4 @ =0x0200E668
	mov ip, r6
	ldrb r0, [r6]
	subs r0, #1
	cmp r2, r0
	blt _0808CD7E
	bl _0808D9DE
_0808CD7E:
	adds r7, r6, #0
	mov sb, r7
_0808CD82:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808CDD2
	ldr r4, _0808CDE8 @ =0x0200CBF0
	mov r8, r4
_0808CD96:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls _0808CDC4
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808CDC4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CD96
_0808CDD2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808CD82
	bl _0808D9DE
	.align 2, 0
_0808CDE4: .4byte 0x0200E668
_0808CDE8: .4byte 0x0200CBF0
_0808CDEC:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808CE68 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CE00
	bl _0808D9DE
_0808CE00:
	adds r3, r2, #0
	mov sb, r3
_0808CE04:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808CE54
	ldr r6, _0808CE6C @ =0x0200CBF0
	mov r8, r6
_0808CE18:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bhs _0808CE46
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808CE46:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CE18
_0808CE54:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808CE04
	bl _0808D9DE
	.align 2, 0
_0808CE68: .4byte 0x0200E668
_0808CE6C: .4byte 0x0200CBF0
_0808CE70:
	cmp r2, #0
	bne _0808CF38
	movs r1, #0
	mov sb, r1
	movs r3, #0
	ldr r0, _0808CEA4 @ =0x0200E668
	ldrb r1, [r0]
	cmp r2, r1
	bhs _0808CEBC
	ldr r6, _0808CEA8 @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808CE8A:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808CEAC
	mov r7, sp
	adds r0, r7, r3
	strb r4, [r0]
	b _0808CEB2
	.align 2, 0
_0808CEA4: .4byte 0x0200E668
_0808CEA8: .4byte 0x0200CBF0
_0808CEAC:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808CEB2:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808CE8A
_0808CEBC:
	movs r3, #0
	ldr r1, _0808CF30 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808CF28
	mov r8, r1
	ldr r2, _0808CF34 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808CED0:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808CF1A
	mov r7, ip
_0808CEE2:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls _0808CF0C
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808CF0C:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808CEE2
_0808CF1A:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808CED0
_0808CF28:
	mov r6, sb
	bl _0808D8D0
	.align 2, 0
_0808CF30: .4byte 0x0200E668
_0808CF34: .4byte 0x0200CBF0
_0808CF38:
	movs r7, #0
	mov sb, r7
	movs r3, #0
	ldr r0, _0808CF68 @ =0x0200E668
	ldrb r1, [r0]
	cmp sb, r1
	bhs _0808CF80
	ldr r6, _0808CF6C @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808CF4E:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808CF70
	mov r1, sp
	adds r0, r1, r3
	strb r4, [r0]
	b _0808CF76
	.align 2, 0
_0808CF68: .4byte 0x0200E668
_0808CF6C: .4byte 0x0200CBF0
_0808CF70:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808CF76:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808CF4E
_0808CF80:
	movs r3, #0
	ldr r1, _0808CFF4 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808CFEC
	mov r8, r1
	ldr r2, _0808CFF8 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808CF94:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808CFDE
	mov r7, ip
_0808CFA6:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bhs _0808CFD0
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808CFD0:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808CFA6
_0808CFDE:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808CF94
_0808CFEC:
	mov r6, sb
	bl _0808D8D0
	.align 2, 0
_0808CFF4: .4byte 0x0200E668
_0808CFF8: .4byte 0x0200CBF0
_0808CFFC:
	cmp r2, #0
	bne _0808D080
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808D078 @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _0808D016
	bl _0808D9DE
_0808D016:
	ldr r2, _0808D078 @ =0x0200E668
	mov sb, r2
_0808D01A:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D066
	ldr r4, _0808D07C @ =0x0200CBF0
	mov r8, r4
_0808D02E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D058
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D058:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D02E
_0808D066:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D01A
	bl _0808D9DE
	.align 2, 0
_0808D078: .4byte 0x0200E668
_0808D07C: .4byte 0x0200CBF0
_0808D080:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D0F8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D094
	bl _0808D9DE
_0808D094:
	adds r3, r2, #0
	mov sb, r3
_0808D098:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D0E4
	ldr r6, _0808D0FC @ =0x0200CBF0
	mov r8, r6
_0808D0AC:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D0D6
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D0D6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D0AC
_0808D0E4:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D098
	bl _0808D9DE
	.align 2, 0
_0808D0F8: .4byte 0x0200E668
_0808D0FC: .4byte 0x0200CBF0
_0808D100:
	cmp r2, #0
	bne _0808D184
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D17C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D118
	bl _0808D9DE
_0808D118:
	adds r4, r3, #0
	mov sb, r4
_0808D11C:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D168
	ldr r0, _0808D180 @ =0x0200CBF0
	mov r8, r0
_0808D130:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D15A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D15A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D130
_0808D168:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D11C
	bl _0808D9DE
	.align 2, 0
_0808D17C: .4byte 0x0200E668
_0808D180: .4byte 0x0200CBF0
_0808D184:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D1FC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D198
	bl _0808D9DE
_0808D198:
	adds r3, r2, #0
	mov sb, r3
_0808D19C:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D1E8
	ldr r6, _0808D200 @ =0x0200CBF0
	mov r8, r6
_0808D1B0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D1DA
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D1DA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D1B0
_0808D1E8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D19C
	bl _0808D9DE
	.align 2, 0
_0808D1FC: .4byte 0x0200E668
_0808D200: .4byte 0x0200CBF0
_0808D204:
	cmp r2, #0
	bne _0808D284
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D27C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D21A
	b _0808D9DE
_0808D21A:
	adds r4, r3, #0
	mov sb, r4
_0808D21E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D26A
	ldr r0, _0808D280 @ =0x0200CBF0
	mov r8, r0
_0808D232:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D25C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D25C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D232
_0808D26A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D21E
	b _0808D9DE
	.align 2, 0
_0808D27C: .4byte 0x0200E668
_0808D280: .4byte 0x0200CBF0
_0808D284:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D2F8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D296
	b _0808D9DE
_0808D296:
	adds r3, r2, #0
	mov sb, r3
_0808D29A:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D2E6
	ldr r6, _0808D2FC @ =0x0200CBF0
	mov r8, r6
_0808D2AE:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D2D8
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D2D8:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D2AE
_0808D2E6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D29A
	b _0808D9DE
	.align 2, 0
_0808D2F8: .4byte 0x0200E668
_0808D2FC: .4byte 0x0200CBF0
_0808D300:
	cmp r2, #0
	bne _0808D380
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D378 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D316
	b _0808D9DE
_0808D316:
	adds r4, r3, #0
	mov sb, r4
_0808D31A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D366
	ldr r0, _0808D37C @ =0x0200CBF0
	mov r8, r0
_0808D32E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D358
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D358:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D32E
_0808D366:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D31A
	b _0808D9DE
	.align 2, 0
_0808D378: .4byte 0x0200E668
_0808D37C: .4byte 0x0200CBF0
_0808D380:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D3F4 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D392
	b _0808D9DE
_0808D392:
	adds r3, r2, #0
	mov sb, r3
_0808D396:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D3E2
	ldr r6, _0808D3F8 @ =0x0200CBF0
	mov r8, r6
_0808D3AA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D3D4
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D3D4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D3AA
_0808D3E2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D396
	b _0808D9DE
	.align 2, 0
_0808D3F4: .4byte 0x0200E668
_0808D3F8: .4byte 0x0200CBF0
_0808D3FC:
	cmp r2, #0
	bne _0808D47C
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D474 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D412
	b _0808D9DE
_0808D412:
	adds r4, r3, #0
	mov sb, r4
_0808D416:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D462
	ldr r0, _0808D478 @ =0x0200CBF0
	mov r8, r0
_0808D42A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D454
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D454:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D42A
_0808D462:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D416
	b _0808D9DE
	.align 2, 0
_0808D474: .4byte 0x0200E668
_0808D478: .4byte 0x0200CBF0
_0808D47C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D4F0 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D48E
	b _0808D9DE
_0808D48E:
	adds r3, r2, #0
	mov sb, r3
_0808D492:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D4DE
	ldr r6, _0808D4F4 @ =0x0200CBF0
	mov r8, r6
_0808D4A6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D4D0
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D4D0:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D4A6
_0808D4DE:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D492
	b _0808D9DE
	.align 2, 0
_0808D4F0: .4byte 0x0200E668
_0808D4F4: .4byte 0x0200CBF0
_0808D4F8:
	cmp r2, #0
	bne _0808D578
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D570 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D50E
	b _0808D9DE
_0808D50E:
	adds r4, r3, #0
	mov sb, r4
_0808D512:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D55E
	ldr r0, _0808D574 @ =0x0200CBF0
	mov r8, r0
_0808D526:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D550
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D550:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D526
_0808D55E:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D512
	b _0808D9DE
	.align 2, 0
_0808D570: .4byte 0x0200E668
_0808D574: .4byte 0x0200CBF0
_0808D578:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D5EC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D58A
	b _0808D9DE
_0808D58A:
	adds r3, r2, #0
	mov sb, r3
_0808D58E:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D5DA
	ldr r6, _0808D5F0 @ =0x0200CBF0
	mov r8, r6
_0808D5A2:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D5CC
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D5CC:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D5A2
_0808D5DA:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D58E
	b _0808D9DE
	.align 2, 0
_0808D5EC: .4byte 0x0200E668
_0808D5F0: .4byte 0x0200CBF0
_0808D5F4:
	cmp r2, #0
	bne _0808D674
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D66C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D60A
	b _0808D9DE
_0808D60A:
	adds r4, r3, #0
	mov sb, r4
_0808D60E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D65A
	ldr r0, _0808D670 @ =0x0200CBF0
	mov r8, r0
_0808D622:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D64C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D64C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D622
_0808D65A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D60E
	b _0808D9DE
	.align 2, 0
_0808D66C: .4byte 0x0200E668
_0808D670: .4byte 0x0200CBF0
_0808D674:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D6E8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D686
	b _0808D9DE
_0808D686:
	adds r3, r2, #0
	mov sb, r3
_0808D68A:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D6D6
	ldr r6, _0808D6EC @ =0x0200CBF0
	mov r8, r6
_0808D69E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D6C8
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D6C8:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D69E
_0808D6D6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D68A
	b _0808D9DE
	.align 2, 0
_0808D6E8: .4byte 0x0200E668
_0808D6EC: .4byte 0x0200CBF0
_0808D6F0:
	cmp r2, #0
	bne _0808D770
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D768 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D706
	b _0808D9DE
_0808D706:
	adds r4, r3, #0
	mov sb, r4
_0808D70A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D756
	ldr r0, _0808D76C @ =0x0200CBF0
	mov r8, r0
_0808D71E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D748
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D748:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D71E
_0808D756:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D70A
	b _0808D9DE
	.align 2, 0
_0808D768: .4byte 0x0200E668
_0808D76C: .4byte 0x0200CBF0
_0808D770:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D7E4 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D782
	b _0808D9DE
_0808D782:
	adds r3, r2, #0
	mov sb, r3
_0808D786:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D7D2
	ldr r6, _0808D7E8 @ =0x0200CBF0
	mov r8, r6
_0808D79A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D7C4
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D7C4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D79A
_0808D7D2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D786
	b _0808D9DE
	.align 2, 0
_0808D7E4: .4byte 0x0200E668
_0808D7E8: .4byte 0x0200CBF0
_0808D7EC:
	cmp r2, #0
	bne _0808D864
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D85C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808D8CE
	adds r4, r3, #0
	mov sb, r4
_0808D804:
	movs r4, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r4, r1
	bge _0808D848
	ldr r6, _0808D860 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808D81A:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bls _0808D838
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808D838:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808D81A
_0808D848:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808D804
	b _0808D8CE
	.align 2, 0
_0808D85C: .4byte 0x0200E668
_0808D860: .4byte 0x0200CBF0
_0808D864:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808D8DC @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge _0808D8CE
	ldr r2, _0808D8DC @ =0x0200E668
	mov sb, r2
_0808D87A:
	movs r4, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r4, r1
	bge _0808D8BE
	ldr r6, _0808D8E0 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808D890:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bhs _0808D8AE
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808D8AE:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808D890
_0808D8BE:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808D87A
_0808D8CE:
	mov r6, sl
_0808D8D0:
	cmp r6, #0
	bne _0808D8D6
	b _0808D9F0
_0808D8D6:
	movs r0, #1
	b _0808D9F2
	.align 2, 0
_0808D8DC: .4byte 0x0200E668
_0808D8E0: .4byte 0x0200CBF0
_0808D8E4:
	cmp r2, #0
	bne _0808D96C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808D964 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _0808D95A
_0808D8F8:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808D94A
	ldr r0, _0808D968 @ =0x0200CBF0
	mov sb, r0
_0808D90A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	ble _0808D93A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808D93A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D964 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808D90A
_0808D94A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D964 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D8F8
_0808D95A:
	mov r7, sl
_0808D95C:
	cmp r7, #0
	beq _0808D9F0
	movs r0, #1
	b _0808D9F2
	.align 2, 0
_0808D964: .4byte 0x0200E668
_0808D968: .4byte 0x0200CBF0
_0808D96C:
	movs r0, #0
	mov sl, r0
	movs r2, #0
	ldr r1, _0808D9E8 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp sl, r0
	bge _0808D9DE
_0808D97C:
	movs r5, #0
	adds r0, r2, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	mov r8, r0
	cmp r5, r1
	bge _0808D9CE
	ldr r1, _0808D9EC @ =0x0200CBF0
	mov sb, r1
_0808D98E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	bge _0808D9BE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808D9BE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D9E8 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808D98E
_0808D9CE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0808D9E8 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r2, r0
	blt _0808D97C
_0808D9DE:
	mov r0, sl
	cmp r0, #0
	beq _0808D9F0
	movs r0, #1
	b _0808D9F2
	.align 2, 0
_0808D9E8: .4byte 0x0200E668
_0808D9EC: .4byte 0x0200CBF0
_0808D9F0:
	movs r0, #0
_0808D9F2:
	add sp, #0x68
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetPrepMainMenuInfoxMsg
GetPrepMainMenuInfoxMsg: @ 0x0808DA04
	push {r4, lr}
	bl GetActivePrepMenuItemIndex
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DA28
	ldr r0, _0808DA24 @ =0x08CC3B30
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b _0808DA60
	.align 2, 0
_0808DA24: .4byte 0x08CC3B30
_0808DA28:
	ldr r0, _0808DA38 @ =0x0202BBF8
	ldrb r1, [r0, #0xe]
	cmp r1, #0x2e
	bne _0808DA40
	cmp r4, #7
	bne _0808DA40
	ldr r0, _0808DA3C @ =0x000003EF
	b _0808DA64
	.align 2, 0
_0808DA38: .4byte 0x0202BBF8
_0808DA3C: .4byte 0x000003EF
_0808DA40:
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _0808DA58
	ldr r0, _0808DA54 @ =0x08CC3B30
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
	b _0808DA60
	.align 2, 0
_0808DA54: .4byte 0x08CC3B30
_0808DA58:
	ldr r0, _0808DA6C @ =0x08CC3B30
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
_0808DA60:
	adds r1, r1, r0
	ldr r0, [r1]
_0808DA64:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808DA6C: .4byte 0x08CC3B30

	thumb_func_start PrepOptionCountToRealIndexByMask
PrepOptionCountToRealIndexByMask: @ 0x0808DA70
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	movs r5, #1
_0808DA7A:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _0808DA8E
	cmp r4, r3
	bne _0808DA8C
	adds r0, r2, #0
	b _0808DA98
_0808DA8C:
	adds r3, #1
_0808DA8E:
	adds r2, #1
	cmp r2, #3
	ble _0808DA7A
	movs r0, #1
	rsbs r0, r0, #0
_0808DA98:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetPrepOptionCount
GetPrepOptionCount: @ 0x0808DAA0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	movs r4, #1
_0808DAAA:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _0808DAB6
	adds r2, #1
_0808DAB6:
	adds r1, #1
	cmp r1, #3
	ble _0808DAAA
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start PutPrepMenuUiImg
PutPrepMenuUiImg: @ 0x0808DAC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _0808DB08 @ =0x0840F374
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0808DB0C @ =0x08406528
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r1, _0808DB10 @ =0x0202BBF8
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB08: .4byte 0x0840F374
_0808DB0C: .4byte 0x08406528
_0808DB10: .4byte 0x0202BBF8

	thumb_func_start sub_0808DB14
sub_0808DB14: @ 0x0808DB14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r1, _0808DB88 @ =0x08407354
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r0, r0, r2
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov r0, r8
	bl TmApplyTsa_thm
	movs r5, #0
	cmp r5, r7
	bge _0808DB5E
	mov r4, r8
	adds r4, #0x40
	adds r5, r7, #0
_0808DB4A:
	adds r0, r4, #0
	ldr r1, _0808DB8C @ =0x0840736C
	lsrs r2, r6, #0x10
	bl TmApplyTsa_thm
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bne _0808DB4A
	adds r5, r7, #0
_0808DB5E:
	lsls r0, r5, #7
	add r0, r8
	adds r0, #0x40
	ldr r1, _0808DB90 @ =0x084073AC
	mov r4, sl
	lsls r2, r4, #0xc
	mov r4, sb
	lsls r3, r4, #0xf
	lsrs r3, r3, #0x14
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB88: .4byte 0x08407354
_0808DB8C: .4byte 0x0840736C
_0808DB90: .4byte 0x084073AC

	thumb_func_start PrepScreenMenu_OnPickUnits
PrepScreenMenu_OnPickUnits: @ 0x0808DB94
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start PrepScreenMenu_OnItems
PrepScreenMenu_OnItems: @ 0x0808DBA8
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #2
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start PrepScreenMenu_OnSupport
PrepScreenMenu_OnSupport: @ 0x0808DBBC
	push {lr}
	movs r1, #0xc
	bl Proc_Goto
	ldr r0, _0808DBDC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DBD6
	ldr r0, _0808DBE0 @ =0x0000038A
	bl m4aSongNumStart
_0808DBD6:
	pop {r0}
	bx r0
	.align 2, 0
_0808DBDC: .4byte 0x0202BBF8
_0808DBE0: .4byte 0x0000038A

	thumb_func_start PrepScreenMenu_OnSave
PrepScreenMenu_OnSave: @ 0x0808DBE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808DC10 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DBFA
	ldr r0, _0808DC14 @ =0x0000038A
	bl m4aSongNumStart
_0808DBFA:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DC10: .4byte 0x0202BBF8
_0808DC14: .4byte 0x0000038A

	thumb_func_start PrepScreenMenu_OnStartPress
PrepScreenMenu_OnStartPress: @ 0x0808DC18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808DC34
	bl PrepSpecialChar_BlinkButtonStart
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #1
	b _0808DC36
_0808DC34:
	movs r0, #0
_0808DC36:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0808DC3C
sub_0808DC3C: @ 0x0808DC3C
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start CanPrepScreenCheckMap
CanPrepScreenCheckMap: @ 0x0808DC48
	ldr r0, _0808DC54 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2e
	beq _0808DC58
	movs r0, #1
	b _0808DC5A
	.align 2, 0
_0808DC54: .4byte 0x0202BBF8
_0808DC58:
	movs r0, #0
_0808DC5A:
	bx lr

	thumb_func_start sub_0808DC5C
sub_0808DC5C: @ 0x0808DC5C
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808DC74
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DC80
_0808DC74:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	b _0808DC82
_0808DC80:
	movs r0, #0
_0808DC82:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0808DC88
sub_0808DC88: @ 0x0808DC88
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_0808DC94
sub_0808DC94: @ 0x0808DC94
	bx lr
	.align 2, 0

	thumb_func_start sub_0808DC98
sub_0808DC98: @ 0x0808DC98
	bx lr
	.align 2, 0

	thumb_func_start ResetSioPidPool
ResetSioPidPool: @ 0x0808DC9C
	ldr r1, _0808DCAC @ =0x0203E788
	movs r2, #0
	adds r0, r1, #4
_0808DCA2:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0808DCA2
	bx lr
	.align 2, 0
_0808DCAC: .4byte 0x0203E788

	thumb_func_start RegisterSioPid
RegisterSioPid: @ 0x0808DCB0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _0808DCC8 @ =0x0203E788
_0808DCBA:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808DCCC
	strb r3, [r1]
	b _0808DCD2
	.align 2, 0
_0808DCC8: .4byte 0x0203E788
_0808DCCC:
	adds r2, #1
	cmp r2, #4
	ble _0808DCBA
_0808DCD2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RemoveSioPid
RemoveSioPid: @ 0x0808DCD8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _0808DD08 @ =0x0203E788
	adds r4, r3, #0
_0808DCE4:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0808DD0C
	adds r2, r1, #0
	cmp r1, #3
	bgt _0808DD00
	adds r1, r1, r4
_0808DCF4:
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #3
	ble _0808DCF4
_0808DD00:
	movs r0, #0
	strb r0, [r3, #4]
	b _0808DD12
	.align 2, 0
_0808DD08: .4byte 0x0203E788
_0808DD0C:
	adds r1, #1
	cmp r1, #4
	ble _0808DCE4
_0808DD12:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GetUnitFromPrepList
GetUnitFromPrepList: @ 0x0808DD18
	ldr r1, _0808DD24 @ =0x020116DC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808DD24: .4byte 0x020116DC

	thumb_func_start RegisterPrepUnitList
RegisterPrepUnitList: @ 0x0808DD28
	ldr r2, _0808DD34 @ =0x020116DC
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0808DD34: .4byte 0x020116DC

	thumb_func_start PrepGetUnitAmount
PrepGetUnitAmount: @ 0x0808DD38
	ldr r0, _0808DD44 @ =0x020116DC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808DD44: .4byte 0x020116DC

	thumb_func_start PrepSetUnitAmount
PrepSetUnitAmount: @ 0x0808DD48
	ldr r1, _0808DD54 @ =0x020116DC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_0808DD54: .4byte 0x020116DC

	thumb_func_start PrepGetLatestCharId
PrepGetLatestCharId: @ 0x0808DD58
	ldr r0, _0808DD64 @ =0x020116DC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808DD64: .4byte 0x020116DC

	thumb_func_start PrepSetLatestCharId
PrepSetLatestCharId: @ 0x0808DD68
	ldr r1, _0808DD74 @ =0x020116DC
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_0808DD74: .4byte 0x020116DC

	thumb_func_start IsCharacterForceDeployed
IsCharacterForceDeployed: @ 0x0808DD78
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808DE5E
	ldr r0, _0808DD98 @ =0x0202BBF8
	ldrb r1, [r0, #0x1b]
	cmp r1, #2
	beq _0808DDAA
	cmp r1, #2
	bgt _0808DD9C
	cmp r1, #1
	beq _0808DDA2
	b _0808DDB4
	.align 2, 0
_0808DD98: .4byte 0x0202BBF8
_0808DD9C:
	cmp r1, #3
	beq _0808DDB0
	b _0808DDB4
_0808DDA2:
	cmp r4, #3
	bne _0808DDB4
_0808DDA6:
	movs r0, #1
	b _0808DE60
_0808DDAA:
	cmp r4, #1
	bne _0808DDB4
	b _0808DDA6
_0808DDB0:
	cmp r4, #2
	beq _0808DDA6
_0808DDB4:
	ldrb r0, [r0, #0xe]
	subs r0, #0x1a
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bhi _0808DE5E
	lsls r0, r0, #2
	ldr r1, _0808DDCC @ =_0808DDD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808DDCC: .4byte _0808DDD0
_0808DDD0: @ jump table
	.4byte _0808DE36 @ case 0
	.4byte _0808DE24 @ case 1
	.4byte _0808DE36 @ case 2
	.4byte _0808DE5E @ case 3
	.4byte _0808DE2A @ case 4
	.4byte _0808DE5E @ case 5
	.4byte _0808DE5E @ case 6
	.4byte _0808DE5E @ case 7
	.4byte _0808DE36 @ case 8
	.4byte _0808DE5E @ case 9
	.4byte _0808DE5E @ case 10
	.4byte _0808DE5E @ case 11
	.4byte _0808DE30 @ case 12
	.4byte _0808DE5E @ case 13
	.4byte _0808DE5E @ case 14
	.4byte _0808DE5E @ case 15
	.4byte _0808DE36 @ case 16
	.4byte _0808DE5E @ case 17
	.4byte _0808DE44 @ case 18
	.4byte _0808DE5E @ case 19
	.4byte _0808DE4A @ case 20
_0808DE24:
	cmp r4, #1
	bne _0808DE5E
	b _0808DDA6
_0808DE2A:
	cmp r4, #0x22
	bne _0808DE5E
	b _0808DDA6
_0808DE30:
	cmp r4, #0x14
	bne _0808DE5E
	b _0808DDA6
_0808DE36:
	cmp r4, #0x2d
	beq _0808DDA6
	cmp r4, #1
	beq _0808DDA6
	cmp r4, #2
	bne _0808DE5E
	b _0808DDA6
_0808DE44:
	cmp r4, #0x26
	bne _0808DE5E
	b _0808DDA6
_0808DE4A:
	cmp r4, #0x2d
	beq _0808DDA6
	cmp r4, #1
	beq _0808DDA6
	cmp r4, #2
	beq _0808DDA6
	cmp r4, #0x26
	beq _0808DDA6
	cmp r4, #0x27
	beq _0808DDA6
_0808DE5E:
	movs r0, #0
_0808DE60:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CalcForceDeployedUnitCounts
CalcForceDeployedUnitCounts: @ 0x0808DE68
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0808DE6E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808DE96
	ldr r2, [r0]
	cmp r2, #0
	beq _0808DE96
	ldr r0, [r0, #0xc]
	ldr r1, _0808DEA4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808DE96
	ldrb r0, [r2, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DE96
	adds r5, #1
_0808DE96:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808DE6E
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808DEA4: .4byte 0x00010004

	thumb_func_start SomeLeftoverFunctionThatReturns0
SomeLeftoverFunctionThatReturns0: @ 0x0808DEA8
	adds r1, r0, #0
	ldr r0, _0808DEC4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x2b
	bgt _0808DEEC
	cmp r0, #0x2a
	bge _0808DEE0
	cmp r0, #9
	beq _0808DEC8
	cmp r0, #0x29
	beq _0808DED4
	b _0808DEEC
	.align 2, 0
_0808DEC4: .4byte 0x0202BBF8
_0808DEC8:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x23
	bne _0808DEEC
	movs r0, #1
	b _0808DEEE
_0808DED4:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0xb
	bne _0808DEEC
	movs r0, #1
	b _0808DEEE
_0808DEE0:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	bne _0808DEEC
	movs r0, #1
	b _0808DEEE
_0808DEEC:
	movs r0, #0
_0808DEEE:
	bx lr

	thumb_func_start IsUnitInCurrentRoster
IsUnitInCurrentRoster: @ 0x0808DEF0
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0808DF14 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808DF1C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0808DF18
	movs r0, #1
	b _0808DF1E
	.align 2, 0
_0808DF14: .4byte 0x00010004
_0808DF18:
	movs r0, #8
	str r0, [r2, #0xc]
_0808DF1C:
	movs r0, #0
_0808DF1E:
	bx lr

	thumb_func_start AtMenu_AddPrepScreenSupportMenuItem
AtMenu_AddPrepScreenSupportMenuItem: @ 0x0808DF20
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r1, r0, #0
	adds r1, #0x2f
	strb r6, [r1]
	ldr r2, _0808DF50 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r3, [r2, #0x14]
	ands r0, r3
	cmp r0, #0
	bne _0808DF8C
	ldrb r2, [r2, #0x1b]
	cmp r2, #1
	bne _0808DF5C
	ldr r1, _0808DF54 @ =PrepScreenMenu_OnSupport
	ldr r3, _0808DF58 @ =0x00001146
	str r6, [sp]
	movs r0, #4
	movs r2, #1
	bl SetPrepScreenMenuItem
	b _0808DF8C
	.align 2, 0
_0808DF50: .4byte 0x0202BBF8
_0808DF54: .4byte PrepScreenMenu_OnSupport
_0808DF58: .4byte 0x00001146
_0808DF5C:
	movs r4, #0
	adds r5, r1, #0
_0808DF60:
	adds r0, r4, #0
	bl sub_080991F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DF76
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_0808DF76:
	adds r4, #1
	cmp r4, #3
	ble _0808DF60
	ldr r1, _0808DF94 @ =PrepScreenMenu_OnSupport
	ldr r3, _0808DF98 @ =0x00001146
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl SetPrepScreenMenuItem
_0808DF8C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DF94: .4byte PrepScreenMenu_OnSupport
_0808DF98: .4byte 0x00001146

	thumb_func_start InitPrepScreenMainMenu
InitPrepScreenMainMenu: @ 0x0808DF9C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_0808FE48
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0808E048
	ldr r1, _0808DFF0 @ =PrepScreenMenu_OnPickUnits
	ldr r3, _0808DFF4 @ =0x0000113D
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808DFF8 @ =PrepScreenMenu_OnItems
	ldr r3, _0808DFFC @ =0x0000113E
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	adds r0, r5, #0
	bl AtMenu_AddPrepScreenSupportMenuItem
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E008
	ldr r1, _0808E000 @ =sub_0808DC88
	ldr r3, _0808E004 @ =0x00001141
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl SetPrepScreenMenuItem
	b _0808E016
	.align 2, 0
_0808DFF0: .4byte PrepScreenMenu_OnPickUnits
_0808DFF4: .4byte 0x0000113D
_0808DFF8: .4byte PrepScreenMenu_OnItems
_0808DFFC: .4byte 0x0000113E
_0808E000: .4byte sub_0808DC88
_0808E004: .4byte 0x00001141
_0808E008:
	ldr r1, _0808E038 @ =sub_0808DC88
	ldr r3, _0808E03C @ =0x00001141
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl SetPrepScreenMenuItem
_0808E016:
	ldr r1, _0808E040 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0808E074
	ldr r1, _0808E044 @ =PrepScreenMenu_OnSave
	movs r3, #0x8a
	lsls r3, r3, #5
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl SetPrepScreenMenuItem
	b _0808E074
	.align 2, 0
_0808E038: .4byte sub_0808DC88
_0808E03C: .4byte 0x00001141
_0808E040: .4byte 0x0202BBF8
_0808E044: .4byte PrepScreenMenu_OnSave
_0808E048:
	ldr r1, _0808E0B4 @ =PrepScreenMenu_OnPickUnits
	ldr r3, _0808E0B8 @ =0x0000113D
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808E0BC @ =PrepScreenMenu_OnItems
	ldr r3, _0808E0C0 @ =0x0000113E
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _0808E0C4 @ =sub_0808DC3C
	ldr r3, _0808E0C8 @ =0x00001152
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	bl SetPrepScreenMenuItem
_0808E074:
	ldr r0, _0808E0CC @ =sub_0808DC5C
	bl SetPrepScreenMenuOnBPress
	ldr r0, _0808E0D0 @ =PrepScreenMenu_OnStartPress
	bl SetPrepScreenMenuOnStartPress
	ldr r0, _0808E0D4 @ =0x02022C60
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808E0D8 @ =0x02023460
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	movs r1, #4
	bl DrawPrepScreenMenuFrameAt
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl SetPrepScreenMenuSelectedItem
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E0B4: .4byte PrepScreenMenu_OnPickUnits
_0808E0B8: .4byte 0x0000113D
_0808E0BC: .4byte PrepScreenMenu_OnItems
_0808E0C0: .4byte 0x0000113E
_0808E0C4: .4byte sub_0808DC3C
_0808E0C8: .4byte 0x00001152
_0808E0CC: .4byte sub_0808DC5C
_0808E0D0: .4byte PrepScreenMenu_OnStartPress
_0808E0D4: .4byte 0x02022C60
_0808E0D8: .4byte 0x02023460

	thumb_func_start GetLatestUnitIndexInPrepListByUId
GetLatestUnitIndexInPrepListByUId: @ 0x0808E0DC
	push {r4, r5, lr}
	movs r5, #0
	b _0808E0FE
_0808E0E2:
	bl GetLastStatScreenUnitId
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _0808E0FC
	adds r0, r5, #0
	b _0808E108
_0808E0FC:
	adds r5, #1
_0808E0FE:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808E0E2
	movs r0, #0
_0808E108:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PrepGetLatestUnitIndex
PrepGetLatestUnitIndex: @ 0x0808E110
	push {r4, r5, lr}
	movs r5, #0
	b _0808E12E
_0808E116:
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl PrepGetLatestCharId
	cmp r4, r0
	bne _0808E12C
	adds r0, r5, #0
	b _0808E138
_0808E12C:
	adds r5, #1
_0808E12E:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808E116
	movs r0, #0
_0808E138:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ReorderPlayerUnitsBasedOnDeployment
ReorderPlayerUnitsBasedOnDeployment: @ 0x0808E140
	push {r4, lr}
	ldr r0, _0808E1A8 @ =0x020106DC
	bl InitUnitStack
	movs r4, #1
_0808E14A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808E16C
	ldr r0, [r2]
	cmp r0, #0
	beq _0808E16C
	ldr r0, [r2, #0xc]
	ldr r1, _0808E1AC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808E16C
	adds r0, r2, #0
	bl PushUnit
_0808E16C:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E14A
	movs r4, #1
_0808E174:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808E196
	ldr r0, [r2]
	cmp r0, #0
	beq _0808E196
	ldr r0, [r2, #0xc]
	ldr r1, _0808E1AC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0808E196
	adds r0, r2, #0
	bl PushUnit
_0808E196:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E174
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E1A8: .4byte 0x020106DC
_0808E1AC: .4byte 0x0001000C

	thumb_func_start SortPlayerUnitsForPrepScreen
SortPlayerUnitsForPrepScreen: @ 0x0808E1B0
	push {r4, r5, r6, r7, lr}
	bl GetChapterAllyUnitCount
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0808E274 @ =0x020106DC
	bl InitUnitStack
	movs r5, #1
_0808E1C2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808E1FC
	ldr r0, [r4]
	cmp r0, #0
	beq _0808E1FC
	ldr r0, [r4, #0xc]
	ldr r1, _0808E278 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E1FC
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E1FC
	adds r0, r4, #0
	bl PushUnit
_0808E1FC:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808E1C2
	movs r5, #1
_0808E204:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808E236
	ldr r0, [r4]
	cmp r0, #0
	beq _0808E236
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E230
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E236
_0808E230:
	adds r0, r4, #0
	bl PushUnit
_0808E236:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808E204
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_0808E242:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808E29A
	ldr r0, [r4]
	cmp r0, #0
	beq _0808E29A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E29A
	adds r0, r4, #0
	bl SomeLeftoverFunctionThatReturns0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E280
	ldr r0, [r4, #0xc]
	ldr r1, _0808E27C @ =0x02000008
	b _0808E296
	.align 2, 0
_0808E274: .4byte 0x020106DC
_0808E278: .4byte 0xFDFFFFFF
_0808E27C: .4byte 0x02000008
_0808E280:
	cmp r7, r6
	ble _0808E292
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _0808E29A
_0808E292:
	ldr r0, [r4, #0xc]
	movs r1, #8
_0808E296:
	orrs r0, r1
	str r0, [r4, #0xc]
_0808E29A:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808E242
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
