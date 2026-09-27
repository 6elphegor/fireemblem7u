	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057174
sub_08057174: @ 0x08057174
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne _08057208
	adds r0, r4, #0
	movs r1, #0
	bl StartSubSpell_efxSongBG
	adds r0, r4, #0
	movs r1, #0
	bl StartSubSpell_efxSongOBJ
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x64
	bl NewEfxTwobaiRST
	ldr r3, _0805723C @ =0x03002870
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
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxALPHA
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl PlaySFX
_08057208:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne _08057264
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartBattleAnimStatusChgHitEffects
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057248
	ldr r0, _08057240 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _08057244 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	b _08057254
	.align 2, 0
_0805723C: .4byte 0x03002870
_08057240: .4byte 0x02000054
_08057244: .4byte 0x02022B40
_08057248:
	ldr r0, _0805725C @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08057260 @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
_08057254:
	adds r0, r4, #0
	bl EnableEfxStatusUnits
	b _0805727A
	.align 2, 0
_0805725C: .4byte 0x02000054
_08057260: .4byte 0x02022B80
_08057264:
	cmp r0, #0xa5
	bne _0805727A
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805727A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
