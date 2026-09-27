	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_RemovePidDisplayed
EvtCmd_RemovePidDisplayed: @ 0x0800E058
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E0A4
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E094
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800E09A
_0800E094:
	adds r0, r4, #0
	bl ClearUnit
_0800E09A:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	b _0800E0C8
_0800E0A4:
	adds r0, r4, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	adds r4, r0, #0
	bl MU_SetDefaultFacing_Auto
	adds r0, r4, #0
	bl StartMuDeathFade
	ldr r0, _0800E0D0 @ =EventRemoveDisplayedWait
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800E0C8:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E0D0: .4byte EventRemoveDisplayedWait
