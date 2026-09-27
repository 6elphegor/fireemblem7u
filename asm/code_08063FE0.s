	.include "macro.inc"

	.syntax unified

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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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

	thumb_func_start EkrDragon_StartDragonTailIntro
EkrDragon_StartDragonTailIntro: @ 0x08064DB0
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
	bl EfxTmFill
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
	bl NewEkrDragonBg3HfScroll
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

	thumb_func_start EkrDragon_DragonTailDisplay
EkrDragon_DragonTailDisplay: @ 0x08064E70
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

	thumb_func_start EkrDragon_StartMainBodyIntro
EkrDragon_StartMainBodyIntro: @ 0x08064EE8
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

	thumb_func_start EkrDragon_PreMainBodyIntro
EkrDragon_PreMainBodyIntro: @ 0x08064F5C
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

	thumb_func_start EkrDragon_StartMainBodyFallIn
EkrDragon_StartMainBodyFallIn: @ 0x08064FE4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08065020 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _08065024
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFlashingWingBg
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFlashingWingObj
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonBg2ScrollExt
	str r0, [r6, #0x4c]
	bl NewEkrDragonBg2ScrollHandler
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
	bl NewEfxDragonDeadFallBody
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
	bl EfxTmFill
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
	bl NewEkrDragonFlashingWingBg
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFlashingWingObj
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonBg2ScrollExt
	str r0, [r6, #0x4c]
	bl NewEkrDragonBg2ScrollHandler
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

	thumb_func_start EkrDragon_WaitMainBodyFallIn
EkrDragon_WaitMainBodyFallIn: @ 0x08065108
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

	thumb_func_start EkrDragon_PreBattleBark
EkrDragon_PreBattleBark: @ 0x080652C0
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
	bl EfxTmFill
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
	bl EfxTmFill
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

	thumb_func_start EkrDragon_WaitForFadeOut
EkrDragon_WaitForFadeOut: @ 0x08065424
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

	thumb_func_start EkrDragon_ReloadTerrainEtc
EkrDragon_ReloadTerrainEtc: @ 0x08065444
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
	bl UnpackChapterMapGraphics
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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

	thumb_func_start EkrDragonTunkFace_Loop
EkrDragonTunkFace_Loop: @ 0x0806571C
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

	thumb_func_start NewEfxDragonDeadFallBody
NewEfxDragonDeadFallBody: @ 0x08065748
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0806578C @ =0x08BD93F8
	movs r1, #3
	bl Proc_Start
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

	thumb_func_start NewEfxDragonDeadFallHeadFx
NewEfxDragonDeadFallHeadFx: @ 0x0806584C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08065890 @ =0x08BD9428
	movs r1, #3
	bl Proc_Start
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

	thumb_func_start EfxDragonDeadFallHead_Loop2
EfxDragonDeadFallHead_Loop2: @ 0x080658D8
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

	thumb_func_start NewEkrDragonFlashingWingBg
NewEkrDragonFlashingWingBg: @ 0x08065904
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065924 @ =0x08BD9450
	movs r1, #4
	bl Proc_Start
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

	thumb_func_start NewEkrDragonFlashingWingObj
NewEkrDragonFlashingWingObj: @ 0x08065A10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065A30 @ =0x08BD9468
	movs r1, #4
	bl Proc_Start
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
	bl Proc_Start
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

	thumb_func_start NewEkrDragonBg2ScrollHandler
NewEkrDragonBg2ScrollHandler: @ 0x08065B90
	push {lr}
	ldr r0, _08065BA4 @ =0x08BD94A0
	movs r1, #3
	bl Proc_Start
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

	thumb_func_start NewEkrDragonBg2ScrollExt
NewEkrDragonBg2ScrollExt: @ 0x08065C24
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
	bl Proc_Start
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

	thumb_func_start EkrDragonBg2ScrollExt_Loop
EkrDragonBg2ScrollExt_Loop: @ 0x08065C9C
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
	bl Proc_Start
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

	thumb_func_start EkrDragonBg3HfScrollHandler_Loop
EkrDragonBg3HfScrollHandler_Loop: @ 0x08065D10
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

	thumb_func_start NewEkrDragonBg3HfScroll
NewEkrDragonBg3HfScroll: @ 0x08065DC8
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
	bl Proc_Start
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
	bl Proc_Start
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

	thumb_func_start EkrDragonFxMainHandler
EkrDragonFxMainHandler: @ 0x08065EE8
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
	bl Proc_Start
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
	bl Proc_Start
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

	thumb_func_start EkrDragonTunk_Loop1
EkrDragonTunk_Loop1: @ 0x080661FC
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
	bl NewEkrDragonScreenFlashing
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
	bl NewEkrDragonScreenFlashing
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
	bl NewEkrDragonScreenFlashing
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
	bl NewEfxDragonDeadFallHeadFx
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
	bl EfxTmFill
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

	thumb_func_start EkrDragonTunk_Loop2
EkrDragonTunk_Loop2: @ 0x080662F4
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
	bl NewEkrDragonScreenFlashing
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
	bl Proc_Start
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
	bl Proc_Start
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

	thumb_func_start EkrDragonBarkQuake_Loop
EkrDragonBarkQuake_Loop: @ 0x080665EC
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

	thumb_func_start NewEkrDragonScreenFlashing
NewEkrDragonScreenFlashing: @ 0x08066794
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080667CC @ =0x08BD95B0
	movs r1, #0
	bl Proc_Start
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

	thumb_func_start EkrDragonScreenFlashing_RefrainPalette
EkrDragonScreenFlashing_RefrainPalette: @ 0x0806690C
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

