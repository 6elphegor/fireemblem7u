	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_RemovePositionDisplayed
EvtCmd_RemovePositionDisplayed: @ 0x0800DF8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DFA4
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DFA6
_0800DFA4:
	ldr r0, _0800DFBC @ =0x0000FFFF
_0800DFA6:
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DFC0
	adds r0, r2, #0
	b _0800DFC2
	.align 2, 0
_0800DFBC: .4byte 0x0000FFFF
_0800DFC0:
	ldr r0, _0800E004 @ =0x0000FFFF
_0800DFC2:
	lsls r2, r0, #0x10
	ldr r0, _0800E008 @ =0x0202E3DC
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E01C
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E00C
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800E012
	.align 2, 0
_0800E004: .4byte 0x0000FFFF
_0800E008: .4byte 0x0202E3DC
_0800E00C:
	adds r0, r4, #0
	bl ClearUnit
_0800E012:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	b _0800E04A
_0800E01C:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	adds r4, r0, #0
	bl MU_SetDefaultFacing_Auto
	adds r0, r4, #0
	bl StartMuDeathFade
	ldr r0, _0800E054 @ =EventRemoveDisplayedWait
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800E04A:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E054: .4byte EventRemoveDisplayedWait
