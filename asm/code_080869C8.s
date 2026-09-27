	.include "macro.inc"

	.syntax unified

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
