	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805CEB0
sub_0805CEB0: @ 0x0805CEB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CEF0
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxLiveOBJ
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl StartSubSpell_efxReblowOBJ
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CFE2
_0805CEF0:
	cmp r0, #0x34
	bne _0805CF58
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl StartSubSpell_efxLiveBG_A
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D21C
	ldr r3, _0805CF54 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl StartSubSpell_efxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl StartSubSpell_efxLiveALPHA
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CFE2
	.align 2, 0
_0805CF54: .4byte 0x03002870
_0805CF58:
	cmp r0, #0x37
	bne _0805CF66
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805D034
_0805CF66:
	cmp r0, #0x97
	bne _0805CF7E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl StartSubSpell_efxReblowOBJ
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b _0805D034
_0805CF7E:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0xa1
	cmp r1, r0
	bne _0805CFF4
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl StartSubSpell_efxLiveBG_B
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D28C
	ldr r3, _0805CFEC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl StartSubSpell_efxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl StartSubSpell_efxLiveALPHA
	ldr r0, _0805CFF0 @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805CFE2:
	movs r3, #1
	bl PlaySFX
	b _0805D034
	.align 2, 0
_0805CFEC: .4byte 0x03002870
_0805CFF0: .4byte 0x0000010F
_0805CFF4:
	adds r0, r2, #0
	adds r0, #0xd3
	cmp r1, r0
	bne _0805D004
	adds r0, r5, #0
	bl NewEfxHpBarLive
	b _0805D034
_0805D004:
	adds r0, r2, #0
	adds r0, #0xdd
	cmp r1, r0
	bne _0805D034
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805D02E
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805D02E:
	adds r0, r4, #0
	bl Proc_Break
_0805D034:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
