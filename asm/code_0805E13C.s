	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E13C
sub_0805E13C: @ 0x0805E13C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E180
	ldr r0, [r4, #0x5c]
	bl sub_0805E320
	ldr r0, _0805E1D4 @ =0x0000011B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0805E180:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x64
	bne _0805E190
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805E190:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #0
	adds r0, #0x82
	cmp r1, r0
	bne _0805E1D8
	adds r0, r5, #0
	bl StartSubSpell_efxSleepOBJ2
	adds r0, r5, #0
	bl sub_0805E3CC
	ldr r0, [r4, #0x5c]
	bl sub_0805E23C
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xe6
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	b _0805E22E
	.align 2, 0
_0805E1D4: .4byte 0x0000011B
_0805E1D8:
	movs r3, #0xa5
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne _0805E20E
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805E22E
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _0805E22E
	adds r0, r5, #0
	movs r1, #2
	bl SetUnitEfxDebuff
	b _0805E22E
_0805E20E:
	movs r2, #0xb9
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805E22E
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805E22E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805E23C
sub_0805E23C: @ 0x0805E23C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805E29C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E2A0 @ =0x08BA3384
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805E2A4 @ =0x081E9048
	str r0, [r5, #0x48]
	ldr r0, _0805E2A8 @ =0x08BA339C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805E2AC @ =0x082751D0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805E2B0 @ =0x08274304
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805E2B4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E2C2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E2B8
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805E2C2
	.align 2, 0
_0805E29C: .4byte 0x0201774C
_0805E2A0: .4byte 0x08BA3384
_0805E2A4: .4byte 0x081E9048
_0805E2A8: .4byte 0x08BA339C
_0805E2AC: .4byte 0x082751D0
_0805E2B0: .4byte 0x08274304
_0805E2B4: .4byte 0x0203E02C
_0805E2B8:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805E2C2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805E2C8
sub_0805E2C8: @ 0x0805E2C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805E2F6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805E314
_0805E2F6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805E314
	bl SpellFx_ClearBG1
	ldr r1, _0805E31C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805E314:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E31C: .4byte 0x0201774C

	thumb_func_start sub_0805E320
sub_0805E320: @ 0x0805E320
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E364 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E368 @ =0x08BA33DC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E36C @ =0x08BCC1E0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805E370 @ =0x08276198
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E374 @ =0x08275FB0
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E364: .4byte 0x0201774C
_0805E368: .4byte 0x08BA33DC
_0805E36C: .4byte 0x08BCC1E0
_0805E370: .4byte 0x08276198
_0805E374: .4byte 0x08275FB0

	thumb_func_start StartSubSpell_efxSleepOBJ2
StartSubSpell_efxSleepOBJ2: @ 0x0805E378
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E3B0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E3B4 @ =0x08BA33FC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E3B8 @ =0x08BCC060
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #8
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3B0: .4byte 0x0201774C
_0805E3B4: .4byte 0x08BA33FC
_0805E3B8: .4byte 0x08BCC060

	thumb_func_start sub_0805E3BC
sub_0805E3BC: @ 0x0805E3BC
	ldr r1, _0805E3C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E3C8: .4byte 0x0201774C

	thumb_func_start sub_0805E3CC
sub_0805E3CC: @ 0x0805E3CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E3E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E3EC @ =0x08BA341C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3E8: .4byte 0x0201774C
_0805E3EC: .4byte 0x08BA341C

	thumb_func_start efxSleepSE_PlaySE
efxSleepSE_PlaySE: @ 0x0805E3F0
	push {r4, lr}
	movs r3, #0x8e
	lsls r3, r3, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r0, #0x5c]
	movs r4, #2
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	movs r3, #1
	bl PlaySFX
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805E410
sub_0805E410: @ 0x0805E410
	ldr r1, _0805E41C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E41C: .4byte 0x0201774C

	thumb_func_start sub_0805E420
sub_0805E420: @ 0x0805E420
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805E458 @ =0x08BA3464
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E458: .4byte 0x08BA3464

	thumb_func_start sub_0805E45C
sub_0805E45C: @ 0x0805E45C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E492
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805E492:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _0805E50C
	adds r0, r6, #0
	bl sub_0805E57C
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _0805E508 @ =0x00000103
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl PlaySFX
	b _0805E570
	.align 2, 0
_0805E508: .4byte 0x00000103
_0805E50C:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne _0805E51C
	adds r0, r6, #0
	bl sub_0805E634
	b _0805E570
_0805E51C:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _0805E532
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b _0805E570
_0805E532:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne _0805E550
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl StartBattleAnimStatusChgHitEffects
	b _0805E570
_0805E550:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _0805E570
	movs r0, #2
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805E570:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805E57C
sub_0805E57C: @ 0x0805E57C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E5B8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E5BC @ =0x08BA347C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E5C0 @ =0x081E914A
	str r1, [r0, #0x48]
	ldr r1, _0805E5C4 @ =0x08BA3494
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805E5C8 @ =0x08BA34C8
	str r1, [r0, #0x54]
	ldr r0, _0805E5CC @ =0x08272DBC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E5B8: .4byte 0x0201774C
_0805E5BC: .4byte 0x08BA347C
_0805E5C0: .4byte 0x081E914A
_0805E5C4: .4byte 0x08BA3494
_0805E5C8: .4byte 0x08BA34C8
_0805E5CC: .4byte 0x08272DBC

	thumb_func_start sub_0805E5D0
sub_0805E5D0: @ 0x0805E5D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805E60C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0805E62A
_0805E60C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805E62A
	bl SpellFx_ClearBG1
	ldr r1, _0805E630 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805E62A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E630: .4byte 0x0201774C

	thumb_func_start sub_0805E634
sub_0805E634: @ 0x0805E634
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E678 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E67C @ =0x08BA34FC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E680 @ =0x08BC6FF4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805E684 @ =0x082761B8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E688 @ =0x08275FB0
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E678: .4byte 0x0201774C
_0805E67C: .4byte 0x08BA34FC
_0805E680: .4byte 0x08BC6FF4
_0805E684: .4byte 0x082761B8
_0805E688: .4byte 0x08275FB0

	thumb_func_start sub_0805E68C
sub_0805E68C: @ 0x0805E68C
	ldr r1, _0805E698 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E698: .4byte 0x0201774C

	thumb_func_start sub_0805E69C
sub_0805E69C: @ 0x0805E69C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805E6D4 @ =0x08BA351C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E6D4: .4byte 0x08BA351C

	thumb_func_start sub_0805E6D8
sub_0805E6D8: @ 0x0805E6D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E706
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805E706:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805E754
	adds r0, r5, #0
	bl sub_0805E9DC
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_0805E7B8
	adds r0, r5, #0
	movs r1, #0x4a
	bl StartSubSpell_efxBerserkCLONE
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl NewEfxRestWINH_
	movs r1, #2
	ldrsh r2, [r5, r1]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl PlaySFX
	b _0805E7AE
_0805E754:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne _0805E790
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805E7AE
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _0805E7AE
	adds r0, r5, #0
	movs r1, #4
	bl SetUnitEfxDebuff
	b _0805E7AE
_0805E790:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _0805E7AE
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805E7AE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805E7B8
sub_0805E7B8: @ 0x0805E7B8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805E8B0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E8B4 @ =0x08BA3534
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _0805E8B8 @ =0x082761D8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805E8BC @ =0x082739E4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805E8C0 @ =0x08273AE4
	ldr r1, _0805E8C4 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805E8C8 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r4, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
	mov r6, ip
	adds r6, #0x37
	movs r3, #0x20
	ldrb r1, [r6]
	orrs r1, r3
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r7, ip
	strb r0, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6]
	ldr r0, _0805E8CC @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0805E8D0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, ip
	adds r0, #0x3d
	ldrb r7, [r0]
	orrs r3, r7
	strb r3, [r0]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _0805E8D4 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E8B0: .4byte 0x0201774C
_0805E8B4: .4byte 0x08BA3534
_0805E8B8: .4byte 0x082761D8
_0805E8BC: .4byte 0x082739E4
_0805E8C0: .4byte 0x08273AE4
_0805E8C4: .4byte 0x02023460
_0805E8C8: .4byte 0x03002870
_0805E8CC: .4byte 0x0000FFE0
_0805E8D0: .4byte 0x0000E0FF
_0805E8D4: .4byte 0x0000F3FF

	thumb_func_start sub_0805E8D8
sub_0805E8D8: @ 0x0805E8D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _0805E92C @ =0x03002870
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805E924
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r0, [r5, #0x1c]
	ldr r1, _0805E930 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _0805E934 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	ldr r1, _0805E938 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805E924:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E92C: .4byte 0x03002870
_0805E930: .4byte 0xFFFFF7FF
_0805E934: .4byte 0x0000F3FF
_0805E938: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxBerserkCLONE
StartSubSpell_efxBerserkCLONE: @ 0x0805E93C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805E960 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E964 @ =0x08BA354C
	movs r1, #4
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E960: .4byte 0x0201774C
_0805E964: .4byte 0x08BA354C

	thumb_func_start sub_0805E968
sub_0805E968: @ 0x0805E968
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _0805E9C4 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _0805E9C8 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805E9BA
	adds r0, r4, #0
	bl Proc_Break
_0805E9BA:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E9C4: .4byte 0xFFFFF7FF
_0805E9C8: .4byte 0x0000F3FF

	thumb_func_start sub_0805E9CC
sub_0805E9CC: @ 0x0805E9CC
	ldr r1, _0805E9D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805E9D8: .4byte 0x0201774C

	thumb_func_start sub_0805E9DC
sub_0805E9DC: @ 0x0805E9DC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805EA24 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EA28 @ =0x08BA356C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _0805EA2C @ =0x08BA14DC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, _0805EA30 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EA24: .4byte 0x0201774C
_0805EA28: .4byte 0x08BA356C
_0805EA2C: .4byte 0x08BA14DC
_0805EA30: .4byte 0x0000F3FF

	thumb_func_start sub_0805EA34
sub_0805EA34: @ 0x0805EA34
	push {lr}
	ldr r2, _0805EA48 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805EA48: .4byte 0x0201774C

	thumb_func_start sub_0805EA4C
sub_0805EA4C: @ 0x0805EA4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EA7C @ =0x08BCC794
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EA80 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EA84 @ =0x082761F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EA7C: .4byte 0x08BCC794
_0805EA80: .4byte 0x08276AB0
_0805EA84: .4byte 0x082761F8

	thumb_func_start sub_0805EA88
sub_0805EA88: @ 0x0805EA88
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EAB8 @ =0x08BCC7A8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EABC @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EAC0 @ =0x082761F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EAB8: .4byte 0x08BCC7A8
_0805EABC: .4byte 0x08276AB0
_0805EAC0: .4byte 0x082761F8

	thumb_func_start sub_0805EAC4
sub_0805EAC4: @ 0x0805EAC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EAF4 @ =0x08BCC7BC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EAF8 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EAFC @ =0x082761F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EAF4: .4byte 0x08BCC7BC
_0805EAF8: .4byte 0x08276AB0
_0805EAFC: .4byte 0x082761F8

	thumb_func_start sub_0805EB00
sub_0805EB00: @ 0x0805EB00
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EB30 @ =0x08BCC7D0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EB34 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EB38 @ =0x082761F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB30: .4byte 0x08BCC7D0
_0805EB34: .4byte 0x08276AB0
_0805EB38: .4byte 0x082761F8

	thumb_func_start sub_0805EB3C
sub_0805EB3C: @ 0x0805EB3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EB6C @ =0x08BCC7E4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EB70 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EB74 @ =0x082761F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB6C: .4byte 0x08BCC7E4
_0805EB70: .4byte 0x08276AB0
_0805EB74: .4byte 0x082761F8

	thumb_func_start sub_0805EB78
sub_0805EB78: @ 0x0805EB78
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EBA8 @ =0x08BCCB58
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EBAC @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EBB0 @ =0x08276690
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EBA8: .4byte 0x08BCCB58
_0805EBAC: .4byte 0x08276AB0
_0805EBB0: .4byte 0x08276690

	thumb_func_start sub_0805EBB4
sub_0805EBB4: @ 0x0805EBB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EBE4 @ =0x08BCCB64
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EBE8 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EBEC @ =0x08276690
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EBE4: .4byte 0x08BCCB64
_0805EBE8: .4byte 0x08276AB0
_0805EBEC: .4byte 0x08276690

	thumb_func_start sub_0805EBF0
sub_0805EBF0: @ 0x0805EBF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EC20 @ =0x08BCCB70
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EC24 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EC28 @ =0x08276690
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EC20: .4byte 0x08BCCB70
_0805EC24: .4byte 0x08276AB0
_0805EC28: .4byte 0x08276690

	thumb_func_start sub_0805EC2C
sub_0805EC2C: @ 0x0805EC2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EC5C @ =0x08BCCB7C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EC60 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EC64 @ =0x08276690
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EC5C: .4byte 0x08BCCB7C
_0805EC60: .4byte 0x08276AB0
_0805EC64: .4byte 0x08276690

	thumb_func_start sub_0805EC68
sub_0805EC68: @ 0x0805EC68
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EC98 @ =0x08BCCB88
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EC9C @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805ECA0 @ =0x08276690
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EC98: .4byte 0x08BCCB88
_0805EC9C: .4byte 0x08276AB0
_0805ECA0: .4byte 0x08276690

	thumb_func_start sub_0805ECA4
sub_0805ECA4: @ 0x0805ECA4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805ECDC @ =0x08BA3624
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805ECDC: .4byte 0x08BA3624

	thumb_func_start sub_0805ECE0
sub_0805ECE0: @ 0x0805ECE0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805ED0C
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805ED0C:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805ED3C
	ldr r0, [r5, #0x5c]
	bl sub_0805EDAC
	adds r0, r4, #0
	bl sub_0805EE60
	adds r0, r4, #0
	bl StartSubSpell_efxMshieldBGOBJ2
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl PlaySFX
	b _0805EDA6
_0805ED3C:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq _0805ED4C
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne _0805ED54
_0805ED4C:
	adds r0, r4, #0
	bl StartSubSpell_efxMshieldBGOBJ2
	b _0805EDA6
_0805ED54:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _0805ED6A
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b _0805EDA6
_0805ED6A:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _0805ED88
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartBattleAnimStatusChgHitEffects
	b _0805EDA6
_0805ED88:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne _0805EDA6
	movs r0, #2
	ldrh r3, [r4, #0x10]
	orrs r0, r3
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl Proc_Break
_0805EDA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805EDAC
sub_0805EDAC: @ 0x0805EDAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805EDF0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EDF4 @ =0x08BA363C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805EDF8 @ =0x081E9180
	str r1, [r0, #0x48]
	ldr r1, _0805EDFC @ =0x08BA3654
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805EE00 @ =0x0827747C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805EE04 @ =0x08276BF0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EDF0: .4byte 0x0201774C
_0805EDF4: .4byte 0x08BA363C
_0805EDF8: .4byte 0x081E9180
_0805EDFC: .4byte 0x08BA3654
_0805EE00: .4byte 0x0827747C
_0805EE04: .4byte 0x08276BF0

	thumb_func_start sub_0805EE08
sub_0805EE08: @ 0x0805EE08
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805EE36
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805EE54
_0805EE36:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805EE54
	bl SpellFx_ClearBG1
	ldr r1, _0805EE5C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805EE54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE5C: .4byte 0x0201774C

	thumb_func_start sub_0805EE60
sub_0805EE60: @ 0x0805EE60
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805EEA4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EEA8 @ =0x08BA3668
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805EEAC @ =0x08BD0C48
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805EEB0 @ =0x0827798C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EEB4 @ =0x08275FB0
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EEA4: .4byte 0x0201774C
_0805EEA8: .4byte 0x08BA3668
_0805EEAC: .4byte 0x08BD0C48
_0805EEB0: .4byte 0x0827798C
_0805EEB4: .4byte 0x08275FB0

	thumb_func_start StartSubSpell_efxMshieldBGOBJ2
StartSubSpell_efxMshieldBGOBJ2: @ 0x0805EEB8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805EEEC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EEF0 @ =0x08BA3688
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805EEF4 @ =0x08BD0D98
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EEEC: .4byte 0x0201774C
_0805EEF0: .4byte 0x08BA3688
_0805EEF4: .4byte 0x08BD0D98

	thumb_func_start sub_0805EEF8
sub_0805EEF8: @ 0x0805EEF8
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0805EF0C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805EF0C: .4byte 0x0201774C

	thumb_func_start sub_0805EF10
sub_0805EF10: @ 0x0805EF10
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805EF48 @ =0x08BA36A8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EF48: .4byte 0x08BA36A8

	thumb_func_start sub_0805EF4C
sub_0805EF4C: @ 0x0805EF4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805EF76
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805EF76:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805EF8A
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _0805F018
_0805EF8A:
	adds r0, r6, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0805EFAC
	adds r0, r5, #0
	bl StartSubSpell_efxShineBG2
	movs r0, #0xaf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805F018
_0805EFAC:
	adds r0, r6, #0
	adds r0, #0x17
	cmp r1, r0
	bne _0805EFC4
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl StartSubSpell_efxShineOBJRND
	b _0805F018
_0805EFC4:
	adds r0, r6, #0
	adds r0, #0x1d
	cmp r1, r0
	bne _0805EFDA
	adds r0, r5, #0
	bl StartSubSpell_efxShineBG
	adds r0, r5, #0
	bl sub_0805F1FC
	b _0805F018
_0805EFDA:
	adds r0, r6, #0
	adds r0, #0x1e
	cmp r1, r0
	bne _0805F002
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805F018
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805F018
_0805F002:
	adds r0, r6, #0
	adds r0, #0x23
	cmp r1, r0
	bne _0805F018
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805F018:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSubSpell_efxShineBG
StartSubSpell_efxShineBG: @ 0x0805F020
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F060 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F064 @ =0x08BA36C0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805F068 @ =0x081E924A
	str r1, [r0, #0x48]
	ldr r1, _0805F06C @ =0x08BA36D8
	str r1, [r0, #0x4c]
	ldr r1, _0805F070 @ =0x08BA36DC
	str r1, [r0, #0x50]
	ldr r1, _0805F074 @ =0x08BA36E0
	str r1, [r0, #0x54]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F060: .4byte 0x0201774C
_0805F064: .4byte 0x08BA36C0
_0805F068: .4byte 0x081E924A
_0805F06C: .4byte 0x08BA36D8
_0805F070: .4byte 0x08BA36DC
_0805F074: .4byte 0x08BA36E0

	thumb_func_start sub_0805F078
sub_0805F078: @ 0x0805F078
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805F0B4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _0805F0D2
_0805F0B4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805F0D2
	bl SpellFx_ClearBG1
	ldr r1, _0805F0D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0805F0D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F0D8: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxShineBG2
StartSubSpell_efxShineBG2: @ 0x0805F0DC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F138 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F13C @ =0x08BA36E4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805F140 @ =0x081E9250
	str r0, [r5, #0x48]
	ldr r0, _0805F144 @ =0x08BA36FC
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805F148 @ =0x08290954
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805F14C @ =0x08290678
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805F150 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F15E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F154
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805F15E
	.align 2, 0
_0805F138: .4byte 0x0201774C
_0805F13C: .4byte 0x08BA36E4
_0805F140: .4byte 0x081E9250
_0805F144: .4byte 0x08BA36FC
_0805F148: .4byte 0x08290954
_0805F14C: .4byte 0x08290678
_0805F150: .4byte 0x0203E02C
_0805F154:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805F15E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start efxShineBG2_Loop
efxShineBG2_Loop: @ 0x0805F168
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805F1D0
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0805F1B0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F1EE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805F1B8
	ldr r0, _0805F1B4 @ =0x02023460
	b _0805F1BC
	.align 2, 0
_0805F1B0: .4byte 0x0203E02C
_0805F1B4: .4byte 0x02023460
_0805F1B8:
	ldr r0, _0805F1CC @ =0x0202349A
	movs r1, #0
_0805F1BC:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805F1EE
	.align 2, 0
_0805F1CC: .4byte 0x0202349A
_0805F1D0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805F1EE
	bl SpellFx_ClearBG1
	ldr r1, _0805F1F8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805F1EE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1F8: .4byte 0x0201774C

	thumb_func_start sub_0805F1FC
sub_0805F1FC: @ 0x0805F1FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F230 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F234 @ =0x08BA3720
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0805F238 @ =0x081E9276
	str r1, [r0, #0x48]
	ldr r1, _0805F23C @ =0x0828FD00
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F230: .4byte 0x0201774C
_0805F234: .4byte 0x08BA3720
_0805F238: .4byte 0x081E9276
_0805F23C: .4byte 0x0828FD00

	thumb_func_start sub_0805F240
sub_0805F240: @ 0x0805F240
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805F266
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805F27C
_0805F266:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805F27C
	ldr r1, _0805F284 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805F27C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F284: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxShineOBJRND
StartSubSpell_efxShineOBJRND: @ 0x0805F288
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F2C0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F2C4 @ =0x08BA3740
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #2
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	ldr r0, _0805F2C8 @ =0x0829162C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F2CC @ =0x08291368
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2C0: .4byte 0x0201774C
_0805F2C4: .4byte 0x08BA3740
_0805F2C8: .4byte 0x0829162C
_0805F2CC: .4byte 0x08291368

	thumb_func_start sub_0805F2D0
sub_0805F2D0: @ 0x0805F2D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805F36C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F320
	ldr r0, [r5, #0x5c]
	movs r4, #2
	ldrsh r3, [r0, r4]
	ldr r4, _0805F31C @ =0x08BA3758
	movs r6, #0x30
	ldrsh r2, [r5, r6]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	adds r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl StartSubSpell_efxShineOBJ
	b _0805F34C
	.align 2, 0
_0805F31C: .4byte 0x08BA3758
_0805F320:
	ldr r0, [r5, #0x5c]
	movs r6, #2
	ldrsh r3, [r0, r6]
	ldr r4, _0805F374 @ =0x08BA3758
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	subs r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl StartSubSpell_efxShineOBJ
_0805F34C:
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x30]
	adds r0, #2
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0805F36C
	ldr r1, _0805F378 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805F36C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F374: .4byte 0x08BA3758
_0805F378: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxShineOBJ
StartSubSpell_efxShineOBJ: @ 0x0805F37C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805F3C8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F3CC @ =0x08BA3768
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x46
	strh r0, [r4, #0x2e]
	ldr r3, _0805F3D0 @ =0x08BD27AC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F3C8: .4byte 0x0201774C
_0805F3CC: .4byte 0x08BA3768
_0805F3D0: .4byte 0x08BD27AC

	thumb_func_start sub_0805F3D4
sub_0805F3D4: @ 0x0805F3D4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	bne _0805F3F6
	ldr r1, _0805F3FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0805F3F6:
	pop {r0}
	bx r0
	.align 2, 0
_0805F3FC: .4byte 0x0201774C

	thumb_func_start sub_0805F400
sub_0805F400: @ 0x0805F400
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805F438 @ =0x08BA3780
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F438: .4byte 0x08BA3780

	thumb_func_start sub_0805F43C
sub_0805F43C: @ 0x0805F43C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805F470
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
_0805F470:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805F50C
	adds r0, r5, #0
	bl sub_0805F638
	ldr r6, _0805F504 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r1, r6, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r7, [r1]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0xf
	adds r3, r4, #0
	bl NewefxRestRST
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x14
	bl sub_0805FD44
	movs r1, #0x20
	ldrsh r2, [r6, r1]
	adds r0, r5, #0
	movs r1, #0x14
	movs r3, #0
	bl NewEfxRestWINH
	ldr r0, _0805F508 @ =0x000002BD
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #1
	bl PlaySFX
	b _0805F62A
	.align 2, 0
_0805F504: .4byte 0x03002870
_0805F508: .4byte 0x000002BD
_0805F50C:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _0805F53C
	bl sub_0805F6EC
	adds r0, r5, #0
	movs r1, #0x15
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r5, #0
	bl StartSubSpell_efxLunaOBJ
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0x10
	bl NewEfxALPHA
	b _0805F62A
_0805F53C:
	adds r0, r4, #0
	adds r0, #0x37
	cmp r1, r0
	bne _0805F55C
	ldr r0, _0805F558 @ =0x000002BE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #0
	bl PlaySFX
	b _0805F62A
	.align 2, 0
_0805F558: .4byte 0x000002BE
_0805F55C:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805F5C8
	adds r0, r5, #0
	movs r1, #0x41
	bl sub_0805F82C
	adds r0, r5, #0
	movs r1, #0x41
	bl sub_0805F968
	ldr r3, _0805F5C4 @ =0x03002870
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
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #2
	movs r3, #0x80
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x44
	movs r2, #0
	bl NewEfxRestWINH_
	b _0805F62A
	.align 2, 0
_0805F5C4: .4byte 0x03002870
_0805F5C8:
	adds r0, r4, #0
	adds r0, #0x87
	cmp r1, r0
	bne _0805F5FA
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805F62A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805F62A
_0805F5FA:
	adds r0, r4, #0
	adds r0, #0x8c
	cmp r1, r0
	bne _0805F614
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r6, #0x5c]
	bl StartSubSpell_efxLunaBG3
	b _0805F62A
_0805F614:
	adds r0, r4, #0
	adds r0, #0xbe
	cmp r1, r0
	bne _0805F62A
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0805F62A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805F638
sub_0805F638: @ 0x0805F638
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F67C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F680 @ =0x08BA3798
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805F684 @ =0x081E9290
	str r1, [r0, #0x48]
	ldr r1, _0805F688 @ =0x08BA37B0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805F68C @ =0x0829211C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805F690 @ =0x0829164C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F67C: .4byte 0x0201774C
_0805F680: .4byte 0x08BA3798
_0805F684: .4byte 0x081E9290
_0805F688: .4byte 0x08BA37B0
_0805F68C: .4byte 0x0829211C
_0805F690: .4byte 0x0829164C

	thumb_func_start sub_0805F694
sub_0805F694: @ 0x0805F694
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805F6C2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805F6E0
_0805F6C2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805F6E0
	bl SpellFx_ClearBG1
	ldr r1, _0805F6E8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805F6E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F6E8: .4byte 0x0201774C

	thumb_func_start sub_0805F6EC
sub_0805F6EC: @ 0x0805F6EC
	push {lr}
	ldr r0, _0805F708 @ =0x08BA37B4
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl StartSubSpell_efxLunaSCR2
	pop {r0}
	bx r0
	.align 2, 0
_0805F708: .4byte 0x08BA37B4

	thumb_func_start efxLunaSCR_Loop
efxLunaSCR_Loop: @ 0x0805F70C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r0, _0805F770 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r5, _0805F774 @ =0x0201FB2C
	cmp r0, #0
	bne _0805F722
	ldr r5, _0805F778 @ =0x0201FC6C
_0805F722:
	ldr r3, _0805F77C @ =0x0201FDB8
	cmp r0, #0
	bne _0805F72A
	ldr r3, _0805F780 @ =0x0201FEF8
_0805F72A:
	movs r4, #0
	movs r6, #0
	ldr r0, _0805F784 @ =0x08BA37E4
	movs r1, #0xe0
	lsls r1, r1, #0xf
	mov r8, r1
	movs r2, #0x70
	mov ip, r2
	adds r7, r0, #0
	subs r7, #0x20
_0805F73E:
	cmp r4, #0xf
	bls _0805F79C
	cmp r4, #0x6f
	bhi _0805F79C
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, sb
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0805F794
	cmp r4, #0x3f
	bhi _0805F78C
	adds r0, r4, #0
	subs r0, #0x70
	cmp r1, r0
	bhs _0805F794
	ldr r1, _0805F788 @ =0x0000FF90
	adds r0, r4, r1
	lsls r0, r0, #0x10
	b _0805F792
	.align 2, 0
_0805F770: .4byte 0x0201FDAC
_0805F774: .4byte 0x0201FB2C
_0805F778: .4byte 0x0201FC6C
_0805F77C: .4byte 0x0201FDB8
_0805F780: .4byte 0x0201FEF8
_0805F784: .4byte 0x08BA37E4
_0805F788: .4byte 0x0000FF90
_0805F78C:
	cmp r1, ip
	bls _0805F794
	mov r0, r8
_0805F792:
	lsrs r2, r0, #0x10
_0805F794:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r3]
	b _0805F7A2
_0805F79C:
	strh r6, [r5]
	adds r5, #2
	strh r6, [r3]
_0805F7A2:
	adds r3, #2
	ldr r1, _0805F7C4 @ =0xFFFF0000
	add r8, r1
	movs r2, #1
	rsbs r2, r2, #0
	add ip, r2
	adds r7, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _0805F73E
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7C4: .4byte 0xFFFF0000

	thumb_func_start StartSubSpell_efxLunaSCR2
StartSubSpell_efxLunaSCR2: @ 0x0805F7C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805F7E4 @ =0x08BA37CC
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7E4: .4byte 0x08BA37CC

	thumb_func_start sub_0805F7E8
sub_0805F7E8: @ 0x0805F7E8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805F824
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0805F824:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805F82C
sub_0805F82C: @ 0x0805F82C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805F890 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F894 @ =0x08BA38A4
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	ldr r0, _0805F898 @ =0x0829226C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805F89C @ =0x082929CC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _0805F8A0 @ =0x08292BAC
	ldr r4, _0805F8A4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F8AC
	ldr r1, _0805F8A8 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	b _0805F8C0
	.align 2, 0
_0805F890: .4byte 0x0201774C
_0805F894: .4byte 0x08BA38A4
_0805F898: .4byte 0x0829226C
_0805F89C: .4byte 0x082929CC
_0805F8A0: .4byte 0x08292BAC
_0805F8A4: .4byte 0x02019784
_0805F8A8: .4byte 0x02023460
_0805F8AC:
	ldr r1, _0805F8EC @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBG
_0805F8C0:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805F8F0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F8FE
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F8F4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805F8FE
	.align 2, 0
_0805F8EC: .4byte 0x02023460
_0805F8F0: .4byte 0x0203E02C
_0805F8F4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805F8FE:
	ldr r2, _0805F91C @ =0x03002870
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
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F91C: .4byte 0x03002870

	thumb_func_start sub_0805F920
sub_0805F920: @ 0x0805F920
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _0805F938 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0805F938: .4byte 0x0201774C

	thumb_func_start sub_0805F93C
sub_0805F93C: @ 0x0805F93C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0805F964 @ =0x03002870
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0805F95E
	adds r0, r2, #0
	bl Proc_Break
_0805F95E:
	pop {r0}
	bx r0
	.align 2, 0
_0805F964: .4byte 0x03002870

	thumb_func_start sub_0805F968
sub_0805F968: @ 0x0805F968
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805F9A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F9A4 @ =0x08BA38C4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805F9A8 @ =0x081E9296
	str r1, [r0, #0x48]
	ldr r1, _0805F9AC @ =0x082929CC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9A0: .4byte 0x0201774C
_0805F9A4: .4byte 0x08BA38C4
_0805F9A8: .4byte 0x081E9296
_0805F9AC: .4byte 0x082929CC

	thumb_func_start sub_0805F9B0
sub_0805F9B0: @ 0x0805F9B0
	ldr r1, _0805F9BC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805F9BC: .4byte 0x0201774C

	thumb_func_start sub_0805F9C0
sub_0805F9C0: @ 0x0805F9C0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805F9E4
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_0805F9E4:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805F9FA
	adds r0, r4, #0
	bl Proc_Break
_0805F9FA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartSubSpell_efxLunaBG3
StartSubSpell_efxLunaBG3: @ 0x0805FA00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805FA58 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FA5C @ =0x08BA38EC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805FA60 @ =0x081E92D4
	str r0, [r5, #0x48]
	ldr r0, _0805FA64 @ =0x08BA3904
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805FA68 @ =0x08BA3934
	str r0, [r5, #0x54]
	ldr r0, _0805FA6C @ =0x08295850
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805FA70 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805FA7E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805FA74
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805FA7E
	.align 2, 0
_0805FA58: .4byte 0x0201774C
_0805FA5C: .4byte 0x08BA38EC
_0805FA60: .4byte 0x081E92D4
_0805FA64: .4byte 0x08BA3904
_0805FA68: .4byte 0x08BA3934
_0805FA6C: .4byte 0x08295850
_0805FA70: .4byte 0x0203E02C
_0805FA74:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805FA7E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805FA84
sub_0805FA84: @ 0x0805FA84
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805FAC0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0805FADE
_0805FAC0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805FADE
	bl SpellFx_ClearBG1
	ldr r1, _0805FAE4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805FADE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAE4: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxLunaOBJ
StartSubSpell_efxLunaOBJ: @ 0x0805FAE8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0805FAEE:
	ldr r0, _0805FB18 @ =0x08BA3964
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls _0805FAEE
	ldr r0, _0805FB1C @ =0x082967F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805FB20 @ =0x082963F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB18: .4byte 0x08BA3964
_0805FB1C: .4byte 0x082967F4
_0805FB20: .4byte 0x082963F4

	thumb_func_start sub_0805FB24
sub_0805FB24: @ 0x0805FB24
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805FB84 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r5, #0
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	ldr r1, [r4, #0x44]
	ldr r0, _0805FB88 @ =0x00002AAA
	muls r0, r1, r0
	strh r0, [r4, #0x30]
	ldr r3, _0805FB8C @ =0x08BD29CC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r5, [r0, #6]
	ldr r1, _0805FB90 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB84: .4byte 0x0201774C
_0805FB88: .4byte 0x00002AAA
_0805FB8C: .4byte 0x08BD29CC
_0805FB90: .4byte 0x0000F3FF

	thumb_func_start sub_0805FB94
sub_0805FB94: @ 0x0805FB94
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r7, #0x14
	str r7, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x32
	bl Interpolate
	ldrh r2, [r4, #0x30]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r6, #0
	strh r1, [r4, #0x30]
	lsrs r2, r1, #8
	ldr r3, _0805FC24 @ =0x080C5A48
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r4, #0x3a]
	adds r0, r3, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0805FBFC
	strh r7, [r4, #0x2c]
_0805FBFC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0805FC1C
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _0805FC28 @ =0x08BD2C2C
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_0805FC1C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FC24: .4byte 0x080C5A48
_0805FC28: .4byte 0x08BD2C2C

	thumb_func_start sub_0805FC2C
sub_0805FC2C: @ 0x0805FC2C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r3, #0x32
	ldrh r1, [r4, #0x30]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r6, #0
	strh r0, [r4, #0x30]
	lsrs r0, r0, #8
	ldr r2, _0805FCA4 @ =0x080C5A48
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r1, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r3, r0
	asrs r1, r1, #0xc
	ldrh r2, [r4, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0xc
	ldrh r2, [r4, #0x3a]
	adds r0, r2, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0805FC7C
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
_0805FC7C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0805FC9C
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _0805FCA8 @ =0x08BD2A04
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_0805FC9C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FCA4: .4byte 0x080C5A48
_0805FCA8: .4byte 0x08BD2A04

	thumb_func_start sub_0805FCAC
sub_0805FCAC: @ 0x0805FCAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0xa
	str r6, [sp]
	movs r0, #1
	movs r1, #0x32
	movs r2, #0
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r2, r3
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, _0805FD3C @ =0x080C5A48
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0805FD12
	strh r6, [r5, #0x2c]
_0805FD12:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0805FD34
	ldr r0, _0805FD40 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r5, #0x60]
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
_0805FD34:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FD3C: .4byte 0x080C5A48
_0805FD40: .4byte 0x0201774C

	thumb_func_start sub_0805FD44
sub_0805FD44: @ 0x0805FD44
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _0805FD6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FD70 @ =0x08BA3994
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FD6C: .4byte 0x0201774C
_0805FD70: .4byte 0x08BA3994

	thumb_func_start sub_0805FD74
sub_0805FD74: @ 0x0805FD74
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805FDB0
	ldr r1, _0805FDB8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805FDB0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FDB8: .4byte 0x0201774C

	thumb_func_start sub_0805FDBC
sub_0805FDBC: @ 0x0805FDBC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805FDF4 @ =0x08BA39AC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FDF4: .4byte 0x08BA39AC

	thumb_func_start sub_0805FDF8
sub_0805FDF8: @ 0x0805FDF8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805FE22
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805FE22:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805FE3E
	movs r0, #0xf
	bl StartSubSpell_efxExcaliburSCR
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #1
	bl NewEfxRestWINH_
	b _0805FE84
_0805FE3E:
	adds r0, r6, #2
	cmp r1, r0
	bne _0805FE68
	adds r0, r4, #0
	bl sub_0805FF48
	adds r0, r4, #0
	bl sub_080600D0
	ldr r0, _0805FE64 @ =0x000002BF
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl PlaySFX
	b _0805FE84
	.align 2, 0
_0805FE64: .4byte 0x000002BF
_0805FE68:
	adds r0, r6, #0
	adds r0, #0x2e
	cmp r1, r0
	bne _0805FE84
	movs r0, #0xb0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0805FE84:
	adds r7, r5, #0
	adds r7, #0x29
	ldrb r0, [r7]
	cmp r0, #0
	bne _0805FF0A
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x33
	cmp r1, r0
	bne _0805FEAC
	adds r0, r4, #0
	bl StartSubSpell_efxExcaliburOBJ
	adds r0, r4, #0
	bl sub_08060298
	adds r0, r4, #0
	bl sub_080603B8
_0805FEAC:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x54
	cmp r1, r0
	bne _0805FED6
	adds r0, r4, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r4, #0
	bl EfxPlayHittedSFX
_0805FED6:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _0805FEEE
	adds r0, r4, #0
	bl sub_08060444
	adds r0, r4, #0
	bl sub_08060564
_0805FEEE:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x69
	cmp r1, r0
	bne _0805FF40
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl Proc_Break
	b _0805FF40
_0805FF0A:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	bne _0805FF26
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
_0805FF26:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x33
	cmp r1, r0
	bne _0805FF40
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl Proc_Break
_0805FF40:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805FF48
sub_0805FF48: @ 0x0805FF48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FF9C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FFA0 @ =0x08BA39C4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	ldr r0, _0805FFA4 @ =0x08296814
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _0805FFA8 @ =0x08296DA4
	ldr r1, _0805FFAC @ =0x02019784
	bl LZ77UnCompWram
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805FFB0 @ =0x03002870
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF9C: .4byte 0x0201774C
_0805FFA0: .4byte 0x08BA39C4
_0805FFA4: .4byte 0x08296814
_0805FFA8: .4byte 0x08296DA4
_0805FFAC: .4byte 0x02019784
_0805FFB0: .4byte 0x03002870

	thumb_func_start sub_0805FFB4
sub_0805FFB4: @ 0x0805FFB4
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _0805FFCC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0805FFCC: .4byte 0x0201774C

	thumb_func_start sub_0805FFD0
sub_0805FFD0: @ 0x0805FFD0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060000
	ldr r0, _0805FFF8 @ =0x02019784
	ldr r1, _0805FFFC @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	b _08060014
	.align 2, 0
_0805FFF8: .4byte 0x02019784
_0805FFFC: .4byte 0x02023460
_08060000:
	ldr r0, _08060044 @ =0x02019784
	ldr r1, _08060048 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
_08060014:
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r4, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08060056
	strh r2, [r4, #0x2c]
	movs r0, #6
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x32]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806004C
	movs r0, #0x80
	b _0806004E
	.align 2, 0
_08060044: .4byte 0x02019784
_08060048: .4byte 0x02023460
_0806004C:
	ldr r0, _08060060 @ =0x0000FF80
_0806004E:
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_08060056:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060060: .4byte 0x0000FF80

	thumb_func_start sub_08060064
sub_08060064: @ 0x08060064
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r1, _080600AC @ =0x03002870
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080600A4
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xc
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_080600A4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080600AC: .4byte 0x03002870

	thumb_func_start sub_080600B0
sub_080600B0: @ 0x080600B0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _080600CA
	adds r0, r2, #0
	bl Proc_Break
_080600CA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080600D0
sub_080600D0: @ 0x080600D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060104 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060108 @ =0x08BA39F4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0806010C @ =0x081E9306
	str r1, [r0, #0x48]
	ldr r1, _08060110 @ =0x08296C04
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060104: .4byte 0x0201774C
_08060108: .4byte 0x08BA39F4
_0806010C: .4byte 0x081E9306
_08060110: .4byte 0x08296C04

	thumb_func_start sub_08060114
sub_08060114: @ 0x08060114
	ldr r1, _08060120 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08060120: .4byte 0x0201774C

	thumb_func_start sub_08060124
sub_08060124: @ 0x08060124
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806014A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08060158
_0806014A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08060158
	adds r0, r4, #0
	bl Proc_Break
_08060158:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSubSpell_efxExcaliburSCR
StartSubSpell_efxExcaliburSCR: @ 0x08060160
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08060180 @ =0x08BA3A1C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	adds r1, r4, #0
	bl StartSubSpell_efxExcaliburSCR2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060180: .4byte 0x08BA3A1C

	thumb_func_start efxExcaliburSCR_Loop
efxExcaliburSCR_Loop: @ 0x08060184
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r0, _080601E0 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r5, _080601E4 @ =0x0201FB2C
	cmp r0, #0
	bne _0806019A
	ldr r5, _080601E8 @ =0x0201FC6C
_0806019A:
	ldr r4, _080601EC @ =0x0201FDB8
	cmp r0, #0
	bne _080601A2
	ldr r4, _080601F0 @ =0x0201FEF8
_080601A2:
	movs r3, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #0x10
	mov ip, r1
	movs r7, #0x80
	ldr r6, _080601F4 @ =0x08BA3A4C
_080601B2:
	cmp r3, #0x7f
	bhi _0806020C
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r2, sb
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08060204
	cmp r3, #0x3f
	bhi _080601FC
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bhs _08060204
	ldr r1, _080601F8 @ =0x0000FF80
	adds r0, r3, r1
	lsls r0, r0, #0x10
	b _08060202
	.align 2, 0
_080601E0: .4byte 0x0201FDAC
_080601E4: .4byte 0x0201FB2C
_080601E8: .4byte 0x0201FC6C
_080601EC: .4byte 0x0201FDB8
_080601F0: .4byte 0x0201FEF8
_080601F4: .4byte 0x08BA3A4C
_080601F8: .4byte 0x0000FF80
_080601FC:
	cmp r1, r7
	bls _08060204
	mov r0, ip
_08060202:
	lsrs r2, r0, #0x10
_08060204:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r4]
	b _08060214
_0806020C:
	mov r1, r8
	strh r1, [r5]
	adds r5, #2
	strh r1, [r4]
_08060214:
	adds r4, #2
	ldr r2, _08060230 @ =0xFFFF0000
	add ip, r2
	subs r7, #1
	adds r6, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _080601B2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060230: .4byte 0xFFFF0000

	thumb_func_start StartSubSpell_efxExcaliburSCR2
StartSubSpell_efxExcaliburSCR2: @ 0x08060234
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08060250 @ =0x08BA3A34
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060250: .4byte 0x08BA3A34

	thumb_func_start sub_08060254
sub_08060254: @ 0x08060254
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08060290
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08060290:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08060298
sub_08060298: @ 0x08060298
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080602DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080602E0 @ =0x08BA3B4C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _080602E4 @ =0x08296F50
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _080602E8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080602F4
	ldr r0, _080602EC @ =0x0829803C
	ldr r1, _080602F0 @ =0x02019784
	bl LZ77UnCompWram
	b _080602FC
	.align 2, 0
_080602DC: .4byte 0x0201774C
_080602E0: .4byte 0x08BA3B4C
_080602E4: .4byte 0x08296F50
_080602E8: .4byte 0x0203E02C
_080602EC: .4byte 0x0829803C
_080602F0: .4byte 0x02019784
_080602F4:
	ldr r0, _0806031C @ =0x08298470
	ldr r1, _08060320 @ =0x02019784
	bl LZ77UnCompWram
_080602FC:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060328
	ldr r0, _08060320 @ =0x02019784
	ldr r1, _08060324 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _0806033C
	.align 2, 0
_0806031C: .4byte 0x08298470
_08060320: .4byte 0x02019784
_08060324: .4byte 0x02023460
_08060328:
	ldr r0, _08060370 @ =0x02019784
	ldr r1, _08060374 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_0806033C:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060378 @ =0x03002870
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060370: .4byte 0x02019784
_08060374: .4byte 0x02023460
_08060378: .4byte 0x03002870

	thumb_func_start sub_0806037C
sub_0806037C: @ 0x0806037C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060394 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060394: .4byte 0x0201774C

	thumb_func_start sub_08060398
sub_08060398: @ 0x08060398
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _080603B2
	adds r0, r2, #0
	bl Proc_Break
_080603B2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080603B8
sub_080603B8: @ 0x080603B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080603EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080603F0 @ =0x08BA3B6C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080603F4 @ =0x081E933C
	str r1, [r0, #0x48]
	ldr r1, _080603F8 @ =0x08297FBC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080603EC: .4byte 0x0201774C
_080603F0: .4byte 0x08BA3B6C
_080603F4: .4byte 0x081E933C
_080603F8: .4byte 0x08297FBC

	thumb_func_start sub_080603FC
sub_080603FC: @ 0x080603FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08060422
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08060438
_08060422:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08060438
	ldr r1, _08060440 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08060438:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060440: .4byte 0x0201774C

	thumb_func_start sub_08060444
sub_08060444: @ 0x08060444
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08060488 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806048C @ =0x08BA3B8C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08060490 @ =0x0828EAD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08060494 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080604A0
	ldr r0, _08060498 @ =0x0828FDC0
	ldr r1, _0806049C @ =0x02019784
	bl LZ77UnCompWram
	b _080604A8
	.align 2, 0
_08060488: .4byte 0x0201774C
_0806048C: .4byte 0x08BA3B8C
_08060490: .4byte 0x0828EAD8
_08060494: .4byte 0x0203E02C
_08060498: .4byte 0x0828FDC0
_0806049C: .4byte 0x02019784
_080604A0:
	ldr r0, _080604C8 @ =0x0829021C
	ldr r1, _080604CC @ =0x02019784
	bl LZ77UnCompWram
_080604A8:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080604D4
	ldr r0, _080604CC @ =0x02019784
	ldr r1, _080604D0 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _080604E8
	.align 2, 0
_080604C8: .4byte 0x0829021C
_080604CC: .4byte 0x02019784
_080604D0: .4byte 0x02023460
_080604D4:
	ldr r0, _0806051C @ =0x02019784
	ldr r1, _08060520 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080604E8:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060524 @ =0x03002870
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806051C: .4byte 0x02019784
_08060520: .4byte 0x02023460
_08060524: .4byte 0x03002870

	thumb_func_start sub_08060528
sub_08060528: @ 0x08060528
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060540 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060540: .4byte 0x0201774C

	thumb_func_start sub_08060544
sub_08060544: @ 0x08060544
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0806055E
	adds r0, r2, #0
	bl Proc_Break
_0806055E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08060564
sub_08060564: @ 0x08060564
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060598 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806059C @ =0x08BA3BAC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080605A0 @ =0x081E934E
	str r1, [r0, #0x48]
	ldr r1, _080605A4 @ =0x0829885C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060598: .4byte 0x0201774C
_0806059C: .4byte 0x08BA3BAC
_080605A0: .4byte 0x081E934E
_080605A4: .4byte 0x0829885C

	thumb_func_start sub_080605A8
sub_080605A8: @ 0x080605A8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080605CE
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _080605E4
_080605CE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080605E4
	ldr r1, _080605EC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080605E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080605EC: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxExcaliburOBJ
StartSubSpell_efxExcaliburOBJ: @ 0x080605F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08060648 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806064C @ =0x08BA3BCC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08060650 @ =0x08BD3758
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #2]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldr r0, _08060654 @ =0x08298D38
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060658 @ =0x082988DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060648: .4byte 0x0201774C
_0806064C: .4byte 0x08BA3BCC
_08060650: .4byte 0x08BD3758
_08060654: .4byte 0x08298D38
_08060658: .4byte 0x082988DC

	thumb_func_start sub_0806065C
sub_0806065C: @ 0x0806065C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	bne _0806067E
	ldr r1, _08060684 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0806067E:
	pop {r0}
	bx r0
	.align 2, 0
_08060684: .4byte 0x0201774C

	thumb_func_start sub_08060688
sub_08060688: @ 0x08060688
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _080606C0 @ =0x08BA3BE4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080606C0: .4byte 0x08BA3BE4

	thumb_func_start sub_080606C4
sub_080606C4: @ 0x080606C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080606F8
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
_080606F8:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #1
	cmp r1, r0
	bne _08060768
	adds r0, r5, #0
	bl sub_080608AC
	adds r0, r5, #0
	bl sub_08060CFC
	ldr r3, _08060760 @ =0x03002870
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
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	mov r0, r8
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x32
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _08060764 @ =0x000002C7
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	b _08060868
	.align 2, 0
_08060760: .4byte 0x03002870
_08060764: .4byte 0x000002C7
_08060768:
	adds r0, r4, #0
	adds r0, #0x45
	cmp r1, r0
	bne _080607C0
	ldr r0, [r6, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x54
	bl sub_080609E4
	ldr r3, _080607BC @ =0x03002870
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
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #0xb2
	lsls r0, r0, #2
	b _08060862
	.align 2, 0
_080607BC: .4byte 0x03002870
_080607C0:
	adds r0, r4, #0
	adds r0, #0x58
	cmp r1, r0
	bne _080607D2
	adds r0, r5, #0
	movs r1, #0x32
	bl sub_08060C60
	b _0806089E
_080607D2:
	adds r0, r4, #0
	adds r0, #0x5d
	cmp r1, r0
	beq _080607E2
	adds r0, r4, #0
	adds r0, #0x6c
	cmp r1, r0
	bne _080607EC
_080607E2:
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	b _0806089E
_080607EC:
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	bne _0806081E
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806089E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0806089E
_0806081E:
	adds r0, r4, #0
	adds r0, #0x9f
	cmp r1, r0
	bne _08060840
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806089E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
	b _0806089E
_08060840:
	adds r0, r4, #0
	adds r0, #0xa3
	cmp r1, r0
	bne _08060874
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #9
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x1e
	bl sub_08060AEC
	adds r0, r5, #0
	bl StartSubSpell_efxGespenstBGCOL2
	ldr r0, _08060870 @ =0x000002C9
_08060862:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
_08060868:
	movs r3, #1
	bl PlaySFX
	b _0806089E
	.align 2, 0
_08060870: .4byte 0x000002C9
_08060874:
	adds r0, r4, #0
	adds r0, #0xb3
	cmp r1, r0
	bne _08060888
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #8
	bl StartSpellThing_MagicQuake
	b _0806089E
_08060888:
	adds r0, r4, #0
	adds r0, #0xcc
	cmp r1, r0
	bne _0806089E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0806089E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080608AC
sub_080608AC: @ 0x080608AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060910 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060914 @ =0x08BA3BFC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08060918 @ =0x081E9360
	str r0, [r5, #0x48]
	ldr r0, _0806091C @ =0x08BA3C14
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060920 @ =0x08298D58
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060924 @ =0x08299F70
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08060928 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060936
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806092C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08060936
	.align 2, 0
_08060910: .4byte 0x0201774C
_08060914: .4byte 0x08BA3BFC
_08060918: .4byte 0x081E9360
_0806091C: .4byte 0x08BA3C14
_08060920: .4byte 0x08298D58
_08060924: .4byte 0x08299F70
_08060928: .4byte 0x0203E02C
_0806092C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08060936:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08060940
sub_08060940: @ 0x08060940
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080609B8
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _08060994 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080609D6
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0806099C
	ldr r0, _08060998 @ =0x02023460
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _080609AC
	.align 2, 0
_08060994: .4byte 0x0203E02C
_08060998: .4byte 0x02023460
_0806099C:
	ldr r0, _080609B4 @ =0x0202349A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_080609AC:
	movs r0, #2
	bl EnableBgSync
	b _080609D6
	.align 2, 0
_080609B4: .4byte 0x0202349A
_080609B8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080609D6
	bl SpellFx_ClearBG1
	ldr r1, _080609E0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080609D6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080609E0: .4byte 0x0201774C

	thumb_func_start sub_080609E4
sub_080609E4: @ 0x080609E4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060A6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060A70 @ =0x08BA3C44
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08060A74 @ =0x0829C5B8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060A78 @ =0x0829CFA8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08060A7C @ =0x0829D028
	ldr r4, _08060A80 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08060A84 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060A88 @ =0x03002870
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060A6C: .4byte 0x0201774C
_08060A70: .4byte 0x08BA3C44
_08060A74: .4byte 0x0829C5B8
_08060A78: .4byte 0x0829CFA8
_08060A7C: .4byte 0x0829D028
_08060A80: .4byte 0x02019784
_08060A84: .4byte 0x02023460
_08060A88: .4byte 0x03002870

	thumb_func_start sub_08060A8C
sub_08060A8C: @ 0x08060A8C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060AA4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060AA4: .4byte 0x0201774C

	thumb_func_start sub_08060AA8
sub_08060AA8: @ 0x08060AA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060AC4
	ldr r1, _08060AC0 @ =0x03002870
	ldrh r0, [r1, #0x20]
	adds r0, #2
	b _08060ACA
	.align 2, 0
_08060AC0: .4byte 0x03002870
_08060AC4:
	ldr r1, _08060AE8 @ =0x03002870
	ldrh r0, [r1, #0x20]
	subs r0, #2
_08060ACA:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08060AE2
	adds r0, r4, #0
	bl Proc_Break
_08060AE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060AE8: .4byte 0x03002870

	thumb_func_start sub_08060AEC
sub_08060AEC: @ 0x08060AEC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060B74 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060B78 @ =0x08BA3C64
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08060B7C @ =0x0829B1BC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060B80 @ =0x0829C01C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08060B84 @ =0x0829C15C
	ldr r4, _08060B88 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08060B8C @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060B90 @ =0x03002870
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060B74: .4byte 0x0201774C
_08060B78: .4byte 0x08BA3C64
_08060B7C: .4byte 0x0829B1BC
_08060B80: .4byte 0x0829C01C
_08060B84: .4byte 0x0829C15C
_08060B88: .4byte 0x02019784
_08060B8C: .4byte 0x02023460
_08060B90: .4byte 0x03002870

	thumb_func_start sub_08060B94
sub_08060B94: @ 0x08060B94
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060BAC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060BAC: .4byte 0x0201774C

	thumb_func_start sub_08060BB0
sub_08060BB0: @ 0x08060BB0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08060BCA
	adds r0, r2, #0
	bl Proc_Break
_08060BCA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSubSpell_efxGespenstBGCOL2
StartSubSpell_efxGespenstBGCOL2: @ 0x08060BD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060C04 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060C08 @ =0x08BA3C84
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08060C0C @ =0x081E93B6
	str r1, [r0, #0x48]
	ldr r1, _08060C10 @ =0x0829C01C
	str r1, [r0, #0x4c]
	ldr r0, _08060C14 @ =0x0829B13C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060C04: .4byte 0x0201774C
_08060C08: .4byte 0x08BA3C84
_08060C0C: .4byte 0x081E93B6
_08060C10: .4byte 0x0829C01C
_08060C14: .4byte 0x0829B13C

	thumb_func_start sub_08060C18
sub_08060C18: @ 0x08060C18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08060C3E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08060C54
_08060C3E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08060C54
	ldr r1, _08060C5C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08060C54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060C5C: .4byte 0x0201774C

	thumb_func_start sub_08060C60
sub_08060C60: @ 0x08060C60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08060CB4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060CB8 @ =0x08BA3CA4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08060CBC @ =0x08BD3E44
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r0, _08060CC0 @ =0x0829DA8C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060CC4 @ =0x0829D2A0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060CB4: .4byte 0x0201774C
_08060CB8: .4byte 0x08BA3CA4
_08060CBC: .4byte 0x08BD3E44
_08060CC0: .4byte 0x0829DA8C
_08060CC4: .4byte 0x0829D2A0

	thumb_func_start sub_08060CC8
sub_08060CC8: @ 0x08060CC8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08060CF0
	ldr r0, _08060CF8 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08060CF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060CF8: .4byte 0x0201774C

	thumb_func_start sub_08060CFC
sub_08060CFC: @ 0x08060CFC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08060D58 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060D5C @ =0x08BA3CBC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _08060D60 @ =0x08BA14DC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, _08060D64 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _08060D68 @ =0x0829DDB8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060D6C @ =0x0829DAAC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060D58: .4byte 0x0201774C
_08060D5C: .4byte 0x08BA3CBC
_08060D60: .4byte 0x08BA14DC
_08060D64: .4byte 0x0000F3FF
_08060D68: .4byte 0x0829DDB8
_08060D6C: .4byte 0x0829DAAC

	thumb_func_start sub_08060D70
sub_08060D70: @ 0x08060D70
	push {lr}
	ldr r2, _08060D84 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08060D84: .4byte 0x0201774C

	thumb_func_start sub_08060D88
sub_08060D88: @ 0x08060D88
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08060DA0 @ =0x08BD42A0
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_08060DA0: .4byte 0x08BD42A0

	thumb_func_start sub_08060DA4
sub_08060DA4: @ 0x08060DA4
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08060DBC @ =0x08BD42F4
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_08060DBC: .4byte 0x08BD42F4

	thumb_func_start sub_08060DC0
sub_08060DC0: @ 0x08060DC0
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08060DD8 @ =0x08BD4300
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_08060DD8: .4byte 0x08BD4300

	thumb_func_start sub_08060DDC
sub_08060DDC: @ 0x08060DDC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _08060E14 @ =0x08BA3D04
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060E14: .4byte 0x08BA3D04

	thumb_func_start sub_08060E18
sub_08060E18: @ 0x08060E18
	push {r4, r5, r6, lr}
	sub sp, #8
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
	bne _08060E54
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBG_A
	ldr r0, _08060E50 @ =0x000002C1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08060EB6
	.align 2, 0
_08060E50: .4byte 0x000002C1
_08060E54:
	cmp r0, #0xe
	bne _08060E60
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBG_B
	b _08060F66
_08060E60:
	cmp r0, #0x2c
	bne _08060E78
	ldr r0, _08060E74 @ =0x000002C2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08060EB6
	.align 2, 0
_08060E74: .4byte 0x000002C2
_08060E78:
	cmp r0, #0x53
	bne _08060E90
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _08060F66
_08060E90:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x5d
	cmp r1, r0
	bne _08060EA4
	adds r0, r5, #0
	bl sub_08061098
	b _08060F66
_08060EA4:
	adds r0, r2, #0
	adds r0, #0x67
	cmp r1, r0
	bne _08060EC4
	ldr r0, _08060EC0 @ =0x000002C3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_08060EB6:
	movs r3, #1
	bl PlaySFX
	b _08060F66
	.align 2, 0
_08060EC0: .4byte 0x000002C3
_08060EC4:
	adds r0, r2, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _08060ED8
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	b _08060F48
_08060ED8:
	adds r0, r2, #0
	adds r0, #0x89
	cmp r1, r0
	bne _08060EEE
	adds r0, r5, #0
	bl sub_08061184
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBGCOL
	b _08060F66
_08060EEE:
	adds r0, r2, #0
	adds r0, #0x90
	cmp r1, r0
	bne _08060F1E
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08060F66
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08060F66
_08060F1E:
	adds r0, r2, #0
	adds r0, #0x9a
	cmp r1, r0
	bne _08060F50
	ldr r0, [r4, #0x5c]
	movs r1, #0x55
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	bl NewEfxTwobaiRST
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBG3
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0xc
_08060F48:
	movs r3, #0x10
	bl NewEfxALPHA
	b _08060F66
_08060F50:
	adds r0, r2, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _08060F66
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08060F66:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSubSpell_efxOuraBG_A
StartSubSpell_efxOuraBG_A: @ 0x08060F70
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060FD4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060FD8 @ =0x08BA3D1C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08060FDC @ =0x081E9408
	str r0, [r5, #0x48]
	ldr r0, _08060FE0 @ =0x08BA3D34
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060FE4 @ =0x0829DDD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060FE8 @ =0x0829E750
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08060FEC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08060FFA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060FF0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08060FFA
	.align 2, 0
_08060FD4: .4byte 0x0201774C
_08060FD8: .4byte 0x08BA3D1C
_08060FDC: .4byte 0x081E9408
_08060FE0: .4byte 0x08BA3D34
_08060FE4: .4byte 0x0829DDD8
_08060FE8: .4byte 0x0829E750
_08060FEC: .4byte 0x0203E02C
_08060FF0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08060FFA:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start StartSubSpell_efxOuraBG_B
StartSubSpell_efxOuraBG_B: @ 0x08061004
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08061068 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806106C @ =0x08BA3D1C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08061070 @ =0x081E9436
	str r0, [r5, #0x48]
	ldr r0, _08061074 @ =0x08BA3D34
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061078 @ =0x0829DDD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806107C @ =0x0829E750
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08061080 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806108E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061084
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0806108E
	.align 2, 0
_08061068: .4byte 0x0201774C
_0806106C: .4byte 0x08BA3D1C
_08061070: .4byte 0x081E9436
_08061074: .4byte 0x08BA3D34
_08061078: .4byte 0x0829DDD8
_0806107C: .4byte 0x0829E750
_08061080: .4byte 0x0203E02C
_08061084:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0806108E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08061098
sub_08061098: @ 0x08061098
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080610FC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061100 @ =0x08BA3D1C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08061104 @ =0x081E9468
	str r0, [r5, #0x48]
	ldr r0, _08061108 @ =0x08BA3D34
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806110C @ =0x0829DDD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08061110 @ =0x0829E750
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08061114 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061122
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061118
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08061122
	.align 2, 0
_080610FC: .4byte 0x0201774C
_08061100: .4byte 0x08BA3D1C
_08061104: .4byte 0x081E9468
_08061108: .4byte 0x08BA3D34
_0806110C: .4byte 0x0829DDD8
_08061110: .4byte 0x0829E750
_08061114: .4byte 0x0203E02C
_08061118:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08061122:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0806112C
sub_0806112C: @ 0x0806112C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806115A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08061178
_0806115A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08061178
	bl SpellFx_ClearBG1
	ldr r1, _08061180 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08061178:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061180: .4byte 0x0201774C

	thumb_func_start sub_08061184
sub_08061184: @ 0x08061184
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080611C8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080611CC @ =0x08BA3DA4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #5
	strh r0, [r5, #0x2e]
	ldr r0, _080611D0 @ =0x0828EAD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _080611D4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080611E0
	ldr r0, _080611D8 @ =0x0828FDC0
	ldr r1, _080611DC @ =0x02019784
	bl LZ77UnCompWram
	b _080611E8
	.align 2, 0
_080611C8: .4byte 0x0201774C
_080611CC: .4byte 0x08BA3DA4
_080611D0: .4byte 0x0828EAD8
_080611D4: .4byte 0x0203E02C
_080611D8: .4byte 0x0828FDC0
_080611DC: .4byte 0x02019784
_080611E0:
	ldr r0, _08061208 @ =0x0829021C
	ldr r1, _0806120C @ =0x02019784
	bl LZ77UnCompWram
_080611E8:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061214
	ldr r0, _0806120C @ =0x02019784
	ldr r1, _08061210 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08061228
	.align 2, 0
_08061208: .4byte 0x0829021C
_0806120C: .4byte 0x02019784
_08061210: .4byte 0x02023460
_08061214:
	ldr r0, _0806125C @ =0x02019784
	ldr r1, _08061260 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08061228:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08061264 @ =0x03002870
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806125C: .4byte 0x02019784
_08061260: .4byte 0x02023460
_08061264: .4byte 0x03002870

	thumb_func_start sub_08061268
sub_08061268: @ 0x08061268
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08061280 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08061280: .4byte 0x0201774C

	thumb_func_start sub_08061284
sub_08061284: @ 0x08061284
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0806129E
	adds r0, r2, #0
	bl Proc_Break
_0806129E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSubSpell_efxOuraBGCOL
StartSubSpell_efxOuraBGCOL: @ 0x080612A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080612DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080612E0 @ =0x08BA3DC4
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	str r0, [r1, #0x44]
	ldr r0, _080612E4 @ =0x081E9482
	str r0, [r1, #0x48]
	ldr r0, _080612E8 @ =0x0828FD00
	str r0, [r1, #0x4c]
	adds r0, #0x60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080612DC: .4byte 0x0201774C
_080612E0: .4byte 0x08BA3DC4
_080612E4: .4byte 0x081E9482
_080612E8: .4byte 0x0828FD00

	thumb_func_start sub_080612EC
sub_080612EC: @ 0x080612EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08061312
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08061328
_08061312:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08061328
	ldr r1, _08061330 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08061328:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061330: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxOuraBG3
StartSubSpell_efxOuraBG3: @ 0x08061334
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806137C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061380 @ =0x08BA3DE4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08061384 @ =0x081E9494
	str r1, [r0, #0x48]
	ldr r1, _08061388 @ =0x08BA3DFC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806138C @ =0x08BA3E2C
	str r1, [r0, #0x54]
	ldr r0, _08061390 @ =0x082AEF60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806137C: .4byte 0x0201774C
_08061380: .4byte 0x08BA3DE4
_08061384: .4byte 0x081E9494
_08061388: .4byte 0x08BA3DFC
_0806138C: .4byte 0x08BA3E2C
_08061390: .4byte 0x082AEF60

	thumb_func_start sub_08061394
sub_08061394: @ 0x08061394
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _080613D0
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b _080613EE
_080613D0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080613EE
	bl SpellFx_ClearBG1
	ldr r1, _080613F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_080613EE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080613F4: .4byte 0x0201774C

	thumb_func_start sub_080613F8
sub_080613F8: @ 0x080613F8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _08061430 @ =0x08BA3E5C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061430: .4byte 0x08BA3E5C

	thumb_func_start sub_08061434
sub_08061434: @ 0x08061434
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08061468
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
_08061468:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0806147C
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _0806158E
_0806147C:
	adds r0, r4, #0
	adds r0, #0xb
	cmp r1, r0
	bne _08061490
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG1
	movs r0, #0xb1
	lsls r0, r0, #2
	b _08061566
_08061490:
	adds r0, r4, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _080614E0
	adds r0, r5, #0
	movs r1, #0x72
	bl sub_08061914
	ldr r3, _080614D8 @ =0x03002870
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
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	ldr r0, _080614DC @ =0x000002C5
	b _08061566
	.align 2, 0
_080614D8: .4byte 0x03002870
_080614DC: .4byte 0x000002C5
_080614E0:
	adds r0, r4, #0
	adds r0, #0x4c
	cmp r1, r0
	bne _080614FA
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08061760
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_080617DC
	b _0806158E
_080614FA:
	adds r0, r4, #0
	adds r0, #0x56
	cmp r1, r0
	bne _0806150E
	adds r0, r5, #0
	movs r1, #0x37
	movs r2, #0x2d
	bl sub_08061874
	b _0806158E
_0806150E:
	adds r0, r4, #0
	adds r0, #0x8d
	cmp r1, r0
	bne _08061538
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806158E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0806158E
_08061538:
	adds r0, r4, #0
	adds r0, #0x8e
	cmp r1, r0
	bne _08061578
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_08061658
	mov r0, r8
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _08061574 @ =0x000002C6
_08061566:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _0806158E
	.align 2, 0
_08061574: .4byte 0x000002C6
_08061578:
	adds r0, r4, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _0806158E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0806158E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSpellBG_IvaldiBG1
StartSpellBG_IvaldiBG1: @ 0x0806159C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080615E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080615EC @ =0x08BA3E74
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080615F0 @ =0x081E9506
	str r1, [r0, #0x48]
	ldr r1, _080615F4 @ =0x08BA3E8C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _080615F8 @ =0x0829DDD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080615FC @ =0x0829E750
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080615E8: .4byte 0x0201774C
_080615EC: .4byte 0x08BA3E74
_080615F0: .4byte 0x081E9506
_080615F4: .4byte 0x08BA3E8C
_080615F8: .4byte 0x0829DDD8
_080615FC: .4byte 0x0829E750

	thumb_func_start sub_08061600
sub_08061600: @ 0x08061600
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806162E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806164C
_0806162E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806164C
	bl SpellFx_ClearBG1
	ldr r1, _08061654 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0806164C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061654: .4byte 0x0201774C

	thumb_func_start sub_08061658
sub_08061658: @ 0x08061658
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080616E0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080616E4 @ =0x08BA3EBC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _080616E8 @ =0x082B0CFC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080616EC @ =0x082B125C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _080616F0 @ =0x082B127C
	ldr r4, _080616F4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _080616F8 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _080616FC @ =0x03002870
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080616E0: .4byte 0x0201774C
_080616E4: .4byte 0x08BA3EBC
_080616E8: .4byte 0x082B0CFC
_080616EC: .4byte 0x082B125C
_080616F0: .4byte 0x082B127C
_080616F4: .4byte 0x02019784
_080616F8: .4byte 0x02023460
_080616FC: .4byte 0x03002870

	thumb_func_start sub_08061700
sub_08061700: @ 0x08061700
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08061718 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08061718: .4byte 0x0201774C

	thumb_func_start sub_0806171C
sub_0806171C: @ 0x0806171C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061738
	ldr r1, _08061734 @ =0x03002870
	ldrh r0, [r1, #0x20]
	adds r0, #0xc
	b _0806173E
	.align 2, 0
_08061734: .4byte 0x03002870
_08061738:
	ldr r1, _0806175C @ =0x03002870
	ldrh r0, [r1, #0x20]
	subs r0, #0xc
_0806173E:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08061756
	adds r0, r4, #0
	bl Proc_Break
_08061756:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806175C: .4byte 0x03002870

	thumb_func_start sub_08061760
sub_08061760: @ 0x08061760
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _080617C4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080617C8 @ =0x08BA3EDC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _080617CC @ =0x08BD53D4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r1, _080617D0 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _080617D4 @ =0x082B3D5C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080617D8 @ =0x082B3A2C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080617C4: .4byte 0x0201774C
_080617C8: .4byte 0x08BA3EDC
_080617CC: .4byte 0x08BD53D4
_080617D0: .4byte 0x0000F3FF
_080617D4: .4byte 0x082B3D5C
_080617D8: .4byte 0x082B3A2C

	thumb_func_start sub_080617DC
sub_080617DC: @ 0x080617DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08061830 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061834 @ =0x08BA3EDC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08061838 @ =0x08BD546C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r1, _0806183C @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061830: .4byte 0x0201774C
_08061834: .4byte 0x08BA3EDC
_08061838: .4byte 0x08BD546C
_0806183C: .4byte 0x0000F3FF

	thumb_func_start sub_08061840
sub_08061840: @ 0x08061840
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08061868
	ldr r0, _08061870 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08061868:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061870: .4byte 0x0201774C

	thumb_func_start sub_08061874
sub_08061874: @ 0x08061874
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _080618A4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080618A8 @ =0x08BA3EF4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl NewEfxFlashBgWhite
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080618A4: .4byte 0x0201774C
_080618A8: .4byte 0x08BA3EF4

	thumb_func_start sub_080618AC
sub_080618AC: @ 0x080618AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08061908 @ =0x02022860
	ldr r4, _0806190C @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08061900
	ldr r1, _08061910 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08061900:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061908: .4byte 0x02022860
_0806190C: .4byte 0x020165C8
_08061910: .4byte 0x0201774C

	thumb_func_start sub_08061914
sub_08061914: @ 0x08061914
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r1, _08061998 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806199C @ =0x08BA3F0C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	str r0, [r5, #0x44]
	ldr r0, _080619A0 @ =0x081E9538
	str r0, [r5, #0x48]
	ldr r4, _080619A4 @ =0x082B35B0
	str r4, [r5, #0x4c]
	ldr r0, _080619A8 @ =0x082B1BB8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	subs r4, #0x20
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r5, #0x5c]
	ldr r2, _080619AC @ =0x082B35D0
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	ldr r0, _080619B0 @ =0x02000000
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _080619B8
	ldr r3, _080619B4 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	b _080619E4
	.align 2, 0
_08061998: .4byte 0x0201774C
_0806199C: .4byte 0x08BA3F0C
_080619A0: .4byte 0x081E9538
_080619A4: .4byte 0x082B35B0
_080619A8: .4byte 0x082B1BB8
_080619AC: .4byte 0x082B35D0
_080619B0: .4byte 0x02000000
_080619B4: .4byte 0x03002870
_080619B8:
	ldr r3, _08061A28 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x18]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x18]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
_080619E4:
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	ldr r6, _08061A2C @ =0x0000F3FF
	adds r1, r6, #0
	ldrh r2, [r7, #8]
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r2, #0
	orrs r1, r5
	strh r1, [r7, #8]
	adds r1, r6, #0
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r5
	strh r1, [r0, #8]
	ldr r4, _08061A30 @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	cmp r1, #0
	beq _08061A20
	adds r0, r6, #0
	ldrh r2, [r1, #8]
	ands r0, r2
	orrs r0, r5
	strh r0, [r1, #8]
_08061A20:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061A28: .4byte 0x03002870
_08061A2C: .4byte 0x0000F3FF
_08061A30: .4byte 0x02000010

	thumb_func_start sub_08061A34
sub_08061A34: @ 0x08061A34
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r4, _08061ADC @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _08061A62
	ldr r0, _08061AE0 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_08061A62:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08061A88
	ldr r0, [r5, #0x4c]
	ldr r1, _08061AE4 @ =0x02022862
	movs r2, #0xf
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_0805067C
_08061A88:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08061B58
	ldr r1, _08061AE8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, _08061AEC @ =0x02000000
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _08061AF4
	ldr r3, _08061AF0 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	b _08061B20
	.align 2, 0
_08061ADC: .4byte 0x02000010
_08061AE0: .4byte 0x0000F3FF
_08061AE4: .4byte 0x02022862
_08061AE8: .4byte 0x0201774C
_08061AEC: .4byte 0x02000000
_08061AF0: .4byte 0x03002870
_08061AF4:
	ldr r3, _08061B60 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
_08061B20:
	ldr r1, [r5, #0x5c]
	ldr r3, _08061B64 @ =0x0000F3FF
	adds r0, r3, #0
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	ldr r1, [r5, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	adds r0, r3, #0
	ldrh r1, [r6, #8]
	ands r0, r1
	orrs r0, r2
	strh r0, [r6, #8]
	cmp r4, #0
	beq _08061B52
	adds r0, r3, #0
	ldrh r1, [r4, #8]
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #8]
_08061B52:
	adds r0, r5, #0
	bl Proc_Break
_08061B58:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061B60: .4byte 0x03002870
_08061B64: .4byte 0x0000F3FF

	thumb_func_start sub_08061B68
sub_08061B68: @ 0x08061B68
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_0804FD1C
	bl SpellFx_SetBG1Position
	ldr r0, _08061BA0 @ =0x08BA3F24
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061BA0: .4byte 0x08BA3F24

	thumb_func_start sub_08061BA4
sub_08061BA4: @ 0x08061BA4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08061BD2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_08061BD2:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0x14
	cmp r1, r0
	bne _08061BEC
	adds r0, r6, #0
	bl sub_08062254
	ldr r0, _08061BE8 @ =0x000002FD
	b _08061C8C
	.align 2, 0
_08061BE8: .4byte 0x000002FD
_08061BEC:
	adds r0, r5, #0
	adds r0, #0x28
	cmp r1, r0
	bne _08061C0C
	adds r0, r6, #0
	bl sub_08061F08
	adds r0, r6, #0
	bl sub_08061D24
	adds r0, r6, #0
	bl sub_08061E70
	bl sub_0804FD54
	b _08061D18
_08061C0C:
	adds r0, r5, #0
	adds r0, #0x91
	cmp r1, r0
	bne _08061C20
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0x14
	bl sub_08062108
	b _08061D18
_08061C20:
	adds r0, r5, #0
	adds r0, #0xaf
	cmp r1, r0
	bne _08061C48
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08061D18
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08061D18
_08061C48:
	adds r0, r5, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _08061C6A
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08061D18
	bl SpellFx_Finish
	bl sub_0804FD6C
	adds r0, r4, #0
	bl Proc_Break
	b _08061D18
_08061C6A:
	adds r0, r5, #0
	adds r0, #0xb1
	cmp r1, r0
	bne _08061CA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x50
	movs r2, #9
	bl StartSpellThing_MagicQuake
	adds r0, r6, #0
	movs r1, #0x1e
	bl sub_08060AEC
	adds r0, r6, #0
	bl StartSubSpell_efxGespenstBGCOL2
	ldr r0, _08061C9C @ =0x000002FE
_08061C8C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _08061D18
	.align 2, 0
_08061C9C: .4byte 0x000002FE
_08061CA0:
	adds r0, r5, #0
	adds r0, #0xcd
	cmp r1, r0
	bne _08061CB2
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _08061D18
_08061CB2:
	adds r0, r5, #0
	adds r0, #0xd7
	cmp r1, r0
	bne _08061CE4
	ldr r0, [r4, #0x5c]
	movs r1, #0x46
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x32
	bl NewEfxTwobaiRST
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxSuperdruidBG3
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	b _08061D18
_08061CE4:
	adds r0, r5, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _08061CF4
	adds r0, r6, #0
	bl sub_080621E4
	b _08061D18
_08061CF4:
	adds r0, r5, #0
	adds r0, #0xf0
	cmp r1, r0
	bne _08061D02
	bl sub_0804FD6C
	b _08061D18
_08061D02:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	ldr r2, _08061D20 @ =0x0000010B
	adds r0, r5, r2
	cmp r1, r0
	bne _08061D18
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_08061D18:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061D20: .4byte 0x0000010B

	thumb_func_start sub_08061D24
sub_08061D24: @ 0x08061D24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061D60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061D64 @ =0x08BA3F3C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #5
	str r1, [r0, #0x48]
	ldr r0, _08061D68 @ =0x082D9800
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08061D6C @ =0x082D9C74
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061D60: .4byte 0x0201774C
_08061D64: .4byte 0x08BA3F3C
_08061D68: .4byte 0x082D9800
_08061D6C: .4byte 0x082D9C74

	thumb_func_start sub_08061D70
sub_08061D70: @ 0x08061D70
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x44]
	cmp r0, r1
	ble _08061DD6
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r5, _08061DE0 @ =0x08BA3F5C
	movs r0, #0x2e
	ldrsh r4, [r6, r0]
	lsls r0, r4, #4
	adds r0, r0, r5
	ldr r1, [r0]
	lsls r4, r4, #2
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r4, #2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	adds r4, #3
	lsls r4, r4, #2
	adds r4, r4, r5
	ldr r4, [r4]
	ldr r0, [r6, #0x60]
	str r4, [sp]
	bl sub_08061DE8
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _08061DD6
	ldr r1, _08061DE4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08061DD6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061DE0: .4byte 0x08BA3F5C
_08061DE4: .4byte 0x0201774C

	thumb_func_start sub_08061DE8
sub_08061DE8: @ 0x08061DE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x20]
	ldr r1, _08061E48 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061E4C @ =0x08BA4044
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	ldr r0, _08061E50 @ =0x08BA402C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	mov r1, r8
	strh r1, [r0, #2]
	mov r2, sb
	strh r2, [r0, #4]
	ldr r1, _08061E54 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r7
	strh r1, [r0, #8]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061E48: .4byte 0x0201774C
_08061E4C: .4byte 0x08BA4044
_08061E50: .4byte 0x08BA402C
_08061E54: .4byte 0x0000F3FF

	thumb_func_start sub_08061E58
sub_08061E58: @ 0x08061E58
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _08061E6C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08061E6C: .4byte 0x0201774C

	thumb_func_start sub_08061E70
sub_08061E70: @ 0x08061E70
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08061EC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061EC8 @ =0x08BA4064
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08061ECC @ =0x08BD6CF4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x3c
	strh r1, [r0, #4]
	ldr r1, _08061ED0 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl AnimSort
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061EC4: .4byte 0x0201774C
_08061EC8: .4byte 0x08BA4064
_08061ECC: .4byte 0x08BD6CF4
_08061ED0: .4byte 0x0000F3FF

	thumb_func_start sub_08061ED4
sub_08061ED4: @ 0x08061ED4
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _08061EE8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08061EE8: .4byte 0x0201774C

	thumb_func_start sub_08061EEC
sub_08061EEC: @ 0x08061EEC
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _08061F04 @ =0x08BD6D14
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_08061F04: .4byte 0x08BD6D14

	thumb_func_start sub_08061F08
sub_08061F08: @ 0x08061F08
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061F48 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061F4C @ =0x08BA4094
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08061F50 @ =0x081E9576
	str r1, [r0, #0x48]
	ldr r1, _08061F54 @ =0x08BA40D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08061F58 @ =0x08BA40AC
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08061F5C @ =0x082C5C08
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061F48: .4byte 0x0201774C
_08061F4C: .4byte 0x08BA4094
_08061F50: .4byte 0x081E9576
_08061F54: .4byte 0x08BA40D4
_08061F58: .4byte 0x08BA40AC
_08061F5C: .4byte 0x082C5C08

	thumb_func_start sub_08061F60
sub_08061F60: @ 0x08061F60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08061FB0
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08061F9A
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08061F9A:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08061FCE
_08061FB0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08061FCE
	bl SpellFx_ClearBG1
	ldr r1, _08061FD8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08061FCE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061FD8: .4byte 0x0201774C

	thumb_func_start StartSubSpell_efxSuperdruidBG3
StartSubSpell_efxSuperdruidBG3: @ 0x08061FDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062024 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062028 @ =0x08BA40FC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0806202C @ =0x081E9624
	str r1, [r0, #0x48]
	ldr r1, _08062030 @ =0x08BA413C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08062034 @ =0x08BA4114
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08062038 @ =0x082D8260
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062024: .4byte 0x0201774C
_08062028: .4byte 0x08BA40FC
_0806202C: .4byte 0x081E9624
_08062030: .4byte 0x08BA413C
_08062034: .4byte 0x08BA4114
_08062038: .4byte 0x082D8260

	thumb_func_start sub_0806203C
sub_0806203C: @ 0x0806203C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080620D8
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08062078
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08062078:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _080620B4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080620F6
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _080620BC
	ldr r0, _080620B8 @ =0x02023460
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _080620CC
	.align 2, 0
_080620B4: .4byte 0x0203E02C
_080620B8: .4byte 0x02023460
_080620BC:
	ldr r0, _080620D4 @ =0x0202349A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_080620CC:
	movs r0, #2
	bl EnableBgSync
	b _080620F6
	.align 2, 0
_080620D4: .4byte 0x0202349A
_080620D8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080620F6
	bl SpellFx_ClearBG1
	ldr r1, _08062104 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080620F6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062104: .4byte 0x0201774C

	thumb_func_start sub_08062108
sub_08062108: @ 0x08062108
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	ldr r1, _08062148 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806214C @ =0x08BA4164
	movs r1, #4
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08062150 @ =0x02022860
	ldr r1, _08062154 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	strh r6, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062148: .4byte 0x0201774C
_0806214C: .4byte 0x08BA4164
_08062150: .4byte 0x02022860
_08062154: .4byte 0x020165C8

	thumb_func_start sub_08062158
sub_08062158: @ 0x08062158
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _08062172
	ldrh r3, [r5, #0x2e]
	b _08062174
_08062172:
	ldrh r3, [r5, #0x2c]
_08062174:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r7, _080621D8 @ =0x020165C8
	ldr r6, _080621DC @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r7, #0
	adds r1, r6, #0
	bl CpuFastSet
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r4, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080621CC
	adds r0, r7, #0
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, _080621E0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080621CC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080621D8: .4byte 0x020165C8
_080621DC: .4byte 0x02022860
_080621E0: .4byte 0x0201774C

	thumb_func_start sub_080621E4
sub_080621E4: @ 0x080621E4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08062230 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062234 @ =0x08BA417C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08062238 @ =0x08BD7078
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, _0806223C @ =0x082D9C94
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08062240 @ =0x082DA240
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062230: .4byte 0x0201774C
_08062234: .4byte 0x08BA417C
_08062238: .4byte 0x08BD7078
_0806223C: .4byte 0x082D9C94
_08062240: .4byte 0x082DA240

	thumb_func_start sub_08062244
sub_08062244: @ 0x08062244
	ldr r1, _08062250 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062250: .4byte 0x0201774C

	thumb_func_start sub_08062254
sub_08062254: @ 0x08062254
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080622A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080622A4 @ =0x08BA419C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _080622A8 @ =0x08BD7090
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, _080622AC @ =0x082D9C94
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _080622B0 @ =0x082DA240
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080622A0: .4byte 0x0201774C
_080622A4: .4byte 0x08BA419C
_080622A8: .4byte 0x08BD7090
_080622AC: .4byte 0x082D9C94
_080622B0: .4byte 0x082DA240

	thumb_func_start sub_080622B4
sub_080622B4: @ 0x080622B4
	ldr r1, _080622C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080622C0: .4byte 0x0201774C

	thumb_func_start StartSpellAnimFillasMight
StartSpellAnimFillasMight: @ 0x080622C4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, _080622FC @ =0x08BA41BC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080622FC: .4byte 0x08BA41BC

	thumb_func_start StartSpellAnimThorsIre
StartSpellAnimThorsIre: @ 0x08062300
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, _08062338 @ =0x08BA41BC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #2
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062338: .4byte 0x08BA41BC

	thumb_func_start StartSpellAnimNinisGrace
StartSpellAnimNinisGrace: @ 0x0806233C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, _08062374 @ =0x08BA41BC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #3
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062374: .4byte 0x08BA41BC

	thumb_func_start StartSpellAnimSetsLitany
StartSpellAnimSetsLitany: @ 0x08062378
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, _080623B0 @ =0x08BA41BC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080623B0: .4byte 0x08BA41BC

	thumb_func_start sub_080623B4
sub_080623B4: @ 0x080623B4
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
	bne _08062448
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	bl StartSubSpell_efxSongBG
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	bl StartSubSpell_efxSongOBJ
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x64
	bl NewEfxTwobaiRST
	ldr r3, _0806245C @ =0x03002870
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
_08062448:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne _08062460
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _08062476
	.align 2, 0
_0806245C: .4byte 0x03002870
_08062460:
	cmp r0, #0xa5
	bne _08062476
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08062476:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxDamageMojiEffect
NewEfxDamageMojiEffect: @ 0x08062480
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080624A8 @ =0x08BA41D4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r5, [r0]
	ldr r0, _080624AC @ =0x081D9FDC
	ldr r1, _080624B0 @ =0x06012000
	bl LZ77UnCompVram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080624A8: .4byte 0x08BA41D4
_080624AC: .4byte 0x081D9FDC
_080624B0: .4byte 0x06012000

	thumb_func_start efxDamageMojiEffectMain
efxDamageMojiEffectMain: @ 0x080624B4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080624D2
	ldr r0, [r1, #0x5c]
	adds r1, #0x29
	ldrb r1, [r1]
	bl NewEfxDamageMojiEffectOBJ
	b _080624DC
_080624D2:
	cmp r0, #0xa
	bne _080624DC
	adds r0, r1, #0
	bl Proc_Break
_080624DC:
	pop {r0}
	bx r0

	thumb_func_start NewEfxDamageMojiEffectOBJ
NewEfxDamageMojiEffectOBJ: @ 0x080624E0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08062504 @ =0x08BA41EC
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	cmp r4, #0
	bne _0806250C
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _08062508 @ =0x08B9D9F0
	b _08062512
	.align 2, 0
_08062504: .4byte 0x08BA41EC
_08062508: .4byte 0x08B9D9F0
_0806250C:
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _0806254C @ =0x08B9DA64
_08062512:
	adds r0, r5, #0
	bl GetAnimPosition
	movs r2, #0xa2
	lsls r2, r2, #7
	cmp r0, #0
	bne _08062524
	movs r2, #0xc2
	lsls r2, r2, #7
_08062524:
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r3, #4
	ldrsh r1, [r5, r3]
	subs r1, #0x28
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	adds r2, r4, #0
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x60]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806254C: .4byte 0x08B9DA64

	thumb_func_start sub_08062550
sub_08062550: @ 0x08062550
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08062578
	ldr r0, [r4, #0x60]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08062578:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxPierceCritical
NewEfxPierceCritical: @ 0x08062580
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _0806259C @ =0x08BA4204
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806259C: .4byte 0x08BA4204

	thumb_func_start sub_080625A0
sub_080625A0: @ 0x080625A0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080625C0
	ldr r0, [r4, #0x5c]
	bl sub_080625D0
	ldr r0, [r4, #0x5c]
	bl sub_08062648
	b _080625CA
_080625C0:
	cmp r0, #0x11
	bne _080625CA
	adds r0, r4, #0
	bl Proc_Break
_080625CA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080625D0
sub_080625D0: @ 0x080625D0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806260C @ =0x08BA421C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08062610 @ =0x081F1864
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08062614 @ =0x081F2944
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, _08062618 @ =0x081F2B44
	ldr r2, _0806261C @ =0x081F2FE4
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806260C: .4byte 0x08BA421C
_08062610: .4byte 0x081F1864
_08062614: .4byte 0x081F2944
_08062618: .4byte 0x081F2B44
_0806261C: .4byte 0x081F2FE4

	thumb_func_start sub_08062620
sub_08062620: @ 0x08062620
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08062640
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08062640:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08062648
sub_08062648: @ 0x08062648
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806266C @ =0x08BA4234
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08062670 @ =0x081E9650
	str r1, [r0, #0x48]
	ldr r1, _08062674 @ =0x081F2944
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806266C: .4byte 0x08BA4234
_08062670: .4byte 0x081E9650
_08062674: .4byte 0x081F2944

	thumb_func_start sub_08062678
sub_08062678: @ 0x08062678
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806269E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _080626AC
_0806269E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080626AC
	adds r0, r4, #0
	bl Proc_Break
_080626AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxNormalEffect
NewEfxNormalEffect: @ 0x080626B4
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _080626D0 @ =0x08BA4254
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080626D0: .4byte 0x08BA4254

	thumb_func_start sub_080626D4
sub_080626D4: @ 0x080626D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080626F8
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	b _0806270E
_080626F8:
	cmp r0, #4
	bne _08062704
	adds r0, r1, #0
	bl sub_08062714
	b _0806270E
_08062704:
	cmp r0, #0x18
	bne _0806270E
	adds r0, r4, #0
	bl Proc_Break
_0806270E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08062714
sub_08062714: @ 0x08062714
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08062774 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062778 @ =0x08BA426C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806277C @ =0x081E9692
	str r0, [r5, #0x48]
	ldr r0, _08062780 @ =0x08BA4284
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08062784 @ =0x081F398C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08062788 @ =0x081F35C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0806278C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806279A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062790
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0806279A
	.align 2, 0
_08062774: .4byte 0x0201774C
_08062778: .4byte 0x08BA426C
_0806277C: .4byte 0x081E9692
_08062780: .4byte 0x08BA4284
_08062784: .4byte 0x081F398C
_08062788: .4byte 0x081F35C4
_0806278C: .4byte 0x0203E02C
_08062790:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0806279A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080627A0
sub_080627A0: @ 0x080627A0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080627CE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080627EC
_080627CE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080627EC
	bl SpellFx_ClearBG1
	ldr r1, _080627F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080627EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080627F4: .4byte 0x0201774C

	thumb_func_start NewEfxYushaSpinShield
NewEfxYushaSpinShield: @ 0x080627F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806281C @ =0x08BA42AC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl NewEfxYushaSpinShieldOBJ
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806281C: .4byte 0x08BA42AC

	thumb_func_start sub_08062820
sub_08062820: @ 0x08062820
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxYushaSpinShieldOBJ
NewEfxYushaSpinShieldOBJ: @ 0x0806282C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _08062854 @ =0x08BA42C4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _08062860
	ldr r2, _08062858 @ =0x08BAD8F0
	ldr r3, _0806285C @ =0x08BAEB90
	b _08062864
	.align 2, 0
_08062854: .4byte 0x08BA42C4
_08062858: .4byte 0x08BAD8F0
_0806285C: .4byte 0x08BAEB90
_08062860:
	ldr r2, _08062890 @ =0x08BAFE60
	ldr r3, _08062894 @ =0x08BB1130
_08062864:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0
	strh r0, [r4, #8]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08062898
	movs r1, #0xe4
	lsls r1, r1, #7
	b _0806289C
	.align 2, 0
_08062890: .4byte 0x08BAFE60
_08062894: .4byte 0x08BB1130
_08062898:
	movs r1, #0x93
	lsls r1, r1, #8
_0806289C:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start efxYushaSpinShieldOBJ_806CD14
efxYushaSpinShieldOBJ_806CD14: @ 0x080628AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	bne _0806290A
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080628E4
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080628DC
	ldr r0, _080628D8 @ =0x08BAEC94
	b _080628FA
	.align 2, 0
_080628D8: .4byte 0x08BAEC94
_080628DC:
	ldr r0, _080628E0 @ =0x08BAD9F4
	b _080628FA
	.align 2, 0
_080628E0: .4byte 0x08BAD9F4
_080628E4:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080628F8
	ldr r0, _080628F4 @ =0x08BB1234
	b _080628FA
	.align 2, 0
_080628F4: .4byte 0x08BB1234
_080628F8:
	ldr r0, _08062910 @ =0x08BAFF64
_080628FA:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806290A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062910: .4byte 0x08BAFF64

	thumb_func_start efxYushaSpinShieldOBJ_806CD7C
efxYushaSpinShieldOBJ_806CD7C: @ 0x08062914
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	ldrh r2, [r0, #0x10]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08062936
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08062936
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_08062936:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start efxYushaSpinShieldOBJ_806CDA4
efxYushaSpinShieldOBJ_806CDA4: @ 0x0806293C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	bl CheckEkrHitDone
	cmp r0, #1
	bne _08062996
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062970
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062968
	ldr r0, _08062964 @ =0x08BAECBC
	b _08062986
	.align 2, 0
_08062964: .4byte 0x08BAECBC
_08062968:
	ldr r0, _0806296C @ =0x08BADA1C
	b _08062986
	.align 2, 0
_0806296C: .4byte 0x08BADA1C
_08062970:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062984
	ldr r0, _08062980 @ =0x08BB125C
	b _08062986
	.align 2, 0
_08062980: .4byte 0x08BB125C
_08062984:
	ldr r0, _0806299C @ =0x08BAFF8C
_08062986:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08062996:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806299C: .4byte 0x08BAFF8C

	thumb_func_start efxYushaSpinShieldOBJ_806CE08
efxYushaSpinShieldOBJ_806CE08: @ 0x080629A0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080629C2
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080629C2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxHurtmutEff00
NewEfxHurtmutEff00: @ 0x080629C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080629F4 @ =0x0201774C
	ldr r5, [r0]
	cmp r5, #0
	bne _08062A06
	ldr r0, _080629F8 @ =0x08BA42F4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	ldr r0, _080629FC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08062A00
	adds r0, r4, #0
	bl NewEfxHurtmutEff00OBJ
	b _08062A06
	.align 2, 0
_080629F4: .4byte 0x0201774C
_080629F8: .4byte 0x08BA42F4
_080629FC: .4byte 0x0203E02C
_08062A00:
	adds r0, r4, #0
	bl NewEfxHurtmutEff01OBJ
_08062A06:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08062A0C
sub_08062A0C: @ 0x08062A0C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxHurtmutEff00OBJ
NewEfxHurtmutEff00OBJ: @ 0x08062A18
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08062A50 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062A54 @ =0x08BA430C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08062A58 @ =0x08BA14DC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062A50: .4byte 0x0201774C
_08062A54: .4byte 0x08BA430C
_08062A58: .4byte 0x08BA14DC

	thumb_func_start sub_08062A5C
sub_08062A5C: @ 0x08062A5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062A74
	ldr r0, _08062A70 @ =0x08BA8230
	b _08062A76
	.align 2, 0
_08062A70: .4byte 0x08BA8230
_08062A74:
	ldr r0, _08062A9C @ =0x08BA859C
_08062A76:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062AA0 @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062AA4 @ =0x081EF23C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062A9C: .4byte 0x08BA859C
_08062AA0: .4byte 0x081F02C0
_08062AA4: .4byte 0x081EF23C

	thumb_func_start sub_08062AA8
sub_08062AA8: @ 0x08062AA8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062AC0
	ldr r0, _08062ABC @ =0x08BA8884
	b _08062AC2
	.align 2, 0
_08062ABC: .4byte 0x08BA8884
_08062AC0:
	ldr r0, _08062AE8 @ =0x08BA8AE0
_08062AC2:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062AEC @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062AF0 @ =0x081EFADC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062AE8: .4byte 0x08BA8AE0
_08062AEC: .4byte 0x081F02C0
_08062AF0: .4byte 0x081EFADC

	thumb_func_start sub_08062AF4
sub_08062AF4: @ 0x08062AF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062B14 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062B14: .4byte 0x0201774C

	thumb_func_start NewEfxHurtmutEff01OBJ
NewEfxHurtmutEff01OBJ: @ 0x08062B18
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08062B50 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062B54 @ =0x08BA4344
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08062B58 @ =0x08BA14DC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062B50: .4byte 0x0201774C
_08062B54: .4byte 0x08BA4344
_08062B58: .4byte 0x08BA14DC

	thumb_func_start sub_08062B5C
sub_08062B5C: @ 0x08062B5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062B74
	ldr r0, _08062B70 @ =0x08BA8278
	b _08062B76
	.align 2, 0
_08062B70: .4byte 0x08BA8278
_08062B74:
	ldr r0, _08062B9C @ =0x08BA85E4
_08062B76:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062BA0 @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062BA4 @ =0x081EF23C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062B9C: .4byte 0x08BA85E4
_08062BA0: .4byte 0x081F02C0
_08062BA4: .4byte 0x081EF23C

	thumb_func_start sub_08062BA8
sub_08062BA8: @ 0x08062BA8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _08062BC0
	ldr r0, _08062BBC @ =0x08BA8894
	b _08062BC2
	.align 2, 0
_08062BBC: .4byte 0x08BA8894
_08062BC0:
	ldr r0, _08062BE8 @ =0x08BA8AF0
_08062BC2:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _08062BEC @ =0x081F02C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062BF0 @ =0x081EFADC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062BE8: .4byte 0x08BA8AF0
_08062BEC: .4byte 0x081F02C0
_08062BF0: .4byte 0x081EFADC

	thumb_func_start sub_08062BF4
sub_08062BF4: @ 0x08062BF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062C14 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062C14: .4byte 0x0201774C

	thumb_func_start NewEfxMagfcast
NewEfxMagfcast: @ 0x08062C18
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08062C5C @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _08062C70
	bl SpellFx_SetBG1Position
	ldr r0, _08062C60 @ =0x08BA437C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	strh r4, [r5, #0x2c]
	ldr r4, _08062C64 @ =0x0203E08E
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x57
	blt _08062C68
	cmp r0, #0x58
	bgt _08062C68
	ldr r0, [r5, #0x5c]
	adds r1, r7, #0
	bl sub_08062C94
	b _08062C70
	.align 2, 0
_08062C5C: .4byte 0x0201774C
_08062C60: .4byte 0x08BA437C
_08062C64: .4byte 0x0203E08E
_08062C68:
	ldr r0, [r5, #0x5c]
	adds r1, r7, #2
	bl sub_08062C94
_08062C70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxMagfcastMain
EfxMagfcastMain: @ 0x08062C78
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08062C90
	adds r0, r1, #0
	bl Proc_Break
_08062C90:
	pop {r0}
	bx r0

	thumb_func_start sub_08062C94
sub_08062C94: @ 0x08062C94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _08062CC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062CCC @ =0x08BA4394
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	cmp r5, #1
	beq _08062CE0
	cmp r5, #1
	blo _08062CD0
	cmp r5, #2
	beq _08062CF0
	cmp r5, #3
	beq _08062D04
	b _08062D1A
	.align 2, 0
_08062CC8: .4byte 0x0201774C
_08062CCC: .4byte 0x08BA4394
_08062CD0:
	ldr r0, _08062CD8 @ =0x081E96BC
	str r0, [r4, #0x48]
	ldr r0, _08062CDC @ =0x08BA43AC
	b _08062CF6
	.align 2, 0
_08062CD8: .4byte 0x081E96BC
_08062CDC: .4byte 0x08BA43AC
_08062CE0:
	ldr r0, _08062CE8 @ =0x081E96D2
	str r0, [r4, #0x48]
	ldr r0, _08062CEC @ =0x08BA43AC
	b _08062CF6
	.align 2, 0
_08062CE8: .4byte 0x081E96D2
_08062CEC: .4byte 0x08BA43AC
_08062CF0:
	ldr r0, _08062CFC @ =0x081E96D8
	str r0, [r4, #0x48]
	ldr r0, _08062D00 @ =0x08BA43C4
_08062CF6:
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	b _08062D1A
	.align 2, 0
_08062CFC: .4byte 0x081E96D8
_08062D00: .4byte 0x08BA43C4
_08062D04:
	ldr r0, _08062D50 @ =0x081E96FA
	str r0, [r4, #0x48]
	ldr r0, _08062D54 @ =0x08BA43C4
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldrb r1, [r6, #0x14]
	adds r0, r1, r6
	ldrb r1, [r0, #0x14]
	adds r0, r6, #0
	bl EfxPlaySEwithCmdCtrl
_08062D1A:
	ldr r0, _08062D58 @ =0x081F832C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08062D5C @ =0x081F9080
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08062D60 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08062D6E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062D64
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08062D6E
	.align 2, 0
_08062D50: .4byte 0x081E96FA
_08062D54: .4byte 0x08BA43C4
_08062D58: .4byte 0x081F832C
_08062D5C: .4byte 0x081F9080
_08062D60: .4byte 0x0203E02C
_08062D64:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08062D6E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08062D74
sub_08062D74: @ 0x08062D74
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08062DA2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08062DC0
_08062DA2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08062DC0
	bl SpellFx_ClearBG1
	ldr r1, _08062DC8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
_08062DC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062DC8: .4byte 0x0201774C

	thumb_func_start NewEfxSunakemuri
NewEfxSunakemuri: @ 0x08062DCC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08062DF4 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _08062DEE
	ldr r0, _08062DF8 @ =0x08BA4404
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl NewEfxSunakemuriOBJ
_08062DEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062DF4: .4byte 0x0201774C
_08062DF8: .4byte 0x08BA4404

	thumb_func_start sub_08062DFC
sub_08062DFC: @ 0x08062DFC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxSunakemuriOBJ
NewEfxSunakemuriOBJ: @ 0x08062E08
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _08062E70 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062E74 @ =0x08BA441C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _08062E78 @ =0x08BB1320
	cmp r4, #0
	beq _08062E36
	ldr r2, _08062E7C @ =0x08BB15B0
	cmp r4, #1
	bne _08062E36
	ldr r2, _08062E80 @ =0x08BB1468
_08062E36:
	ldr r3, _08062E84 @ =0x08BB13C4
	cmp r4, #0
	beq _08062E44
	ldr r3, _08062E88 @ =0x08BB1654
	cmp r4, #1
	bne _08062E44
	ldr r3, _08062E8C @ =0x08BB150C
_08062E44:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldr r4, _08062E90 @ =0x0203E0D8
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x40
	bls _08062E66
	b _08062FD0
_08062E66:
	lsls r0, r0, #2
	ldr r1, _08062E94 @ =_08062E98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062E70: .4byte 0x0201774C
_08062E74: .4byte 0x08BA441C
_08062E78: .4byte 0x08BB1320
_08062E7C: .4byte 0x08BB15B0
_08062E80: .4byte 0x08BB1468
_08062E84: .4byte 0x08BB13C4
_08062E88: .4byte 0x08BB1654
_08062E8C: .4byte 0x08BB150C
_08062E90: .4byte 0x0203E0D8
_08062E94: .4byte _08062E98
_08062E98: @ jump table
	.4byte _08062FD0 @ case 0
	.4byte _08062F9C @ case 1
	.4byte _08062F9C @ case 2
	.4byte _08062F9C @ case 3
	.4byte _08062F9C @ case 4
	.4byte _08062F9C @ case 5
	.4byte _08062FC8 @ case 6
	.4byte _08062FC8 @ case 7
	.4byte _08062FC8 @ case 8
	.4byte _08062FC8 @ case 9
	.4byte _08062F9C @ case 10
	.4byte _08062FC8 @ case 11
	.4byte _08062F9C @ case 12
	.4byte _08062F9C @ case 13
	.4byte _08062F9C @ case 14
	.4byte _08062F9C @ case 15
	.4byte _08062FB8 @ case 16
	.4byte _08062F9C @ case 17
	.4byte _08062F9C @ case 18
	.4byte _08062F9C @ case 19
	.4byte _08062FA4 @ case 20
	.4byte _08062FB8 @ case 21
	.4byte _08062FB8 @ case 22
	.4byte _08062FC8 @ case 23
	.4byte _08062FC8 @ case 24
	.4byte _08062F9C @ case 25
	.4byte _08062F9C @ case 26
	.4byte _08062F9C @ case 27
	.4byte _08062F9C @ case 28
	.4byte _08062FC8 @ case 29
	.4byte _08062FC8 @ case 30
	.4byte _08062FC8 @ case 31
	.4byte _08062FC8 @ case 32
	.4byte _08062FC8 @ case 33
	.4byte _08062F9C @ case 34
	.4byte _08062F9C @ case 35
	.4byte _08062FC8 @ case 36
	.4byte _08062F9C @ case 37
	.4byte _08062F9C @ case 38
	.4byte _08062F9C @ case 39
	.4byte _08062F9C @ case 40
	.4byte _08062F9C @ case 41
	.4byte _08062F9C @ case 42
	.4byte _08062F9C @ case 43
	.4byte _08062FD0 @ case 44
	.4byte _08062FC8 @ case 45
	.4byte _08062FD0 @ case 46
	.4byte _08062F9C @ case 47
	.4byte _08062FC8 @ case 48
	.4byte _08062FC8 @ case 49
	.4byte _08062FC8 @ case 50
	.4byte _08062F9C @ case 51
	.4byte _08062FD0 @ case 52
	.4byte _08062FD0 @ case 53
	.4byte _08062FB8 @ case 54
	.4byte _08062FC8 @ case 55
	.4byte _08062F9C @ case 56
	.4byte _08062F9C @ case 57
	.4byte _08062F9C @ case 58
	.4byte _08062F9C @ case 59
	.4byte _08062FB8 @ case 60
	.4byte _08062F9C @ case 61
	.4byte _08062FC8 @ case 62
	.4byte _08062F9C @ case 63
	.4byte _08062F9C @ case 64
_08062F9C:
	ldr r0, _08062FA0 @ =0x081FB454
	b _08062FBA
	.align 2, 0
_08062FA0: .4byte 0x081FB454
_08062FA4:
	ldr r0, [r5, #0x5c]
	bl IsAnimSoundInPositionMaybe
	cmp r0, #0
	beq _08062FB8
	ldr r0, _08062FB4 @ =0x081FB454
	b _08062FBA
	.align 2, 0
_08062FB4: .4byte 0x081FB454
_08062FB8:
	ldr r0, _08062FC4 @ =0x081FB474
_08062FBA:
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	b _08062FD0
	.align 2, 0
_08062FC4: .4byte 0x081FB474
_08062FC8:
	ldr r0, _08062FE4 @ =0x081FB494
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
_08062FD0:
	ldr r0, _08062FE8 @ =0x081FAFE4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062FE4: .4byte 0x081FB494
_08062FE8: .4byte 0x081FAFE4

	thumb_func_start EfxSunakemuriOBJMain
EfxSunakemuriOBJMain: @ 0x08062FEC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08063012
	ldr r0, _08063018 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08063012:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063018: .4byte 0x0201774C

	thumb_func_start NewEfxLokmsuna
NewEfxLokmsuna: @ 0x0806301C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08063040 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _0806303A
	ldr r0, _08063044 @ =0x08BA4434
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	bl NewEfxLokmsunaOBJ
_0806303A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063040: .4byte 0x0201774C
_08063044: .4byte 0x08BA4434

	thumb_func_start sub_08063048
sub_08063048: @ 0x08063048
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxLokmsunaOBJ
NewEfxLokmsunaOBJ: @ 0x08063054
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080630A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080630A4 @ =0x08BA444C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _080630A8 @ =0x08BD91D8
	ldr r3, _080630AC @ =0x08BD92FC
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, _080630B0 @ =0x00000FFF
	ldrh r1, [r6, #8]
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080630B4
	movs r1, #0xe0
	lsls r1, r1, #7
	b _080630B8
	.align 2, 0
_080630A0: .4byte 0x0201774C
_080630A4: .4byte 0x08BA444C
_080630A8: .4byte 0x08BD91D8
_080630AC: .4byte 0x08BD92FC
_080630B0: .4byte 0x00000FFF
_080630B4:
	movs r1, #0x90
	lsls r1, r1, #8
_080630B8:
	adds r0, r1, #0
	ldrh r1, [r6, #8]
	orrs r0, r1
	strh r0, [r6, #8]
	ldr r0, _080630D4 @ =0x082DE400
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080630D4: .4byte 0x082DE400

	thumb_func_start EfxLokmsunaIOBJMain
EfxLokmsunaIOBJMain: @ 0x080630D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _080630FE
	ldr r0, _08063104 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080630FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063104: .4byte 0x0201774C

	thumb_func_start sub_08063108
sub_08063108: @ 0x08063108
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063120 @ =0x08BA4464
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063120: .4byte 0x08BA4464

	thumb_func_start sub_08063124
sub_08063124: @ 0x08063124
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063146
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x28
	movs r3, #0
	bl NewEfxFlashUnit
	b _0806318A
_08063146:
	cmp r0, #0xa
	bne _08063154
	adds r0, r6, #0
	movs r1, #0x14
	bl NewEfxFlashBgWhite
	b _0806318A
_08063154:
	cmp r0, #0x2d
	bne _0806318A
	ldr r5, _08063190 @ =0x02000000
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl Proc_Break
_0806318A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063190: .4byte 0x02000000

	thumb_func_start sub_08063194
sub_08063194: @ 0x08063194
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080631AC @ =0x08BA447C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080631AC: .4byte 0x08BA447C

	thumb_func_start sub_080631B0
sub_080631B0: @ 0x080631B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080631CE
	adds r0, r6, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	b _08063204
_080631CE:
	cmp r0, #6
	bne _08063204
	ldr r5, _0806320C @ =0x02000000
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl Proc_Break
_08063204:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806320C: .4byte 0x02000000

	thumb_func_start NewEfxSongOBJ2
NewEfxSongOBJ2: @ 0x08063210
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063270 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063274 @ =0x08BA4494
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08063278 @ =0x08BA6660
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0806327C @ =0x081EB900
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063280 @ =0x081EB78C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl PlaySFX
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063270: .4byte 0x0201774C
_08063274: .4byte 0x08BA4494
_08063278: .4byte 0x08BA6660
_0806327C: .4byte 0x081EB900
_08063280: .4byte 0x081EB78C

	thumb_func_start EfxSongOBJ2Main
EfxSongOBJ2Main: @ 0x08063284
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _080632A8
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl PlaySFX
_080632A8:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _080632C8
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _080632D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080632C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080632D0: .4byte 0x0201774C

	thumb_func_start NewEfxDanceOBJ
NewEfxDanceOBJ: @ 0x080632D4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063334 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063338 @ =0x08BA44AC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x19
	strh r0, [r4, #0x2e]
	ldr r3, _0806333C @ =0x08BA6630
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _08063340 @ =0x081EB900
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063344 @ =0x081EB78C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe1
	movs r3, #1
	bl PlaySFX
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063334: .4byte 0x0201774C
_08063338: .4byte 0x08BA44AC
_0806333C: .4byte 0x08BA6630
_08063340: .4byte 0x081EB900
_08063344: .4byte 0x081EB78C

	thumb_func_start sub_08063348
sub_08063348: @ 0x08063348
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08063370
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08063378 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08063370:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063378: .4byte 0x0201774C

	thumb_func_start NewEfxSpecalEffect
NewEfxSpecalEffect: @ 0x0806337C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080633B0 @ =0x02017768
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080633CA
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	strh r1, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080633B8
	ldr r0, _080633B4 @ =0x0203E094
	b _080633BA
	.align 2, 0
_080633B0: .4byte 0x02017768
_080633B4: .4byte 0x0203E094
_080633B8:
	ldr r0, _080633F8 @ =0x0203E098
_080633BA:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsWeaponLegency
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08063400
_080633CA:
	ldr r4, _080633FC @ =0x02000000
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	movs r1, #0x40
	ldrh r0, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	b _08063422
	.align 2, 0
_080633F8: .4byte 0x0203E098
_080633FC: .4byte 0x02000000
_08063400:
	ldr r0, _08063428 @ =0x08BA44C4
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xf0
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r5, #0
	bl sub_08063438
_08063422:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063428: .4byte 0x08BA44C4

	thumb_func_start sub_0806342C
sub_0806342C: @ 0x0806342C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063438
sub_08063438: @ 0x08063438
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _08063454 @ =0x08BA44DC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063454: .4byte 0x08BA44DC

	thumb_func_start sub_08063458
sub_08063458: @ 0x08063458
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063472
	ldr r0, [r6, #0x5c]
	bl NewEfxSRankWeaponEffectBG
	b _080634BC
_08063472:
	cmp r0, #0x15
	bne _08063486
	ldr r0, [r6, #0x5c]
	movs r1, #0x2d
	movs r2, #1
	bl NewEfxRestWINH_
	bl sub_0806353C
	b _080634BC
_08063486:
	cmp r0, #0x46
	bne _080634BC
	ldr r5, _080634C4 @ =0x02000000
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_080634BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080634C4: .4byte 0x02000000

	thumb_func_start NewEfxSRankWeaponEffectBG
NewEfxSRankWeaponEffectBG: @ 0x080634C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08063504 @ =0x08BA44F4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08063508 @ =0x081F3440
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806350C @ =0x081F3500
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r2, _08063510 @ =0x081F3520
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063504: .4byte 0x08BA44F4
_08063508: .4byte 0x081F3440
_0806350C: .4byte 0x081F3500
_08063510: .4byte 0x081F3520

	thumb_func_start EfxSRankWeaponEffectBGMain
EfxSRankWeaponEffectBGMain: @ 0x08063514
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08063534
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08063534:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806353C
sub_0806353C: @ 0x0806353C
	push {lr}
	ldr r0, _08063558 @ =0x08BA450C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl NewEfxSRankWeaponEffectSCR2
	pop {r0}
	bx r0
	.align 2, 0
_08063558: .4byte 0x08BA450C

	thumb_func_start EfxSRankWeaponEffectSCRMain
EfxSRankWeaponEffectSCRMain: @ 0x0806355C
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, _080635A4 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _080635A8 @ =0x0201FDB8
	cmp r0, #0
	bne _0806356C
	ldr r4, _080635AC @ =0x0201FEF8
_0806356C:
	movs r3, #0
	movs r7, #0x88
	lsls r7, r7, #0x10
	movs r6, #0x88
	ldr r5, _080635B0 @ =0x08BA453C
_08063576:
	cmp r3, #0x77
	bhi _080635C2
	movs r0, #0
	ldrsh r1, [r5, r0]
	mov r2, ip
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080635BE
	cmp r3, #0x3b
	bhi _080635B8
	adds r0, r3, #0
	subs r0, #0x88
	cmp r1, r0
	bhs _080635BE
	ldr r1, _080635B4 @ =0x0000FF78
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080635BE
	.align 2, 0
_080635A4: .4byte 0x0201FDAC
_080635A8: .4byte 0x0201FDB8
_080635AC: .4byte 0x0201FEF8
_080635B0: .4byte 0x08BA453C
_080635B4: .4byte 0x0000FF78
_080635B8:
	cmp r1, r6
	bls _080635BE
	lsrs r2, r7, #0x10
_080635BE:
	strh r2, [r4]
	b _080635C6
_080635C2:
	movs r0, #0
	strh r0, [r4]
_080635C6:
	adds r4, #2
	ldr r2, _080635DC @ =0xFFFF0000
	adds r7, r7, r2
	subs r6, #1
	adds r5, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _08063576
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080635DC: .4byte 0xFFFF0000

	thumb_func_start NewEfxSRankWeaponEffectSCR2
NewEfxSRankWeaponEffectSCR2: @ 0x080635E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080635FC @ =0x08BA4524
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080635FC: .4byte 0x08BA4524

	thumb_func_start sub_08063600
sub_08063600: @ 0x08063600
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806363C
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806363C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08063644
sub_08063644: @ 0x08063644
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _08063660 @ =0x08BA462C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063660: .4byte 0x08BA462C

	thumb_func_start sub_08063664
sub_08063664: @ 0x08063664
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0806369A
	ldr r0, [r5, #0x5c]
	movs r1, #0x49
	bl sub_080636AC
	movs r4, #0xa0
	lsls r4, r4, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	ldr r0, [r5, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_0806369A:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x64
	bne _080636A6
	adds r0, r5, #0
	bl Proc_Break
_080636A6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080636AC
sub_080636AC: @ 0x080636AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806372C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063730 @ =0x08BA4644
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _08063734 @ =0x081E971C
	str r1, [r0, #0x48]
	ldr r1, _08063738 @ =0x08BA465C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0806373C @ =0x081FAC38
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08063740 @ =0x081F9FC4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r3, _08063744 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806372C: .4byte 0x0201774C
_08063730: .4byte 0x08BA4644
_08063734: .4byte 0x081E971C
_08063738: .4byte 0x08BA465C
_0806373C: .4byte 0x081FAC38
_08063740: .4byte 0x081F9FC4
_08063744: .4byte 0x03002870

	thumb_func_start sub_08063748
sub_08063748: @ 0x08063748
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08063774
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
_08063774:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _080637C6
	ldr r3, _080637CC @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	bl SpellFx_ClearBG1
	ldr r1, _080637D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080637C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080637CC: .4byte 0x03002870
_080637D0: .4byte 0x0201774C

	thumb_func_start NewEfxMantBatabata
NewEfxMantBatabata: @ 0x080637D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetAnimPosition
	ldr r1, _08063800 @ =0x0203E08E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x57
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1b
	bhi _080638C8
	lsls r0, r0, #2
	ldr r1, _08063804 @ =_08063808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063800: .4byte 0x0203E08E
_08063804: .4byte _08063808
_08063808: @ jump table
	.4byte _08063878 @ case 0
	.4byte _08063878 @ case 1
	.4byte _08063888 @ case 2
	.4byte _080638C8 @ case 3
	.4byte _08063888 @ case 4
	.4byte _080638C8 @ case 5
	.4byte _080638C8 @ case 6
	.4byte _080638C8 @ case 7
	.4byte _080638C8 @ case 8
	.4byte _080638C8 @ case 9
	.4byte _080638C8 @ case 10
	.4byte _080638C8 @ case 11
	.4byte _080638C8 @ case 12
	.4byte _080638C8 @ case 13
	.4byte _080638C8 @ case 14
	.4byte _080638C8 @ case 15
	.4byte _080638C8 @ case 16
	.4byte _08063898 @ case 17
	.4byte _080638C8 @ case 18
	.4byte _080638C8 @ case 19
	.4byte _080638B8 @ case 20
	.4byte _080638B8 @ case 21
	.4byte _080638C8 @ case 22
	.4byte _080638C8 @ case 23
	.4byte _080638C8 @ case 24
	.4byte _080638C8 @ case 25
	.4byte _080638A8 @ case 26
	.4byte _080638A8 @ case 27
_08063878:
	ldr r5, _08063880 @ =0x08BB17E8
	ldr r4, _08063884 @ =0x08BB197C
	b _080638CC
	.align 2, 0
_08063880: .4byte 0x08BB17E8
_08063884: .4byte 0x08BB197C
_08063888:
	ldr r5, _08063890 @ =0x08BB1B28
	ldr r4, _08063894 @ =0x08BB1CD4
	b _080638CC
	.align 2, 0
_08063890: .4byte 0x08BB1B28
_08063894: .4byte 0x08BB1CD4
_08063898:
	ldr r5, _080638A0 @ =0x08BB1E80
	ldr r4, _080638A4 @ =0x08BB2028
	b _080638CC
	.align 2, 0
_080638A0: .4byte 0x08BB1E80
_080638A4: .4byte 0x08BB2028
_080638A8:
	ldr r5, _080638B0 @ =0x08BB2164
	ldr r4, _080638B4 @ =0x08BB229C
	b _080638CC
	.align 2, 0
_080638B0: .4byte 0x08BB2164
_080638B4: .4byte 0x08BB229C
_080638B8:
	ldr r5, _080638C0 @ =0x08BB2500
	ldr r4, _080638C4 @ =0x08BB2768
	b _080638CC
	.align 2, 0
_080638C0: .4byte 0x08BB2500
_080638C4: .4byte 0x08BB2768
_080638C8:
	ldr r5, _08063924 @ =0x08BB288C
	ldr r4, _08063928 @ =0x08BB29B0
_080638CC:
	ldr r0, _0806392C @ =0x08BA466C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r7, [r6, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r6, #0x2c]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08063930 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r6, #0x60]
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08063934
	movs r1, #0xe4
	lsls r1, r1, #7
	b _08063938
	.align 2, 0
_08063924: .4byte 0x08BB288C
_08063928: .4byte 0x08BB29B0
_0806392C: .4byte 0x08BA466C
_08063930: .4byte 0x02000010
_08063934:
	movs r1, #0x93
	lsls r1, r1, #8
_08063938:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxMantBatabata_Loop1
EfxMantBatabata_Loop1: @ 0x08063958
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldr r0, [r2, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldr r0, [r2, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806397E
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806397E
	adds r0, r2, #0
	bl Proc_Break
_0806397E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxMantBatabata_Loop2
EfxMantBatabata_Loop2: @ 0x08063984
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bl CheckEkrHitDone
	cmp r0, #1
	bne _080639BE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _080639C4 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_080639BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080639C4: .4byte 0x02000010

	thumb_func_start sub_080639C8
sub_080639C8: @ 0x080639C8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _080639E4 @ =0x08BA468C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080639E4: .4byte 0x08BA468C

	thumb_func_start EfxChillEffectMain
EfxChillEffectMain: @ 0x080639E8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063A08
	ldr r0, [r4, #0x5c]
	bl NewEfxChillEffectBG
	ldr r0, [r4, #0x5c]
	bl NewEfxChillEffectBGCOL
	b _08063A24
_08063A08:
	cmp r0, #3
	beq _08063A10
	cmp r0, #0x11
	bne _08063A1A
_08063A10:
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgBlack
	b _08063A24
_08063A1A:
	cmp r0, #0x24
	bne _08063A24
	adds r0, r4, #0
	bl Proc_Break
_08063A24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxChillEffectBG
NewEfxChillEffectBG: @ 0x08063A2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08063A70 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063A74 @ =0x08BA46A4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08063A78 @ =0x081E973A
	str r1, [r0, #0x48]
	ldr r1, _08063A7C @ =0x08BA46BC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08063A80 @ =0x08296F50
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063A70: .4byte 0x0201774C
_08063A74: .4byte 0x08BA46A4
_08063A78: .4byte 0x081E973A
_08063A7C: .4byte 0x08BA46BC
_08063A80: .4byte 0x08296F50

	thumb_func_start sub_08063A84
sub_08063A84: @ 0x08063A84
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08063AB2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08063AD0
_08063AB2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08063AD0
	bl SpellFx_ClearBG1
	ldr r1, _08063AD8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08063AD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063AD8: .4byte 0x0201774C

	thumb_func_start NewEfxChillEffectBGCOL
NewEfxChillEffectBGCOL: @ 0x08063ADC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063B00 @ =0x08BA46C8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08063B04 @ =0x081E9748
	str r1, [r0, #0x48]
	ldr r1, _08063B08 @ =0x082B3D7C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063B00: .4byte 0x08BA46C8
_08063B04: .4byte 0x081E9748
_08063B08: .4byte 0x082B3D7C

	thumb_func_start sub_08063B0C
sub_08063B0C: @ 0x08063B0C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08063B32
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08063B40
_08063B32:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08063B40
	adds r0, r4, #0
	bl Proc_Break
_08063B40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxChillAnime
NewEfxChillAnime: @ 0x08063B48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	cmp r1, #0
	bne _08063B64
	ldr r6, _08063B5C @ =0x08BD5644
	ldr r4, _08063B60 @ =0x08BD5848
	b _08063B68
	.align 2, 0
_08063B5C: .4byte 0x08BD5644
_08063B60: .4byte 0x08BD5848
_08063B64:
	ldr r6, _08063BC0 @ =0x08BD5BFC
	ldr r4, _08063BC4 @ =0x08BD5FB0
_08063B68:
	ldr r0, _08063BC8 @ =0x08BA46E8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r6, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _08063BCC @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r5, #0x60]
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08063BD0
	movs r1, #0xe4
	lsls r1, r1, #7
	b _08063BD4
	.align 2, 0
_08063BC0: .4byte 0x08BD5BFC
_08063BC4: .4byte 0x08BD5FB0
_08063BC8: .4byte 0x08BA46E8
_08063BCC: .4byte 0x02000010
_08063BD0:
	movs r1, #0x93
	lsls r1, r1, #8
_08063BD4:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08063BF4
sub_08063BF4: @ 0x08063BF4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _08063C60
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r6, #0x60]
	bl AnimDelete
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08063C68 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r5, _08063C6C @ =0x02000000
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_08063C60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063C68: .4byte 0x02000010
_08063C6C: .4byte 0x02000000

	thumb_func_start sub_08063C70
sub_08063C70: @ 0x08063C70
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _08063C8C @ =0x08BA4700
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063C8C: .4byte 0x08BA4700

	thumb_func_start sub_08063C90
sub_08063C90: @ 0x08063C90
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063CDC
	adds r0, r1, #0
	bl sub_08063D44
	ldr r0, [r6, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _08063CC2
	movs r0, #0xba
	lsls r0, r0, #2
	b _08063CC4
_08063CC2:
	ldr r0, _08063CD8 @ =0x000002E3
_08063CC4:
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08063D38
	.align 2, 0
_08063CD8: .4byte 0x000002E3
_08063CDC:
	cmp r0, #0x1a
	bne _08063D02
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	bl NewEfxDrsmmoyaScroll
	adds r1, r0, #0
	ldr r0, [r6, #0x5c]
	movs r2, #0xa
	str r2, [sp]
	movs r3, #0x2d
	bl NewEfxDrsmmoyaScrollCOL
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	movs r2, #1
	bl NewEfxRestWINH_
	b _08063D38
_08063D02:
	cmp r0, #0x6f
	bne _08063D38
	ldr r5, _08063D40 @ =0x02000000
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_08063D38:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063D40: .4byte 0x02000000

	thumb_func_start sub_08063D44
sub_08063D44: @ 0x08063D44
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08063DC0 @ =0x08BA4718
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r4, #0
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _08063DC4 @ =0x081E9792
	str r0, [r5, #0x48]
	ldr r0, _08063DC8 @ =0x08BA4730
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08063DCC @ =0x08BA4764
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _08063DD0 @ =0x082B83B4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, _08063DD4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #1
	movs r0, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08063DD8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08063DE6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08063DDC
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08063DE6
	.align 2, 0
_08063DC0: .4byte 0x08BA4718
_08063DC4: .4byte 0x081E9792
_08063DC8: .4byte 0x08BA4730
_08063DCC: .4byte 0x08BA4764
_08063DD0: .4byte 0x082B83B4
_08063DD4: .4byte 0x03002870
_08063DD8: .4byte 0x0203E02C
_08063DDC:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08063DE6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxDrsmmoyaBG_Loop
EfxDrsmmoyaBG_Loop: @ 0x08063DEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08063E3C
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08063E26
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08063E26:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08063E52
_08063E3C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08063E52
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08063E52:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxDrsmmoyaScroll
NewEfxDrsmmoyaScroll: @ 0x08063E5C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08063E80 @ =0x08BA4798
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [r0, #0x48]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08063E80: .4byte 0x08BA4798

	thumb_func_start EfxDrsmmoyaScroll_Loop
EfxDrsmmoyaScroll_Loop: @ 0x08063E84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _08063EF4 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _08063EF8 @ =0x0201FDB8
	cmp r0, #0
	bne _08063E98
	ldr r4, _08063EFC @ =0x0201FEF8
_08063E98:
	movs r3, #0
	ldr r0, [r2, #0x44]
	mov ip, r0
	ldr r1, _08063F00 @ =0x080C5A48
	mov r8, r1
	movs r6, #0xff
	ldr r5, [r2, #0x48]
_08063EA6:
	lsls r0, r3, #1
	movs r7, #0x2e
	ldrsh r1, [r2, r7]
	adds r0, r0, r1
	ands r0, r6
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #9
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r0, r5, r0
	asrs r0, r0, #8
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0x4f
	bls _08063EA6
	ldrh r0, [r2, #0x2e]
	adds r0, #2
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	bne _08063EE8
	adds r0, r2, #0
	bl Proc_End
_08063EE8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063EF4: .4byte 0x0201FDAC
_08063EF8: .4byte 0x0201FDB8
_08063EFC: .4byte 0x0201FEF8
_08063F00: .4byte 0x080C5A48

	thumb_func_start NewEfxDrsmmoyaScrollCOL
NewEfxDrsmmoyaScrollCOL: @ 0x08063F04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r0, _08063F38 @ =0x08BA47B0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	str r7, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063F38: .4byte 0x08BA47B0

	thumb_func_start EfxDrsmmoyaScrollCOL_Loop1
EfxDrsmmoyaScrollCOL_Loop1: @ 0x08063F3C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	ldr r0, [r5, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r4, #0x48]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _08063F74
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08063F74:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxDrsmmoyaScrollCOL_Delay
EfxDrsmmoyaScrollCOL_Delay: @ 0x08063F7C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x48]
	cmp r0, r1
	ble _08063F9A
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_08063F9A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxDrsmmoyaScrollCOL_Loop3
EfxDrsmmoyaScrollCOL_Loop3: @ 0x08063FA0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	ldr r0, [r5, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x48]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x4c]
	cmp r0, r1
	ble _08063FD8
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08063FD8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ResetClassReelSpell
ResetClassReelSpell: @ 0x08063FE0
	ldr r0, _08063FEC @ =0x0203E0F4
	movs r1, #0
	str r1, [r0]
	ldr r0, _08063FF0 @ =0x0203E0F8
	str r1, [r0]
	bx lr
	.align 2, 0
_08063FEC: .4byte 0x0203E0F4
_08063FF0: .4byte 0x0203E0F8

	thumb_func_start EndActiveClassReelSpell
EndActiveClassReelSpell: @ 0x08063FF4
	push {r4, lr}
	ldr r4, _0806400C @ =0x0203E0F4
	ldr r0, [r4]
	cmp r0, #0
	beq _08064006
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08064006:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806400C: .4byte 0x0203E0F4

	thumb_func_start EndActiveClassReelBgColorProc
EndActiveClassReelBgColorProc: @ 0x08064010
	push {r4, lr}
	ldr r4, _08064028 @ =0x0203E0F8
	ldr r0, [r4]
	cmp r0, #0
	beq _08064022
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08064022:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064028: .4byte 0x0203E0F8

	thumb_func_start SetActiveClassReelSpell
SetActiveClassReelSpell: @ 0x0806402C
	ldr r1, _08064034 @ =0x0203E0F4
	str r0, [r1]
	bx lr
	.align 2, 0
_08064034: .4byte 0x0203E0F4

	thumb_func_start SetActiveCRSpellBgColorProc
SetActiveCRSpellBgColorProc: @ 0x08064038
	ldr r1, _08064040 @ =0x0203E0F8
	str r0, [r1]
	bx lr
	.align 2, 0
_08064040: .4byte 0x0203E0F8

	thumb_func_start GetMagicEffectBufferFor
GetMagicEffectBufferFor: @ 0x08064044
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start SetCRSpellBgPosition
SetCRSpellBgPosition: @ 0x0806404C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064068
	ldr r0, _08064064 @ =0x081D8599
	ldrh r1, [r4, #2]
	ldrb r0, [r0]
	subs r0, r1, r0
	b _08064070
	.align 2, 0
_08064064: .4byte 0x081D8599
_08064068:
	ldr r0, _080640A0 @ =0x081D859E
	ldrb r0, [r0]
	ldrh r3, [r4, #2]
	subs r0, r0, r3
_08064070:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x58
	ldrh r4, [r4, #4]
	subs r2, r2, r4
	ldrh r0, [r5, #0x12]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r5, [r5, #4]
	subs r2, r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080640A0: .4byte 0x081D859E

	thumb_func_start ClearCRSpellBgTmBuf
ClearCRSpellBgTmBuf: @ 0x080640A4
	push {r4, lr}
	sub sp, #4
	bl GetMagicEffectBufferFor
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x14]
	ldr r2, _080640D0 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080640D0: .4byte 0x01000200

	thumb_func_start sub_080640D4
sub_080640D4: @ 0x080640D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetMagicEffectBufferFor
	mov r8, r0
	cmp r4, #0
	bne _080640F4
	adds r0, r7, #0
	b _080640F6
_080640F4:
	adds r0, r6, #0
_080640F6:
	movs r1, #0x78
	bl AnimCreate
	adds r2, r0, #0
	mov r1, r8
	ldrh r1, [r1, #0x10]
	lsls r0, r1, #0xc
	mov r3, r8
	ldrh r3, [r3, #0xe]
	orrs r0, r3
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CRSpell_WriteBgMap
CRSpell_WriteBgMap: @ 0x08064128
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r5, r3, #0
	bl GetMagicEffectBufferFor
	adds r4, r0, #0
	cmp r5, #1
	bne _0806414A
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	bl LZ77UnCompWram
_0806414A:
	adds r2, r6, #0
	cmp r5, #1
	bne _08064152
	ldr r2, [r4, #0x1c]
_08064152:
	cmp r7, #0
	bne _0806416C
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08064180
_0806416C:
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08064180:
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CRSpell_RegisterBgGfx
CRSpell_RegisterBgGfx: @ 0x08064194
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl GetMagicEffectBufferFor
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	lsls r5, r0, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r5, r0
	ldr r1, [r4, #0x18]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x18]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CRSpell_RegisterBgPal
CRSpell_RegisterBgPal: @ 0x080641C4
	push {r4, lr}
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	ldrh r0, [r0, #0xc]
	lsls r1, r0, #5
	ldr r0, _080641E8 @ =0x02022860
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641E8: .4byte 0x02022860

	thumb_func_start sub_080641EC
sub_080641EC: @ 0x080641EC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl GetMagicEffectBufferFor
	adds r4, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r5, r0, #5
	ldr r0, _08064218 @ =0x06010000
	adds r5, r5, r0
	ldr r1, [r4, #0x20]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064218: .4byte 0x06010000

	thumb_func_start sub_0806421C
sub_0806421C: @ 0x0806421C
	push {r4, lr}
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	ldrh r0, [r0, #0x10]
	lsls r1, r0, #5
	ldr r0, _08064240 @ =0x02022A60
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064240: .4byte 0x02022A60

	thumb_func_start StartClassReelSpellAnim
StartClassReelSpellAnim: @ 0x08064244
	push {r4, lr}
	adds r4, r0, #0
	bl GetMagicEffectBufferFor
	ldr r1, _08064264 @ =0x08BA47D8
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064264: .4byte 0x08BA47D8

	thumb_func_start sub_08064268
sub_08064268: @ 0x08064268
	bx lr
	.align 2, 0

	thumb_func_start sub_0806426C
sub_0806426C: @ 0x0806426C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064288 @ =0x08BA47F8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	bl SetActiveClassReelSpell
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064288: .4byte 0x08BA47F8

	thumb_func_start efxopFire_Loop_Main
efxopFire_Loop_Main: @ 0x0806428C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopFireBG
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopFireOBJ
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartCRSubSpell_efxopFireBG
StartCRSubSpell_efxopFireBG: @ 0x080642AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _080642F8 @ =0x08BA4820
	adds r1, r4, #0
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080642FC @ =0x081E9838
	str r0, [r4, #0x48]
	ldr r0, _08064300 @ =0x08BA4838
	str r0, [r4, #0x4c]
	ldr r1, _08064304 @ =0x081FD2CC
	adds r0, r5, #0
	bl CRSpell_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, _08064308 @ =0x081FC6D4
	bl CRSpell_RegisterBgGfx
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl SetCRSpellBgPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080642F8: .4byte 0x08BA4820
_080642FC: .4byte 0x081E9838
_08064300: .4byte 0x08BA4838
_08064304: .4byte 0x081FD2CC
_08064308: .4byte 0x081FC6D4

	thumb_func_start efxopFireBG_Loop
efxopFireBG_Loop: @ 0x0806430C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064338
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl CRSpell_WriteBgMap
	b _08064350
_08064338:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064350
	ldr r0, [r4, #0x5c]
	bl ClearCRSpellBgTmBuf
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064350:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartCRSubSpell_efxopFireOBJ
StartCRSubSpell_efxopFireOBJ: @ 0x08064358
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	adds r7, r0, #0
	ldr r0, _08064394 @ =0x08BA4868
	adds r1, r4, #0
	bl SpawnProc
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08064398 @ =0x08BB46D0
	ldr r3, _0806439C @ =0x08BB4348
	adds r0, r5, #0
	movs r1, #1
	bl sub_080640D4
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080643A0
	ldrh r0, [r5, #2]
	subs r0, #8
	b _080643A4
	.align 2, 0
_08064394: .4byte 0x08BA4868
_08064398: .4byte 0x08BB46D0
_0806439C: .4byte 0x08BB4348
_080643A0:
	ldrh r0, [r5, #2]
	adds r0, #8
_080643A4:
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	adds r0, #8
	strh r0, [r4, #4]
	ldrh r2, [r4, #2]
	ldrh r3, [r7, #6]
	adds r1, r2, r3
	strh r1, [r4, #2]
	ldrh r7, [r7, #8]
	adds r0, r7, r0
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _080643D0 @ =0x081FEE00
	bl sub_0806421C
	ldr r0, [r6, #0x5c]
	ldr r1, _080643D4 @ =0x081FE804
	bl sub_080641EC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080643D0: .4byte 0x081FEE00
_080643D4: .4byte 0x081FE804

	thumb_func_start sub_080643D8
sub_080643D8: @ 0x080643D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _080643F6
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080643F6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080643FC
sub_080643FC: @ 0x080643FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064418 @ =0x08BA4880
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	bl SetActiveClassReelSpell
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064418: .4byte 0x08BA4880

	thumb_func_start efxopThunder_Loop_Main
efxopThunder_Loop_Main: @ 0x0806441C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopThunderBG
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopThunderBGCOL
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopThunderOBJ
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartCRSubSpell_efxopThunderBG
StartCRSubSpell_efxopThunderBG: @ 0x08064444
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _0806448C @ =0x08BA48A8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064490 @ =0x081E986A
	str r0, [r4, #0x48]
	ldr r0, _08064494 @ =0x08BA48C0
	str r0, [r4, #0x4c]
	ldr r1, _08064498 @ =0x081FBD70
	adds r0, r5, #0
	bl CRSpell_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, _0806449C @ =0x081FB4B4
	bl CRSpell_RegisterBgGfx
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl SetCRSpellBgPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806448C: .4byte 0x08BA48A8
_08064490: .4byte 0x081E986A
_08064494: .4byte 0x08BA48C0
_08064498: .4byte 0x081FBD70
_0806449C: .4byte 0x081FB4B4

	thumb_func_start efxopThunderBG_Loop
efxopThunderBG_Loop: @ 0x080644A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	ldr r0, [r4, #0x5c]
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08064502
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	movs r3, #1
	bl CRSpell_WriteBgMap
	cmp r5, #0
	bne _080644E4
	ldrh r0, [r6, #0xa]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_080644E4:
	cmp r5, #1
	bne _080644F0
	ldrh r0, [r6, #0xa]
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_080644F0:
	ldr r0, [r6, #0x14]
	adds r0, #0x3c
	ldrh r3, [r6, #0xc]
	str r7, [sp]
	movs r1, #2
	movs r2, #0x14
	bl FillBGRect
	b _0806451A
_08064502:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0806451A
	ldr r0, [r4, #0x5c]
	bl ClearCRSpellBgTmBuf
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0806451A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartCRSubSpell_efxopThunderBGCOL
StartCRSubSpell_efxopThunderBGCOL: @ 0x08064524
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806454C @ =0x08BA48C8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	bl SetActiveCRSpellBgColorProc
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064550 @ =0x081E9874
	str r0, [r4, #0x48]
	ldr r0, _08064554 @ =0x081FBD70
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806454C: .4byte 0x08BA48C8
_08064550: .4byte 0x081E9874
_08064554: .4byte 0x081FBD70

	thumb_func_start sub_08064558
sub_08064558: @ 0x08064558
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806457E
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl CRSpell_RegisterBgPal
	b _08064590
_0806457E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08064590
	bl EndActiveClassReelBgColorProc
	adds r0, r4, #0
	bl Proc_Break
_08064590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartCRSubSpell_efxopThunderOBJ
StartCRSubSpell_efxopThunderOBJ: @ 0x08064598
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r7, r0, #0
	ldr r0, _080645D4 @ =0x08BA48E8
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _080645D8 @ =0x08BB3F30
	ldr r3, _080645DC @ =0x08BB3404
	adds r0, r5, #0
	movs r1, #1
	bl sub_080640D4
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080645E0
	ldrh r0, [r5, #2]
	adds r0, #0x38
	b _080645E4
	.align 2, 0
_080645D4: .4byte 0x08BA48E8
_080645D8: .4byte 0x08BB3F30
_080645DC: .4byte 0x08BB3404
_080645E0:
	ldrh r0, [r5, #2]
	subs r0, #0x38
_080645E4:
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r2, [r7, #6]
	adds r0, r1, r2
	strh r0, [r4, #2]
	ldrh r1, [r4, #4]
	ldrh r7, [r7, #8]
	adds r0, r1, r7
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _0806460C @ =0x081FC634
	bl sub_0806421C
	ldr r0, [r6, #0x5c]
	ldr r1, _08064610 @ =0x081FC19C
	bl sub_080641EC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806460C: .4byte 0x081FC634
_08064610: .4byte 0x081FC19C

	thumb_func_start sub_08064614
sub_08064614: @ 0x08064614
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08064632
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08064632:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08064638
sub_08064638: @ 0x08064638
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08064650 @ =0x08BA4900
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064650: .4byte 0x08BA4900

	thumb_func_start sub_08064654
sub_08064654: @ 0x08064654
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_080648AC
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopLiveBG
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_08064768
	ldr r3, _080646C4 @ =0x03002870
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
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl StartCRSubSpell_efxopLiveALPHA
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl StartCRSubSpell_efxopLiveALPHA
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080646C4: .4byte 0x03002870

	thumb_func_start StartCRSubSpell_efxopLiveBG
StartCRSubSpell_efxopLiveBG: @ 0x080646C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _0806470C @ =0x08BA4928
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	bl SetActiveClassReelSpell
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064710 @ =0x081E98B6
	str r0, [r4, #0x48]
	ldr r0, _08064714 @ =0x08BA4940
	str r0, [r4, #0x4c]
	ldr r1, _08064718 @ =0x08269CF8
	adds r0, r5, #0
	bl CRSpell_RegisterBgGfx
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl SetCRSpellBgPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806470C: .4byte 0x08BA4928
_08064710: .4byte 0x081E98B6
_08064714: .4byte 0x08BA4940
_08064718: .4byte 0x08269CF8

	thumb_func_start efxopLiveBG_Loop
efxopLiveBG_Loop: @ 0x0806471C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064748
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #0
	bl CRSpell_WriteBgMap
	b _08064760
_08064748:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064760
	ldr r0, [r4, #0x5c]
	bl ClearCRSpellBgTmBuf
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064768
sub_08064768: @ 0x08064768
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064790 @ =0x08BA4944
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	bl SetActiveCRSpellBgColorProc
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064794 @ =0x081E98BC
	str r0, [r4, #0x48]
	ldr r0, _08064798 @ =0x0826A7E8
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064790: .4byte 0x08BA4944
_08064794: .4byte 0x081E98BC
_08064798: .4byte 0x0826A7E8

	thumb_func_start sub_0806479C
sub_0806479C: @ 0x0806479C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080647C2
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl CRSpell_RegisterBgPal
	b _080647D4
_080647C2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080647D4
	bl EndActiveClassReelBgColorProc
	adds r0, r4, #0
	bl Proc_Break
_080647D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartCRSubSpell_efxopLiveALPHA
StartCRSubSpell_efxopLiveALPHA: @ 0x080647DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08064808 @ =0x08BA4964
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064808: .4byte 0x08BA4964

	thumb_func_start sub_0806480C
sub_0806480C: @ 0x0806480C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08064822
	adds r0, r1, #0
	bl Proc_Break
_08064822:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064828
sub_08064828: @ 0x08064828
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _08064842
	adds r0, r4, #0
	bl Proc_Break
	b _080648A0
_08064842:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806485E
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b _0806486E
_0806485E:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
_0806486E:
	bl Interpolate
	adds r5, r0, #0
	ldr r3, _080648A8 @ =0x03002870
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
	movs r1, #0
	strb r5, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_080648A0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080648A8: .4byte 0x03002870

	thumb_func_start sub_080648AC
sub_080648AC: @ 0x080648AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _08064900 @ =0x08BA4984
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _08064904 @ =0x08BBE6B0
	adds r0, r5, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_080640D4
	str r0, [r4, #0x60]
	ldrh r2, [r0, #2]
	ldrh r3, [r6, #6]
	adds r1, r2, r3
	strh r1, [r0, #2]
	ldrh r2, [r0, #4]
	ldrh r6, [r6, #8]
	adds r1, r2, r6
	strh r1, [r0, #4]
	ldr r0, [r4, #0x5c]
	ldr r1, _08064908 @ =0x0826AC3C
	bl sub_0806421C
	ldr r0, [r4, #0x5c]
	ldr r1, _0806490C @ =0x0826A9E8
	bl sub_080641EC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064900: .4byte 0x08BA4984
_08064904: .4byte 0x08BBE6B0
_08064908: .4byte 0x0826AC3C
_0806490C: .4byte 0x0826A9E8

	thumb_func_start sub_08064910
sub_08064910: @ 0x08064910
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08064930
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08064930:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064938
sub_08064938: @ 0x08064938
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064954 @ =0x08BA499C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	bl SetActiveClassReelSpell
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064954: .4byte 0x08BA499C

	thumb_func_start sub_08064958
sub_08064958: @ 0x08064958
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopLightningBG
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartCRSubSpell_efxopLightningBG
StartCRSubSpell_efxopLightningBG: @ 0x08064970
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _080649B4 @ =0x08BA49C4
	adds r1, r4, #0
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080649B8 @ =0x081E98FE
	str r0, [r4, #0x48]
	ldr r0, _080649BC @ =0x08BA4AE4
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _080649C0 @ =0x08BA49DC
	str r0, [r4, #0x54]
	ldr r0, _080649C4 @ =0x08BA4A60
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl SetCRSpellBgPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080649B4: .4byte 0x08BA49C4
_080649B8: .4byte 0x081E98FE
_080649BC: .4byte 0x08BA4AE4
_080649C0: .4byte 0x08BA49DC
_080649C4: .4byte 0x08BA4A60

	thumb_func_start efxopLightningBG_Loop
efxopLightningBG_Loop: @ 0x080649C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08064A0C
	ldr r6, [r7, #0x4c]
	ldr r1, [r7, #0x54]
	ldr r5, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl CRSpell_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	bl CRSpell_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r4, r4, r6
	ldr r2, [r4]
	movs r1, #0
	movs r3, #1
	bl CRSpell_WriteBgMap
	b _08064A24
_08064A0C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08064A24
	ldr r0, [r7, #0x5c]
	bl ClearCRSpellBgTmBuf
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_08064A24:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064A2C
sub_08064A2C: @ 0x08064A2C
	ldr r0, _08064A38 @ =0x02020040
	movs r1, #1
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08064A38: .4byte 0x02020040

	thumb_func_start GetKeyStatus_IgnoreMask
GetKeyStatus_IgnoreMask: @ 0x08064A3C
	ldr r0, _08064A44 @ =0x02020040
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08064A44: .4byte 0x02020040

	thumb_func_start ResetEkrDragonStatus
ResetEkrDragonStatus: @ 0x08064A48
	ldr r1, _08064A64 @ =0x02020040
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r1, _08064A68 @ =0x02020050
	strh r0, [r1]
	strh r0, [r1, #2]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_08064A64: .4byte 0x02020040
_08064A68: .4byte 0x02020050

	thumb_func_start GetEkrDragonStatus
GetEkrDragonStatus: @ 0x08064A6C
	push {lr}
	bl GetAnimPosition
	cmp r0, #0
	beq _08064A80
	ldr r0, _08064A7C @ =0x02020050
	b _08064A82
	.align 2, 0
_08064A7C: .4byte 0x02020050
_08064A80:
	ldr r0, _08064A88 @ =0x02020040
_08064A82:
	pop {r1}
	bx r1
	.align 2, 0
_08064A88: .4byte 0x02020040

	thumb_func_start GetEkrDragonStatusAttr
GetEkrDragonStatusAttr: @ 0x08064A8C
	push {lr}
	bl GetEkrDragonStatus
	ldrh r0, [r0, #2]
	pop {r1}
	bx r1

	thumb_func_start AddEkrDragonStatusAttr
AddEkrDragonStatusAttr: @ 0x08064A98
	push {r4, lr}
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetEkrDragonStatus
	ldrh r1, [r0, #2]
	orrs r4, r1
	strh r4, [r0, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetEkrDragonStatusType
GetEkrDragonStatusType: @ 0x08064AB0
	push {lr}
	bl GetEkrDragonStatusType_
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetEkrDragonStatusType_
GetEkrDragonStatusType_: @ 0x08064ABC
	push {lr}
	bl GetEkrDragonStatus
	ldrh r0, [r0]
	pop {r1}
	bx r1

	thumb_func_start AddEkrDragonStatusType
AddEkrDragonStatusType: @ 0x08064AC8
	push {r4, lr}
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetEkrDragonStatus
	ldrh r1, [r0]
	orrs r4, r1
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CheckInEkrDragon
CheckInEkrDragon: @ 0x08064AE0
	push {lr}
	bl GetKeyStatus_IgnoreMask
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EkrDragonTmCpyHFlip
EkrDragonTmCpyHFlip: @ 0x08064AEC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064B28
	asrs r2, r4, #3
	asrs r4, r5, #3
	ldr r0, _08064B30 @ =0x02019784
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	lsls r3, r4, #5
	adds r3, r3, r4
	lsls r3, r3, #2
	ldr r4, _08064B34 @ =0x0201D41C
	adds r3, r3, r4
	adds r2, r2, r3
	movs r3, #0x20
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #6
	str r3, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
_08064B28:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064B30: .4byte 0x02019784
_08064B34: .4byte 0x0201D41C

	thumb_func_start EkrDragonTmCpyExt
EkrDragonTmCpyExt: @ 0x08064B38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064B86
	asrs r4, r7, #3
	movs r1, #7
	asrs r5, r6, #3
	ands r6, r1
	movs r0, #3
	ands r1, r7
	adds r2, r6, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _08064B90 @ =0x0201D45E
	adds r4, r4, r0
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r2, _08064B94 @ =0x02024460
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
_08064B86:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064B90: .4byte 0x0201D45E
_08064B94: .4byte 0x02024460

	thumb_func_start EkrDragonTmCpyWithDistance
EkrDragonTmCpyWithDistance: @ 0x08064B98
	push {lr}
	ldr r0, _08064BB0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08064BBE
	cmp r0, #1
	bgt _08064BB4
	cmp r0, #0
	beq _08064BBA
	b _08064BD2
	.align 2, 0
_08064BB0: .4byte 0x0203E02C
_08064BB4:
	cmp r0, #2
	beq _08064BC8
	b _08064BD2
_08064BBA:
	movs r0, #0xf8
	b _08064BC0
_08064BBE:
	movs r0, #0xc0
_08064BC0:
	movs r1, #0
	bl EkrDragonTmCpyHFlip
	b _08064BD2
_08064BC8:
	movs r0, #0x10
	rsbs r0, r0, #0
	movs r1, #0
	bl EkrDragonTmCpyHFlip
_08064BD2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrDragonIntroDone
EkrDragonIntroDone: @ 0x08064BD8
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08064BEE
	movs r0, #0
	b _08064BF0
_08064BEE:
	movs r0, #1
_08064BF0:
	pop {r1}
	bx r1

	thumb_func_start CheckEkrDragonEndingDone
CheckEkrDragonEndingDone: @ 0x08064BF4
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08064C0A
	movs r0, #0
	b _08064C0C
_08064C0A:
	movs r0, #1
_08064C0C:
	pop {r1}
	bx r1

	thumb_func_start NewEkrDragon
NewEkrDragon: @ 0x08064C10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetEkrDragonStatus
	adds r6, r0, #0
	ldr r0, _08064C3C @ =0x08BD9318
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r4, [r6, #4]
	adds r0, r5, #0
	movs r1, #1
	bl AddEkrDragonStatusAttr
	str r5, [r6, #0xc]
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064C3C: .4byte 0x08BD9318

	thumb_func_start SetEkrDragonExit
SetEkrDragonExit: @ 0x08064C40
	push {lr}
	movs r1, #4
	bl AddEkrDragonStatusAttr
	pop {r0}
	bx r0

	thumb_func_start SetEfxDragonDeadFallHead
SetEfxDragonDeadFallHead: @ 0x08064C4C
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #5
	bl AddEkrDragonStatusAttr
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CheckEfxDragonDeadFallHead
CheckEfxDragonDeadFallHead: @ 0x08064C5C
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	bne _08064C74
	movs r0, #0
	b _08064C76
_08064C74:
	movs r0, #1
_08064C76:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start InitEkrDragonStatus
InitEkrDragonStatus: @ 0x08064C7C
	push {lr}
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064C8C
	movs r0, #0
	bl SetAnimStateHidden
_08064C8C:
	pop {r0}
	bx r0

	thumb_func_start EkrDragonUpdateFlashingUnit
EkrDragonUpdateFlashingUnit: @ 0x08064C90
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064CCA
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064CBC
	ldr r0, _08064CB4 @ =0x081D97D0
	ldr r1, _08064CB8 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	b _08064CC6
	.align 2, 0
_08064CB4: .4byte 0x081D97D0
_08064CB8: .4byte 0x02022920
_08064CBC:
	ldr r0, _08064CD0 @ =0x081D97D0
	ldr r1, _08064CD4 @ =0x02022940
	movs r2, #8
	bl CpuFastSet
_08064CC6:
	bl EnablePalSync
_08064CCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064CD0: .4byte 0x081D97D0
_08064CD4: .4byte 0x02022940

	thumb_func_start BanimSetFrontPaletteForDragon
BanimSetFrontPaletteForDragon: @ 0x08064CD8
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064D12
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064D04
	ldr r0, _08064CFC @ =0x082E0FEC
	ldr r1, _08064D00 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	b _08064D0E
	.align 2, 0
_08064CFC: .4byte 0x082E0FEC
_08064D00: .4byte 0x02022920
_08064D04:
	ldr r0, _08064D18 @ =0x082E0FEC
	ldr r1, _08064D1C @ =0x02022940
	movs r2, #8
	bl CpuFastSet
_08064D0E:
	bl EnablePalSync
_08064D12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064D18: .4byte 0x082E0FEC
_08064D1C: .4byte 0x02022940

	thumb_func_start EkrDragonUpdatePal_08065510
EkrDragonUpdatePal_08065510: @ 0x08064D20
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08064D44 @ =0x082E589C
	ldr r4, _08064D48 @ =0x020228E0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064D44: .4byte 0x082E589C
_08064D48: .4byte 0x020228E0

	thumb_func_start EkrDragon_Preparefx
EkrDragon_Preparefx: @ 0x08064D4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #0x8a
	bl EkrPrepareBanimfx
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonBaseHide
	ldr r1, _08064D70 @ =0x0203E024
	movs r0, #0x13
	strh r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064D70: .4byte 0x0203E024

	thumb_func_start EkrDragon_CustomBgFadeIn
EkrDragon_CustomBgFadeIn: @ 0x08064D74
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08064DA8
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08064DA8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08064DB0
sub_08064DB0: @ 0x08064DB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _08064E4C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldr r0, _08064E50 @ =0x082DE7E8
	ldr r1, _08064E54 @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _08064E58 @ =0x082E10CC
	ldr r1, _08064E5C @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _08064E60 @ =0x082E0FEC
	ldr r1, _08064E64 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08064E68 @ =0x001F001F
	bl sub_080507B8
	ldr r0, _08064E6C @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	movs r0, #0
	movs r1, #0x78
	bl EkrDragonTmCpyHFlip
	movs r0, #0xf8
	rsbs r0, r0, #0
	movs r1, #0
	bl EkrDragonTmCpyExt
	bl EnablePalSync
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0x78
	movs r2, #0x60
	movs r3, #2
	bl NewEkrDragonBg3HfScrollHandler
	str r0, [r4, #0x64]
	movs r0, #0x78
	movs r1, #0
	bl sub_08065DC8
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E4C: .4byte 0x03002870
_08064E50: .4byte 0x082DE7E8
_08064E54: .4byte 0x06008000
_08064E58: .4byte 0x082E10CC
_08064E5C: .4byte 0x02019784
_08064E60: .4byte 0x082E0FEC
_08064E64: .4byte 0x02022920
_08064E68: .4byte 0x001F001F
_08064E6C: .4byte 0x02024460

	thumb_func_start sub_08064E70
sub_08064E70: @ 0x08064E70
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0xf8
	rsbs r1, r1, #0
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl EkrDragonTmCpyExt
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _08064ECC
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08064ECC:
	ldrh r5, [r5, #0x2c]
	cmp r5, #0xf
	bne _08064EE0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xe6
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08064EE0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08064EE8
sub_08064EE8: @ 0x08064EE8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08064F50
	ldr r5, _08064F0C @ =0x0203E02C
	ldrh r0, [r5]
	cmp r0, #2
	bne _08064F10
	adds r0, r4, #0
	bl Proc_Break
	b _08064F50
	.align 2, 0
_08064F0C: .4byte 0x0203E02C
_08064F10:
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonTunkFace
	adds r2, r0, #0
	str r2, [r4, #0x64]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08064F2C
	cmp r0, #1
	beq _08064F3C
	b _08064F44
_08064F2C:
	ldr r1, _08064F38 @ =0x0201FB00
	movs r0, #0x38
	ldrh r1, [r1]
	subs r0, r0, r1
	b _08064F42
	.align 2, 0
_08064F38: .4byte 0x0201FB00
_08064F3C:
	ldr r0, _08064F58 @ =0x0201FB00
	ldrh r0, [r0]
	rsbs r0, r0, #0
_08064F42:
	strh r0, [r2, #0x34]
_08064F44:
	ldr r1, [r4, #0x64]
	movs r0, #0x4c
	strh r0, [r1, #0x3c]
	adds r0, r4, #0
	bl Proc_Break
_08064F50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064F58: .4byte 0x0201FB00

	thumb_func_start sub_08064F5C
sub_08064F5C: @ 0x08064F5C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x64]
	ldr r0, _08064F80 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _08064F84
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl Proc_Break
	b _08064FDA
	.align 2, 0
_08064F80: .4byte 0x0203E02C
_08064F84:
	movs r0, #0x34
	ldrsh r2, [r6, r0]
	adds r1, r2, #0
	subs r1, #0x30
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x10
	str r4, [sp]
	movs r0, #1
	bl Interpolate
	strh r0, [r6, #0x32]
	movs r0, #0x3c
	ldrsh r2, [r6, r0]
	adds r1, r2, #0
	subs r1, #0x80
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #1
	bl Interpolate
	strh r0, [r6, #0x3a]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08064FDA
	ldr r0, [r5, #0x64]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl Proc_Break
_08064FDA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08064FE4
sub_08064FE4: @ 0x08064FE4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08065020 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _08065024
	ldr r0, [r6, #0x5c]
	bl sub_08065904
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl sub_08065A10
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl sub_08065C24
	str r0, [r6, #0x4c]
	bl sub_08065B90
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFireBG2
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	b _080650E6
	.align 2, 0
_08065020: .4byte 0x0203E02C
_08065024:
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080650E6
	strh r1, [r6, #0x2c]
	movs r0, #0x80
	strh r0, [r6, #0x2e]
	movs r0, #0x20
	strh r0, [r6, #0x3a]
	strh r1, [r6, #0x3c]
	ldr r0, [r6, #0x5c]
	bl sub_08065748
	str r0, [r6, #0x64]
	ldr r1, [r6, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x32]
	ldr r1, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r2, [r6, #0x3a]
	subs r0, r0, r2
	strh r0, [r1, #0x3a]
	movs r0, #8
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	movs r1, #0x9d
	lsls r1, r1, #1
	bl NewEkrDragonFireBg3
	ldr r0, _080650F0 @ =0x082E1218
	ldr r4, _080650F4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r5, _080650F8 @ =0x001F001F
	str r5, [sp]
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r2, _080650FC @ =0x05000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r5, #0
	bl sub_080507B8
	ldr r0, _08065100 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065104 @ =0x0201FB00
	ldr r0, [r0]
	movs r2, #0x3a
	ldrsh r1, [r6, r2]
	bl EkrDragonTmCpyExt
	ldr r0, [r6, #0x5c]
	bl sub_08065904
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl sub_08065A10
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl sub_08065C24
	str r0, [r6, #0x4c]
	bl sub_08065B90
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFireBG2
	str r0, [r6, #0x48]
	movs r0, #0xbc
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r6, #0
	bl Proc_Break
_080650E6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080650F0: .4byte 0x082E1218
_080650F4: .4byte 0x02019784
_080650F8: .4byte 0x001F001F
_080650FC: .4byte 0x05000020
_08065100: .4byte 0x02024460
_08065104: .4byte 0x0201FB00

	thumb_func_start sub_08065108
sub_08065108: @ 0x08065108
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08065128 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _0806512C
	adds r0, r5, #0
	bl Proc_Break
	b _0806529C
	.align 2, 0
_08065128: .4byte 0x0203E02C
_0806512C:
	movs r0, #0x3a
	ldrsh r1, [r5, r0]
	movs r3, #0x3c
	ldrsh r2, [r5, r3]
	movs r4, #0x2c
	ldrsh r3, [r5, r4]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r7, r0, #0
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r7
	strh r0, [r1, #0x3a]
	ldr r1, [r5, #0x64]
	ldr r4, _080652AC @ =0x02017760
	ldrh r2, [r1, #0x32]
	ldrh r3, [r4]
	subs r0, r2, r3
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldrh r6, [r1, #0x3a]
	ldrh r2, [r4, #2]
	subs r0, r6, r2
	strh r0, [r1, #0x3a]
	ldr r3, _080652B0 @ =0x02000028
	mov sl, r3
	ldrh r6, [r3, #2]
	ldrh r0, [r4]
	adds r1, r6, r0
	ldr r2, _080652B4 @ =0x0201FB00
	mov r8, r2
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r3, _080652B8 @ =0x0200002C
	mov sb, r3
	ldrh r6, [r3, #2]
	ldrh r0, [r4, #2]
	subs r2, r6, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	movs r2, #0
	ldrsh r1, [r4, r2]
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	adds r1, r7, r1
	bl EkrDragonTmCpyExt
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _080652BC @ =0x02000038
	ldrh r0, [r4]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r4]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r4, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	adds r0, #1
	cmp r1, r0
	bne _0806529C
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r7
	strh r0, [r1, #0x3a]
	mov r4, r8
	ldr r1, [r4]
	mov r0, sl
	ldrh r0, [r0, #2]
	subs r1, r0, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, sb
	movs r4, #2
	ldrsh r2, [r3, r4]
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r1, r8
	ldr r0, [r1]
	adds r1, r7, #0
	bl EkrDragonTmCpyExt
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r2, [r6]
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r6, #2]
	rsbs r1, r3, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r4, [r6]
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldr r0, [r5, #0x54]
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_0806529C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080652AC: .4byte 0x02017760
_080652B0: .4byte 0x02000028
_080652B4: .4byte 0x0201FB00
_080652B8: .4byte 0x0200002C
_080652BC: .4byte 0x02000038

	thumb_func_start sub_080652C0
sub_080652C0: @ 0x080652C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065304 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _0806531C
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, _08065308 @ =0x082E1218
	ldr r1, _0806530C @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _08065310 @ =0x001F001F
	bl sub_080507B8
	ldr r0, _08065314 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065318 @ =0x0201FB00
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	adds r0, r4, #0
	bl Proc_Break
	b _08065388
	.align 2, 0
_08065304: .4byte 0x0203E02C
_08065308: .4byte 0x082E1218
_0806530C: .4byte 0x02019784
_08065310: .4byte 0x001F001F
_08065314: .4byte 0x02024460
_08065318: .4byte 0x0201FB00
_0806531C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldr r1, _08065390 @ =0x010D0000
	cmp r0, r1
	bne _08065342
	ldr r0, [r4, #0x64]
	movs r1, #0x3c
	movs r2, #9
	bl NewEkrDragonBarkQuake
	ldr r0, _08065394 @ =0x000002F1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08065342:
	ldr r0, _08065398 @ =0x00000195
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	bne _08065388
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, _0806539C @ =0x082E1218
	ldr r1, _080653A0 @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _080653A4 @ =0x001F001F
	bl sub_080507B8
	ldr r0, _080653A8 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _080653AC @ =0x0201FB00
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	adds r0, r4, #0
	bl Proc_Break
_08065388:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065390: .4byte 0x010D0000
_08065394: .4byte 0x000002F1
_08065398: .4byte 0x00000195
_0806539C: .4byte 0x082E1218
_080653A0: .4byte 0x02019784
_080653A4: .4byte 0x001F001F
_080653A8: .4byte 0x02024460
_080653AC: .4byte 0x0201FB00

	thumb_func_start EkrDragon_TriggerIntroDone
EkrDragon_TriggerIntroDone: @ 0x080653B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonFxMain
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EkrDragon_InBattleIDLE
EkrDragon_InBattleIDLE: @ 0x080653D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0806541E
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x68]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	ldr r0, [r4, #0x50]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl CheckEfxDragonDeadFallHead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08065410
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonBodyBlack
	b _08065416
_08065410:
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonTunk
_08065416:
	str r0, [r4, #0x50]
	adds r0, r4, #0
	bl Proc_Break
_0806541E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08065424
sub_08065424: @ 0x08065424
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	bne _0806543E
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806543E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08065444
sub_08065444: @ 0x08065444
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl Proc_End
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x48]
	bl Proc_End
	ldr r3, _080654C8 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _080654CC @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonBaseAppear
	ldr r0, _080654D0 @ =0x02024460
	ldr r1, _080654D4 @ =0x0000601F
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	movs r0, #0x10
	bl EfxChapterMapFadeOUT
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080654C8: .4byte 0x03002870
_080654CC: .4byte 0x0203E010
_080654D0: .4byte 0x02024460
_080654D4: .4byte 0x0000601F

	thumb_func_start EkrDragon_ReloadCustomBgAndFadeOut
EkrDragon_ReloadCustomBgAndFadeOut: @ 0x080654D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080654F6
	ldr r0, _0806552C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ApplyChapterMapGraphics
	bl RenderMap
_080654F6:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08065524
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08065524:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806552C: .4byte 0x0202BBF8

	thumb_func_start EkrDragon_TriggerEnding
EkrDragon_TriggerEnding: @ 0x08065530
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEkrDragonBaseHide
NewEkrDragonBaseHide: @ 0x08065548
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065568 @ =0x08BD93A0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065568: .4byte 0x08BD93A0

	thumb_func_start EkrDragonBaseHide_Loop
EkrDragonBaseHide_Loop: @ 0x0806556C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _080655CC @ =0x02020060
	ldr r4, _080655D0 @ =0x020228E0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080655C4
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080655C4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080655CC: .4byte 0x02020060
_080655D0: .4byte 0x020228E0

	thumb_func_start sub_080655D4
sub_080655D4: @ 0x080655D4
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrDragonBaseAppear
NewEkrDragonBaseAppear: @ 0x080655E0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08065634 @ =0x08BD93C0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r5, #0x2c]
	ldr r0, _08065638 @ =0x02023C60
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl FillBGRect
	ldr r0, _0806563C @ =0x0201FAD0
	bl sub_08054F30
	ldr r4, _08065640 @ =0x020228E0
	ldr r1, _08065644 @ =0x02020060
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	movs r3, #0x10
	bl EfxPalBlackInOut
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065634: .4byte 0x08BD93C0
_08065638: .4byte 0x02023C60
_0806563C: .4byte 0x0201FAD0
_08065640: .4byte 0x020228E0
_08065644: .4byte 0x02020060

	thumb_func_start EkrDragonBaseAppear_Loop
EkrDragonBaseAppear_Loop: @ 0x08065648
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _080656A8 @ =0x02020060
	ldr r4, _080656AC @ =0x020228E0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080656A0
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080656A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080656A8: .4byte 0x02020060
_080656AC: .4byte 0x020228E0

	thumb_func_start sub_080656B0
sub_080656B0: @ 0x080656B0
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrDragonTunkFace
NewEkrDragonTunkFace: @ 0x080656BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806570C @ =0x08BD93E0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r0, _08065710 @ =0x082E1A30
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, _08065714 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08065718 @ =0x08BDAC58
	movs r1, #0x14
	bl AnimCreate
	movs r2, #0
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r4, #0x32]
	strh r1, [r0, #2]
	strh r1, [r4, #0x3a]
	strh r1, [r0, #4]
	str r0, [r4, #0x60]
	adds r0, r4, #0
	adds r0, #0x29
	strb r2, [r0]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806570C: .4byte 0x08BD93E0
_08065710: .4byte 0x082E1A30
_08065714: .4byte 0x082E4064
_08065718: .4byte 0x08BDAC58

	thumb_func_start sub_0806571C
sub_0806571C: @ 0x0806571C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x3a]
	strh r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08065740
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08065740:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08065748
sub_08065748: @ 0x08065748
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0806578C @ =0x08BD93F8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r4, _08065790 @ =0x08BDABA0
	ldr r0, _08065794 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08065798 @ =0x082E1A30
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806578C: .4byte 0x08BD93F8
_08065790: .4byte 0x08BDABA0
_08065794: .4byte 0x082E4064
_08065798: .4byte 0x082E1A30

	thumb_func_start sub_0806579C
sub_0806579C: @ 0x0806579C
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

	thumb_func_start EfxDragonDeadFallBody_Loop1
EfxDragonDeadFallBody_Loop1: @ 0x080657A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	movs r3, #0
	strh r0, [r2, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0x86
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _080657EA
	strh r3, [r4, #0x2c]
	ldr r0, _080657F0 @ =0x08BDAC60
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	ldr r0, _080657F4 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080657F8 @ =0x082E2910
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
_080657EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080657F0: .4byte 0x08BDAC60
_080657F4: .4byte 0x082E4064
_080657F8: .4byte 0x082E2910

	thumb_func_start EfxDragonDeadFallBody_Loop2
EfxDragonDeadFallBody_Loop2: @ 0x080657FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2e
	bne _08065830
	ldr r0, _08065838 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806583C @ =0x082E1A30
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
_08065830:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065838: .4byte 0x082E4064
_0806583C: .4byte 0x082E1A30

	thumb_func_start EfxDragonDeadFallBody_Blocking
EfxDragonDeadFallBody_Blocking: @ 0x08065840
	ldr r2, [r0, #0x60]
	ldrh r1, [r0, #0x32]
	strh r1, [r2, #2]
	ldrh r0, [r0, #0x3a]
	strh r0, [r2, #4]
	bx lr

	thumb_func_start sub_0806584C
sub_0806584C: @ 0x0806584C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08065890 @ =0x08BD9428
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r4, _08065894 @ =0x08BDACB0
	ldr r0, _08065898 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806589C @ =0x082E35CC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065890: .4byte 0x08BD9428
_08065894: .4byte 0x08BDACB0
_08065898: .4byte 0x082E4064
_0806589C: .4byte 0x082E35CC

	thumb_func_start sub_080658A0
sub_080658A0: @ 0x080658A0
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

	thumb_func_start EfxDragonDeadFallHead_Loop1
EfxDragonDeadFallHead_Loop1: @ 0x080658AC
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	bne _080658D2
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_080658D2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080658D8
sub_080658D8: @ 0x080658D8
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x32]
	movs r3, #0
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x3a]
	strh r0, [r2, #4]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080658FE
	strh r3, [r1, #0x2c]
	ldr r0, _08065900 @ =0x08BDACB0
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
_080658FE:
	bx lr
	.align 2, 0
_08065900: .4byte 0x08BDACB0

	thumb_func_start sub_08065904
sub_08065904: @ 0x08065904
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065924 @ =0x08BD9450
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x5c]
	ldrb r1, [r4, #0x12]
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065924: .4byte 0x08BD9450

	thumb_func_start EkrDragonFlashingWingBg_Loop
EkrDragonFlashingWingBg_Loop: @ 0x08065928
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08065944
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _08065A0A
_08065944:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08065956
	cmp r1, #1
	beq _08065970
	b _0806598C
_08065956:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _08065968 @ =0x082DE598
	str r0, [r4, #0x48]
	ldr r0, _0806596C @ =0x082E0FEC
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	b _0806598C
	.align 2, 0
_08065968: .4byte 0x082DE598
_0806596C: .4byte 0x082E0FEC
_08065970:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080659B8 @ =0x082DE5AA
	str r0, [r4, #0x48]
	ldr r0, _080659BC @ =0x082E0FEC
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	ldr r0, [r4, #0x5c]
	movs r1, #0x3c
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
_0806598C:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080659C4
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080659C0 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _080659E8
	.align 2, 0
_080659B8: .4byte 0x082DE5AA
_080659BC: .4byte 0x082E0FEC
_080659C0: .4byte 0x02022920
_080659C4:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080659D2
	movs r0, #0
	strb r0, [r5]
	b _080659E8
_080659D2:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080659E8
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgWhite
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080659E8:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _08065A04
	adds r0, r1, #0
	cmp r0, #1
	beq _080659FC
	cmp r0, #3
	bne _08065A00
_080659FC:
	movs r0, #1
	b _08065A02
_08065A00:
	movs r0, #0
_08065A02:
	strb r0, [r5]
_08065A04:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_08065A0A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08065A10
sub_08065A10: @ 0x08065A10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065A30 @ =0x08BD9468
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x5c]
	ldrb r1, [r4, #0x12]
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065A30: .4byte 0x08BD9468

	thumb_func_start EkrDragonFlashingWingObj_Loop
EkrDragonFlashingWingObj_Loop: @ 0x08065A34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08065A50
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _08065AFE
_08065A50:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08065A62
	cmp r1, #1
	beq _08065A70
	b _08065A82
_08065A62:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _08065A6C @ =0x082DE6A4
	b _08065A78
	.align 2, 0
_08065A6C: .4byte 0x082DE6A4
_08065A70:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08065AAC @ =0x082DE6AA
_08065A78:
	str r0, [r4, #0x48]
	ldr r0, _08065AB0 @ =0x082E4084
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
_08065A82:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08065AB8
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _08065AB4 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _08065ADC
	.align 2, 0
_08065AAC: .4byte 0x082DE6AA
_08065AB0: .4byte 0x082E4084
_08065AB4: .4byte 0x02022B40
_08065AB8:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08065AC6
	movs r0, #0
	strb r0, [r5]
	b _08065ADC
_08065AC6:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08065ADC
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgWhite
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_08065ADC:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _08065AF8
	adds r0, r1, #0
	cmp r0, #1
	beq _08065AF0
	cmp r0, #3
	bne _08065AF4
_08065AF0:
	movs r0, #1
	b _08065AF6
_08065AF4:
	movs r0, #0
_08065AF6:
	strb r0, [r5]
_08065AF8:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_08065AFE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewEkrDragonFireBG2
NewEkrDragonFireBG2: @ 0x08065B04
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08065B68 @ =0x08BD9480
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, _08065B6C @ =0x082E4D30
	ldr r1, _08065B70 @ =0x06005000
	bl LZ77UnCompVram
	ldr r0, _08065B74 @ =0x082E58BC
	ldr r6, _08065B78 @ =0x02019784
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r0, _08065B7C @ =0x082E589C
	ldr r1, _08065B80 @ =0x020228E0
	movs r2, #8
	bl CpuFastSet
	ldr r4, _08065B84 @ =0x02023C60
	adds r0, r4, #0
	movs r1, #0x1f
	bl TmFill
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #4
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08065B68: .4byte 0x08BD9480
_08065B6C: .4byte 0x082E4D30
_08065B70: .4byte 0x06005000
_08065B74: .4byte 0x082E58BC
_08065B78: .4byte 0x02019784
_08065B7C: .4byte 0x082E589C
_08065B80: .4byte 0x020228E0
_08065B84: .4byte 0x02023C60

	thumb_func_start sub_08065B88
sub_08065B88: @ 0x08065B88
	bx lr
	.align 2, 0

	thumb_func_start sub_08065B8C
sub_08065B8C: @ 0x08065B8C
	bx lr
	.align 2, 0

	thumb_func_start sub_08065B90
sub_08065B90: @ 0x08065B90
	push {lr}
	ldr r0, _08065BA4 @ =0x08BD94A0
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r1}
	bx r1
	.align 2, 0
_08065BA4: .4byte 0x08BD94A0

	thumb_func_start EkrDragonBg2ScrollHandler_Loop
EkrDragonBg2ScrollHandler_Loop: @ 0x08065BA8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08065BEC @ =0x0201FB20
	ldr r0, [r0]
	ldr r3, _08065BF0 @ =0x0201FB2C
	cmp r0, #0
	bne _08065BB8
	ldr r3, _08065BF4 @ =0x0201FC6C
_08065BB8:
	movs r2, #0
	ldr r6, _08065BF8 @ =0x080C5A48
	movs r5, #0xff
_08065BBE:
	lsls r0, r2, #1
	movs r7, #0x2c
	ldrsh r1, [r4, r7]
	adds r0, r0, r1
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #0xa
	adds r0, #4
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _08065BBE
	ldrh r0, [r4, #0x2c]
	adds r0, #2
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065BEC: .4byte 0x0201FB20
_08065BF0: .4byte 0x0201FB2C
_08065BF4: .4byte 0x0201FC6C
_08065BF8: .4byte 0x080C5A48

	thumb_func_start sub_08065BFC
sub_08065BFC: @ 0x08065BFC
	ldr r0, _08065C18 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08065C16
	ldr r3, _08065C1C @ =0x0400001A
	ldr r2, _08065C20 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08065C16:
	bx lr
	.align 2, 0
_08065C18: .4byte 0x04000004
_08065C1C: .4byte 0x0400001A
_08065C20: .4byte 0x0201FB28

	thumb_func_start sub_08065C24
sub_08065C24: @ 0x08065C24
	push {r4, r5, r6, r7, lr}
	ldr r2, _08065C74 @ =0x0201FB2C
	movs r1, #0
	adds r0, r2, #0
	ldr r4, _08065C78 @ =0x0201FC6C
	ldr r3, _08065C7C @ =0x0201FB20
	mov ip, r3
	ldr r5, _08065C80 @ =0x0201FB24
	ldr r6, _08065C84 @ =0x0201FB28
	ldr r7, _08065C88 @ =sub_08065BFC
	movs r3, #0
_08065C3A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08065C3A
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_08065C4A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08065C4A
	movs r4, #0
	mov r1, ip
	str r4, [r1]
	str r0, [r5]
	str r0, [r6]
	adds r0, r7, #0
	bl SetOnHBlankA
	ldr r0, _08065C8C @ =0x08BD94B8
	movs r1, #0
	bl SpawnProc
	strh r4, [r0, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08065C74: .4byte 0x0201FB2C
_08065C78: .4byte 0x0201FC6C
_08065C7C: .4byte 0x0201FB20
_08065C80: .4byte 0x0201FB24
_08065C84: .4byte 0x0201FB28
_08065C88: .4byte sub_08065BFC
_08065C8C: .4byte 0x08BD94B8

	thumb_func_start sub_08065C90
sub_08065C90: @ 0x08065C90
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_08065C9C
sub_08065C9C: @ 0x08065C9C
	ldr r1, _08065CB0 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _08065CBC
	movs r0, #0
	str r0, [r1]
	ldr r1, _08065CB4 @ =0x0201FB24
	ldr r0, _08065CB8 @ =0x0201FB2C
	b _08065CC4
	.align 2, 0
_08065CB0: .4byte 0x0201FB20
_08065CB4: .4byte 0x0201FB24
_08065CB8: .4byte 0x0201FB2C
_08065CBC:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08065CD0 @ =0x0201FB24
	ldr r0, _08065CD4 @ =0x0201FC6C
_08065CC4:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _08065CD8 @ =0x0201FB28
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_08065CD0: .4byte 0x0201FB24
_08065CD4: .4byte 0x0201FC6C
_08065CD8: .4byte 0x0201FB28

	thumb_func_start NewEkrDragonBg3HfScrollHandler
NewEkrDragonBg3HfScrollHandler: @ 0x08065CDC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08065D0C @ =0x08BD94D8
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08065D0C: .4byte 0x08BD94D8

	thumb_func_start sub_08065D10
sub_08065D10: @ 0x08065D10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldr r0, _08065D8C @ =0x0201FDAC
	ldr r0, [r0]
	ldr r2, _08065D90 @ =0x0201FDB8
	cmp r0, #0
	bne _08065D28
	ldr r2, _08065D94 @ =0x0201FEF8
_08065D28:
	ldr r0, [r1, #0x50]
	ldrh r3, [r1, #0x2e]
	adds r0, r3, r0
	strh r0, [r1, #0x2e]
	movs r4, #0
	movs r3, #0
	ldr r6, [r1, #0x44]
	mov r8, r6
	ldr r7, [r1, #0x48]
	mov sl, r7
	ldr r0, _08065D98 @ =0x08BDACBC
	mov ip, r0
	ldr r5, [r1, #0x4c]
	ldr r6, _08065D9C @ =0x03002870
	mov sb, r6
_08065D46:
	add r4, sl
	lsrs r0, r4, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, #4
	mov r6, sb
	ldrh r6, [r6, #0x28]
	adds r0, r6, r0
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x77
	bls _08065D46
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _08065D7E
	adds r0, r1, #0
	bl Proc_End
_08065D7E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065D8C: .4byte 0x0201FDAC
_08065D90: .4byte 0x0201FDB8
_08065D94: .4byte 0x0201FEF8
_08065D98: .4byte 0x08BDACBC
_08065D9C: .4byte 0x03002870

	thumb_func_start sub_08065DA0
sub_08065DA0: @ 0x08065DA0
	ldr r0, _08065DBC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08065DBA
	ldr r3, _08065DC0 @ =0x0400001C
	ldr r2, _08065DC4 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08065DBA:
	bx lr
	.align 2, 0
_08065DBC: .4byte 0x04000004
_08065DC0: .4byte 0x0400001C
_08065DC4: .4byte 0x0201FDB4

	thumb_func_start sub_08065DC8
sub_08065DC8: @ 0x08065DC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08065E2C @ =0x0201FDB8
	movs r2, #0
	adds r0, r3, #0
	ldr r4, _08065E30 @ =0x0201FEF8
	ldr r5, _08065E34 @ =0x0201FDAC
	ldr r6, _08065E38 @ =0x0201FDB0
	ldr r7, _08065E3C @ =0x0201FDB4
	mov sb, r7
	ldr r7, _08065E40 @ =sub_08065DA0
	mov ip, r7
_08065DEA:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _08065DEA
	adds r3, r4, #0
	movs r2, #0
_08065DF8:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _08065DF8
	movs r4, #0
	str r4, [r5]
	str r0, [r6]
	mov r1, sb
	str r0, [r1]
	mov r0, ip
	bl SetOnHBlankA
	ldr r0, _08065E44 @ =0x08BD94F0
	movs r1, #0
	bl SpawnProc
	strh r4, [r0, #0x2c]
	mov r7, r8
	str r7, [r0, #0x44]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065E2C: .4byte 0x0201FDB8
_08065E30: .4byte 0x0201FEF8
_08065E34: .4byte 0x0201FDAC
_08065E38: .4byte 0x0201FDB0
_08065E3C: .4byte 0x0201FDB4
_08065E40: .4byte sub_08065DA0
_08065E44: .4byte 0x08BD94F0

	thumb_func_start sub_08065E48
sub_08065E48: @ 0x08065E48
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrDragonBg3HfScroll_Loop
EkrDragonBg3HfScroll_Loop: @ 0x08065E54
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065E6C @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08065E78
	movs r0, #0
	str r0, [r1]
	ldr r1, _08065E70 @ =0x0201FDB0
	ldr r0, _08065E74 @ =0x0201FDB8
	b _08065E80
	.align 2, 0
_08065E6C: .4byte 0x0201FDAC
_08065E70: .4byte 0x0201FDB0
_08065E74: .4byte 0x0201FDB8
_08065E78:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08065EAC @ =0x0201FDB0
	ldr r0, _08065EB0 @ =0x0201FEF8
_08065E80:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _08065EB4 @ =0x0201FDB4
	ldr r0, [r0]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _08065EA6
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_08065EA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065EAC: .4byte 0x0201FDB0
_08065EB0: .4byte 0x0201FEF8
_08065EB4: .4byte 0x0201FDB4

	thumb_func_start NewEkrDragonFxMain
NewEkrDragonFxMain: @ 0x08065EB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065EE0 @ =0x08BD9510
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r1, _08065EE4 @ =0x08BD9528
	str r1, [r0, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065EE0: .4byte 0x08BD9510
_08065EE4: .4byte 0x08BD9528

	thumb_func_start sub_08065EE8
sub_08065EE8: @ 0x08065EE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r0, r1
	beq _08065F58
	str r1, [r4, #0x54]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	cmp r1, #9
	bhi _08065F58
	lsls r0, r1, #2
	ldr r1, _08065F10 @ =_08065F14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08065F10: .4byte _08065F14
_08065F14: @ jump table
	.4byte _08065F3C @ case 0
	.4byte _08065F44 @ case 1
	.4byte _08065F3C @ case 2
	.4byte _08065F44 @ case 3
	.4byte _08065F4C @ case 4
	.4byte _08065F4C @ case 5
	.4byte _08065F54 @ case 6
	.4byte _08065F54 @ case 7
	.4byte _08065F54 @ case 8
	.4byte _08065F3C @ case 9
_08065F3C:
	ldr r0, _08065F40 @ =0x082DE7AA
	b _08065F56
	.align 2, 0
_08065F40: .4byte 0x082DE7AA
_08065F44:
	ldr r0, _08065F48 @ =0x082DE7BC
	b _08065F56
	.align 2, 0
_08065F48: .4byte 0x082DE7BC
_08065F4C:
	ldr r0, _08065F50 @ =0x082DE7CE
	b _08065F56
	.align 2, 0
_08065F50: .4byte 0x082DE7CE
_08065F54:
	ldr r0, _08065F8C @ =0x082DE7A4
_08065F56:
	str r0, [r4, #0x48]
_08065F58:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08065F98
	ldr r1, [r4, #0x4c]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08065F90 @ =0x02019784
	bl LZ77UnCompWram
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065F94 @ =0x0201FB00
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	b _0806600C
	.align 2, 0
_08065F8C: .4byte 0x082DE7A4
_08065F90: .4byte 0x02019784
_08065F94: .4byte 0x0201FB00
_08065F98:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08065FC6
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08065FBC
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _0806600C
	b _08065FD6
_08065FBC:
	bl CheckEkrHitDone
	cmp r0, #1
	bne _0806600C
	b _08066000
_08065FC6:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08065FEA
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08065FDC
_08065FD6:
	movs r0, #1
	strh r0, [r4, #0x2e]
	b _0806600C
_08065FDC:
	ldr r1, [r4, #0x5c]
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _0806600C
	b _08066000
_08065FEA:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806600C
	ldr r0, _08066014 @ =0x000002F2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066000:
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_0806600C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066014: .4byte 0x000002F2

	thumb_func_start NewEkrDragonBodyBlack
NewEkrDragonBodyBlack: @ 0x08066018
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08066038 @ =0x08BD9530
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x29
	strb r2, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066038: .4byte 0x08BD9530

	thumb_func_start EkrDragonBodyBlack_Loop
EkrDragonBodyBlack_Loop: @ 0x0806603C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _080660BC @ =0x082E0FEC
	ldr r4, _080660C0 @ =0x02022920
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _080660C4 @ =0x02000054
	ldr r0, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #8
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	adds r0, r5, #0
	bl EkrDragonUpdatePal_08065510
	bl EnablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080660B2
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080660B2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080660BC: .4byte 0x082E0FEC
_080660C0: .4byte 0x02022920
_080660C4: .4byte 0x02000054

	thumb_func_start sub_080660C8
sub_080660C8: @ 0x080660C8
	bx lr
	.align 2, 0

	thumb_func_start sub_080660CC
sub_080660CC: @ 0x080660CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	asrs r5, r5, #3
	asrs r4, r4, #3
	ldr r0, _08066158 @ =0x082E17A4
	ldr r6, _0806615C @ =0x02019784
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	lsls r5, r5, #1
	lsls r2, r4, #5
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r7, _08066160 @ =0x0201D41C
	adds r2, r2, r7
	adds r2, r5, r2
	movs r1, #0x20
	mov sl, r1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #6
	mov sb, r1
	str r1, [sp, #8]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0xc]
	subs r1, #1
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
	adds r4, #2
	lsls r0, r4, #5
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r5, r5, r0
	mov r0, sl
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r5, #0
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066158: .4byte 0x082E17A4
_0806615C: .4byte 0x02019784
_08066160: .4byte 0x0201D41C

	thumb_func_start sub_08066164
sub_08066164: @ 0x08066164
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl SetBgOffset
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _080661B0 @ =0x0201D41C
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _080661B4 @ =0x02024460
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080661B0: .4byte 0x0201D41C
_080661B4: .4byte 0x02024460

	thumb_func_start NewEkrDragonTunk
NewEkrDragonTunk: @ 0x080661B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080661F0 @ =0x08BD9550
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	ldr r0, _080661F4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080661DE
	ldr r0, _080661F8 @ =0x0000FFE0
_080661DE:
	strh r0, [r5, #0x32]
	movs r0, #1
	bl FadeBgmOut
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080661F0: .4byte 0x08BD9550
_080661F4: .4byte 0x0203E02C
_080661F8: .4byte 0x0000FFE0

	thumb_func_start sub_080661FC
sub_080661FC: @ 0x080661FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08066228
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066794
	ldr r0, _080662E0 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066228:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x23
	bne _08066246
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066794
	ldr r0, _080662E0 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066246:
	ldrh r1, [r5, #0x2c]
	cmp r1, #0x32
	bne _08066264
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066794
	ldr r0, _080662E0 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066264:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x36
	bne _080662C2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r5, #0x3a]
	strh r6, [r5, #0x3c]
	ldr r0, [r5, #0x5c]
	bl sub_0806584C
	str r0, [r5, #0x64]
	ldr r1, [r5, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, #0x16
	strh r1, [r0, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r2, [r5, #0x3a]
	subs r0, r0, r2
	adds r0, #0xd8
	strh r0, [r1, #0x3a]
	ldr r0, _080662E4 @ =0x082E1218
	ldr r1, _080662E8 @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _080662EC @ =0x001F001F
	bl sub_080507B8
	ldr r0, _080662F0 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r1, #0xf0
	bl sub_080660CC
	movs r0, #0
	adds r1, r4, #0
	bl sub_08066164
_080662C2:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x64
	bne _080662D8
	strh r6, [r5, #0x2c]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x2e]
	strh r6, [r5, #0x30]
	adds r0, r5, #0
	bl Proc_Break
_080662D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080662E0: .4byte 0x00000147
_080662E4: .4byte 0x082E1218
_080662E8: .4byte 0x02019784
_080662EC: .4byte 0x001F001F
_080662F0: .4byte 0x02024460

	thumb_func_start sub_080662F4
sub_080662F4: @ 0x080662F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r1, r0, #0
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x16
	movs r7, #0
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r1
	adds r0, #0xd8
	strh r0, [r2, #0x3a]
	ldr r2, [r4, #0x64]
	ldr r5, _080664B0 @ =0x02017760
	ldrh r3, [r2, #0x32]
	ldrh r6, [r5]
	subs r0, r3, r6
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldrh r3, [r2, #0x3a]
	ldrh r6, [r5, #2]
	subs r0, r3, r6
	strh r0, [r2, #0x3a]
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	bl sub_08066164
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _080664B4 @ =0x02000038
	ldrh r0, [r5]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r5]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	ldrh r3, [r6, #2]
	adds r1, r2, r3
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r4, #0x2c]
	adds r1, #1
	strh r1, [r4, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, #1
	cmp r1, r0
	bne _080663C6
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
_080663C6:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080663EC
	movs r0, #8
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
	ldr r0, _080664B8 @ =0x000002F3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_080663EC:
	ldrh r3, [r4, #0x30]
	cmp r3, #0x3c
	bne _08066402
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #9
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
_08066402:
	ldrh r0, [r4, #0x30]
	cmp r0, #0x5a
	bne _08066418
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xa
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
_08066418:
	ldrh r1, [r4, #0x30]
	cmp r1, #0x87
	bne _08066428
	movs r0, #0x3c
	movs r1, #0x1e
	movs r2, #0x78
	bl sub_08066794
_08066428:
	ldrh r2, [r4, #0x30]
	cmp r2, #0xc8
	bne _0806648E
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x54]
	bl Proc_End
	strh r7, [r5]
	strh r7, [r5, #2]
	movs r3, #0x3c
	ldrsh r1, [r4, r3]
	movs r0, #0
	bl sub_08066164
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r6]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #0x10
	bl EkrDragonUpdatePal_08065510
_0806648E:
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r5, [r4, #0x30]
	cmp r5, r0
	bne _080664A6
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080664A6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080664B0: .4byte 0x02017760
_080664B4: .4byte 0x02000038
_080664B8: .4byte 0x000002F3

	thumb_func_start sub_080664BC
sub_080664BC: @ 0x080664BC
	bx lr
	.align 2, 0

	thumb_func_start NewEkrDragonFireBg3
NewEkrDragonFireBg3: @ 0x080664C0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806652C @ =0x08BD9578
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _08066530 @ =0x082E4164
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08066534 @ =0x082E4B54
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08066538 @ =0x082E4B74
	ldr r4, _0806653C @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08066540 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806652C: .4byte 0x08BD9578
_08066530: .4byte 0x082E4164
_08066534: .4byte 0x082E4B54
_08066538: .4byte 0x082E4B74
_0806653C: .4byte 0x02019784
_08066540: .4byte 0x02023460

	thumb_func_start sub_08066544
sub_08066544: @ 0x08066544
	push {lr}
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrDragonFireBG3_Loop
EkrDragonFireBG3_Loop: @ 0x08066554
	push {r4, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2, #0x44]
	ldr r1, _08066594 @ =0x03002870
	asrs r0, r0, #8
	movs r3, #0
	strh r0, [r1, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	beq _080665AC
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _08066598
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	b _080665AC
	.align 2, 0
_08066594: .4byte 0x03002870
_08066598:
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	adds r0, #0x1e
	cmp r1, r0
	bne _080665AC
	adds r0, r2, #0
	bl Proc_Break
_080665AC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEkrDragonBarkQuake
NewEkrDragonBarkQuake: @ 0x080665B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r0, _080665E8 @ =0x08BD9598
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080665E8: .4byte 0x08BD9598

	thumb_func_start sub_080665EC
sub_080665EC: @ 0x080665EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, [r0, #0x5c]
	str r0, [sp]
	ldr r4, _08066780 @ =0x02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r7, _08066784 @ =0x02000038
	ldrh r2, [r4]
	ldrh r3, [r7]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r6, [r4, #2]
	ldrh r0, [r7, #2]
	adds r2, r6, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #3
	bl SetBgOffset
	ldrh r5, [r4]
	ldr r0, _08066788 @ =0x02000028
	ldrh r0, [r0]
	subs r1, r0, r5
	ldr r2, _0806678C @ =0x0201FB00
	ldr r0, [r2]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08066790 @ =0x0200002C
	mov sl, r3
	ldrh r4, [r4, #2]
	ldrh r6, [r3]
	subs r2, r6, r4
	lsls r2, r2, #0x10
	ldr r3, _08066788 @ =0x02000028
	ldrh r3, [r3, #2]
	adds r5, r5, r3
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r6, sl
	ldrh r6, [r6, #2]
	subs r4, r6, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r0, r1, #0x10
	mov r8, r0
	asrs r1, r1, #0x10
	lsrs r6, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r6, [r3, #0x2e]
	lsls r1, r6, #0x10
	cmp r0, r1
	ble _08066770
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r7]
	ldrh r2, [r7, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r7]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r7, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r7]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r7, [r7, #2]
	rsbs r1, r7, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r6, _0806678C @ =0x0201FB00
	ldr r4, [r6]
	ldr r0, _08066788 @ =0x02000028
	ldrh r0, [r0]
	subs r1, r0, r4
	lsls r1, r1, #0x10
	ldr r2, _08066788 @ =0x02000028
	ldrh r2, [r2, #2]
	subs r4, r2, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r3, sl
	ldrh r5, [r3, #2]
	lsrs r6, r1, #0x10
	mov r8, r6
	asrs r1, r1, #0x10
	ldrh r6, [r3]
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldr r0, [r3, #0x60]
	bl Proc_End
	mov r0, sb
	bl Proc_Break
_08066770:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066780: .4byte 0x02017760
_08066784: .4byte 0x02000038
_08066788: .4byte 0x02000028
_0806678C: .4byte 0x0201FB00
_08066790: .4byte 0x0200002C

	thumb_func_start sub_08066794
sub_08066794: @ 0x08066794
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080667CC @ =0x08BD95B0
	movs r1, #0
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _080667D0 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x3c
	subs r1, #0x21
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080667CC: .4byte 0x08BD95B0
_080667D0: .4byte 0x03002870

	thumb_func_start EkrDragonScreenFlashing_Loop1
EkrDragonScreenFlashing_Loop1: @ 0x080667D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _0806683C @ =0x02022860
	ldr r4, _08066840 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08066834
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08066834:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806683C: .4byte 0x02022860
_08066840: .4byte 0x020165C8

	thumb_func_start EkrDragonScreenFlashing_Loop2
EkrDragonScreenFlashing_Loop2: @ 0x08066844
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08066894 @ =0x02022860
	ldr r4, _08066898 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _0806688E
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0806688E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066894: .4byte 0x02022860
_08066898: .4byte 0x020165C8

	thumb_func_start EkrDragonScreenFlashing_Loop3
EkrDragonScreenFlashing_Loop3: @ 0x0806689C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08066904 @ =0x02022860
	ldr r4, _08066908 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x4c]
	cmp r0, r1
	ble _080668FC
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_080668FC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066904: .4byte 0x02022860
_08066908: .4byte 0x020165C8

	thumb_func_start sub_0806690C
sub_0806690C: @ 0x0806690C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08066938 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x3d
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066938: .4byte 0x03002870

	thumb_func_start sub_0806693C
sub_0806693C: @ 0x0806693C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x1c]
	mov r8, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080669A2
	movs r0, #0x20
	mov r3, ip
	subs r0, r0, r3
	lsls r0, r0, #0x10
	mov sb, r0
_08066964:
	mov r3, ip
	subs r5, r2, #1
	cmp r3, #0
	beq _08066996
	movs r2, #1
	rsbs r2, r2, #0
	ldr r7, _080669B0 @ =0x00000FFF
	lsls r4, r6, #0xc
_08066974:
	ldrh r0, [r1]
	cmp r6, r2
	beq _08066982
	ands r0, r7
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066982:
	cmp r8, r2
	beq _0806698C
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0806698C:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08066974
_08066996:
	mov r2, sb
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08066964
_080669A2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080669B0: .4byte 0x00000FFF

	thumb_func_start FillBGRect
FillBGRect: @ 0x080669B4
	push {r4, r5, r6, r7, lr}
	adds r5, r3, #0
	ldr r7, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080669EC
	movs r0, #0x20
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0xf
	lsls r5, r5, #0xc
_080669D2:
	adds r0, r4, #0
	subs r2, #1
	cmp r0, #0
	beq _080669E6
	adds r1, r7, r5
_080669DC:
	strh r1, [r3]
	adds r3, #2
	subs r0, #1
	cmp r0, #0
	bne _080669DC
_080669E6:
	adds r3, r3, r6
	cmp r2, #0
	bne _080669D2
_080669EC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

