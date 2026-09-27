	.include "macro.inc"

	.syntax unified

	thumb_func_start StartEventHorizontalQuakefxViolentlyNoSound
StartEventHorizontalQuakefxViolentlyNoSound: @ 0x0807ACDC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807AD00 @ =0x08CA756C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _0807ACF4
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
_0807ACF4:
	movs r1, #0
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AD00: .4byte 0x08CA756C

	thumb_func_start StartEventHorizontalQuakefxSlightlyNoSound
StartEventHorizontalQuakefxSlightlyNoSound: @ 0x0807AD04
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807AD28 @ =0x08CA756C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _0807AD1C
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
_0807AD1C:
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AD28: .4byte 0x08CA756C

	thumb_func_start sub_0807AD2C
sub_0807AD2C: @ 0x0807AD2C
	push {lr}
	ldr r0, _0807AD48 @ =0x0202BBB8
	ldr r1, _0807AD4C @ =0x0000FFFC
	ldrh r2, [r0, #0xc]
	ands r1, r2
	strh r1, [r0, #0xc]
	ldr r0, _0807AD50 @ =0x08CA756C
	bl Proc_EndEach
	movs r0, #4
	bl Sound_FadeOutSE
	pop {r0}
	bx r0
	.align 2, 0
_0807AD48: .4byte 0x0202BBB8
_0807AD4C: .4byte 0x0000FFFC
_0807AD50: .4byte 0x08CA756C

	thumb_func_start sub_0807AD54
sub_0807AD54: @ 0x0807AD54
	push {lr}
	ldr r0, _0807AD70 @ =0x0202BBB8
	ldr r1, _0807AD74 @ =0x0000FFFC
	ldrh r2, [r0, #0xe]
	ands r1, r2
	strh r1, [r0, #0xe]
	ldr r0, _0807AD78 @ =0x08CA759C
	bl Proc_EndEach
	movs r0, #4
	bl Sound_FadeOutSE
	pop {r0}
	bx r0
	.align 2, 0
_0807AD70: .4byte 0x0202BBB8
_0807AD74: .4byte 0x0000FFFC
_0807AD78: .4byte 0x08CA759C

	thumb_func_start sub_0807AD7C
sub_0807AD7C: @ 0x0807AD7C
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0807AD84
sub_0807AD84: @ 0x0807AD84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807ADBC
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807ADE0
	ldr r0, _0807ADB4 @ =0x0202BBB8
	ldr r1, _0807ADB8 @ =0x0000FFFD
	ldrh r2, [r0, #0xc]
	ands r1, r2
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0xc]
	b _0807ADE0
	.align 2, 0
_0807ADB4: .4byte 0x0202BBB8
_0807ADB8: .4byte 0x0000FFFD
_0807ADBC:
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807ADE0
	movs r0, #3
	bl GetBgXOffset
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
_0807ADE0:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0807ADFE
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #4
	bl Sound_FadeOutSE
_0807ADFE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartEventQuakefx
StartEventQuakefx: @ 0x0807AE04
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807AE24 @ =0x08CA75B4
	bl SpawnProc
	ldr r0, _0807AE28 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807AE20
	ldr r0, _0807AE2C @ =0x0000026A
	bl m4aSongNumStart
_0807AE20:
	pop {r0}
	bx r0
	.align 2, 0
_0807AE24: .4byte 0x08CA75B4
_0807AE28: .4byte 0x0202BBF8
_0807AE2C: .4byte 0x0000026A

	thumb_func_start sub_0807AE30
sub_0807AE30: @ 0x0807AE30
	push {lr}
	ldr r0, _0807AE4C @ =0x0202BBB8
	ldr r1, _0807AE50 @ =0x0000FFFC
	ldrh r2, [r0, #0xe]
	ands r1, r2
	strh r1, [r0, #0xe]
	movs r0, #4
	bl Sound_FadeOutSE
	ldr r0, _0807AE54 @ =0x08CA75B4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807AE4C: .4byte 0x0202BBB8
_0807AE50: .4byte 0x0000FFFC
_0807AE54: .4byte 0x08CA75B4

	thumb_func_start sub_0807AE58
sub_0807AE58: @ 0x0807AE58
	push {lr}
	movs r0, #0x91
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_0807AE64
sub_0807AE64: @ 0x0807AE64
	push {lr}
	movs r0, #0x91
	bl ClearFlag
	pop {r0}
	bx r0

	thumb_func_start DragonGatefx_DistortionHandler
DragonGatefx_DistortionHandler: @ 0x0807AE70
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #8
	movs r3, #3
	bl sub_08076F44
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #3
	bl GetBgXOffset
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #8
	movs r3, #3
	bl sub_08076FC4
	bl SwapScanlineBufs
	adds r4, #0x64
	ldrh r4, [r4]
	movs r0, #3
	bl GetBgXOffset
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0807AED8
sub_0807AED8: @ 0x0807AED8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, #0x4c
	strh r1, [r0]
	movs r0, #1
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0807AF7C @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _0807AF80 @ =0x081BB310
	ldr r1, _0807AF84 @ =0x06004000
	bl Decompress
	ldr r0, _0807AF88 @ =0x02023C60
	ldr r1, _0807AF8C @ =0x081BC784
	movs r2, #0xc4
	lsls r2, r2, #7
	bl sub_080AACD8
	ldr r5, _0807AF90 @ =0x081BC744
	adds r0, r5, #0
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl EnableBgSync
	ldr r1, _0807AF94 @ =0x081BC764
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #6
	bl StartMixPalette
	bl InitScanlineEffect
	ldr r0, _0807AF98 @ =sub_08077C0C
	bl SetOnHBlankA
	ldr r0, _0807AF9C @ =DragonGatefx_DistortionHandler
	adds r1, r4, #0
	bl StartParallelWorker
	adds r4, #0x64
	movs r0, #2
	strh r0, [r4]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AF7C: .4byte 0x03002870
_0807AF80: .4byte 0x081BB310
_0807AF84: .4byte 0x06004000
_0807AF88: .4byte 0x02023C60
_0807AF8C: .4byte 0x081BC784
_0807AF90: .4byte 0x081BC744
_0807AF94: .4byte 0x081BC764
_0807AF98: .4byte sub_08077C0C
_0807AF9C: .4byte DragonGatefx_DistortionHandler

	thumb_func_start sub_0807AFA0
sub_0807AFA0: @ 0x0807AFA0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0807B04C @ =DragonGatefx_DragonHBlank
	bl SetOnHBlankA
	ldr r3, _0807B050 @ =0x03002870
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
	movs r5, #0
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r2, [r3, #0x10]
	orrs r2, r0
	strb r2, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldr r0, _0807B054 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0807B058 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807B05C @ =0x081BCB1C
	ldr r1, _0807B060 @ =0x06003000
	bl Decompress
	ldr r0, _0807B064 @ =0x02023460
	ldr r1, _0807B068 @ =0x081BD958
	movs r2, #0xe3
	lsls r2, r2, #7
	bl sub_080AACD8
	ldr r0, _0807B06C @ =0x081BD758
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x4c
	strh r5, [r0]
	ldr r0, [r4, #0x14]
	bl TryLockProc
	adds r4, #0x64
	movs r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B04C: .4byte DragonGatefx_DragonHBlank
_0807B050: .4byte 0x03002870
_0807B054: .4byte 0x0000FFE0
_0807B058: .4byte 0x0000E0FF
_0807B05C: .4byte 0x081BCB1C
_0807B060: .4byte 0x06003000
_0807B064: .4byte 0x02023460
_0807B068: .4byte 0x081BD958
_0807B06C: .4byte 0x081BD758

	thumb_func_start sub_0807B070
sub_0807B070: @ 0x0807B070
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807B0CC @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807B0C4
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _0807B0D0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0807B0C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B0CC: .4byte 0x03002870
_0807B0D0: .4byte 0x02023C60

	thumb_func_start sub_0807B0D4
sub_0807B0D4: @ 0x0807B0D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807B160 @ =0x03002870
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0807B164 @ =0x06003000
	ldr r1, _0807B168 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuFastSet
	ldr r0, _0807B16C @ =0x02023C60
	ldr r1, _0807B170 @ =0x081BD958
	movs r2, #0xe4
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0807B174 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl EnableBgSync
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r5, #0xc]
	ands r0, r1
	strb r0, [r5, #0xc]
	adds r0, r2, #0
	ldrb r1, [r5, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x10]
	movs r0, #3
	ldrb r1, [r5, #0x14]
	orrs r0, r1
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r5, #0x18]
	ldr r0, [r4, #0x14]
	bl TryUnlockProc
	adds r4, #0x64
	movs r0, #2
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B160: .4byte 0x03002870
_0807B164: .4byte 0x06003000
_0807B168: .4byte 0x06004000
_0807B16C: .4byte 0x02023C60
_0807B170: .4byte 0x081BD958
_0807B174: .4byte 0x02023460

	thumb_func_start sub_0807B178
sub_0807B178: @ 0x0807B178
	push {lr}
	ldr r0, _0807B184 @ =sub_08077C0C
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807B184: .4byte sub_08077C0C

	thumb_func_start sub_0807B188
sub_0807B188: @ 0x0807B188
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0807B1D4 @ =0x06003000
	ldr r2, _0807B1D8 @ =0x01000C00
	mov r0, sp
	bl CpuFastSet
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _0807B1DC @ =0x03002870
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807B1D4: .4byte 0x06003000
_0807B1D8: .4byte 0x01000C00
_0807B1DC: .4byte 0x03002870

	thumb_func_start sub_0807B1E0
sub_0807B1E0: @ 0x0807B1E0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807B1F0 @ =0x08CA75D4
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0807B1F0: .4byte 0x08CA75D4

	thumb_func_start sub_0807B1F4
sub_0807B1F4: @ 0x0807B1F4
	push {lr}
	ldr r0, _0807B208 @ =0x08CA75D4
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807B208: .4byte 0x08CA75D4

	thumb_func_start sub_0807B20C
sub_0807B20C: @ 0x0807B20C
	push {lr}
	ldr r0, _0807B21C @ =0x08CA75D4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807B21C: .4byte 0x08CA75D4

	thumb_func_start sub_0807B220
sub_0807B220: @ 0x0807B220
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start DragonSpriteBlinking_Loop
DragonSpriteBlinking_Loop: @ 0x0807B228
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x86
	bl GetUnitByPid
	adds r2, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	cmp r2, #0
	beq _0807B25E
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _0807B25E
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807B25E
	eors r1, r3
	str r1, [r2, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_0807B25E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807B264
sub_0807B264: @ 0x0807B264
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807B274 @ =0x08CA762C
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0807B274: .4byte 0x08CA762C

	thumb_func_start sub_0807B278
sub_0807B278: @ 0x0807B278
	push {lr}
	ldr r0, _0807B288 @ =0x08CA762C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807B288: .4byte 0x08CA762C

	thumb_func_start PutDragonGateFlame
PutDragonGateFlame: @ 0x0807B28C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0807B2E0 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r4, r0, r4
	movs r1, #0xff
	ands r4, r1
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	subs r5, r0, r5
	ands r5, r1
	ldr r0, _0807B2E4 @ =0x081B9790
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807B2E8 @ =0x081B93C8
	ldr r1, _0807B2EC @ =0x06000800
	bl Decompress
	ldr r0, _0807B2F0 @ =0x02022C60
	ldr r1, _0807B2F4 @ =0x081B97B0
	movs r2, #0x40
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	adds r1, r4, #0
	adds r2, r5, #0
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B2E0: .4byte 0x0202BBB8
_0807B2E4: .4byte 0x081B9790
_0807B2E8: .4byte 0x081B93C8
_0807B2EC: .4byte 0x06000800
_0807B2F0: .4byte 0x02022C60
_0807B2F4: .4byte 0x081B97B0

	thumb_func_start sub_0807B2F8
sub_0807B2F8: @ 0x0807B2F8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r3, r0, #0
	ldr r2, _0807B340 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r3, r3, r0
	ldr r5, _0807B344 @ =0x000001FF
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r1, r1, r0
	movs r4, #0xff
	ldr r0, _0807B348 @ =0x08197CC8
	ldr r6, _0807B34C @ =0x08198164
	ldr r2, _0807B350 @ =0x08198838
	ands r3, r5
	ands r1, r4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	movs r1, #0xd0
	lsls r1, r1, #3
	str r1, [sp, #0x10]
	movs r1, #4
	str r1, [sp, #0x14]
	adds r1, r6, #0
	bl StartSpriteAnimfx
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B340: .4byte 0x0202BBB8
_0807B344: .4byte 0x000001FF
_0807B348: .4byte 0x08197CC8
_0807B34C: .4byte 0x08198164
_0807B350: .4byte 0x08198838

	thumb_func_start DragonFlamefx_Handler
DragonFlamefx_Handler: @ 0x0807B354
	push {lr}
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0807B380
	movs r0, #0x1f
	ands r1, r0
	cmp r1, #0
	bne _0807B380
	ldr r0, _0807B384 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B380
	movs r0, #0xf8
	bl m4aSongNumStart
_0807B380:
	pop {r0}
	bx r0
	.align 2, 0
_0807B384: .4byte 0x0202BBF8

	thumb_func_start sub_0807B388
sub_0807B388: @ 0x0807B388
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl sub_080AA964
	bl ArchiveCurrentPalettes
	adds r6, r4, #0
	adds r6, #0x4c
	movs r3, #0
	movs r5, #0
	strh r5, [r6]
	ldr r7, _0807B47C @ =0x03002870
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r3, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0807B480 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807B484 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_08077910
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807B488 @ =HBlank_Scanline_8078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #7
	bl EnableBgSync
	strh r5, [r6]
	ldr r0, _0807B48C @ =0x08CF09B8
	movs r1, #0x80
	lsls r1, r1, #7
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0x80
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x90
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_080139D8
	str r5, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
	ldr r0, _0807B490 @ =DragonFlamefx_Handler
	adds r1, r4, #0
	bl StartParallelWorker
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B47C: .4byte 0x03002870
_0807B480: .4byte 0x0000FFE0
_0807B484: .4byte 0x0000E0FF
_0807B488: .4byte HBlank_Scanline_8078098
_0807B48C: .4byte 0x08CF09B8
_0807B490: .4byte DragonFlamefx_Handler

	thumb_func_start sub_0807B494
sub_0807B494: @ 0x0807B494
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r2, [r5]
	adds r2, #1
	movs r4, #0
	strh r2, [r5]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807B4E4 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807B4DE
	movs r0, #0
	strh r0, [r5]
	adds r0, r6, #0
	bl Proc_Break
_0807B4DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B4E4: .4byte 0x03002870

	thumb_func_start DragonFlamefx_EndRing
DragonFlamefx_EndRing: @ 0x0807B4E8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r0, #0x4c
	movs r5, #0
	strh r5, [r0]
	movs r0, #0
	bl BmBgfxSetLoopEN
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	adds r4, #0x64
	strh r5, [r4]
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807B528
sub_0807B528: @ 0x0807B528
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807B574 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807B56E
	adds r0, r5, #0
	bl Proc_Break
_0807B56E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B574: .4byte 0x03002870

	thumb_func_start sub_0807B578
sub_0807B578: @ 0x0807B578
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r3, _0807B5FC @ =0x03002870
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
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0807B600 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807B604 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807B608 @ =0x08B923EC
	bl Proc_Find
	bl Proc_End
	movs r0, #0x70
	movs r1, #0x20
	bl PutDragonGateFlame
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B5FC: .4byte 0x03002870
_0807B600: .4byte 0x0000FFE0
_0807B604: .4byte 0x0000E0FF
_0807B608: .4byte 0x08B923EC

	thumb_func_start sub_0807B60C
sub_0807B60C: @ 0x0807B60C
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _0807B68C @ =0x02022C00
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0x1b
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r6, #0x80
	lsls r6, r6, #0x14
	str r6, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	movs r0, #0xda
	bl GetUnitByPid
	adds r4, r0, #0
	cmp r4, #0
	beq _0807B65E
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807B65E:
	movs r0, #0x86
	bl GetUnitByPid
	adds r4, r0, #0
	cmp r4, #0
	beq _0807B672
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807B672:
	ldr r0, _0807B690 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B684
	movs r0, #0xd6
	bl m4aSongNumStart
_0807B684:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B68C: .4byte 0x02022C00
_0807B690: .4byte 0x0202BBF8

	thumb_func_start sub_0807B694
sub_0807B694: @ 0x0807B694
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807B6B2
	adds r0, r5, #0
	bl sub_0807B60C
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_0807B2F8
_0807B6B2:
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	ldr r0, _0807B6F8 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807B6F2
	adds r0, r5, #0
	bl Proc_Break
_0807B6F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B6F8: .4byte 0x03002870

	thumb_func_start sub_0807B6FC
sub_0807B6FC: @ 0x0807B6FC
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807B768 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0807B76C @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #5
	bl EnableBgSync
	ldr r3, _0807B770 @ =0x03002870
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
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807B768: .4byte 0x02023C60
_0807B76C: .4byte 0x02022C60
_0807B770: .4byte 0x03002870

	thumb_func_start sub_0807B774
sub_0807B774: @ 0x0807B774
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807B784 @ =0x08CA763C
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0807B784: .4byte 0x08CA763C

	thumb_func_start sub_0807B788
sub_0807B788: @ 0x0807B788
	push {lr}
	ldr r0, _0807B798 @ =0x08CA763C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807B798: .4byte 0x08CA763C

	thumb_func_start sub_0807B79C
sub_0807B79C: @ 0x0807B79C
	push {lr}
	ldr r0, _0807B7B0 @ =0x08CA763C
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807B7B0: .4byte 0x08CA763C

	thumb_func_start sub_0807B7B4
sub_0807B7B4: @ 0x0807B7B4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807B7E8
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0807B7E8
	ldr r0, _0807B814 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B7DC
	movs r0, #0xe5
	bl m4aSongNumStart
_0807B7DC:
	movs r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl Proc_Goto
_0807B7E8:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0807B80A
	ldr r0, [r4, #0x50]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0807B80A
	ldr r0, _0807B814 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B80A
	movs r0, #0xf8
	bl m4aSongNumStart
_0807B80A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807B814: .4byte 0x0202BBF8

	thumb_func_start sub_0807B818
sub_0807B818: @ 0x0807B818
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ArchiveCurrentPalettes
	adds r6, r5, #0
	adds r6, #0x4c
	movs r3, #0
	movs r4, #0
	strh r4, [r6]
	ldr r7, _0807B8F8 @ =0x03002870
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r3, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0807B8FC @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807B900 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_08077910
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807B904 @ =HBlank_Scanline_8078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #7
	bl EnableBgSync
	strh r4, [r6]
	ldr r0, _0807B908 @ =0x08CF0214
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	str r4, [sp, #8]
	ldr r1, _0807B90C @ =sub_0807B7B4
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0x80
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x82
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8F8: .4byte 0x03002870
_0807B8FC: .4byte 0x0000FFE0
_0807B900: .4byte 0x0000E0FF
_0807B904: .4byte HBlank_Scanline_8078098
_0807B908: .4byte 0x08CF0214
_0807B90C: .4byte sub_0807B7B4

	thumb_func_start sub_0807B910
sub_0807B910: @ 0x0807B910
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x12
	ldr r2, _0807B948 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r3, r2, #0
	cmp r4, #6
	bgt _0807B94C
	movs r0, #0x10
	subs r1, r0, r4
	b _0807B94E
	.align 2, 0
_0807B948: .4byte 0x03002870
_0807B94C:
	movs r1, #0xa
_0807B94E:
	adds r0, r3, #0
	adds r0, #0x45
	movs r3, #0
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x46
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807B96C
	adds r0, r5, #0
	adds r0, #0x4c
	strh r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807B96C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807B974
sub_0807B974: @ 0x0807B974
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r6, r2, #0x13
	ldr r0, _0807B9EC @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x50
	bne _0807B9D8
	movs r0, #0x80
	lsls r0, r0, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #0x80
	movs r2, #0x80
	bl sub_080139D8
_0807B9D8:
	cmp r6, #0x10
	bne _0807B9E2
	adds r0, r5, #0
	bl Proc_Break
_0807B9E2:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9EC: .4byte 0x03002870

	thumb_func_start sub_0807B9F0
sub_0807B9F0: @ 0x0807B9F0
	push {r4, lr}
	movs r4, #0x41
_0807B9F4:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807BA0E
	ldr r1, [r0]
	cmp r1, #0
	beq _0807BA0E
	ldrb r1, [r1, #4]
	cmp r1, #0x86
	beq _0807BA0E
	bl ClearUnit
_0807BA0E:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B9F4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807BA1C
sub_0807BA1C: @ 0x0807BA1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	ldr r0, _0807BB00 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807BB04 @ =0x03002870
	mov ip, r0
	mov r5, ip
	adds r5, #0x3c
	movs r3, #0x3f
	ldrb r1, [r5]
	ands r3, r1
	mov r6, ip
	adds r6, #0x44
	movs r2, #0
	mov r8, r2
	movs r7, #0x45
	add r7, ip
	mov sl, r7
	movs r4, #0x10
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r7, ip
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r7, [r7, #0x14]
	ands r1, r7
	movs r0, #2
	orrs r1, r0
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	movs r0, #0x40
	orrs r3, r0
	strb r3, [r5]
	strb r4, [r6]
	mov r7, sl
	strb r4, [r7]
	mov r1, r8
	ldr r0, _0807BB08 @ =0x030028B6
	strb r1, [r0]
	ldr r0, _0807BB0C @ =0x0000FFE0
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807BB10 @ =0x0000E0FF
	ands r0, r1
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x70
	movs r1, #0x20
	bl PutDragonGateFlame
	bl sub_0807B9F0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _0807BB14 @ =0xFFDFFFFE
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	mov r7, sb
	str r7, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB00: .4byte 0x02023C60
_0807BB04: .4byte 0x03002870
_0807BB08: .4byte 0x030028B6
_0807BB0C: .4byte 0x0000FFE0
_0807BB10: .4byte 0x0000E0FF
_0807BB14: .4byte 0xFFDFFFFE

	thumb_func_start sub_0807BB18
sub_0807BB18: @ 0x0807BB18
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_0807B2F8
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807BB30
sub_0807BB30: @ 0x0807BB30
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r2, r0, #1
	strh r2, [r4]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x13
	ldr r0, _0807BBD8 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #8
	bne _0807BB82
	movs r0, #0x86
	bl GetUnitByPid
	adds r1, r5, #0
	bl StartUnitTornOut
_0807BB82:
	ldrh r4, [r4]
	cmp r4, #0x10
	bne _0807BB9A
	ldr r0, _0807BBDC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807BB9A
	movs r0, #0xd6
	bl m4aSongNumStart
_0807BB9A:
	cmp r6, #0x10
	bne _0807BBD0
	ldr r0, _0807BBE0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r2, _0807BBD8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807BBD0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBD8: .4byte 0x03002870
_0807BBDC: .4byte 0x0202BBF8
_0807BBE0: .4byte 0x02022C60

	thumb_func_start sub_0807BBE4
sub_0807BBE4: @ 0x0807BBE4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807BBF4 @ =0x08CA76DC
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF4: .4byte 0x08CA76DC

	thumb_func_start sub_0807BBF8
sub_0807BBF8: @ 0x0807BBF8
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetText
	ldr r1, _0807BC6C @ =0x06009000
	mov r0, sp
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	mov r0, sp
	bl SetTextFont
	movs r4, #0
	str r4, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0807BC70 @ =0x01000008
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _0807BC74 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	add r4, sp, #0x20
	adds r0, r4, #0
	movs r1, #0x14
	bl InitText
	ldr r1, _0807BC78 @ =0x020246AA
	adds r0, r4, #0
	bl PutText
	movs r0, #0xa0
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BC6C: .4byte 0x06009000
_0807BC70: .4byte 0x01000008
_0807BC74: .4byte 0x06008000
_0807BC78: .4byte 0x020246AA

	thumb_func_start CandleFlameFx_ScanlineEffect
CandleFlameFx_ScanlineEffect: @ 0x0807BC7C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #2
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r6, #0x1e
	str r6, [sp, #4]
	movs r5, #8
	str r5, [sp, #8]
	movs r2, #7
	movs r3, #7
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x11
	asrs r1, r1, #0x10
	mov r2, r8
	str r2, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #3
	movs r3, #0xf
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartCandleFlameFx
StartCandleFlameFx: @ 0x0807BCE0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0807BD40 @ =0x02023460
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0807BD44 @ =0x08425478
	ldr r1, _0807BD48 @ =0x06000800
	bl Decompress
	ldr r1, _0807BD4C @ =0x08425578
	ldr r2, _0807BD50 @ =0x00007040
	adds r0, r4, #0
	bl TmApplyTsa_t
	ldr r0, _0807BD54 @ =0x08425558
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	bl InitScanlineEffect
	ldr r0, _0807BD58 @ =CandleFlameFx_OnHBlank
	bl SetOnHBlankA
	ldr r0, _0807BD5C @ =CandleFlameFx_ScanlineEffect
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _0807BD60 @ =0x085499B4
	ldr r1, _0807BD64 @ =0x08425B20
	movs r2, #7
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl StartMixPalette
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD40: .4byte 0x02023460
_0807BD44: .4byte 0x08425478
_0807BD48: .4byte 0x06000800
_0807BD4C: .4byte 0x08425578
_0807BD50: .4byte 0x00007040
_0807BD54: .4byte 0x08425558
_0807BD58: .4byte CandleFlameFx_OnHBlank
_0807BD5C: .4byte CandleFlameFx_ScanlineEffect
_0807BD60: .4byte 0x085499B4
_0807BD64: .4byte 0x08425B20

	thumb_func_start sub_0807BD68
sub_0807BD68: @ 0x0807BD68
	push {lr}
	bl sub_080AA964
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807BD74
sub_0807BD74: @ 0x0807BD74
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_080AA964
	ldr r3, _0807BE20 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r6, [r2]
	ands r0, r6
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
	ldr r0, _0807BE24 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0807BE28 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807BE2C @ =0x06008000
	ldr r1, _0807BE30 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _0807BE34 @ =0x02022960
	ldr r6, _0807BE38 @ =0xFFFFFF00
	adds r1, r0, r6
	movs r2, #0x38
	bl CpuFastSet
	ldr r0, _0807BE3C @ =0x00008080
	adds r3, r0, #0
	ldr r2, _0807BE40 @ =0x02024460
	ldr r1, _0807BE44 @ =0x02023C60
	movs r4, #0x80
	lsls r4, r4, #3
_0807BDF8:
	ldrh r6, [r2]
	adds r0, r3, r6
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0807BDF8
	bl EnablePalSync
	movs r0, #4
	bl EnableBgSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE20: .4byte 0x03002870
_0807BE24: .4byte 0x0000FFE0
_0807BE28: .4byte 0x0000E0FF
_0807BE2C: .4byte 0x06008000
_0807BE30: .4byte 0x06001000
_0807BE34: .4byte 0x02022960
_0807BE38: .4byte 0xFFFFFF00
_0807BE3C: .4byte 0x00008080
_0807BE40: .4byte 0x02024460
_0807BE44: .4byte 0x02023C60

	thumb_func_start sub_0807BE48
sub_0807BE48: @ 0x0807BE48
	ldr r2, _0807BE64 @ =0x03002870
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
_0807BE64: .4byte 0x03002870

	thumb_func_start sub_0807BE68
sub_0807BE68: @ 0x0807BE68
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807BED0 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x37
	str r2, [sp]
	movs r2, #8
	movs r3, #8
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	ldr r3, _0807BED4 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _0807BED8 @ =0x0854F180
	ldr r1, _0807BEDC @ =0x08425C20
	movs r2, #7
	str r2, [sp]
	ldr r2, [r4, #0x14]
	str r2, [sp, #4]
	movs r2, #2
	movs r3, #8
	bl StartMixPalette
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BED0: .4byte 0x02024460
_0807BED4: .4byte 0x03002870
_0807BED8: .4byte 0x0854F180
_0807BEDC: .4byte 0x08425C20

	thumb_func_start sub_0807BEE0
sub_0807BEE0: @ 0x0807BEE0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807BF2C @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807BF26
	adds r0, r4, #0
	bl Proc_Break
_0807BF26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BF2C: .4byte 0x03002870

	thumb_func_start sub_0807BF30
sub_0807BF30: @ 0x0807BF30
	push {lr}
	ldr r0, _0807BF9C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0807BFA0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #6
	bl EnableBgSync
	ldr r3, _0807BFA4 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
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
	bl EndAllParallelWorkers
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807BF9C: .4byte 0x02023460
_0807BFA0: .4byte 0x02023C60
_0807BFA4: .4byte 0x03002870

	thumb_func_start sub_0807BFA8
sub_0807BFA8: @ 0x0807BFA8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807BFB8 @ =0x08CA7754
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0807BFB8: .4byte 0x08CA7754

	thumb_func_start QuintessenceFx_ParallelWorker
QuintessenceFx_ParallelWorker: @ 0x0807BFBC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r6, #0x3c
	str r6, [sp, #4]
	movs r5, #0x10
	str r5, [sp, #8]
	movs r2, #3
	movs r3, #2
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	str r2, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #2
	movs r3, #4
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start QuintFxBg2_Init
QuintFxBg2_Init: @ 0x0807C020
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0

	thumb_func_start QuintFxBg2_Loop
QuintFxBg2_Loop: @ 0x0807C028
	push {lr}
	ldr r2, [r0, #0x58]
	adds r2, #1
	str r2, [r0, #0x58]
	lsls r1, r2, #0xe
	lsrs r1, r1, #0x10
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807C044
sub_0807C044: @ 0x0807C044
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0807C0E0 @ =0x03002870
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
	movs r4, #0
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0807C0E4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807C0E8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C0EC @ =0x081B98C8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807C0F0 @ =0x083FF780
	ldr r1, _0807C0F4 @ =0x06004000
	bl Decompress
	ldr r0, _0807C0F8 @ =0x02023C60
	ldr r1, _0807C0FC @ =0x081B98E8
	movs r2, #0xa4
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #0xc
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	str r4, [r5, #0x58]
	bl InitScanlineEffect
	ldr r0, _0807C100 @ =QuintessenceFx_OnHBlank
	bl SetOnHBlankA
	ldr r0, _0807C104 @ =QuintessenceFx_ParallelWorker
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _0807C108 @ =0x08CA7794
	movs r1, #0
	bl SpawnProc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C0E0: .4byte 0x03002870
_0807C0E4: .4byte 0x0000FFE0
_0807C0E8: .4byte 0x0000E0FF
_0807C0EC: .4byte 0x081B98C8
_0807C0F0: .4byte 0x083FF780
_0807C0F4: .4byte 0x06004000
_0807C0F8: .4byte 0x02023C60
_0807C0FC: .4byte 0x081B98E8
_0807C100: .4byte QuintessenceFx_OnHBlank
_0807C104: .4byte QuintessenceFx_ParallelWorker
_0807C108: .4byte 0x08CA7794

	thumb_func_start sub_0807C10C
sub_0807C10C: @ 0x0807C10C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807C158 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807C152
	adds r0, r4, #0
	bl Proc_Break
_0807C152:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C158: .4byte 0x03002870

	thumb_func_start sub_0807C15C
sub_0807C15C: @ 0x0807C15C
	push {r4, lr}
	ldr r1, _0807C1AC @ =0x03002870
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r2, ip
	adds r2, #0x44
	movs r3, #0
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x45
	strb r3, [r1]
	adds r1, #1
	strb r3, [r1]
	ldr r1, _0807C1B0 @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #4
	orrs r1, r2
	ldr r2, _0807C1B4 @ =0x0000E0FF
	ands r1, r2
	movs r4, #0xc0
	lsls r4, r4, #5
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r0, #0x4c
	strh r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C1AC: .4byte 0x03002870
_0807C1B0: .4byte 0x0000FFE0
_0807C1B4: .4byte 0x0000E0FF

	thumb_func_start sub_0807C1B8
sub_0807C1B8: @ 0x0807C1B8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807C204 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0xa
	bne _0807C1FE
	adds r0, r4, #0
	bl Proc_Break
_0807C1FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C204: .4byte 0x03002870

	thumb_func_start sub_0807C208
sub_0807C208: @ 0x0807C208
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807C254 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807C24E
	adds r0, r4, #0
	bl Proc_Break
_0807C24E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C254: .4byte 0x03002870

	thumb_func_start sub_0807C258
sub_0807C258: @ 0x0807C258
	push {lr}
	ldr r0, _0807C2B4 @ =0x08CA7794
	bl Proc_Find
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0807C2B8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _0807C2BC @ =0x03002870
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
	pop {r0}
	bx r0
	.align 2, 0
_0807C2B4: .4byte 0x08CA7794
_0807C2B8: .4byte 0x02023C60
_0807C2BC: .4byte 0x03002870

	thumb_func_start sub_0807C2C0
sub_0807C2C0: @ 0x0807C2C0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C2D0 @ =0x08CA77AC
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0807C2D0: .4byte 0x08CA77AC

	thumb_func_start sub_0807C2D4
sub_0807C2D4: @ 0x0807C2D4
	push {lr}
	ldr r0, _0807C2E8 @ =0x08CA77AC
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C2E8: .4byte 0x08CA77AC

	thumb_func_start QuintessenceFx_Goto_C
QuintessenceFx_Goto_C: @ 0x0807C2EC
	push {lr}
	ldr r0, _0807C300 @ =0x08CA77AC
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C300: .4byte 0x08CA77AC

	thumb_func_start sub_0807C304
sub_0807C304: @ 0x0807C304
	push {lr}
	ldr r0, _0807C314 @ =0x08CA77AC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807C314: .4byte 0x08CA77AC

	thumb_func_start sub_0807C318
sub_0807C318: @ 0x0807C318
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start UnitTornOut_Loop
UnitTornOut_Loop: @ 0x0807C320
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x54]
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl TornOutUnitSprite
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _0807C358
	ldr r0, [r5, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r5, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	adds r0, r6, #0
	bl Proc_Break
_0807C358:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartUnitTornOut
StartUnitTornOut: @ 0x0807C360
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807C374 @ =0x08CA7844
	bl SpawnProc
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C374: .4byte 0x08CA7844

	thumb_func_start sub_0807C378
sub_0807C378: @ 0x0807C378
	push {lr}
	bl CheckLinkedToFE6
	cmp r0, #0
	bgt _0807C386
	movs r0, #0
	b _0807C388
_0807C386:
	movs r0, #1
_0807C388:
	pop {r1}
	bx r1

	thumb_func_start sub_0807C38C
sub_0807C38C: @ 0x0807C38C
	push {lr}
	bl CheckLinkedToFE6
	cmp r0, #1
	bgt _0807C39A
	movs r0, #0
	b _0807C39C
_0807C39A:
	movs r0, #1
_0807C39C:
	pop {r1}
	bx r1

	thumb_func_start sub_0807C3A0
sub_0807C3A0: @ 0x0807C3A0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #8
	strh r0, [r4]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #0
	bl GetBgYOffset
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	str r0, [sp]
	movs r0, #0x50
	mov r8, r0
	str r0, [sp, #4]
	movs r6, #1
	str r6, [sp, #8]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #2
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #0
	bl GetBgXOffset
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r5, #0
	movs r2, #3
	movs r3, #2
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807C41C
sub_0807C41C: @ 0x0807C41C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807C4F4 @ =0x083FC91C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0807C4F8 @ =0x03002870
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
	movs r4, #0
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0807C4FC @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807C500 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C504 @ =0x081A68FC
	ldr r1, _0807C508 @ =0x06000800
	bl Decompress
	ldr r0, _0807C50C @ =0x081A71C8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807C510 @ =0x02022C60
	ldr r1, [r5, #0x58]
	lsls r1, r1, #2
	add r1, sp
	ldr r1, [r1]
	ldr r2, _0807C514 @ =0x00005040
	bl sub_080AACD8
	ldr r1, [r5, #0x2c]
	rsbs r1, r1, #0
	movs r0, #0xff
	ands r1, r0
	ldr r2, [r5, #0x30]
	rsbs r2, r2, #0
	ands r2, r0
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	bl InitScanlineEffect
	ldr r0, _0807C518 @ =sub_08077ADC
	bl SetOnHBlankA
	ldr r0, _0807C51C @ =sub_0807C3A0
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C4F4: .4byte 0x083FC91C
_0807C4F8: .4byte 0x03002870
_0807C4FC: .4byte 0x0000FFE0
_0807C500: .4byte 0x0000E0FF
_0807C504: .4byte 0x081A68FC
_0807C508: .4byte 0x06000800
_0807C50C: .4byte 0x081A71C8
_0807C510: .4byte 0x02022C60
_0807C514: .4byte 0x00005040
_0807C518: .4byte sub_08077ADC
_0807C51C: .4byte sub_0807C3A0

	thumb_func_start sub_0807C520
sub_0807C520: @ 0x0807C520
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0xf
	ldr r0, _0807C574 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	asrs r1, r2, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807C56C
	strh r3, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807C56C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C574: .4byte 0x03002870

	thumb_func_start sub_0807C578
sub_0807C578: @ 0x0807C578
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C590
	adds r0, #0xf
_0807C590:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _0807C5B6
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C5A6
	adds r0, r1, #7
_0807C5A6:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	subs r4, r1, r0
	b _0807C5CC
_0807C5B6:
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C5BE
	adds r0, r1, #7
_0807C5BE:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r0, #0
	adds r4, #8
_0807C5CC:
	ldr r3, _0807C610 @ =0x03002870
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
	movs r2, #0
	strb r4, [r0]
	asrs r1, r4, #1
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	cmp r1, #0x10
	bne _0807C60A
	strh r2, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807C60A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C610: .4byte 0x03002870

	thumb_func_start sub_0807C614
sub_0807C614: @ 0x0807C614
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r0, _0807C668 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r4
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	asrs r2, r2, #0x11
	adds r2, #8
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807C662
	adds r0, r5, #0
	bl Proc_Break
_0807C662:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C668: .4byte 0x03002870

	thumb_func_start sub_0807C66C
sub_0807C66C: @ 0x0807C66C
	push {lr}
	ldr r0, _0807C6A4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r2, _0807C6A8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C6A4: .4byte 0x02022C60
_0807C6A8: .4byte 0x03002870

	thumb_func_start StartFlameBreathfx
StartFlameBreathfx: @ 0x0807C6AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0807C6C8 @ =0x08CA7864
	bl SpawnProcLocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C6C8: .4byte 0x08CA7864

	thumb_func_start sub_0807C6CC
sub_0807C6CC: @ 0x0807C6CC
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ArchiveCurrentPalettes
	adds r0, r5, #0
	adds r0, #0x4c
	movs r3, #0
	movs r4, #0
	strh r4, [r0]
	ldr r6, _0807C798 @ =0x03002870
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _0807C79C @ =0x0000FFE0
	ldrh r2, [r6, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807C7A0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #0x3c]
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_08077910
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807C7A4 @ =HBlank_Scanline_8078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r0, [r6, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, #0x14]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	movs r0, #7
	bl EnableBgSync
	ldr r0, _0807C7A8 @ =0x08CF0B8C
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r0, _0807C7AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C790
	ldr r0, _0807C7B0 @ =0x000002FA
	bl m4aSongNumStart
_0807C790:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C798: .4byte 0x03002870
_0807C79C: .4byte 0x0000FFE0
_0807C7A0: .4byte 0x0000E0FF
_0807C7A4: .4byte HBlank_Scanline_8078098
_0807C7A8: .4byte 0x08CF0B8C
_0807C7AC: .4byte 0x0202BBF8
_0807C7B0: .4byte 0x000002FA

	thumb_func_start IceCrystalfx_ResetPalette
IceCrystalfx_ResetPalette: @ 0x0807C7B4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	bl ArchiveCurrentPalettes
	adds r0, r4, #0
	bl StartEventHorizontalQuakefxViolentlyNoSound
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807C7D4
sub_0807C7D4: @ 0x0807C7D4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #0x10
	strh r0, [r4]
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #1
	bl WriteFadedPaletteFromArchive
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r4]
	cmp r1, r0
	bne _0807C80A
	adds r0, r5, #0
	bl StartEventHorizontalQuakefxSlightlyNoSound
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807C80A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0807C810
sub_0807C810: @ 0x0807C810
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r5, _0807C898 @ =0x03002870
	adds r3, r5, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, r5, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r4, [r0]
	cmp r2, #0x10
	bne _0807C892
	ldr r0, _0807C89C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r5, #0xc]
	ands r0, r2
	strb r0, [r5, #0xc]
	adds r0, r1, #0
	ldrb r2, [r5, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r6, #0
	bl Proc_Break
_0807C892:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C898: .4byte 0x03002870
_0807C89C: .4byte 0x02023C60

	thumb_func_start sub_0807C8A0
sub_0807C8A0: @ 0x0807C8A0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C8B0 @ =0x08CA789C
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0807C8B0: .4byte 0x08CA789C

	thumb_func_start sub_0807C8B4
sub_0807C8B4: @ 0x0807C8B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0807C8F4 @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _0807C8F8 @ =0x00000FCC
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetBoxTalkFlags
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetBoxTalkFlags
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C8F4: .4byte 0x06013000
_0807C8F8: .4byte 0x00000FCC

	thumb_func_start sub_0807C8FC
sub_0807C8FC: @ 0x0807C8FC
	push {r4, lr}
	ldr r2, _0807C95C @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl GetTalkResult
	cmp r0, #1
	bne _0807C966
	movs r4, #1
_0807C92A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807C960
	ldr r1, [r2]
	cmp r1, #0
	beq _0807C960
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0807C960
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	b _0807C966
	.align 2, 0
_0807C95C: .4byte 0x03002870
_0807C960:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807C92A
_0807C966:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807C96C
sub_0807C96C: @ 0x0807C96C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807C984 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x11
	beq _0807C988
	cmp r0, #0x14
	beq _0807C996
	b _0807C9A2
	.align 2, 0
_0807C984: .4byte 0x0202BBF8
_0807C988:
	movs r0, #0x6a
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C9AA
	b _0807C9A2
_0807C996:
	movs r0, #0x6a
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C9AA
_0807C9A2:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0807C9AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807C9B0
sub_0807C9B0: @ 0x0807C9B0
	push {lr}
	ldr r2, _0807C9FC @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807CA00 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	movs r0, #0x1c
	bl DisplayBackground
	bl ArchiveCurrentPalettes
	movs r3, #0xf0
	lsls r3, r3, #4
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
	pop {r0}
	bx r0
	.align 2, 0
_0807C9FC: .4byte 0x03002870
_0807CA00: .4byte 0x0000FFE0

	thumb_func_start sub_0807CA04
sub_0807CA04: @ 0x0807CA04
	push {r4, lr}
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r4, _0807CA38 @ =0x0202BBF8
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	bne _0807CA22
	ldr r2, _0807CA3C @ =0x00000FC9
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807CA22:
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0807CA32
	ldr r2, _0807CA40 @ =0x00000FCA
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807CA32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA38: .4byte 0x0202BBF8
_0807CA3C: .4byte 0x00000FC9
_0807CA40: .4byte 0x00000FCA

	thumb_func_start sub_0807CA44
sub_0807CA44: @ 0x0807CA44
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ClearTalk
	movs r0, #0
	bl InitBgs
	ldr r2, _0807CAB4 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl ApplySystemObjectsGraphics
	ldr r4, _0807CAB8 @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	ldr r2, _0807CABC @ =0x00000FCB
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetBoxTalkFlags
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetBoxTalkFlags
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CAB4: .4byte 0x03002870
_0807CAB8: .4byte 0x06013000
_0807CABC: .4byte 0x00000FCB

	thumb_func_start sub_0807CAC0
sub_0807CAC0: @ 0x0807CAC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _0807CB1C @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl ApplySystemObjectsGraphics
	ldr r1, _0807CB20 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807CB16
	movs r0, #0x90
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CB16
	ldr r0, _0807CB24 @ =0x08CA7994
	adds r1, r4, #0
	bl SpawnProcLocking
	movs r0, #0x90
	bl ClearFlag
_0807CB16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CB1C: .4byte 0x03002870
_0807CB20: .4byte 0x0202BBF8
_0807CB24: .4byte 0x08CA7994

	thumb_func_start sub_0807CB28
sub_0807CB28: @ 0x0807CB28
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start sub_0807CB3C
sub_0807CB3C: @ 0x0807CB3C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0x28
	bl GetUnitByPid
	adds r5, r0, #0
	bl LoadUiFrameGraphics
	bl ResetText
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #8
	movs r2, #0x11
	movs r3, #4
	bl DrawUiFrame2
	ldr r0, _0807CBD0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807CB74
	ldr r0, _0807CBD4 @ =0x0000037B
	bl m4aSongNumStart
_0807CB74:
	ldr r0, _0807CBD8 @ =0x000012CE
	bl GetMsg
	ldr r4, _0807CBDC @ =0x02022EA2
	adds r1, r4, #0
	adds r1, #0xe
	movs r2, #0x10
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	adds r0, #0x28
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumber
	ldr r0, _0807CBE0 @ =0x000012CF
	bl GetMsg
	adds r4, #0x2a
	movs r1, #8
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r1, r6, #0
	adds r1, #0x4c
	movs r0, #0x78
	strh r0, [r1]
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CBD0: .4byte 0x0202BBF8
_0807CBD4: .4byte 0x0000037B
_0807CBD8: .4byte 0x000012CE
_0807CBDC: .4byte 0x02022EA2
_0807CBE0: .4byte 0x000012CF

	thumb_func_start sub_0807CBE4
sub_0807CBE4: @ 0x0807CBE4
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807CC06
	ldr r0, _0807CC10 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0807CC0C
_0807CC06:
	adds r0, r2, #0
	bl Proc_Break
_0807CC0C:
	pop {r0}
	bx r0
	.align 2, 0
_0807CC10: .4byte 0x08B857F8

	thumb_func_start sub_0807CC14
sub_0807CC14: @ 0x0807CC14
	push {lr}
	ldr r0, _0807CC30 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0807CC34 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807CC30: .4byte 0x02023460
_0807CC34: .4byte 0x02022C60

	thumb_func_start sub_0807CC38
sub_0807CC38: @ 0x0807CC38
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl HasConvoyAccess_
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CC50
	ldr r0, _0807CC58 @ =0x08CA78DC
	adds r1, r4, #0
	bl SpawnProcLocking
_0807CC50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CC58: .4byte 0x08CA78DC

	thumb_func_start sub_0807CC5C
sub_0807CC5C: @ 0x0807CC5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _0807CD38 @ =0x030028AC
	mov ip, r2
	ldr r0, _0807CD3C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	mov r8, r0
	mov r0, r8
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #8
	rsbs r2, r2, #0
	add r2, ip
	mov sb, r2
	mov r1, r8
	ldrb r0, [r2]
	orrs r1, r0
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	mov sl, r2
	mov r0, sl
	ldrb r2, [r7]
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, sl
	ands r0, r1
	strb r0, [r7]
	movs r0, #0x3f
	mov r2, ip
	ldrb r2, [r2]
	ands r0, r2
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _0807CD40 @ =sub_080777E4
	bl SetOnHBlankA
	ldr r0, _0807CD44 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807CD2A
	ldr r0, _0807CD48 @ =0x00000269
	bl m4aSongNumStart
_0807CD2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CD38: .4byte 0x030028AC
_0807CD3C: .4byte 0x0000FFE0
_0807CD40: .4byte sub_080777E4
_0807CD44: .4byte 0x0202BBF8
_0807CD48: .4byte 0x00000269

	thumb_func_start sub_0807CD4C
sub_0807CD4C: @ 0x0807CD4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #4
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x68
	mov r2, r8
	bl sub_0807764C
	ldr r3, _0807CDC0 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _0807CDB6
	adds r0, r7, #0
	bl Proc_Break
_0807CDB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CDC0: .4byte 0x03002870

	thumb_func_start WorldFlushReload
WorldFlushReload: @ 0x0807CDC4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl ApplyMapChange
	movs r0, #1
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807CDEC
sub_0807CDEC: @ 0x0807CDEC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x80
	movs r5, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	subs r1, r1, r4
	adds r0, r1, #0
	muls r0, r5, r0
	muls r0, r1, r0
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x30
	adds r2, r5, #0
	bl sub_0807764C
	ldr r3, _0807CE5C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x80
	blt _0807CE54
	adds r0, r7, #0
	bl Proc_Break
_0807CE54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE5C: .4byte 0x03002870

	thumb_func_start sub_0807CE60
sub_0807CE60: @ 0x0807CE60
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _0807CEB0 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	subs r0, #0x21
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807CEB0: .4byte 0x03002870

	thumb_func_start sub_0807CEB4
sub_0807CEB4: @ 0x0807CEB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807CEC4 @ =0x08CA79C4
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0807CEC4: .4byte 0x08CA79C4

	thumb_func_start sub_0807CEC8
sub_0807CEC8: @ 0x0807CEC8
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #1
	bl UpdateBestGlobalSupportValue
	pop {r0}
	bx r0

	thumb_func_start sub_0807CED8
sub_0807CED8: @ 0x0807CED8
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #2
	bl UpdateBestGlobalSupportValue
	pop {r0}
	bx r0

	thumb_func_start sub_0807CEE8
sub_0807CEE8: @ 0x0807CEE8
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #3
	bl UpdateBestGlobalSupportValue
	pop {r0}
	bx r0

	thumb_func_start sub_0807CEF8
sub_0807CEF8: @ 0x0807CEF8
	bx lr
	.align 2, 0

	thumb_func_start sub_0807CEFC
sub_0807CEFC: @ 0x0807CEFC
	ldr r1, _0807CF0C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807CF0C: .4byte 0x0202BBB8

	thumb_func_start sub_0807CF10
sub_0807CF10: @ 0x0807CF10
	push {lr}
	movs r0, #0x18
	bl GetUnitByPid
	movs r1, #0x6b
	bl FindUnitItemSlot
	adds r1, r0, #0
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1

	thumb_func_start sub_0807CF2C
sub_0807CF2C: @ 0x0807CF2C
	push {r4, lr}
	ldr r4, _0807CF5C @ =0x0203A85C
	ldrb r0, [r4, #0x11]
	cmp r0, #0x17
	bne _0807CF60
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIid
	adds r4, r0, #0
	movs r0, #0x6b
	bl GetItemIid
	cmp r4, r0
	bne _0807CF60
	movs r0, #1
	b _0807CF62
	.align 2, 0
_0807CF5C: .4byte 0x0203A85C
_0807CF60:
	movs r0, #0
_0807CF62:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807CF68
sub_0807CF68: @ 0x0807CF68
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807CF7C
sub_0807CF7C: @ 0x0807CF7C
	push {lr}
	movs r0, #8
	bl GetUnitByPid
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r1, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0807CFA0
	ldr r0, _0807CF9C @ =0x00000407
	ldrh r1, [r1, #0x10]
	cmp r1, r0
	bne _0807CFA0
	movs r0, #1
	b _0807CFA2
	.align 2, 0
_0807CF9C: .4byte 0x00000407
_0807CFA0:
	movs r0, #0
_0807CFA2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807CFA8
sub_0807CFA8: @ 0x0807CFA8
	push {lr}
	bl sub_0807A03C
	movs r1, #0
	cmp r0, #1
	bgt _0807CFB6
	movs r1, #1
_0807CFB6:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807CFBC
sub_0807CFBC: @ 0x0807CFBC
	push {lr}
	movs r0, #0x17
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_0807CFC8
sub_0807CFC8: @ 0x0807CFC8
	push {lr}
	movs r0, #8
	bl GetUnitByPid
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807CFDE
	movs r2, #1
_0807CFDE:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807CFE4
sub_0807CFE4: @ 0x0807CFE4
	push {lr}
	ldr r0, _0807CFF0 @ =0x00002710
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_0807CFF0: .4byte 0x00002710

	thumb_func_start sub_0807CFF4
sub_0807CFF4: @ 0x0807CFF4
	push {lr}
	movs r0, #8
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D006
	movs r0, #0
	b _0807D018
_0807D006:
	ldr r0, _0807D01C @ =0x0202E3E0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r1, #0x25
	ldrb r0, [r0, #6]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_0807D018:
	pop {r1}
	bx r1
	.align 2, 0
_0807D01C: .4byte 0x0202E3E0

	thumb_func_start sub_0807D020
sub_0807D020: @ 0x0807D020
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0x85
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D042
	movs r0, #0x84
	bl GetFlag
	lsls r0, r0, #0x18
	movs r5, #0x74
	cmp r0, #0
	beq _0807D050
	movs r5, #0x73
	b _0807D054
_0807D042:
	movs r0, #0x84
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D050
	movs r5, #0x75
_0807D050:
	cmp r5, #0
	beq _0807D06C
_0807D054:
	movs r0, #0x2d
	bl GetUnitByPid
	adds r4, r0, #0
	adds r0, r5, #0
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	b _0807D08C
_0807D06C:
	bl sub_080A0430
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D08C
	movs r0, #0x2d
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x74
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
_0807D08C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807D094
sub_0807D094: @ 0x0807D094
	ldr r0, _0807D0B0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0x2f
	beq _0807D0B4
	cmp r0, #0x30
	beq _0807D0B4
	cmp r0, #0x31
	beq _0807D0B4
	cmp r0, #0x2e
	beq _0807D0B4
	movs r0, #0
	b _0807D0B6
	.align 2, 0
_0807D0B0: .4byte 0x03004690
_0807D0B4:
	movs r0, #1
_0807D0B6:
	bx lr

	thumb_func_start sub_0807D0B8
sub_0807D0B8: @ 0x0807D0B8
	push {r4, lr}
	movs r0, #0x10
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x3e
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x10
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x6b
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x16
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x6b
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x16
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x6b
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x1c
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x6b
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D170
sub_0807D170: @ 0x0807D170
	push {lr}
	movs r0, #0x10
	bl GetUnitByPid
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807D186
	movs r2, #1
_0807D186:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807D18C
sub_0807D18C: @ 0x0807D18C
	push {r4, lr}
	movs r0, #0xe
	bl GetFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xf
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D1AC
	adds r4, #1
_0807D1AC:
	movs r0, #0x10
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D1BE
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0807D1BE:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D1C8
sub_0807D1C8: @ 0x0807D1C8
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D1D8
	movs r1, #1
_0807D1D8:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D1E0
sub_0807D1E0: @ 0x0807D1E0
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0807D1F2
	movs r1, #1
_0807D1F2:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807D1F8
sub_0807D1F8: @ 0x0807D1F8
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807D20A
	movs r1, #1
_0807D20A:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807D210
sub_0807D210: @ 0x0807D210
	push {lr}
	ldr r0, _0807D234 @ =0x0202E3DC
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldrb r0, [r0, #3]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807D238
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0807D238
	movs r0, #1
	b _0807D23A
	.align 2, 0
_0807D234: .4byte 0x0202E3DC
_0807D238:
	movs r0, #0
_0807D23A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D240
sub_0807D240: @ 0x0807D240
	push {lr}
	movs r0, #0x26
	bl GetUnitByPid
	cmp r0, #0
	beq _0807D266
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0807D266
	movs r0, #0xa
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D266
	movs r0, #1
	b _0807D268
_0807D266:
	movs r0, #0
_0807D268:
	pop {r1}
	bx r1

	thumb_func_start sub_0807D26C
sub_0807D26C: @ 0x0807D26C
	ldr r2, _0807D298 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r3, #1
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	bx lr
	.align 2, 0
_0807D298: .4byte 0x03002870

	thumb_func_start sub_0807D29C
sub_0807D29C: @ 0x0807D29C
	push {lr}
	movs r0, #1
	bl GetUnitByPid
	movs r1, #6
	movs r2, #2
	bl SetUnitStatusExt
	pop {r0}
	bx r0

	thumb_func_start sub_0807D2B0
sub_0807D2B0: @ 0x0807D2B0
	push {lr}
	ldr r0, _0807D2DC @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807D2D8
	ldr r0, _0807D2E0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	beq _0807D2E4
	cmp r0, #0x3d
	beq _0807D2E4
	bl RandNextB
	movs r1, #0xb
	bl DivRem
	cmp r0, #0
	beq _0807D2E4
_0807D2D8:
	movs r0, #0
	b _0807D2E6
	.align 2, 0
_0807D2DC: .4byte 0x0202BBF8
_0807D2E0: .4byte 0x03004690
_0807D2E4:
	movs r0, #1
_0807D2E6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D2EC
sub_0807D2EC: @ 0x0807D2EC
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D2F2:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807D30E
	ldr r0, [r0]
	cmp r0, #0
	beq _0807D30E
	ldrb r0, [r0, #4]
	bl PidStatsGetExpGain
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807D30E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D2F2
	ldr r0, _0807D320 @ =0x03004ADC
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D320: .4byte 0x03004ADC

	thumb_func_start sub_0807D324
sub_0807D324: @ 0x0807D324
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D32A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807D342
	ldr r0, [r0]
	cmp r0, #0
	beq _0807D342
	ldrb r0, [r0, #4]
	bl PidStatsGetExpGain
	adds r5, r5, r0
_0807D342:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D32A
	ldr r0, _0807D358 @ =0x03004ADC
	ldrh r0, [r0]
	subs r5, r5, r0
	ldr r0, _0807D35C @ =0x000002BB
	cmp r5, r0
	bgt _0807D360
	movs r0, #0
	b _0807D362
	.align 2, 0
_0807D358: .4byte 0x03004ADC
_0807D35C: .4byte 0x000002BB
_0807D360:
	movs r0, #1
_0807D362:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D368
sub_0807D368: @ 0x0807D368
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D36E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807D3A4
	ldr r3, [r2]
	cmp r3, #0
	beq _0807D3A4
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807D3A4
	ldrb r1, [r3, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0807D39A
	cmp r1, #0x2d
	bne _0807D3A4
_0807D39A:
	movs r0, #8
	ldrsb r0, [r2, r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807D3A4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D36E
	cmp r5, #0x31
	bhi _0807D3B2
	movs r0, #0
	b _0807D3B4
_0807D3B2:
	movs r0, #1
_0807D3B4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D3BC
sub_0807D3BC: @ 0x0807D3BC
	push {lr}
	sub sp, #4
	movs r1, #3
	str r1, [sp]
	movs r1, #0x10
	movs r2, #1
	movs r3, #2
	bl StartUnkTrapAnim
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_0807D3D4
sub_0807D3D4: @ 0x0807D3D4
	push {lr}
	movs r0, #0x25
	bl GetUnitByPid
	ldrb r1, [r0, #0x11]
	ldrb r0, [r0, #0x10]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807D3F2
	cmp r1, #2
	bhi _0807D3F2
	movs r0, #1
	b _0807D3F4
_0807D3F2:
	movs r0, #0
_0807D3F4:
	pop {r1}
	bx r1

	thumb_func_start sub_0807D3F8
sub_0807D3F8: @ 0x0807D3F8
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807D410 @ =0x00004E1F
	cmp r0, r1
	ble _0807D408
	movs r2, #1
_0807D408:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807D410: .4byte 0x00004E1F

	thumb_func_start sub_0807D414
sub_0807D414: @ 0x0807D414
	push {lr}
	ldr r0, _0807D420 @ =0x00004E20
	bl sub_08079C48
	pop {r0}
	bx r0
	.align 2, 0
_0807D420: .4byte 0x00004E20

	thumb_func_start sub_0807D424
sub_0807D424: @ 0x0807D424
	push {lr}
	movs r0, #7
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D442
	movs r0, #0xd
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D442
	movs r0, #1
	b _0807D444
_0807D442:
	movs r0, #0
_0807D444:
	pop {r1}
	bx r1

	thumb_func_start sub_0807D448
sub_0807D448: @ 0x0807D448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r2, #0
	movs r6, #0
	movs r4, #1
_0807D458:
	adds r0, r4, #0
	str r2, [sp]
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	ldr r2, [sp]
	cmp r5, #0
	beq _0807D4A8
	ldr r0, [r5]
	cmp r0, #0
	beq _0807D4A8
	ldr r0, [r5, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807D4A8
	lsls r0, r2, #1
	mov r2, r8
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0807D4A6
	adds r4, r1, #0
_0807D488:
	ldr r0, [r5]
	ldrh r1, [r4]
	ldrb r0, [r0, #4]
	ldrb r2, [r4]
	cmp r0, r2
	bne _0807D49E
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl PidStatsGetExpGain
	adds r6, r6, r0
_0807D49E:
	adds r4, #2
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807D488
_0807D4A6:
	movs r2, #0
_0807D4A8:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _0807D458
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D4C0
sub_0807D4C0: @ 0x0807D4C0
	push {r4, lr}
	ldr r0, _0807D4DC @ =0x08CB8984
	bl sub_0807D448
	adds r4, r0, #0
	ldr r0, _0807D4E0 @ =0x08CB898E
	bl sub_0807D448
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhi _0807D4E4
	movs r0, #0
	b _0807D4E6
	.align 2, 0
_0807D4DC: .4byte 0x08CB8984
_0807D4E0: .4byte 0x08CB898E
_0807D4E4:
	movs r0, #1
_0807D4E6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D4EC
sub_0807D4EC: @ 0x0807D4EC
	push {r4, lr}
	movs r0, #9
	bl GetFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D50C
	adds r4, #1
_0807D50C:
	movs r0, #0xb
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D51A
	adds r4, #1
_0807D51A:
	movs r0, #0
	cmp r4, #1
	bgt _0807D522
	movs r0, #1
_0807D522:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D528
sub_0807D528: @ 0x0807D528
	push {r4, lr}
	movs r0, #9
	bl GetFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D548
	adds r4, #1
_0807D548:
	movs r0, #0xb
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D556
	adds r4, #1
_0807D556:
	movs r0, #0xc
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D564
	adds r4, #1
_0807D564:
	movs r0, #0xd
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D572
	adds r4, #1
_0807D572:
	movs r0, #0xe
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D580
	adds r4, #1
_0807D580:
	movs r0, #0xf
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D58E
	adds r4, #1
_0807D58E:
	movs r0, #0x10
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D59C
	adds r4, #1
_0807D59C:
	movs r0, #0x11
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D5AA
	adds r4, #1
_0807D5AA:
	cmp r4, #3
	ble _0807D5B2
	movs r0, #0
	b _0807D5B4
_0807D5B2:
	movs r0, #1
_0807D5B4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D5BC
sub_0807D5BC: @ 0x0807D5BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D600
	movs r0, #0x5b
	bl GetUnitByPid
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r3, _0807D608 @ =0x0202BBB8
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	lsls r2, r2, #4
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	subs r0, #8
	subs r2, r2, r0
	adds r0, r4, #0
	bl sub_08020D6C
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
_0807D600:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D608: .4byte 0x0202BBB8

	thumb_func_start sub_0807D60C
sub_0807D60C: @ 0x0807D60C
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0807D63E
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0807D634 @ =0x0202BBB8
	ands r0, r2
	cmp r0, #0
	beq _0807D638
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	b _0807D63C
	.align 2, 0
_0807D634: .4byte 0x0202BBB8
_0807D638:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
_0807D63C:
	strh r0, [r1, #0xc]
_0807D63E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D644
sub_0807D644: @ 0x0807D644
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D674
	ldr r0, _0807D678 @ =0x08CBB47C
	movs r1, #0
	bl SpawnProc
	ldr r1, _0807D67C @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x2c]
	ldr r0, _0807D680 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807D674
	ldr r0, _0807D684 @ =0x0000026A
	bl m4aSongNumStart
_0807D674:
	pop {r0}
	bx r0
	.align 2, 0
_0807D678: .4byte 0x08CBB47C
_0807D67C: .4byte 0x0202BBB8
_0807D680: .4byte 0x0202BBF8
_0807D684: .4byte 0x0000026A

	thumb_func_start sub_0807D688
sub_0807D688: @ 0x0807D688
	push {lr}
	ldr r0, _0807D6AC @ =0x08CBB47C
	bl Proc_EndEach
	ldr r2, _0807D6B0 @ =0x0202BBB8
	ldrh r0, [r2, #0xc]
	adds r0, #0xf
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2, #0xc]
	movs r0, #4
	bl Sound_FadeOutSE
	pop {r0}
	bx r0
	.align 2, 0
_0807D6AC: .4byte 0x08CBB47C
_0807D6B0: .4byte 0x0202BBB8

	thumb_func_start sub_0807D6B4
sub_0807D6B4: @ 0x0807D6B4
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807D6D6
	adds r0, r4, #0
	bl Proc_Break
_0807D6D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D6DC
sub_0807D6DC: @ 0x0807D6DC
	bx lr
	.align 2, 0

	thumb_func_start sub_0807D6E0
sub_0807D6E0: @ 0x0807D6E0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_0807D6B4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807D6F4
sub_0807D6F4: @ 0x0807D6F4
	push {lr}
	ldr r2, _0807D70C @ =0x02022240
	movs r1, #0xff
	strb r1, [r2, #0x1b]
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_0807D6B4
	pop {r0}
	bx r0
	.align 2, 0
_0807D70C: .4byte 0x02022240

	thumb_func_start sub_0807D710
sub_0807D710: @ 0x0807D710
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D75E
	movs r0, #0x85
	bl GetUnitByPid
	adds r4, r0, #0
	ldrb r0, [r4, #0xb]
	adds r0, #0x40
	strb r0, [r4, #0xb]
	bl RefreshUnitSprites
	ldrb r0, [r4, #0xb]
	subs r0, #0x40
	strb r0, [r4, #0xb]
	ldr r0, _0807D764 @ =0x02022C00
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	bl ColorFadeSetupFromColorToWhite
	bl ColorFadeInit
	ldr r1, _0807D768 @ =0x02022240
	movs r0, #1
	strb r0, [r1, #0x1b]
	ldr r0, _0807D76C @ =0x08CBB48C
	adds r1, r5, #0
	bl SpawnProc
_0807D75E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D764: .4byte 0x02022C00
_0807D768: .4byte 0x02022240
_0807D76C: .4byte 0x08CBB48C

	thumb_func_start sub_0807D770
sub_0807D770: @ 0x0807D770
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D784
	ldr r0, _0807D788 @ =0x08CBB48C
	bl Proc_BreakEach
_0807D784:
	pop {r0}
	bx r0
	.align 2, 0
_0807D788: .4byte 0x08CBB48C

	thumb_func_start sub_0807D78C
sub_0807D78C: @ 0x0807D78C
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D7AE
	movs r0, #0x84
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x56
	bl GetJobInfo
	str r0, [r4, #4]
	bl RefreshUnitSprites
_0807D7AE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D7B4
sub_0807D7B4: @ 0x0807D7B4
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D7D8
	movs r0, #0x84
	bl GetUnitByPid
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	bl StartMuDeathFade
_0807D7D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807D7E0
sub_0807D7E0: @ 0x0807D7E0
	push {lr}
	movs r0, #0x70
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D7FC
	ldr r0, _0807D7F8 @ =0x08CDB3C8
	bl CreateUnit
	b _0807D802
	.align 2, 0
_0807D7F8: .4byte 0x08CDB3C8
_0807D7FC:
	ldr r0, _0807D808 @ =0x08CDB3E8
	bl CreateUnit
_0807D802:
	pop {r0}
	bx r0
	.align 2, 0
_0807D808: .4byte 0x08CDB3E8

	thumb_func_start sub_0807D80C
sub_0807D80C: @ 0x0807D80C
	push {r4, lr}
	ldr r0, _0807D830 @ =0x0203A3F0
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetLeaderPid
	cmp r4, r0
	beq _0807D838
	ldr r0, _0807D834 @ =0x0203A470
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetLeaderPid
	cmp r4, r0
	beq _0807D838
	movs r0, #0
	b _0807D83A
	.align 2, 0
_0807D830: .4byte 0x0203A3F0
_0807D834: .4byte 0x0203A470
_0807D838:
	movs r0, #1
_0807D83A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D840
sub_0807D840: @ 0x0807D840
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D884
	movs r0, #0x44
	bl GetUnitByPid
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r3, _0807D88C @ =0x0202BBB8
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	lsls r2, r2, #4
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	subs r0, #8
	subs r2, r2, r0
	adds r0, r4, #0
	bl sub_08020D6C
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
_0807D884:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D88C: .4byte 0x0202BBB8

	thumb_func_start sub_0807D890
sub_0807D890: @ 0x0807D890
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D8C6
	ldr r0, _0807D8D0 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r5, [r0, r1]
	movs r1, #0x7f
	subs r1, r1, r5
	movs r2, #0xe
	ldrsh r4, [r0, r2]
	movs r2, #0x18
	subs r2, r2, r4
	movs r3, #0x87
	subs r3, r3, r5
	movs r0, #0x30
	subs r0, r0, r4
	str r0, [sp]
	adds r0, r6, #0
	bl StartEmitStarsAnim
_0807D8C6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D8D0: .4byte 0x0202BBB8

	thumb_func_start sub_0807D8D4
sub_0807D8D4: @ 0x0807D8D4
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D8E6
	bl ClearEmitedStars
_0807D8E6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EventCall_SwingSwordfx
EventCall_SwingSwordfx: @ 0x0807D8EC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D904
	adds r0, r2, #0
	bl StartSwingSwordfx
_0807D904:
	pop {r0}
	bx r0

	thumb_func_start EventCall_NinianReturnToHuman
EventCall_NinianReturnToHuman: @ 0x0807D908
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D93E
	movs r0, #0xda
	bl GetUnitByPid
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl NinianStartTransformToHunman
	adds r0, r4, #0
	bl ClearUnit
	bl RefreshUnitSprites
	bl RefreshEntityMaps
_0807D93E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventCall_HideNinianDragonSMS
EventCall_HideNinianDragonSMS: @ 0x0807D944
	push {lr}
	movs r0, #0xda
	bl GetUnitByPid
	bl HideUnitSprite
	pop {r0}
	bx r0

	thumb_func_start EventCall_NinianDragonTrembling
EventCall_NinianDragonTrembling: @ 0x0807D954
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	cmp r6, #0
	bne _0807D9AA
	movs r0, #0xda
	bl GetUnitByPid
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #4
	ldr r2, _0807D9B4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	adds r4, #8
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	lsls r5, r5, #4
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	subs r5, r5, r0
	ldr r0, _0807D9B8 @ =0x081BE108
	ldr r1, _0807D9BC @ =0x06013000
	bl Decompress
	ldr r0, _0807D9C0 @ =0x081BE4D8
	ldr r3, _0807D9C4 @ =0x0000C180
	str r6, [sp]
	str r6, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartSpriteAnimProc
	ldr r0, _0807D9C8 @ =EventCall_HideNinianDragonSMS
	movs r1, #1
	bl CallDelayed
_0807D9AA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9B4: .4byte 0x0202BBB8
_0807D9B8: .4byte 0x081BE108
_0807D9BC: .4byte 0x06013000
_0807D9C0: .4byte 0x081BE4D8
_0807D9C4: .4byte 0x0000C180
_0807D9C8: .4byte EventCall_HideNinianDragonSMS

	thumb_func_start EventCall_PutFallNinian
EventCall_PutFallNinian: @ 0x0807D9CC
	push {lr}
	movs r0, #0xda
	bl GetUnitByPid
	cmp r0, #0
	beq _0807D9E0
	bl ShowUnitSprite
	bl EndEachSpriteAnimProc
_0807D9E0:
	pop {r0}
	bx r0

	thumb_func_start sub_0807D9E4
sub_0807D9E4: @ 0x0807D9E4
	push {r4, lr}
	movs r0, #9
	bl GetUnitByPid
	adds r4, r0, #0
	bl sub_08079D20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DA0C
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x13
	bne _0807DA0C
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _0807DA0C
	movs r0, #1
	b _0807DA0E
_0807DA0C:
	movs r0, #0
_0807DA0E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807DA14
sub_0807DA14: @ 0x0807DA14
	push {r4, r5, r6, lr}
	movs r0, #9
	bl GetUnitByPid
	adds r6, r0, #0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0807DA5E
_0807DA26:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807DA46
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DA46
	movs r0, #1
	b _0807DA60
_0807DA46:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bhi _0807DA5E
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0807DA26
_0807DA5E:
	movs r0, #0
_0807DA60:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DA68
sub_0807DA68: @ 0x0807DA68
	push {lr}
	movs r0, #0x37
	bl GetUnitByPid
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807DA86
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807DA86
	movs r0, #1
	b _0807DA88
_0807DA86:
	movs r0, #0
_0807DA88:
	pop {r1}
	bx r1

	thumb_func_start sub_0807DA8C
sub_0807DA8C: @ 0x0807DA8C
	push {lr}
	movs r0, #9
	bl GetUnitByPid
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807DAA0
	movs r1, #1
_0807DAA0:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DAA8
sub_0807DAA8: @ 0x0807DAA8
	push {lr}
	movs r0, #0x37
	bl GetUnitByPid
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807DABC
	movs r1, #1
_0807DABC:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DAC4
sub_0807DAC4: @ 0x0807DAC4
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r6, #9
	movs r5, #1
_0807DACC:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DB64
	ldr r0, [r4]
	cmp r0, #0
	beq _0807DB64
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _0807DB64
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #6
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl KillUnit
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _0807DB5C @ =0x0203A3F0
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807DB10
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807DB10:
	ldr r0, _0807DB60 @ =0x0203A470
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807DB22
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807DB22:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807DB3A
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDropRescue
_0807DB3A:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807DB6A
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDropRescue
	b _0807DB6A
	.align 2, 0
_0807DB5C: .4byte 0x0203A3F0
_0807DB60: .4byte 0x0203A470
_0807DB64:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807DACC
_0807DB6A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807DB74
sub_0807DB74: @ 0x0807DB74
	push {lr}
	bl sub_0807A304
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DB98
	movs r1, #0
	ldr r0, _0807DB94 @ =0x0202E3E0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #5]
	cmp r0, #0x25
	bne _0807DB90
	movs r1, #1
_0807DB90:
	adds r0, r1, #0
	b _0807DB9A
	.align 2, 0
_0807DB94: .4byte 0x0202E3E0
_0807DB98:
	movs r0, #0
_0807DB9A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DBA0
sub_0807DBA0: @ 0x0807DBA0
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r1, _0807DBD8 @ =0x083FC924
	mov r0, sp
	movs r2, #0x14
	bl memcpy
	movs r3, #0
	ldr r0, _0807DBDC @ =0x0202E3DC
	ldr r4, [r0]
	mov r2, sp
	movs r5, #0xc0
_0807DBB8:
	movs r0, #1
	ldrsb r0, [r2, r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807DBE0
	ands r0, r5
	cmp r0, #0
	bne _0807DBE0
	movs r0, #1
	b _0807DBEA
	.align 2, 0
_0807DBD8: .4byte 0x083FC924
_0807DBDC: .4byte 0x0202E3DC
_0807DBE0:
	adds r2, #2
	adds r3, #1
	cmp r3, #8
	ble _0807DBB8
	movs r0, #0
_0807DBEA:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DBF4
sub_0807DBF4: @ 0x0807DBF4
	push {r4, lr}
	movs r0, #0x27
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x8c
	bl CreateItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807DC14
sub_0807DC14: @ 0x0807DC14
	push {lr}
	adds r0, #0x60
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strh r1, [r0, #4]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	pop {r0}
	bx r0

	thumb_func_start sub_0807DC30
sub_0807DC30: @ 0x0807DC30
	adds r3, r0, #0
	ldr r1, _0807DC48 @ =0x08CBF3AC
	ldr r0, [r1]
	cmp r0, #0
	beq _0807DC56
	adds r2, r1, #0
_0807DC3C:
	ldr r0, [r2]
	cmp r3, r0
	bne _0807DC4C
	ldr r0, [r1, #4]
	b _0807DC58
	.align 2, 0
_0807DC48: .4byte 0x08CBF3AC
_0807DC4C:
	adds r1, #8
	adds r2, #8
	ldr r0, [r1]
	cmp r0, #0
	bne _0807DC3C
_0807DC56:
	movs r0, #0
_0807DC58:
	bx lr
	.align 2, 0

	thumb_func_start sub_0807DC5C
sub_0807DC5C: @ 0x0807DC5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x60
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807DC7A
	bl EndTalk
	movs r0, #0
	b _0807DD8E
_0807DC7A:
	bl IsTalkActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0807DC88
	b _0807DD8C
_0807DC88:
	ldrb r0, [r5]
	cmp r0, #1
	beq _0807DCF0
	cmp r0, #1
	bgt _0807DC98
	cmp r0, #0
	beq _0807DCA2
	b _0807DD8C
_0807DC98:
	cmp r0, #2
	beq _0807DD18
	cmp r0, #3
	beq _0807DD56
	b _0807DD8C
_0807DCA2:
	movs r6, #1
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0807DCE4
	adds r6, r0, #0
	b _0807DCE4
_0807DCAE:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DCE2
	ldr r2, [r4]
	cmp r2, #0
	beq _0807DCE2
	ldr r0, [r4, #0xc]
	ldr r1, _0807DCEC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807DCE2
	ldrb r0, [r2, #4]
	strb r0, [r5, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0807DCE2
	cmp r0, #2
	beq _0807DCE2
	cmp r0, #0x2d
	beq _0807DCE2
	cmp r0, #0x26
	bne _0807DD48
_0807DCE2:
	adds r6, #1
_0807DCE4:
	cmp r6, #0x3f
	ble _0807DCAE
	movs r0, #0
	b _0807DD8E
	.align 2, 0
_0807DCEC: .4byte 0x0001000C
_0807DCF0:
	ldrb r0, [r5, #2]
	bl GetUnitByPid
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DD38
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r6, #0
	bl CameraMoveWatchPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	b _0807DD38
_0807DD18:
	ldr r4, _0807DD40 @ =0x08B907C0
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0807DD38
	bl ClearTalkBubble
	ldr r1, _0807DD44 @ =StartFaceFadeOut
	adds r0, r4, #0
	bl Proc_ForEach
	adds r0, r6, #0
	movs r1, #8
	bl StartTemporaryLock
_0807DD38:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0807DD8C
	.align 2, 0
_0807DD40: .4byte 0x08B907C0
_0807DD44: .4byte StartFaceFadeOut
_0807DD48:
	ldrb r0, [r5, #2]
	bl sub_0807DC30
	strh r0, [r5, #4]
	adds r0, r6, #1
	strb r0, [r5, #1]
	b _0807DD38
_0807DD56:
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _0807DD8A
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl ClearPutTalkText
	bl ClearTalk
	ldrh r0, [r5, #4]
	bl GetMsg
	adds r2, r0, #0
	movs r0, #0xa
	movs r1, #0xe
	movs r3, #0
	bl StartTalkExt
	movs r0, #1
	bl SetTalkPrintColor
	movs r0, #1
	bl SetActiveTalkFace
_0807DD8A:
	strb r4, [r5]
_0807DD8C:
	movs r0, #1
_0807DD8E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0807DD94
sub_0807DD94: @ 0x0807DD94
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0807DDC4 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0807DDC8 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0807DDCC @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807DDC4: .4byte 0x01000008
_0807DDC8: .4byte 0x02022C60
_0807DDCC: .4byte 0x02023460

	thumb_func_start sub_0807DDD0
sub_0807DDD0: @ 0x0807DDD0
	push {lr}
	bl sub_0800F0C8
	bl SyncUnitDeploymentState
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807DDEC
sub_0807DDEC: @ 0x0807DDEC
	push {lr}
	ldr r0, _0807DE10 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807DE14
	bl sub_0807A1F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DE14
	movs r0, #7
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DE14
	movs r0, #1
	b _0807DE16
	.align 2, 0
_0807DE10: .4byte 0x0202BBF8
_0807DE14:
	movs r0, #0
_0807DE16:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DE1C
sub_0807DE1C: @ 0x0807DE1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r0, sp, #0x10
	ldr r1, _0807DEA0 @ =0x083FC938
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
	movs r7, #0
	movs r6, #1
	add r5, sp, #0x10
_0807DE36:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807DE8C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807DE8C
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807DE8C
	cmp r4, #2
	beq _0807DE8C
	cmp r4, #0x2d
	beq _0807DE8C
	cmp r4, #0x26
	beq _0807DE8C
	cmp r4, #0x27
	beq _0807DE8C
	ldr r1, [r1, #0xc]
	ldr r0, _0807DEA4 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807DE8C
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	str r2, [sp]
	movs r0, #1
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807DE92
_0807DE8C:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807DE36
_0807DE92:
	bl RefreshUnitSprites
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DEA0: .4byte 0x083FC938
_0807DEA4: .4byte 0x0001000C

	thumb_func_start sub_0807DEA8
sub_0807DEA8: @ 0x0807DEA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	add r2, sp, #0x1c
	adds r1, r2, #0
	ldr r0, _0807DECC @ =0x083FC954
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, _0807DED0 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807DED4
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #1
	b _0807DEDE
	.align 2, 0
_0807DECC: .4byte 0x083FC954
_0807DED0: .4byte 0x0202BBF8
_0807DED4:
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #2
_0807DEDE:
	str r0, [sp, #0x18]
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807DF1C
	adds r4, r2, #0
	add r7, sp, #0x10
	movs r5, #2
_0807DEF4:
	ldm r7!, {r0}
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #1
	ldrsb r3, [r4, r3]
	movs r1, #2
	ldrsb r1, [r4, r1]
	str r1, [sp]
	movs r1, #3
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	bl EventLoadUnit
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807DEF4
_0807DF1C:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Finial_EventLoadAllies1
Finial_EventLoadAllies1: @ 0x0807DF24
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	add r0, sp, #0x10
	ldr r1, _0807DFD4 @ =0x083FC960
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807DFCC
	add r0, sp, #0x10
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r3, #1
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x27
	movs r1, #0
	bl EventLoadUnit
	add r0, sp, #0x10
	movs r2, #4
	ldrsb r2, [r0, r2]
	movs r3, #5
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	bl EventLoadUnit
	ldr r1, _0807DFD8 @ =0x0202BBF8
	adds r1, #0x2b
	movs r4, #1
	adds r0, r4, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807DFCC
	add r0, sp, #0x10
	movs r2, #8
	ldrsb r2, [r0, r2]
	movs r3, #9
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xcd
	movs r1, #0x51
	bl EventLoadUnit
_0807DFCC:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DFD4: .4byte 0x083FC960
_0807DFD8: .4byte 0x0202BBF8

	thumb_func_start Finial_EventLoadAllies2
Finial_EventLoadAllies2: @ 0x0807DFDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	add r1, sp, #0x10
	ldr r0, _0807E07C @ =0x083FC96C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E070
	movs r6, #1
	add r5, sp, #0x10
_0807E008:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807E066
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E066
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807E066
	cmp r4, #2
	beq _0807E066
	cmp r4, #0x2d
	beq _0807E066
	cmp r4, #0x26
	beq _0807E066
	cmp r4, #0x27
	beq _0807E066
	ldr r1, [r1, #0xc]
	ldr r0, _0807E080 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807E066
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	movs r0, #2
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #3
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r7, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	movs r0, #1
	add r8, r0
	mov r2, r8
	cmp r2, #3
	bgt _0807E06C
_0807E066:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807E008
_0807E06C:
	bl RefreshUnitSprites
_0807E070:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E07C: .4byte 0x083FC96C
_0807E080: .4byte 0x0001000C

	thumb_func_start Finial_EventLoadAllies3
Finial_EventLoadAllies3: @ 0x0807E084
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	mov r8, r0
	movs r7, #0
	add r0, sp, #0x10
	ldr r1, _0807E120 @ =0x083FC97C
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	mov r1, r8
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E114
	movs r6, #1
	mov r5, sp
_0807E0AA:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807E10A
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E10A
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807E10A
	cmp r4, #2
	beq _0807E10A
	cmp r4, #0x2d
	beq _0807E10A
	cmp r4, #0x26
	beq _0807E10A
	cmp r4, #0x27
	beq _0807E10A
	ldr r1, [r1, #0xc]
	ldr r0, _0807E124 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807E10A
	cmp r7, #3
	ble _0807E102
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	movs r0, #2
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #3
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
_0807E102:
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807E110
_0807E10A:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807E0AA
_0807E110:
	bl RefreshUnitSprites
_0807E114:
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E120: .4byte 0x083FC97C
_0807E124: .4byte 0x0001000C

	thumb_func_start Finial_EventLoadAllies4
Finial_EventLoadAllies4: @ 0x0807E128
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	add r2, sp, #0x1c
	adds r1, r2, #0
	ldr r0, _0807E15C @ =0x083FC988
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E1A2
	ldr r0, _0807E160 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807E164
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #1
	b _0807E16E
	.align 2, 0
_0807E15C: .4byte 0x083FC988
_0807E160: .4byte 0x0202BBF8
_0807E164:
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #2
_0807E16E:
	str r0, [sp, #0x18]
	adds r4, r2, #0
	add r7, sp, #0x10
	movs r5, #2
_0807E176:
	ldm r7!, {r0}
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #1
	ldrsb r3, [r4, r3]
	movs r1, #2
	ldrsb r1, [r4, r1]
	str r1, [sp]
	movs r1, #3
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	bl EventLoadUnit
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807E176
	bl RefreshUnitSprites
_0807E1A2:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E1AC
sub_0807E1AC: @ 0x0807E1AC
	push {lr}
	movs r0, #0x27
	bl GetUnitByPid
	movs r1, #0
	bl StartStatusHealEffect
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E1C0
sub_0807E1C0: @ 0x0807E1C0
	push {r4, r5, lr}
	ldr r5, _0807E240 @ =0x08CE08F8
	ldr r0, _0807E244 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r0, #0x27
	bl GetUnitByPid
	adds r1, r0, #0
	ldr r0, _0807E248 @ =0x08CE0978
	bl FakeLoadUnit
	movs r0, #1
	bl GetUnitByPid
	adds r1, r0, #0
	ldr r0, _0807E24C @ =0x08CE0998
	bl FakeLoadUnit
	movs r0, #1
	bl GetUnitByPid
	adds r1, r0, #0
	ldr r0, _0807E250 @ =0x08CE0898
	bl FakeLoadUnit
	movs r0, #2
	bl GetUnitByPid
	adds r1, r0, #0
	ldr r0, _0807E254 @ =0x08CE08B8
	bl FakeLoadUnit
	movs r0, #0x2d
	bl GetUnitByPid
	adds r1, r0, #0
	ldr r0, _0807E258 @ =0x08CE08D8
	bl FakeLoadUnit
	movs r4, #1
_0807E216:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	bne _0807E224
	b _0807E32E
_0807E224:
	ldr r0, [r2]
	cmp r0, #0
	bne _0807E22C
	b _0807E32E
_0807E22C:
	ldrb r0, [r0, #4]
	subs r0, #1
	cmp r0, #0x2c
	bhi _0807E314
	lsls r0, r0, #2
	ldr r1, _0807E25C @ =_0807E260
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E240: .4byte 0x08CE08F8
_0807E244: .4byte 0x0202E3F4
_0807E248: .4byte 0x08CE0978
_0807E24C: .4byte 0x08CE0998
_0807E250: .4byte 0x08CE0898
_0807E254: .4byte 0x08CE08B8
_0807E258: .4byte 0x08CE08D8
_0807E25C: .4byte _0807E260
_0807E260: @ jump table
	.4byte _0807E32E @ case 0
	.4byte _0807E32E @ case 1
	.4byte _0807E314 @ case 2
	.4byte _0807E314 @ case 3
	.4byte _0807E314 @ case 4
	.4byte _0807E314 @ case 5
	.4byte _0807E314 @ case 6
	.4byte _0807E314 @ case 7
	.4byte _0807E314 @ case 8
	.4byte _0807E314 @ case 9
	.4byte _0807E314 @ case 10
	.4byte _0807E314 @ case 11
	.4byte _0807E314 @ case 12
	.4byte _0807E314 @ case 13
	.4byte _0807E314 @ case 14
	.4byte _0807E314 @ case 15
	.4byte _0807E314 @ case 16
	.4byte _0807E314 @ case 17
	.4byte _0807E314 @ case 18
	.4byte _0807E314 @ case 19
	.4byte _0807E314 @ case 20
	.4byte _0807E314 @ case 21
	.4byte _0807E314 @ case 22
	.4byte _0807E314 @ case 23
	.4byte _0807E314 @ case 24
	.4byte _0807E314 @ case 25
	.4byte _0807E314 @ case 26
	.4byte _0807E314 @ case 27
	.4byte _0807E314 @ case 28
	.4byte _0807E314 @ case 29
	.4byte _0807E314 @ case 30
	.4byte _0807E314 @ case 31
	.4byte _0807E314 @ case 32
	.4byte _0807E314 @ case 33
	.4byte _0807E314 @ case 34
	.4byte _0807E314 @ case 35
	.4byte _0807E314 @ case 36
	.4byte _0807E32E @ case 37
	.4byte _0807E32E @ case 38
	.4byte _0807E314 @ case 39
	.4byte _0807E314 @ case 40
	.4byte _0807E314 @ case 41
	.4byte _0807E314 @ case 42
	.4byte _0807E314 @ case 43
	.4byte _0807E32E @ case 44
_0807E314:
	ldr r0, [r2, #0xc]
	ldr r1, _0807E344 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807E32E
	adds r0, r5, #0
	adds r1, r2, #0
	bl FakeLoadUnit
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807E336
_0807E32E:
	adds r4, #1
	cmp r4, #0x3f
	bgt _0807E336
	b _0807E216
_0807E336:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E344: .4byte 0x0001000C

	thumb_func_start sub_0807E348
sub_0807E348: @ 0x0807E348
	push {r4, r5, lr}
	ldr r5, _0807E3A4 @ =0x08CE09B8
	ldr r0, _0807E3A8 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r4, #1
_0807E358:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E38E
	ldr r0, [r2]
	cmp r0, #0
	beq _0807E38E
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	beq _0807E38E
	cmp r0, #0x27
	beq _0807E38E
	ldr r0, [r2, #0xc]
	ldr r1, _0807E3AC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807E38E
	adds r0, r5, #0
	adds r1, r2, #0
	bl FakeLoadUnit
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807E394
_0807E38E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807E358
_0807E394:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3A4: .4byte 0x08CE09B8
_0807E3A8: .4byte 0x0202E3F4
_0807E3AC: .4byte 0x0001000C

	thumb_func_start sub_0807E3B0
sub_0807E3B0: @ 0x0807E3B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetUnitByPid
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807E3D0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08011DAC
	b _0807E3D6
_0807E3D0:
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807E3D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807E3DC
sub_0807E3DC: @ 0x0807E3DC
	push {lr}
	ldr r0, _0807E3F4 @ =0x08CE0B18
	movs r1, #0x27
	bl sub_0807E3B0
	ldr r0, _0807E3F8 @ =0x08CE0B38
	movs r1, #0x26
	bl sub_0807E3B0
	pop {r0}
	bx r0
	.align 2, 0
_0807E3F4: .4byte 0x08CE0B18
_0807E3F8: .4byte 0x08CE0B38

	thumb_func_start sub_0807E3FC
sub_0807E3FC: @ 0x0807E3FC
	push {lr}
	sub sp, #0x10
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0x12
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x12
	bl EventLoadUnit
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start ForceDisplayDragonSprite
ForceDisplayDragonSprite: @ 0x0807E420
	push {lr}
	movs r0, #0x25
	bl GetUnitByPid
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E436
	ldr r0, [r2, #0xc]
	ldr r1, _0807E43C @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0807E436:
	pop {r0}
	bx r0
	.align 2, 0
_0807E43C: .4byte 0xFFFEFFFF

	thumb_func_start EventDragonsSpritefx_Init
EventDragonsSpritefx_Init: @ 0x0807E440
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x6b
	movs r0, #0
	strb r0, [r1]
	movs r3, #0
	movs r4, #0
	subs r1, #0x33
	adds r5, r2, #0
	adds r5, #0x2c
	ldr r0, _0807E478 @ =0x0000FFFF
	adds r6, r0, #0
	adds r2, #0x5c
_0807E45C:
	stm r5!, {r4}
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	strh r4, [r2]
	adds r1, #2
	adds r2, #2
	adds r3, #1
	cmp r3, #2
	ble _0807E45C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E478: .4byte 0x0000FFFF

	thumb_func_start EventDragonsSpritefx_End
EventDragonsSpritefx_End: @ 0x0807E47C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r4, #0x2c
	movs r5, #2
_0807E484:
	ldr r0, [r4]
	cmp r0, #0
	beq _0807E48E
	bl EndSpriteAnimProc
_0807E48E:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807E484
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0807E49C
sub_0807E49C: @ 0x0807E49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	movs r5, #0
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	mov r1, r8
	adds r1, #0x2c
	str r1, [sp, #0xc]
_0807E4B8:
	ldr r2, [sp, #0xc]
	ldr r0, [r2]
	cmp r0, #0
	bne _0807E4C2
	b _0807E5DA
_0807E4C2:
	mov r0, r8
	adds r0, #0x38
	add r0, sl
	mov sb, r0
	mov r0, r8
	adds r0, #0x44
	add r0, sl
	str r0, [sp, #4]
	mov r4, r8
	adds r4, #0x3e
	mov r3, r8
	adds r3, #0x4a
	str r3, [sp, #8]
	mov r6, sb
	ldrh r6, [r6]
	ldrh r7, [r0]
	cmp r6, r7
	bne _0807E4F6
	mov r0, sl
	adds r1, r4, r0
	adds r0, r3, #0
	add r0, sl
	ldrh r2, [r1]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0807E598
_0807E4F6:
	mov r0, r8
	adds r0, #0x56
	mov r3, sl
	adds r5, r0, r3
	subs r0, #6
	adds r1, r0, r3
	ldrh r6, [r5]
	ldrh r7, [r1]
	adds r0, r6, r7
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	mov ip, r2
	cmp r0, ip
	ble _0807E51C
	mov r3, ip
	strh r3, [r5]
_0807E51C:
	movs r6, #0
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bne _0807E528
	mov r7, ip
	strh r7, [r5]
_0807E528:
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	mov r6, ip
	subs r3, r6, r2
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r7, [sp, #4]
	movs r6, #0
	ldrsh r0, [r7, r6]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0807E54A
	adds r1, #0xff
_0807E54A:
	asrs r6, r1, #8
	mov r0, sl
	adds r7, r4, r0
	movs r1, #0
	ldrsh r0, [r7, r1]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r3, [sp, #8]
	add r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0807E56A
	adds r1, #0xff
_0807E56A:
	asrs r4, r1, #8
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, ip
	bne _0807E594
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	mov r1, sb
	strh r0, [r1]
	ldrh r0, [r3]
	strh r0, [r7]
	ldr r2, [sp, #0xc]
	ldr r0, [r2]
	ldr r0, [r0, #0x50]
	mov r1, r8
	adds r1, #0x62
	ldr r3, [sp]
	adds r1, r1, r3
	ldrb r1, [r1]
	bl SetSpriteAnimId
_0807E594:
	movs r5, #1
	b _0807E5A2
_0807E598:
	mov r4, sb
	movs r7, #0
	ldrsh r6, [r4, r7]
	movs r0, #0
	ldrsh r4, [r1, r0]
_0807E5A2:
	ldr r1, _0807E634 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r6, r6, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r4, r4, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r4, r0
	bge _0807E5BA
	movs r4, #0xcc
_0807E5BA:
	ldr r0, _0807E638 @ =0x000001FF
	ands r6, r0
	movs r0, #0xff
	ands r4, r0
	ldr r7, [sp, #0xc]
	ldr r0, [r7]
	mov r1, r8
	adds r1, #0x5c
	add r1, sl
	ldrh r1, [r1]
	adds r2, r1, r4
	adds r1, r6, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl SetSpriteAnimProcParameters
_0807E5DA:
	movs r0, #2
	add sl, r0
	ldr r1, [sp, #0xc]
	adds r1, #4
	str r1, [sp, #0xc]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp]
	cmp r2, #2
	bgt _0807E5F0
	b _0807E4B8
_0807E5F0:
	cmp r5, #0
	beq _0807E622
	mov r2, r8
	adds r2, #0x6b
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x18
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807E622
	ldr r0, _0807E63C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E622
	movs r0, #0xb8
	lsls r0, r0, #2
	bl m4aSongNumStart
_0807E622:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E634: .4byte 0x0202BBB8
_0807E638: .4byte 0x000001FF
_0807E63C: .4byte 0x0202BBF8

	thumb_func_start StartEventDragonsSpriteDeamon
StartEventDragonsSpriteDeamon: @ 0x0807E640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E66C @ =0x08CBFC74
	bl SpawnProc
	adds r0, #0x6a
	strb r4, [r0]
	cmp r4, #0
	bne _0807E65A
	ldr r0, _0807E670 @ =0x081BEFE4
	ldr r1, _0807E674 @ =0x06013000
	bl Decompress
_0807E65A:
	cmp r4, #1
	bne _0807E666
	ldr r0, _0807E678 @ =0x081C0DE0
	ldr r1, _0807E674 @ =0x06013000
	bl Decompress
_0807E666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E66C: .4byte 0x08CBFC74
_0807E670: .4byte 0x081BEFE4
_0807E674: .4byte 0x06013000
_0807E678: .4byte 0x081C0DE0

	thumb_func_start sub_0807E67C
sub_0807E67C: @ 0x0807E67C
	push {lr}
	ldr r0, _0807E688 @ =0x08CBFC74
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807E688: .4byte 0x08CBFC74

	thumb_func_start PutFireDragonSpritefx
PutFireDragonSpritefx: @ 0x0807E68C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	mov sb, r3
	ldr r5, [sp, #0x2c]
	ldr r0, _0807E71C @ =0x083FC994
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0807E720 @ =0x08CBFC74
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807E786
	adds r0, #0x62
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
	lsls r0, r5, #1
	mov r2, r8
	adds r5, r0, r2
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _0807E728
	adds r0, r4, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	adds r0, #8
	ldr r0, [r0]
	ldr r3, _0807E724 @ =0x0000A980
	str r5, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	adds r1, r7, #0
	mov r2, sb
	bl StartSpriteAnimProc
	mov r3, r8
	str r0, [r3]
	lsls r2, r6, #1
	adds r1, r4, #0
	adds r1, #0x38
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	strh r7, [r1]
	adds r1, r4, #0
	adds r1, #0x3e
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
	strh r2, [r1]
	b _0807E786
	.align 2, 0
_0807E71C: .4byte 0x083FC994
_0807E720: .4byte 0x08CBFC74
_0807E724: .4byte 0x0000A980
_0807E728:
	ldr r3, [sp, #0x30]
	cmp r3, #0
	bne _0807E738
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	b _0807E786
_0807E738:
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	lsls r2, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0807E75E
	adds r0, r4, #0
	adds r0, #0x3e
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, sb
	beq _0807E786
_0807E75E:
	adds r0, r4, #0
	adds r0, #0x56
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r0, r2
	mov r1, sp
	ldrh r1, [r1, #0x30]
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
_0807E786:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start RemoveFireDragonSpritefx
RemoveFireDragonSpritefx: @ 0x0807E794
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0807E7CC @ =0x08CBFC74
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807E7C4
	lsls r1, r6, #2
	adds r0, #0x2c
	adds r5, r0, r1
	ldr r0, [r5]
	cmp r0, #0
	beq _0807E7C4
	bl EndSpriteAnimProc
	lsls r1, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r1, _0807E7D0 @ =0x0000FFFF
	strh r1, [r0]
	movs r0, #0
	str r0, [r5]
_0807E7C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E7CC: .4byte 0x08CBFC74
_0807E7D0: .4byte 0x0000FFFF

	thumb_func_start sub_0807E7D4
sub_0807E7D4: @ 0x0807E7D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E808 @ =0x08CBFC74
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E800
	lsls r0, r4, #2
	adds r1, r2, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E800
	lsls r0, r4, #1
	adds r1, r2, #0
	adds r1, #0x5c
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
_0807E800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E808: .4byte 0x08CBFC74

	thumb_func_start EventCall_PutFireDragonSprite
EventCall_PutFireDragonSprite: @ 0x0807E80C
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	bl StartEventDragonsSpriteDeamon
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0x98
	movs r3, #0x58
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xf8
	movs r3, #0x58
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Move2ndFireDragon
Move2ndFireDragon: @ 0x0807E854
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0

	thumb_func_start Move3rdFireDragon
Move3rdFireDragon: @ 0x0807E870
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ReputFireDragonSprite
ReputFireDragonSprite: @ 0x0807E88C
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	bl StartEventDragonsSpriteDeamon
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FireDragonSpriteRetreated
FireDragonSpriteRetreated: @ 0x0807E8D4
	push {lr}
	sub sp, #8
	movs r0, #3
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x68
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E8F4
sub_0807E8F4: @ 0x0807E8F4
	push {lr}
	sub sp, #8
	movs r0, #3
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x68
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E914
sub_0807E914: @ 0x0807E914
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #1
	bl StartEventDragonsSpriteDeamon
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x70
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x70
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E95C
sub_0807E95C: @ 0x0807E95C
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E97C
sub_0807E97C: @ 0x0807E97C
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E99C
sub_0807E99C: @ 0x0807E99C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E9C8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E9B2
	ldr r0, _0807E9CC @ =0x000002FB
	bl m4aSongNumStart
_0807E9B2:
	movs r1, #6
	rsbs r1, r1, #0
	movs r0, #0
	movs r2, #8
	adds r3, r4, #0
	bl StartFlameBreathfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9C8: .4byte 0x0202BBF8
_0807E9CC: .4byte 0x000002FB

	thumb_func_start sub_0807E9D0
sub_0807E9D0: @ 0x0807E9D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E9FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E9E8
	movs r0, #0xbf
	lsls r0, r0, #2
	bl m4aSongNumStart
_0807E9E8:
	movs r0, #1
	movs r1, #2
	movs r2, #8
	adds r3, r4, #0
	bl StartFlameBreathfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9FC: .4byte 0x0202BBF8

	thumb_func_start StartEventDragonsSpriteMovefx
StartEventDragonsSpriteMovefx: @ 0x0807EA00
	push {r4, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807EA30
sub_0807EA30: @ 0x0807EA30
	push {r4, r5, lr}
	movs r1, #0xc0
	str r1, [r0, #0x2c]
	movs r1, #0x98
	str r1, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0807EAC8 @ =0x081C2340
	ldr r1, _0807EACC @ =0x06005000
	bl Decompress
	ldr r0, _0807EAD0 @ =0x081C23C8
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807EAD4 @ =0x02023C60
	ldr r1, _0807EAD8 @ =0x081C25C8
	movs r2, #0x85
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0807EADC @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r2, #0x36
	adds r2, r2, r3
	mov ip, r2
	movs r1, #1
	ldrb r0, [r2]
	orrs r0, r1
	movs r5, #2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	movs r4, #8
	orrs r0, r4
	movs r2, #0x10
	orrs r0, r2
	mov r2, ip
	strb r0, [r2]
	adds r3, #0x37
	ldrb r0, [r3]
	orrs r1, r0
	orrs r1, r5
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAC8: .4byte 0x081C2340
_0807EACC: .4byte 0x06005000
_0807EAD0: .4byte 0x081C23C8
_0807EAD4: .4byte 0x02023C60
_0807EAD8: .4byte 0x081C25C8
_0807EADC: .4byte 0x03002870

	thumb_func_start DragonFlameImpact_Loop
DragonFlameImpact_Loop: @ 0x0807EAE0
	push {r4, r5, lr}
	ldr r2, _0807EB1C @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	ldr r5, [r0, #0x2c]
	subs r5, r5, r1
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	ldr r4, [r0, #0x30]
	subs r4, r4, r1
	adds r4, #8
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	ldrh r2, [r0]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x42
	bl sub_08026250
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB1C: .4byte 0x0202BBB8

	thumb_func_start DragonFlameImpact_End
DragonFlameImpact_End: @ 0x0807EB20
	push {lr}
	ldr r0, _0807EB34 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807EB34: .4byte 0x02023C60

	thumb_func_start sub_0807EB38
sub_0807EB38: @ 0x0807EB38
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807EB48 @ =0x08CBFC94
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0807EB48: .4byte 0x08CBFC94

	thumb_func_start sub_0807EB4C
sub_0807EB4C: @ 0x0807EB4C
	push {lr}
	ldr r0, _0807EB58 @ =0x08CBFC94
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807EB58: .4byte 0x08CBFC94

	thumb_func_start EventCall_FireDragonScreamingInPain
EventCall_FireDragonScreamingInPain: @ 0x0807EB5C
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #1
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventCall_FireDragonFellWeakly
EventCall_FireDragonFellWeakly: @ 0x0807EB9C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #2
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	adds r0, r6, #0
	bl StartEventQuakefx
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EventCall_FireDragonFadeOut
EventCall_FireDragonFadeOut: @ 0x0807EBE4
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #3
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventCall_FinalFireDragonReStandUp
EventCall_FinalFireDragonReStandUp: @ 0x0807EC14
	push {lr}
	sub sp, #8
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0

	thumb_func_start sub_0807EC30
sub_0807EC30: @ 0x0807EC30
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0807EC98 @ =0x03002870
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
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _0807EC9C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0807ECA0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	bl sub_0807E7D4
	movs r0, #2
	bl sub_0807E7D4
	adds r5, #0x4c
	strh r4, [r5]
	ldr r0, _0807ECA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807EC90
	movs r0, #0xe5
	bl m4aSongNumStart
_0807EC90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC98: .4byte 0x03002870
_0807EC9C: .4byte 0x0000FFE0
_0807ECA0: .4byte 0x0000E0FF
_0807ECA4: .4byte 0x0202BBF8

	thumb_func_start sub_0807ECA8
sub_0807ECA8: @ 0x0807ECA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x12
	lsls r3, r1, #1
	cmp r3, #0x10
	ble _0807ECC8
	movs r3, #0x10
_0807ECC8:
	ldr r2, _0807ED28 @ =0x03002870
	adds r5, r2, #0
	adds r5, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r4, [r5]
	ands r0, r4
	strb r0, [r5]
	movs r0, #0x10
	subs r0, r0, r1
	movs r6, #0x44
	adds r6, r6, r2
	mov r8, r6
	movs r4, #0
	strb r0, [r6]
	adds r7, r2, #0
	adds r7, #0x45
	strb r3, [r7]
	adds r6, r2, #0
	adds r6, #0x46
	strb r4, [r6]
	cmp r1, #0x10
	bne _0807ED18
	movs r0, #1
	bl RemoveFireDragonSpritefx
	movs r0, #2
	bl RemoveFireDragonSpritefx
	mov r0, sl
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	mov r0, r8
	strb r4, [r0]
	strb r4, [r7]
	strb r4, [r6]
	mov r0, sb
	bl Proc_Break
_0807ED18:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED28: .4byte 0x03002870

	thumb_func_start sub_0807ED2C
sub_0807ED2C: @ 0x0807ED2C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807ED3C @ =0x08CBFCB4
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0807ED3C: .4byte 0x08CBFCB4

	thumb_func_start ForceCenteredDragon
ForceCenteredDragon: @ 0x0807ED40
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x86
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x91
	bl SetFlag
	adds r0, r4, #0
	movs r1, #1
	bl SetUnitHp
	ldr r0, [r4, #0xc]
	movs r1, #7
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl CameraMoveWatchPositionCenter
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0807ED78
sub_0807ED78: @ 0x0807ED78
	ldr r0, _0807ED88 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807ED88: .4byte 0x08B857F8

	thumb_func_start sub_0807ED8C
sub_0807ED8C: @ 0x0807ED8C
	ldr r0, _0807ED9C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #4
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807ED9C: .4byte 0x08B857F8

	thumb_func_start sub_0807EDA0
sub_0807EDA0: @ 0x0807EDA0
	movs r0, #0
	bx lr

	thumb_func_start sub_0807EDA4
sub_0807EDA4: @ 0x0807EDA4
	ldr r0, _0807EDB4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807EDB4: .4byte 0x08B857F8

	thumb_func_start sub_0807EDB8
sub_0807EDB8: @ 0x0807EDB8
	push {lr}
	ldr r0, _0807EDC8 @ =0x03005B10
	ldr r1, _0807EDCC @ =0x0000FFFF
	movs r2, #0x20
	bl m4aMPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDC8: .4byte 0x03005B10
_0807EDCC: .4byte 0x0000FFFF

	thumb_func_start sub_0807EDD0
sub_0807EDD0: @ 0x0807EDD0
	push {lr}
	ldr r0, _0807EDE0 @ =0x03005DA0
	ldr r1, _0807EDE4 @ =0x0000FFFF
	movs r2, #0x20
	bl m4aMPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDE0: .4byte 0x03005DA0
_0807EDE4: .4byte 0x0000FFFF

	thumb_func_start sub_0807EDE8
sub_0807EDE8: @ 0x0807EDE8
	push {lr}
	ldr r0, _0807EDFC @ =0x03005B10
	ldr r1, _0807EE00 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDFC: .4byte 0x03005B10
_0807EE00: .4byte 0x0000FFFF

	thumb_func_start sub_0807EE04
sub_0807EE04: @ 0x0807EE04
	push {lr}
	ldr r0, _0807EE18 @ =0x03005DA0
	ldr r1, _0807EE1C @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EE18: .4byte 0x03005DA0
_0807EE1C: .4byte 0x0000FFFF

	thumb_func_start sub_0807EE20
sub_0807EE20: @ 0x0807EE20
	ldr r0, _0807EE34 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807EE38
	movs r0, #1
	b _0807EE3A
	.align 2, 0
_0807EE34: .4byte 0x08B857F8
_0807EE38:
	movs r0, #0
_0807EE3A:
	bx lr

	thumb_func_start GetLynModeDeathFlag
GetLynModeDeathFlag: @ 0x0807EE3C
	push {lr}
	movs r0, #0x9d
	bl GetFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start SetLynModeDeathFlag
SetLynModeDeathFlag: @ 0x0807EE4C
	push {lr}
	movs r0, #0x9d
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_0807EE58
sub_0807EE58: @ 0x0807EE58
	push {lr}
	movs r0, #8
	bl GetUnitByPid
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EE6E
	movs r2, #1
_0807EE6E:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807EE74
sub_0807EE74: @ 0x0807EE74
	push {lr}
	movs r0, #0x11
	bl GetUnitByPid
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EE8A
	movs r2, #1
_0807EE8A:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807EE90
sub_0807EE90: @ 0x0807EE90
	push {lr}
	movs r0, #0x13
	bl GetUnitByPid
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EEA6
	movs r2, #1
_0807EEA6:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807EEAC
sub_0807EEAC: @ 0x0807EEAC
	movs r1, #0
	ldr r0, _0807EEBC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #4
	bne _0807EEB8
	movs r1, #1
_0807EEB8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEBC: .4byte 0x0202BBF8

	thumb_func_start sub_0807EEC0
sub_0807EEC0: @ 0x0807EEC0
	movs r1, #0
	ldr r0, _0807EED0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #5
	bne _0807EECC
	movs r1, #1
_0807EECC:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EED0: .4byte 0x0202BBF8

	thumb_func_start sub_0807EED4
sub_0807EED4: @ 0x0807EED4
	movs r1, #0
	ldr r0, _0807EEE4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #6
	bne _0807EEE0
	movs r1, #1
_0807EEE0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEE4: .4byte 0x0202BBF8

	thumb_func_start sub_0807EEE8
sub_0807EEE8: @ 0x0807EEE8
	movs r1, #0
	ldr r0, _0807EEF8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x26
	bne _0807EEF4
	movs r1, #1
_0807EEF4:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEF8: .4byte 0x0202BBF8

	thumb_func_start sub_0807EEFC
sub_0807EEFC: @ 0x0807EEFC
	ldr r0, _0807EF28 @ =0x0203A3F0
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	ldr r0, _0807EF2C @ =0x0203A470
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807EF24
	cmp r1, #0x2d
	beq _0807EF24
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807EF24
	cmp r2, #0x2d
	bne _0807EF30
_0807EF24:
	movs r0, #1
	b _0807EF32
	.align 2, 0
_0807EF28: .4byte 0x0203A3F0
_0807EF2C: .4byte 0x0203A470
_0807EF30:
	movs r0, #0
_0807EF32:
	bx lr

	thumb_func_start sub_0807EF34
sub_0807EF34: @ 0x0807EF34
	push {lr}
	movs r0, #0x14
	bl GetUnitByPid
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EF4A
	movs r2, #1
_0807EF4A:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807EF50
sub_0807EF50: @ 0x0807EF50
	push {lr}
	movs r0, #0x32
	bl GetUnitByPid
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EF66
	movs r2, #1
_0807EF66:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807EF6C
sub_0807EF6C: @ 0x0807EF6C
	ldr r0, _0807EF84 @ =0x0203A3F0
	ldr r1, [r0]
	ldr r0, _0807EF88 @ =0x0203A470
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #2
	beq _0807EF80
	cmp r0, #2
	bne _0807EF8C
_0807EF80:
	movs r0, #1
	b _0807EF8E
	.align 2, 0
_0807EF84: .4byte 0x0203A3F0
_0807EF88: .4byte 0x0203A470
_0807EF8C:
	movs r0, #0
_0807EF8E:
	bx lr

	thumb_func_start sub_0807EF90
sub_0807EF90: @ 0x0807EF90
	push {r4, lr}
	bl GetPartyTotalGoldValue
	adds r4, r0, #0
	ldr r0, _0807EFB4 @ =0x0000752F
	cmp r4, r0
	ble _0807EFBC
	movs r0, #0x85
	bl SetFlag
	ldr r0, _0807EFB8 @ =0x000080E7
	cmp r4, r0
	ble _0807EFC8
	movs r0, #0x84
	bl SetFlag
	b _0807EFC8
	.align 2, 0
_0807EFB4: .4byte 0x0000752F
_0807EFB8: .4byte 0x000080E7
_0807EFBC:
	ldr r0, _0807EFD0 @ =0x00004E1F
	cmp r4, r0
	ble _0807EFC8
	movs r0, #0x84
	bl SetFlag
_0807EFC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFD0: .4byte 0x00004E1F

	thumb_func_start sub_0807EFD4
sub_0807EFD4: @ 0x0807EFD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	movs r6, #1
	ldr r0, _0807F01C @ =0x0202BBF8
	bl RegisterChapterStats
	bl ComputeChapterRankings
	bl SaveEndgameRankings
	bl sub_0807EF90
	movs r5, #1
_0807EFF2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r5, #1
	mov r8, r5
	cmp r4, #0
	beq _0807F09C
	ldr r0, [r4]
	cmp r0, #0
	beq _0807F09C
	adds r0, r4, #0
	bl UnitLoadSupports
	ldr r5, _0807F020 @ =0x08CA0448
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807F09C
	ldr r0, [r4]
	b _0807F08A
	.align 2, 0
_0807F01C: .4byte 0x0202BBF8
_0807F020: .4byte 0x08CA0448
_0807F024:
	ldrb r0, [r5, #1]
	cmp r0, r2
	beq _0807F032
	ldrb r0, [r5, #1]
	bl GetCharacterData
	str r0, [r4]
_0807F032:
	ldr r0, [r4, #0xc]
	ldr r1, _0807F058 @ =0x00010008
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl UnitClearInventory
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0807F04A
	bl ClearFlag
_0807F04A:
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807F05E
	b _0807F078
	.align 2, 0
_0807F058: .4byte 0x00010008
_0807F05C:
	adds r6, #1
_0807F05E:
	cmp r6, #0x3f
	bgt _0807F070
	adds r0, r6, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r0, [r7]
	cmp r0, #0
	bne _0807F05C
_0807F070:
	adds r0, r4, #0
	adds r1, r7, #0
	bl CopyUnit
_0807F078:
	adds r0, r4, #0
	bl ClearUnit
	b _0807F09C
_0807F080:
	adds r5, #8
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807F09C
_0807F08A:
	ldrb r3, [r0, #4]
	cmp r3, r1
	bne _0807F080
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0807F024
_0807F09C:
	mov r5, r8
	cmp r5, #0x3f
	ble _0807EFF2
	bl ClearPidStats_ret
	ldr r1, _0807F0C0 @ =0x0202BBF8
	movs r0, #0xc
	strb r0, [r1, #0xe]
	bl CleanupUnitsBeforeChapter
	bl SavePlayThroughData
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F0C0: .4byte 0x0202BBF8

	thumb_func_start SetPostLynModeChapter
SetPostLynModeChapter: @ 0x0807F0C4
	push {r4, lr}
	ldr r4, _0807F0D4 @ =0x0202BBF8
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	beq _0807F0D8
	cmp r0, #3
	beq _0807F0E2
	b _0807F0EC
	.align 2, 0
_0807F0D4: .4byte 0x0202BBF8
_0807F0D8:
	movs r0, #0xc
	bl SetNextChapter
	movs r0, #0xc
	b _0807F0EA
_0807F0E2:
	movs r0, #0xd
	bl SetNextChapter
	movs r0, #0xd
_0807F0EA:
	strb r0, [r4, #0xe]
_0807F0EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807F0F4
sub_0807F0F4: @ 0x0807F0F4
	push {lr}
	ldr r3, _0807F164 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807F168 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r0, _0807F16C @ =0x081C3590
	ldr r1, _0807F170 @ =0x06000800
	bl Decompress
	ldr r0, _0807F174 @ =0x081C39A4
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807F178 @ =0x02022C60
	ldr r1, _0807F17C @ =0x081C39C4
	ldr r2, _0807F180 @ =0x00005040
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807F164: .4byte 0x03002870
_0807F168: .4byte 0x0000FFE0
_0807F16C: .4byte 0x081C3590
_0807F170: .4byte 0x06000800
_0807F174: .4byte 0x081C39A4
_0807F178: .4byte 0x02022C60
_0807F17C: .4byte 0x081C39C4
_0807F180: .4byte 0x00005040

	thumb_func_start sub_0807F184
sub_0807F184: @ 0x0807F184
	push {lr}
	ldr r0, _0807F190 @ =0x083FC99C
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F190: .4byte 0x083FC99C

	thumb_func_start sub_0807F194
sub_0807F194: @ 0x0807F194
	push {lr}
	ldr r0, _0807F1A0 @ =0x083FC9B4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1A0: .4byte 0x083FC9B4

	thumb_func_start sub_0807F1A4
sub_0807F1A4: @ 0x0807F1A4
	push {lr}
	ldr r0, _0807F1B0 @ =0x083FC9C4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1B0: .4byte 0x083FC9C4

	thumb_func_start sub_0807F1B4
sub_0807F1B4: @ 0x0807F1B4
	push {lr}
	ldr r0, _0807F1C0 @ =0x083FC9D4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1C0: .4byte 0x083FC9D4

	thumb_func_start sub_0807F1C4
sub_0807F1C4: @ 0x0807F1C4
	push {lr}
	ldr r0, _0807F1D0 @ =0x083FC9EC
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1D0: .4byte 0x083FC9EC

	thumb_func_start sub_0807F1D4
sub_0807F1D4: @ 0x0807F1D4
	push {lr}
	movs r0, #0
	movs r1, #0x74
	bl UnlockSoundRoomSong
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807F1E4
sub_0807F1E4: @ 0x0807F1E4
	ldr r3, _0807F228 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r2, [r3, #0x10]
	orrs r2, r0
	strb r2, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	bx lr
	.align 2, 0
_0807F228: .4byte 0x03002870

	thumb_func_start sub_0807F22C
sub_0807F22C: @ 0x0807F22C
	push {r4, r5, r6, r7, lr}
	ldr r7, _0807F2C0 @ =0x03002870
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r6, #4
	orrs r0, r6
	movs r1, #8
	orrs r0, r1
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	ldr r0, _0807F2C4 @ =0x06008000
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _0807F2C8 @ =0x02024460
	ldr r1, _0807F2CC @ =0x02023460
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	ldrb r0, [r7, #1]
	orrs r4, r0
	movs r0, #2
	orrs r4, r0
	orrs r4, r6
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	strb r4, [r7, #1]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0807F2D0 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0807F2D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F2C0: .4byte 0x03002870
_0807F2C4: .4byte 0x06008000
_0807F2C8: .4byte 0x02024460
_0807F2CC: .4byte 0x02023460
_0807F2D0: .4byte 0x0000FFE0
_0807F2D4: .4byte 0x0000E0FF

	thumb_func_start sub_0807F2D8
sub_0807F2D8: @ 0x0807F2D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0807F320 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl PutCgBackground
	ldr r2, _0807F324 @ =0x03002870
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
	movs r0, #8
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F320: .4byte 0x02024460
_0807F324: .4byte 0x03002870

	thumb_func_start sub_0807F328
sub_0807F328: @ 0x0807F328
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807F390 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r4, #0x10
	subs r0, r4, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807F388
	movs r0, #1
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r0, r2
	subs r1, #3
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r5, #0
	bl Proc_Break
_0807F388:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F390: .4byte 0x03002870

	thumb_func_start sub_0807F394
sub_0807F394: @ 0x0807F394
	push {r4, lr}
	ldr r1, _0807F40C @ =0x03002870
	mov ip, r1
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	mov r3, ip
	ldrb r3, [r3, #0xc]
	ands r1, r3
	mov r4, ip
	strb r1, [r4, #0xc]
	adds r1, r2, #0
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r4, #0x10]
	ldrb r4, [r4, #0x14]
	ands r2, r4
	movs r1, #2
	orrs r2, r1
	mov r1, ip
	strb r2, [r1, #0x14]
	movs r1, #3
	mov r2, ip
	ldrb r2, [r2, #0x18]
	orrs r1, r2
	mov r3, ip
	strb r1, [r3, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	bl sub_0807B20C
	ldr r0, _0807F410 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0807F414 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #6
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F40C: .4byte 0x03002870
_0807F410: .4byte 0x02023460
_0807F414: .4byte 0x02023C60

	thumb_func_start sub_0807F418
sub_0807F418: @ 0x0807F418
	push {lr}
	sub sp, #4
	ldr r0, _0807F454 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #8
	movs r3, #6
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	ldr r2, _0807F458 @ =0x03002870
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807F454: .4byte 0x02024460
_0807F458: .4byte 0x03002870

	thumb_func_start sub_0807F45C
sub_0807F45C: @ 0x0807F45C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F46C @ =0x08CC1198
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0807F46C: .4byte 0x08CC1198

	thumb_func_start sub_0807F470
sub_0807F470: @ 0x0807F470
	push {r4, lr}
	sub sp, #4
	ldr r4, _0807F4FC @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r4, #0x18]
	ldr r0, _0807F500 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #4
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl PutCgBackground
	movs r0, #1
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0807F504 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807F508 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4FC: .4byte 0x03002870
_0807F500: .4byte 0x02022C60
_0807F504: .4byte 0x0000FFE0
_0807F508: .4byte 0x0000E0FF

	thumb_func_start NilsEpilogueOutro_LoadNilsInDragonsGate
NilsEpilogueOutro_LoadNilsInDragonsGate: @ 0x0807F50C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807F56C @ =0x081900E4
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807F570 @ =0x0818F8B0
	ldr r1, _0807F574 @ =0x06005800
	bl Decompress
	ldr r0, _0807F578 @ =0x02023C60
	ldr r1, _0807F57C @ =0x0818FC08
	ldr r2, _0807F580 @ =0x000072C0
	bl TmApplyTsa_t
	ldr r4, _0807F584 @ =0x0818C004
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807F588 @ =0x02024460
	ldr r1, _0807F58C @ =0x0818F2D4
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_t
	ldr r0, _0807F590 @ =0x0818F7B0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl ApplyPaletteExt
	movs r0, #0xc
	bl EnableBgSync
	adds r5, #0x4c
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F56C: .4byte 0x081900E4
_0807F570: .4byte 0x0818F8B0
_0807F574: .4byte 0x06005800
_0807F578: .4byte 0x02023C60
_0807F57C: .4byte 0x0818FC08
_0807F580: .4byte 0x000072C0
_0807F584: .4byte 0x0818C004
_0807F588: .4byte 0x02024460
_0807F58C: .4byte 0x0818F2D4
_0807F590: .4byte 0x0818F7B0

	thumb_func_start sub_0807F594
sub_0807F594: @ 0x0807F594
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807F5FC @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r5, #0x10
	subs r1, r5, r2
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807F5F4
	movs r0, #2
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r5
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl Proc_Break
_0807F5F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5FC: .4byte 0x03002870

	thumb_func_start sub_0807F600
sub_0807F600: @ 0x0807F600
	push {lr}
	ldr r0, _0807F614 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807F614: .4byte 0x02022C60

	thumb_func_start sub_0807F618
sub_0807F618: @ 0x0807F618
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r3, _0807F680 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F680: .4byte 0x03002870

	thumb_func_start NilsEpilogueOutro_FadeDragonsGateToBlack
NilsEpilogueOutro_FadeDragonsGateToBlack: @ 0x0807F684
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807F6B4
sub_0807F6B4: @ 0x0807F6B4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F6C4 @ =0x08CC1208
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0807F6C4: .4byte 0x08CC1208

	thumb_func_start sub_0807F6C8
sub_0807F6C8: @ 0x0807F6C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x98
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F6E4
	movs r0, #0x98
	bl SetFlag
	adds r0, r4, #0
	bl sub_080A4E0C
_0807F6E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawUiGaugeBitmapEdgeColumn
DrawUiGaugeBitmapEdgeColumn: @ 0x0807F6EC
	push {r4, r5, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #4
	strb r4, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	movs r5, #0xe
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r0, r0, r4
	movs r1, #3
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start DrawUiGaugeBitmapBaseColumn
DrawUiGaugeBitmapBaseColumn: @ 0x0807F710
	push {r4, r5, lr}
	adds r4, r0, r2
	movs r3, #4
	strb r3, [r4]
	adds r3, r1, r2
	adds r3, r0, r3
	movs r5, #0xe
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r4, r0, r4
	strb r5, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start DrawUiGaugeBitmapFilledColumn
DrawUiGaugeBitmapFilledColumn: @ 0x0807F740
	push {r4, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #1
	strb r4, [r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawUiGaugeBitmapBonusColumn
DrawUiGaugeBitmapBonusColumn: @ 0x0807F75C
	push {r4, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #0xd
	strb r4, [r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #0xc
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawUiGauge
DrawUiGauge: @ 0x0807F778
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov sb, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x28]
	mov sl, r0
	ldr r1, _0807F840 @ =0x02020140
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	lsls r2, r6, #4
	ldr r0, _0807F844 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	lsls r4, r6, #3
	mov r0, r8
	adds r1, r4, #0
	mov r2, sb
	bl DrawUiGaugeBitmapEdgeColumn
	mov r0, sb
	adds r2, r0, r5
	adds r2, #3
	mov r0, r8
	adds r1, r4, #0
	bl DrawUiGaugeBitmapEdgeColumn
	movs r4, #0
	adds r5, #2
	cmp r4, r5
	bge _0807F7E0
	mov r7, sb
	adds r7, #1
_0807F7D0:
	adds r2, r4, r7
	mov r0, r8
	lsls r1, r6, #3
	bl DrawUiGaugeBitmapBaseColumn
	adds r4, #1
	cmp r4, r5
	blt _0807F7D0
_0807F7E0:
	movs r4, #0
	ldr r1, [sp, #4]
	lsls r7, r1, #5
	cmp r4, sl
	bge _0807F7FE
	mov r5, sb
	adds r5, #2
_0807F7EE:
	adds r2, r4, r5
	mov r0, r8
	lsls r1, r6, #3
	bl DrawUiGaugeBitmapFilledColumn
	adds r4, #1
	cmp r4, sl
	blt _0807F7EE
_0807F7FE:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	ble _0807F820
	mov r0, sb
	adds r0, #2
	mov r1, sl
	adds r5, r1, r0
	ldr r4, [sp, #0x2c]
_0807F80E:
	mov r0, r8
	lsls r1, r6, #3
	adds r2, r5, #0
	bl DrawUiGaugeBitmapBonusColumn
	adds r5, #1
	subs r4, #1
	cmp r4, #0
	bne _0807F80E
_0807F820:
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r7, r0
	mov r0, r8
	adds r2, r6, #0
	movs r3, #1
	bl ApplyBitmap
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F840: .4byte 0x02020140
_0807F844: .4byte 0x001FFFFF

	thumb_func_start PutDrawUiGauge
PutDrawUiGauge: @ 0x0807F848
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl DrawUiGauge
	ldr r0, _0807F88C @ =0x000003FF
	ands r0, r5
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl PutAppliedBitmap
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F88C: .4byte 0x000003FF

	thumb_func_start sub_0807F890
sub_0807F890: @ 0x0807F890
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start BackgroundSlide_Loop
BackgroundSlide_Loop: @ 0x0807F898
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0807F8AE
	adds r1, #3
_0807F8AE:
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0807F8C4
	adds r0, #3
_0807F8C4:
	asrs r1, r0, #2
	ldr r0, _0807F8D0 @ =0x0400001C
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F8D0: .4byte 0x0400001C

	thumb_func_start StartMuralBackgroundAlt
StartMuralBackgroundAlt: @ 0x0807F8D4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, _0807F90C @ =0x02024460
	cmp r4, #0
	bne _0807F8EE
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_0807F8EE:
	cmp r5, #0
	bge _0807F8F4
	movs r5, #0xe
_0807F8F4:
	ldr r1, _0807F910 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0807F918
	ldr r0, _0807F914 @ =0x081C8184
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0807F922
	.align 2, 0
_0807F90C: .4byte 0x02024460
_0807F910: .4byte 0x0202BBB8
_0807F914: .4byte 0x081C8184
_0807F918:
	ldr r0, _0807F95C @ =0x0841E2D8
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
_0807F922:
	ldr r0, _0807F960 @ =0x08418E44
	adds r1, r4, #0
	bl Decompress
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _0807F964 @ =0x0000027F
_0807F942:
	adds r0, r2, r1
	strh r0, [r6]
	adds r6, #2
	adds r2, #1
	cmp r2, r3
	ble _0807F942
	ldr r0, _0807F968 @ =0x08CC1C5C
	adds r1, r7, #0
	bl SpawnProc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807F95C: .4byte 0x0841E2D8
_0807F960: .4byte 0x08418E44
_0807F964: .4byte 0x0000027F
_0807F968: .4byte 0x08CC1C5C

	thumb_func_start StartMuralBackgroundExt
StartMuralBackgroundExt: @ 0x0807F96C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r7, _0807F9A4 @ =0x02024460
	cmp r4, #0
	bne _0807F98E
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_0807F98E:
	cmp r5, #0
	bge _0807F994
	movs r5, #0xe
_0807F994:
	cmp r6, #0
	beq _0807F9AC
	ldr r0, _0807F9A8 @ =0x081C8184
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0807F9B6
	.align 2, 0
_0807F9A4: .4byte 0x02024460
_0807F9A8: .4byte 0x081C8184
_0807F9AC:
	ldr r0, _0807F9F4 @ =0x0841E2D8
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
_0807F9B6:
	ldr r0, _0807F9F8 @ =0x08418E44
	adds r1, r4, #0
	bl Decompress
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _0807F9FC @ =0x0000027F
_0807F9D6:
	adds r0, r2, r1
	strh r0, [r7]
	adds r7, #2
	adds r2, #1
	cmp r2, r3
	ble _0807F9D6
	ldr r0, _0807FA00 @ =0x08CC1C5C
	mov r1, r8
	bl SpawnProc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807F9F4: .4byte 0x0841E2D8
_0807F9F8: .4byte 0x08418E44
_0807F9FC: .4byte 0x0000027F
_0807FA00: .4byte 0x08CC1C5C

	thumb_func_start EndMuralBackground
EndMuralBackground: @ 0x0807FA04
	push {lr}
	ldr r0, _0807FA10 @ =0x08CC1C5C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807FA10: .4byte 0x08CC1C5C

	thumb_func_start GetLastStatScreenUnitId
GetLastStatScreenUnitId: @ 0x0807FA14
	ldr r0, _0807FA1C @ =0x0203E670
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_0807FA1C: .4byte 0x0203E670

	thumb_func_start SetStatScreenLastUnitId
SetStatScreenLastUnitId: @ 0x0807FA20
	ldr r1, _0807FA28 @ =0x0203E670
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0807FA28: .4byte 0x0203E670

	thumb_func_start SetStatScreenExcludedUnitFlags
SetStatScreenExcludedUnitFlags: @ 0x0807FA2C
	ldr r1, _0807FA34 @ =0x0203E670
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0807FA34: .4byte 0x0203E670

	thumb_func_start InitStatScreenText
InitStatScreenText: @ 0x0807FA38
	push {lr}
	ldr r0, _0807FA44 @ =0x08CC1C74
	bl InitTextList
	pop {r0}
	bx r0
	.align 2, 0
_0807FA44: .4byte 0x08CC1C74

	thumb_func_start DisplayTexts
DisplayTexts: @ 0x0807FA48
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	b _0807FA7C
_0807FA50:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _0807FA72
	ldr r0, [r0]
	bl GetMsg
	ldr r5, [r6]
	ldr r1, [r6, #4]
	ldrb r2, [r6, #8]
	ldrb r3, [r6, #9]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	b _0807FA7A
_0807FA72:
	ldr r0, [r6]
	ldr r1, [r6, #4]
	bl PutText
_0807FA7A:
	adds r6, #0x10
_0807FA7C:
	ldr r0, [r6]
	cmp r0, #0
	bne _0807FA50
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutStatScreenLeftPanelInfo
PutStatScreenLeftPanelInfo: @ 0x0807FA8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r7, _0807FB70 @ =0x0200310C
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r5, r0, #0
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, _0807FB74 @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r4, [r7, #0xc]
	adds r0, r4, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl BattleGenerateDisplayStats
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0xa2
	lsls r1, r1, #2
	add r1, r8
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	ldr r0, [r7, #0xc]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetMsg
	adds r2, r7, #0
	adds r2, #0x20
	ldr r1, _0807FB78 @ =0x00000342
	add r1, r8
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0807FB7C @ =0x000003C2
	add r0, r8
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	ldr r0, _0807FB80 @ =0x000003CA
	add r0, r8
	movs r1, #3
	movs r2, #0x1f
	bl PutSpecialChar
	ldr r0, _0807FB84 @ =0x00000442
	add r0, r8
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r0, _0807FB88 @ =0x0000044A
	add r0, r8
	movs r1, #3
	movs r2, #0x16
	bl PutSpecialChar
	movs r0, #0xf2
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r7, #0xc]
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, _0807FB8C @ =0x000003CE
	add r0, r8
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, [r7, #0xc]
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _0807FB94
	ldr r0, _0807FB90 @ =0x00000446
	add r0, r8
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0807FBAA
	.align 2, 0
_0807FB70: .4byte 0x0200310C
_0807FB74: .4byte 0x02022C60
_0807FB78: .4byte 0x00000342
_0807FB7C: .4byte 0x000003C2
_0807FB80: .4byte 0x000003CA
_0807FB84: .4byte 0x00000442
_0807FB88: .4byte 0x0000044A
_0807FB8C: .4byte 0x000003CE
_0807FB90: .4byte 0x00000446
_0807FB94:
	movs r4, #0x89
	lsls r4, r4, #3
	add r4, r8
	ldr r0, [r7, #0xc]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_0807FBAA:
	ldr r5, _0807FBC4 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _0807FBCC
	ldr r0, _0807FBC8 @ =0x020230AC
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0807FBDE
	.align 2, 0
_0807FBC4: .4byte 0x0200310C
_0807FBC8: .4byte 0x020230AC
_0807FBCC:
	ldr r4, _0807FBEC @ =0x020230AE
	ldr r0, [r5, #0xc]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_0807FBDE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBEC: .4byte 0x020230AE

	thumb_func_start sub_0807FBF0
sub_0807FBF0: @ 0x0807FBF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0807FD00 @ =0x0200310C
	ldr r0, [r5, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetPidStats
	adds r4, r0, #0
	cmp r4, #0
	beq _0807FCF6
	ldr r1, _0807FD04 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	ldr r0, _0807FD08 @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	bl IsFirstPlaythrough
	cmp r0, #1
	beq _0807FCF6
	ldr r1, [r5, #0xc]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	ldrh r1, [r4, #0xc]
	lsls r0, r1, #0x12
	lsrs r6, r0, #0x14
	ldr r1, _0807FD0C @ =0x000003E7
	cmp r6, r1
	ble _0807FC4A
	adds r6, r1, #0
_0807FC4A:
	movs r0, #3
	ldrb r2, [r4, #0xc]
	ands r0, r2
	lsls r7, r0, #8
	ldrb r0, [r4, #0xb]
	orrs r7, r0
	cmp r7, r1
	ble _0807FC5C
	adds r7, r1, #0
_0807FC5C:
	ldrb r4, [r4]
	mov r8, r4
	movs r1, #0x94
	lsls r1, r1, #1
	adds r5, r5, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0807FD10 @ =0x000012AB
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _0807FD14 @ =0x000012AC
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2e
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _0807FD18 @ =0x000012AD
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x56
	movs r2, #3
	bl Text_InsertDrawString
	ldr r4, _0807FD1C @ =0x020035BE
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	adds r0, r6, #0
	bl CountDigits
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	adds r0, r7, #0
	bl CountDigits
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0xc
	adds r0, r0, r1
	movs r1, #2
	adds r2, r7, #0
	bl PutNumber
	mov r0, r8
	bl CountDigits
	lsls r0, r0, #1
	adds r4, #0x16
	adds r0, r0, r4
	movs r1, #2
	mov r2, r8
	bl PutNumber
	ldr r0, _0807FD20 @ =0x02003FBC
	ldr r1, _0807FD24 @ =0x083FD5C4
	movs r2, #0x83
	lsls r2, r2, #5
	bl TmApplyTsa_t
_0807FCF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD00: .4byte 0x0200310C
_0807FD04: .4byte 0x0202BBB8
_0807FD08: .4byte 0x0202BBF8
_0807FD0C: .4byte 0x000003E7
_0807FD10: .4byte 0x000012AB
_0807FD14: .4byte 0x000012AC
_0807FD18: .4byte 0x000012AD
_0807FD1C: .4byte 0x020035BE
_0807FD20: .4byte 0x02003FBC
_0807FD24: .4byte 0x083FD5C4

	thumb_func_start DrawStatWithBar
DrawStatWithBar: @ 0x0807FD28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r8, r1
	str r2, [sp, #0xc]
	adds r7, r3, #0
	ldr r5, [sp, #0x30]
	subs r0, r5, r7
	mov sb, r0
	lsls r6, r2, #5
	adds r0, r6, r1
	lsls r0, r0, #1
	ldr r4, _0807FDE4 @ =0x0200323C
	adds r0, r0, r4
	movs r1, #2
	ldr r2, [sp, #0x34]
	cmp r7, r2
	bne _0807FD56
	movs r1, #4
_0807FD56:
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r1, r6, #1
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r4
	mov r0, sb
	bl PutNumberBonus
	cmp r5, #0x1e
	ble _0807FD74
	movs r5, #0x1e
	subs r5, r5, r7
	mov sb, r5
_0807FD74:
	mov r0, sl
	lsls r5, r0, #1
	add r5, sl
	lsls r5, r5, #1
	ldr r1, _0807FDE8 @ =0x00000401
	adds r5, r5, r1
	ldr r4, [sp, #0xc]
	adds r4, #1
	lsls r4, r4, #5
	subs r4, #2
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _0807FDEC @ =0x02003C3C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	ldr r2, [sp, #0x34]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #4]
	mov r1, sb
	lsls r0, r1, #2
	add r0, sb
	lsls r0, r0, #3
	add r0, sb
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutDrawUiGauge
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FDE4: .4byte 0x0200323C
_0807FDE8: .4byte 0x00000401
_0807FDEC: .4byte 0x02003C3C

	thumb_func_start sub_0807FDF0
sub_0807FDF0: @ 0x0807FDF0
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _0807FE40 @ =0x083FCA4C
	ldr r4, _0807FE44 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _0807FE48 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_t
	ldr r0, _0807FE4C @ =0x084049A0
	bl DisplayTexts
	ldr r5, _0807FE50 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0807FE5C
	ldr r0, _0807FE54 @ =0x000010F9
	bl GetMsg
	adds r3, r5, #0
	adds r3, #0x30
	ldr r1, _0807FE58 @ =0x0200327E
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _0807FE76
	.align 2, 0
_0807FE40: .4byte 0x083FCA4C
_0807FE44: .4byte 0x02020140
_0807FE48: .4byte 0x0200373C
_0807FE4C: .4byte 0x084049A0
_0807FE50: .4byte 0x0200310C
_0807FE54: .4byte 0x000010F9
_0807FE58: .4byte 0x0200327E
_0807FE5C:
	ldr r0, _08080048 @ =0x000010F8
	bl GetMsg
	adds r2, r5, #0
	adds r2, #0x30
	ldr r1, _0808004C @ =0x0200327E
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
_0807FE76:
	ldr r6, _08080050 @ =0x0200310C
	ldr r0, [r6, #0xc]
	bl GetUnitPower
	ldr r1, [r6, #0xc]
	movs r3, #0x14
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #5
	movs r2, #1
	bl DrawStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSkill
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x15]
	ldr r0, [r2, #0xc]
	movs r5, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0807FEBA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FEBA:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x15]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FED6
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FED6:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #5
	movs r2, #3
	bl DrawStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSpeed
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FF04
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FF04:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FF20
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FF20:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #5
	movs r2, #5
	bl DrawStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitLuck
	ldr r1, [r6, #0xc]
	movs r3, #0x19
	ldrsb r3, [r1, r3]
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #5
	movs r2, #7
	bl DrawStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitDefense
	ldr r1, [r6, #0xc]
	movs r3, #0x17
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #5
	movs r2, #9
	bl DrawStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitResistance
	ldr r1, [r6, #0xc]
	movs r3, #0x18
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #5
	movs r2, #0xb
	bl DrawStatWithBar
	ldr r1, [r6, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x12
	ldrsb r3, [r0, r3]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	adds r0, r0, r3
	str r0, [sp]
	movs r5, #0xf
	str r5, [sp, #4]
	movs r0, #6
	movs r1, #0xd
	movs r2, #1
	bl DrawStatWithBar
	ldr r1, [r6, #0xc]
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
	adds r0, r3, r0
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #0xd
	movs r2, #3
	bl DrawStatWithBar
	ldr r4, _08080054 @ =0x02003396
	ldr r0, [r6, #0xc]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r4, #2
	ldr r0, [r6, #0xc]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetAidIconFromAttributes
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	adds r4, r6, #0
	adds r4, #0x78
	ldr r0, [r6, #0xc]
	bl sub_08018CC0
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
	ldr r1, [r6, #0xc]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	ands r5, r0
	cmp r5, #4
	bne _08080058
	adds r4, #0x10
	adds r0, r1, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #2
	bl Text_InsertDrawString
	b _0808006E
	.align 2, 0
_08080048: .4byte 0x000010F8
_0808004C: .4byte 0x0200327E
_08080050: .4byte 0x0200310C
_08080054: .4byte 0x02003396
_08080058:
	adds r4, r6, #0
	adds r4, #0x88
	adds r0, r1, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
_0808006E:
	ldr r5, _080800A8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	adds r0, #0x30
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _08080088
	ldr r0, _080800AC @ =0x0200351C
	lsrs r2, r2, #4
	movs r1, #0
	bl PutNumberSmall
_08080088:
	ldr r4, _080800B0 @ =0x02003496
	ldr r0, [r5, #0xc]
	bl sub_08026B24
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	bl sub_0807FBF0
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800A8: .4byte 0x0200310C
_080800AC: .4byte 0x0200351C
_080800B0: .4byte 0x02003496

	thumb_func_start sub_080800B4
sub_080800B4: @ 0x080800B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08080118 @ =0x083FCAC0
	ldr r4, _0808011C @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080120 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_t
	ldr r0, _08080124 @ =0x083FCE2C
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080128 @ =0x02003EFE
	ldr r2, _0808012C @ =0x00007060
	adds r1, r4, #0
	bl TmApplyTsa_t
	ldr r0, _08080130 @ =0x08404A60
	bl DisplayTexts
	movs r4, #0
	ldr r1, _08080134 @ =0x0200310C
	ldr r0, [r1, #0xc]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08080172
	adds r7, r1, #0
	mov r8, r4
	movs r6, #0x40
_080800FA:
	ldr r2, [r7, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08080138
	adds r0, r2, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _08080138
	movs r2, #4
	b _0808014A
	.align 2, 0
_08080118: .4byte 0x083FCAC0
_0808011C: .4byte 0x02020140
_08080120: .4byte 0x0200373C
_08080124: .4byte 0x083FCE2C
_08080128: .4byte 0x02003EFE
_0808012C: .4byte 0x00007060
_08080130: .4byte 0x08404A60
_08080134: .4byte 0x0200310C
_08080138:
	ldr r0, [r7, #0xc]
	adds r1, r5, #0
	bl IsItemDisplayUseable
	movs r2, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808014A
	movs r2, #1
_0808014A:
	lsls r0, r4, #3
	ldr r1, _08080244 @ =0x0200319C
	adds r0, r0, r1
	ldr r3, _08080248 @ =0x0200323E
	adds r3, r6, r3
	adds r1, r5, #0
	bl sub_08016668
	movs r0, #2
	add r8, r0
	adds r6, #0x80
	adds r4, #1
	cmp r4, #4
	bgt _08080172
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	add r0, r8
	ldrh r5, [r0]
	cmp r5, #0
	bne _080800FA
_08080172:
	ldr r7, _0808024C @ =0x0200310C
	ldr r0, [r7, #0xc]
	bl GetUnitEquippedWeaponSlot
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	blt _080801AC
	lsls r4, r4, #1
	adds r0, r4, #1
	lsls r0, r0, #6
	ldr r1, _08080250 @ =0x0200325C
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x1f
	bl PutSpecialChar
	adds r0, r4, #2
	lsls r0, r0, #6
	ldr r1, _08080254 @ =0x02003C3E
	adds r0, r0, r1
	ldr r1, _08080258 @ =0x083FCE68
	ldr r2, _0808025C @ =0x00007060
	bl TmApplyTsa_t
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
_080801AC:
	ldr r6, _08080260 @ =0x0200358C
	ldr r4, _08080264 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x60
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0xe
	adds r1, r4, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x8e
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r5, #0
	bl GetItemRangeString
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0xb8
	bl GetStringTextLen
	movs r1, #0x2f
	subs r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r4, #0
	ldr r0, _08080268 @ =0x00005278
	adds r5, r0, #0
	adds r2, r6, #0
	subs r2, #0x8c
	ldr r1, _0808026C @ =0x00005270
	adds r3, r1, #0
	adds r1, r6, #0
	subs r1, #0x4c
_08080226:
	adds r0, r4, r5
	strh r0, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #7
	ble _08080226
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080244: .4byte 0x0200319C
_08080248: .4byte 0x0200323E
_0808024C: .4byte 0x0200310C
_08080250: .4byte 0x0200325C
_08080254: .4byte 0x02003C3E
_08080258: .4byte 0x083FCE68
_0808025C: .4byte 0x00007060
_08080260: .4byte 0x0200358C
_08080264: .4byte 0x0203A3F0
_08080268: .4byte 0x00005278
_0808026C: .4byte 0x00005270

	thumb_func_start PutStatScreenSupportList
PutStatScreenSupportList: @ 0x08080270
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #6
	str r0, [sp, #8]
	ldr r4, _08080358 @ =0x0200310C
	ldr r0, [r4, #0xc]
	bl GetUnitTotalSupportLevel
	movs r1, #0
	str r1, [sp, #0xc]
	cmp r0, #5
	bne _08080294
	movs r0, #4
	str r0, [sp, #0xc]
_08080294:
	ldr r0, [r4, #0xc]
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov sb, r1
	movs r0, #0
	cmp r0, sl
	bge _08080348
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, _08080358 @ =0x0200310C
	adds r1, r0, r1
	str r1, [sp, #0x10]
_080802B0:
	ldr r1, _08080358 @ =0x0200310C
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportLevel
	adds r7, r0, #0
	cmp r7, #0
	beq _08080340
	ldr r1, _08080358 @ =0x0200310C
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportPid
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [sp, #8]
	lsls r6, r0, #6
	ldr r1, _0808035C @ =0x02003244
	mov r8, r1
	adds r5, r6, r1
	adds r0, r4, #0
	bl GetAffinityIconByPid
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r4, #0
	bl GetCharacterData
	ldrh r0, [r0]
	bl GetMsg
	mov r1, r8
	adds r1, #6
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl PutDrawText
	movs r5, #2
	cmp r7, #3
	bne _08080316
	movs r5, #4
_08080316:
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bne _0808031E
	movs r5, #4
_0808031E:
	mov r4, r8
	adds r4, #0x12
	adds r4, r6, r4
	adds r0, r7, #0
	bl GetSupportLevelSpecialChar
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutSpecialChar
	ldr r1, [sp, #8]
	adds r1, #2
	str r1, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r0, #8
	str r0, [sp, #0x10]
_08080340:
	movs r1, #1
	add sb, r1
	cmp sb, sl
	blt _080802B0
_08080348:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080358: .4byte 0x0200310C
_0808035C: .4byte 0x02003244

	thumb_func_start DisplayWeaponExp
DisplayWeaponExp: @ 0x08080360
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	adds r1, r3, #0
	ldr r0, _08080414 @ =0x0200310C
	ldr r0, [r0, #0xc]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r4, r2, #5
	adds r0, r4, r6
	lsls r0, r0, #1
	ldr r2, _08080418 @ =0x0200323C
	mov r8, r2
	add r0, r8
	adds r1, #0x70
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	movs r7, #2
	cmp r5, #0xfa
	ble _0808039C
	movs r7, #4
_0808039C:
	adds r4, #4
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	adds r0, r5, #0
	bl GetWeaponLevelSpecialCharFromExp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutSpecialChar
	add r2, sp, #0x10
	adds r0, r5, #0
	add r1, sp, #0xc
	bl GetWeaponExpProgressState
	mov r0, sb
	lsls r5, r0, #1
	add r5, sb
	lsls r5, r5, #1
	ldr r2, _0808041C @ =0x00000401
	adds r5, r5, r2
	mov r4, sl
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #2
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r0, _08080420 @ =0x02003C3C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	movs r0, #0x22
	str r0, [sp]
	ldr r1, [sp, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, [sp, #0x10]
	subs r1, #1
	bl __divsi3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutDrawUiGauge
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080414: .4byte 0x0200310C
_08080418: .4byte 0x0200323C
_0808041C: .4byte 0x00000401
_08080420: .4byte 0x02003C3C

	thumb_func_start sub_08080424
sub_08080424: @ 0x08080424
	push {r4, lr}
	ldr r0, _0808047C @ =0x083FCB30
	ldr r4, _08080480 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080484 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_t
	ldr r0, _08080488 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808048C
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #5
	bl DisplayWeaponExp
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #6
	bl DisplayWeaponExp
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #7
	bl DisplayWeaponExp
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #4
	bl DisplayWeaponExp
	b _080804BC
	.align 2, 0
_0808047C: .4byte 0x083FCB30
_08080480: .4byte 0x02020140
_08080484: .4byte 0x0200373C
_08080488: .4byte 0x0200310C
_0808048C:
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl DisplayWeaponExp
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #1
	bl DisplayWeaponExp
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #2
	bl DisplayWeaponExp
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #3
	bl DisplayWeaponExp
_080804BC:
	bl PutStatScreenSupportList
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutStatScreenPage
PutStatScreenPage: @ 0x080804C8
	push {r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _08080508 @ =0x08404B60
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r5, #0
	str r5, [sp, #0x10]
	add r0, sp, #0x10
	ldr r1, _0808050C @ =0x0200323C
	ldr r2, _08080510 @ =0x01000140
	bl CpuFastSet
	str r5, [sp, #0x14]
	add r0, sp, #0x14
	ldr r1, _08080514 @ =0x02003C3C
	ldr r2, _08080518 @ =0x01000120
	bl CpuFastSet
	lsls r4, r4, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	bl _call_via_r0
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080508: .4byte 0x08404B60
_0808050C: .4byte 0x0200323C
_08080510: .4byte 0x01000140
_08080514: .4byte 0x02003C3C
_08080518: .4byte 0x01000120

	thumb_func_start sub_0808051C
sub_0808051C: @ 0x0808051C
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r6, #0xc0
	ands r6, r0
	adds r4, r0, #0
_0808052C:
	adds r4, r4, r7
	movs r0, #0x3f
	ands r4, r0
	adds r0, r6, r4
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _0808052C
	ldr r5, [r3]
	cmp r5, #0
	beq _0808052C
	ldr r0, _080805D4 @ =0x0203E670
	ldrh r2, [r0, #2]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0808055A
	ldr r0, [r3, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808052C
_0808055A:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0808056C
	ldr r0, [r3, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0808052C
_0808056C:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08080580
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0808052C
_08080580:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08080592
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0808052C
_08080592:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080805A6
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _0808052C
_080805A6:
	movs r0, #0x20
	ands r0, r2
	ldr r2, [r3, #4]
	cmp r0, #0
	beq _080805C0
	ldr r0, [r5, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0808052C
_080805C0:
	ldrb r2, [r2, #4]
	cmp r2, #0x49
	beq _0808052C
	ldrb r5, [r5, #4]
	cmp r5, #0x9e
	beq _0808052C
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080805D4: .4byte 0x0203E670

	thumb_func_start sub_080805D8
sub_080805D8: @ 0x080805D8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08080658 @ =0x02022CF8
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TmFillRect_t
	ldr r0, _0808065C @ =0x020234F8
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TmFillRect_t
	ldr r0, _08080660 @ =0x02023CF8
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TmFillRect_t
	ldr r6, _08080664 @ =0x08CC1D94
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r6
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0x7f
	bne _08080630
	adds r0, r7, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl PutStatScreenPage
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r6
	movs r5, #0
	ldrsb r5, [r0, r5]
_08080630:
	adds r1, r7, #0
	adds r1, #0x52
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08080640
	rsbs r5, r5, #0
_08080640:
	adds r2, r5, #0
	cmp r5, #0
	bge _08080648
	rsbs r2, r5, #0
_08080648:
	movs r0, #0x12
	subs r6, r0, r2
	cmp r5, #0
	bge _08080668
	movs r4, #0
	rsbs r5, r5, #0
	b _0808066C
	.align 2, 0
_08080658: .4byte 0x02022CF8
_0808065C: .4byte 0x020234F8
_08080660: .4byte 0x02023CF8
_08080664: .4byte 0x08CC1D94
_08080668:
	adds r4, r5, #0
	movs r5, #0
_0808066C:
	lsls r5, r5, #1
	ldr r0, _080806D4 @ =0x0200323C
	adds r0, r5, r0
	lsls r4, r4, #1
	ldr r1, _080806D8 @ =0x02022CF8
	adds r1, r4, r1
	adds r2, r6, #0
	movs r3, #0x12
	bl TmCopyRect_t
	ldr r0, _080806DC @ =0x0200373C
	adds r0, r5, r0
	ldr r1, _080806E0 @ =0x020234F8
	adds r1, r4, r1
	adds r2, r6, #0
	movs r3, #0x12
	bl TmCopyRect_t
	ldr r0, _080806E4 @ =0x02003C3C
	adds r5, r5, r0
	ldr r0, _080806E8 @ =0x02023CF8
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #0x12
	bl TmCopyRect_t
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldr r1, _080806EC @ =0x08CC1D94
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r5, r0
	bne _080806CE
	adds r0, r7, #0
	bl Proc_Break
_080806CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080806D4: .4byte 0x0200323C
_080806D8: .4byte 0x02022CF8
_080806DC: .4byte 0x0200373C
_080806E0: .4byte 0x020234F8
_080806E4: .4byte 0x02003C3C
_080806E8: .4byte 0x02023CF8
_080806EC: .4byte 0x08CC1D94

	thumb_func_start StatScreenPageSlide_End
StatScreenPageSlide_End: @ 0x080806F0
	ldr r1, _080806F8 @ =0x0200310C
	movs r0, #0
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_080806F8: .4byte 0x0200310C

	thumb_func_start StartStatScreenPageSlide
StartStatScreenPageSlide: @ 0x080806FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r7, _08080758 @ =0x08CC1DA4
	adds r0, r7, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _0808074C
	ldr r0, _0808075C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808072A
	ldr r0, _08080760 @ =0x0000038F
	bl m4aSongNumStart
_0808072A:
	adds r0, r7, #0
	adds r1, r6, #0
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x4c
	strh r4, [r0]
	subs r0, #2
	mov r2, r8
	strh r2, [r0]
	adds r0, #8
	strh r5, [r0]
	ldr r0, _08080764 @ =0x0200310C
	strh r5, [r0, #2]
	str r4, [r0, #0x14]
	movs r1, #1
	strb r1, [r0, #8]
_0808074C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080758: .4byte 0x08CC1DA4
_0808075C: .4byte 0x0202BBF8
_08080760: .4byte 0x0000038F
_08080764: .4byte 0x0200310C

	thumb_func_start sub_08080768
sub_08080768: @ 0x08080768
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _080807DC @ =0x0200310C
	movs r6, #0
	movs r4, #1
	movs r0, #1
	strb r0, [r1, #8]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #4
	strh r0, [r1]
	ldr r3, _080807E0 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	orrs r0, r4
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x10]
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _080807E4 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _080807E8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r3, #0x3d
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	ldr r0, [r5, #0x38]
	cmp r0, #0
	ble _080807EC
	str r6, [r5, #0x3c]
	movs r0, #0x3c
	rsbs r0, r0, #0
	b _080807F0
	.align 2, 0
_080807DC: .4byte 0x0200310C
_080807E0: .4byte 0x03002870
_080807E4: .4byte 0x0000FFE0
_080807E8: .4byte 0x0000E0FF
_080807EC:
	str r6, [r5, #0x3c]
	movs r0, #0x3c
_080807F0:
	str r0, [r5, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080807F8
sub_080807F8: @ 0x080807F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, _08080870 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r1, [r5]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r4, _08080874 @ =0x0200310C
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, #0x8a
	movs r1, #0x50
	bl SetMuScreenPosition
	ldr r1, [r6, #0x3c]
	ldr r2, [r6, #0x40]
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl Interpolate
	strh r0, [r4, #6]
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08080866
	adds r0, r6, #0
	bl Proc_Break
_08080866:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080870: .4byte 0x03002870
_08080874: .4byte 0x0200310C

	thumb_func_start sub_08080878
sub_08080878: @ 0x08080878
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r5, #0
	movs r0, #1
	strh r0, [r1]
	ldr r3, _080808D4 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x10]
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _080808D8 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _080808DC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, [r4, #0x38]
	cmp r0, #0
	ble _080808E0
	movs r0, #0x3c
	b _080808E4
	.align 2, 0
_080808D4: .4byte 0x03002870
_080808D8: .4byte 0x0000FFE0
_080808DC: .4byte 0x0000E0FF
_080808E0:
	movs r0, #0x3c
	rsbs r0, r0, #0
_080808E4:
	str r0, [r4, #0x3c]
	str r5, [r4, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080808F0
sub_080808F0: @ 0x080808F0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08080964 @ =0x03002870
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r2, [r5]
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r4, _08080968 @ =0x0200310C
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, #0x8a
	movs r1, #0x50
	bl SetMuScreenPosition
	ldr r1, [r6, #0x3c]
	ldr r2, [r6, #0x40]
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	strh r0, [r4, #6]
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0808095C
	adds r0, r6, #0
	bl Proc_Break
_0808095C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080964: .4byte 0x03002870
_08080968: .4byte 0x0200310C

	thumb_func_start StatScreenUnitSlide_ChangeUnit
StatScreenUnitSlide_ChangeUnit: @ 0x0808096C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	ldr r1, _08080994 @ =0x0200310C
	str r0, [r1, #0xc]
	ldr r0, _08080998 @ =0x08CC1F6C
	bl Proc_Find
	bl StatScreen_InitUnit
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080994: .4byte 0x0200310C
_08080998: .4byte 0x08CC1F6C

	thumb_func_start StatScreenUnitSlide_End
StatScreenUnitSlide_End: @ 0x0808099C
	push {r4, r5, lr}
	ldr r4, _08080A20 @ =0x0200310C
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _080809AE
	movs r1, #0x50
	movs r2, #0x8a
	bl SetMuScreenPosition
_080809AE:
	ldr r3, _08080A24 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	movs r2, #3
	ldrb r0, [r3, #0x10]
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r5, [r3, #0x14]
	ands r1, r5
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r2, r0
	strb r2, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	ldr r0, _08080A28 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _08080A2C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #6
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	strb r2, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080A20: .4byte 0x0200310C
_08080A24: .4byte 0x03002870
_08080A28: .4byte 0x0000FFE0
_08080A2C: .4byte 0x0000E0FF

	thumb_func_start StartStatScreenUnitSlide
StartStatScreenUnitSlide: @ 0x08080A30
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08080A64 @ =0x08CC1DBC
	bl SpawnProcLocking
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	adds r2, r0, #0
	adds r2, #0x4a
	strh r1, [r2]
	str r5, [r0, #0x38]
	ldr r0, _08080A68 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08080A5C
	movs r0, #0xc8
	bl m4aSongNumStart
_08080A5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080A64: .4byte 0x08CC1DBC
_08080A68: .4byte 0x0202BBF8

	thumb_func_start PutUpdateStatScreenPageName
PutUpdateStatScreenPageName: @ 0x08080A6C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08080AC4 @ =0x0200310C
	movs r2, #4
	ldrsh r1, [r0, r2]
	adds r1, #0x6d
	movs r3, #6
	ldrsh r2, [r0, r3]
	adds r2, #5
	ldr r3, _08080AC8 @ =0x08CC1DFC
	ldr r4, _08080ACC @ =0x08CC1E10
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r4, #0xf9
	lsls r4, r4, #6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r5, r5, #6
	lsls r0, r0, #1
	ldr r1, _08080AD0 @ =0x083FD4C4
	adds r0, r0, r1
	adds r5, r5, r0
	ldr r1, _08080AD4 @ =0x02022AC8
	adds r0, r5, #0
	movs r2, #0xb
	bl CpuSet
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080AC4: .4byte 0x0200310C
_08080AC8: .4byte 0x08CC1DFC
_08080ACC: .4byte 0x08CC1E10
_08080AD0: .4byte 0x083FD4C4
_08080AD4: .4byte 0x02022AC8

	thumb_func_start StatScreenPageName_Init
StatScreenPageName_Init: @ 0x08080AD8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r4, _08080B68 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sl, r0
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
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _08080B6C @ =0x0200310C
	ldrb r0, [r0]
	movs r1, #0x36
	add sb, r1
	mov r2, sb
	strb r0, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080B68: .4byte 0x080C5A48
_08080B6C: .4byte 0x0200310C

	thumb_func_start StatScreenPageName_Main
StatScreenPageName_Main: @ 0x08080B70
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	bl PutUpdateStatScreenPageName
	ldr r1, _08080B94 @ =0x0200310C
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08080B98
	movs r0, #5
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _08080B9C
	.align 2, 0
_08080B94: .4byte 0x0200310C
_08080B98:
	ldrb r0, [r1]
	strb r0, [r5]
_08080B9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StatScreenPageName_CloseMain
StatScreenPageName_CloseMain: @ 0x08080BA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _08080C68 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r0, [r0]
	bl PutUpdateStatScreenPageName
	ldrh r0, [r7, #0x38]
	subs r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08080C56
	movs r0, #1
	strh r0, [r7, #0x38]
	adds r0, r7, #0
	bl Proc_Break
_08080C56:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080C68: .4byte 0x080C5A48

	thumb_func_start StatScreenPageName_OpenMain
StatScreenPageName_OpenMain: @ 0x08080C6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _08080D34 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	ldr r4, _08080D38 @ =0x0200310C
	ldrb r0, [r4]
	bl PutUpdateStatScreenPageName
	ldrh r0, [r7, #0x38]
	adds r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08080D22
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_08080D22:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080D34: .4byte 0x080C5A48
_08080D38: .4byte 0x0200310C

	thumb_func_start StatScreenSprites_Init
StatScreenSprites_Init: @ 0x08080D3C
	movs r2, #0
	movs r1, #0x69
	strh r1, [r0, #0x2a]
	movs r1, #0xca
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_08080D54
sub_08080D54: @ 0x08080D54
	adds r1, r0, #0
	ldr r2, _08080D84 @ =0x0200310C
	movs r0, #0x20
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08080D6A
	movs r0, #0x1f
	strh r0, [r1, #0x32]
	movs r0, #0x63
	strh r0, [r1, #0x2a]
_08080D6A:
	movs r0, #0x10
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08080D7C
	movs r0, #0x1f
	strh r0, [r1, #0x34]
	movs r0, #0xd0
	strh r0, [r1, #0x2c]
_08080D7C:
	movs r0, #0
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_08080D84: .4byte 0x0200310C

	thumb_func_start sub_08080D88
sub_08080D88: @ 0x08080D88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _08080E60 @ =0x00004640
	mov sb, r0
	ldrh r1, [r7, #0x32]
	ldrh r2, [r7, #0x2e]
	adds r0, r1, r2
	strh r0, [r7, #0x2e]
	ldrh r3, [r7, #0x30]
	ldrh r2, [r7, #0x34]
	adds r0, r3, r2
	strh r0, [r7, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08080DB4
	subs r0, r1, #1
	strh r0, [r7, #0x32]
_08080DB4:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #4
	ble _08080DC2
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_08080DC2:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08080DEA
	ldrh r1, [r7, #0x2a]
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	cmp r0, #0x68
	bgt _08080DDC
	adds r0, r1, #1
	strh r0, [r7, #0x2a]
_08080DDC:
	ldrh r1, [r7, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	cmp r0, #0xca
	ble _08080DEA
	subs r0, r1, #1
	strh r0, [r7, #0x2c]
_08080DEA:
	ldr r6, _08080E64 @ =0x0200310C
	movs r0, #4
	ldrsh r5, [r6, r0]
	movs r1, #0x2a
	ldrsh r0, [r7, r1]
	adds r5, r5, r0
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r4, #6
	ldr r3, _08080E68 @ =0x08B905D0
	mov r8, r3
	ldrh r1, [r7, #0x2e]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	movs r2, #4
	ldrsh r5, [r6, r2]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	adds r5, r5, r0
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r4, #6
	ldr r6, _08080E6C @ =0x08B90620
	ldrh r7, [r7, #0x30]
	lsrs r0, r7, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080E60: .4byte 0x00004640
_08080E64: .4byte 0x0200310C
_08080E68: .4byte 0x08B905D0
_08080E6C: .4byte 0x08B90620

	thumb_func_start sub_08080E70
sub_08080E70: @ 0x08080E70
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08080ED0 @ =0x0200310C
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xe3
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	ldr r5, _08080ED4 @ =0x08B905B0
	ldrb r6, [r4, #1]
	ldr r3, _08080ED8 @ =0x00004EA4
	adds r0, r6, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r1, #0xdd
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0xc
	ldr r0, _08080EDC @ =0x00004E45
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r3, #4
	ldrsh r1, [r4, r3]
	adds r1, #0xd6
	movs r6, #6
	ldrsh r2, [r4, r6]
	adds r2, #0xc
	ldrb r4, [r4]
	ldr r3, _08080EE0 @ =0x00004EA5
	adds r0, r4, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080ED0: .4byte 0x0200310C
_08080ED4: .4byte 0x08B905B0
_08080ED8: .4byte 0x00004EA4
_08080EDC: .4byte 0x00004E45
_08080EE0: .4byte 0x00004EA5

	thumb_func_start StatScreenSprites_PutMuAreaSprites
StatScreenSprites_PutMuAreaSprites: @ 0x08080EE4
	push {r4, lr}
	sub sp, #4
	ldr r4, _08080F38 @ =0x0200310C
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r0, #6
	ldrsh r2, [r4, r0]
	ldr r3, _08080F3C @ =0x08CC1E58
	movs r0, #0xb9
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xc
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x40
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0x83
	ldr r3, _08080F40 @ =0x08B905F8
	ldr r0, _08080F44 @ =0x00004E90
	str r0, [sp]
	movs r0, #0xb
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x60
	ldr r0, _08080F48 @ =0x000001FF
	ands r1, r0
	ldrb r2, [r4, #6]
	ldr r3, _08080F4C @ =0x08CC1EA2
	ldr r0, _08080F50 @ =0x0000A460
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080F38: .4byte 0x0200310C
_08080F3C: .4byte 0x08CC1E58
_08080F40: .4byte 0x08B905F8
_08080F44: .4byte 0x00004E90
_08080F48: .4byte 0x000001FF
_08080F4C: .4byte 0x08CC1EA2
_08080F50: .4byte 0x0000A460

	thumb_func_start sub_08080F54
sub_08080F54: @ 0x08080F54
	push {r4, r5, lr}
	sub sp, #0xc
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08080F68
	movs r2, #1
_08080F68:
	adds r5, r2, #0
	ldr r1, _08081010 @ =0x08404B70
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r4, _08081014 @ =0x0200310C
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08081008
	ldrb r0, [r4]
	cmp r0, #0
	bne _08080FD0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08080FD0
	movs r0, #0x78
	movs r1, #0x28
	movs r2, #1
	bl PutSysArrow
	movs r0, #0x78
	movs r1, #0x38
	movs r2, #1
	bl PutSysArrow
	cmp r5, #0
	beq _08080FD0
	ldr r3, _08081018 @ =0x08B905B0
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808101C @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x4e
	bl PutSprite
_08080FD0:
	ldr r0, _08081014 @ =0x0200310C
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081008
	cmp r5, #0
	beq _08081008
	ldr r3, _08081018 @ =0x08B905B0
	ldrb r2, [r2, #0x1b]
	lsrs r0, r2, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808101C @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x56
	bl PutSprite
_08081008:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081010: .4byte 0x08404B70
_08081014: .4byte 0x0200310C
_08081018: .4byte 0x08B905B0
_0808101C: .4byte 0x00000803

	thumb_func_start sub_08081020
sub_08081020: @ 0x08081020
	push {r4, lr}
	ldr r3, _0808107C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
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
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r4, #0x46
	movs r0, #0x10
	strb r0, [r4, r3]
	ldr r0, _08081080 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08081084 @ =0x02022860
	strh r2, [r0]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808107C: .4byte 0x03002870
_08081080: .4byte 0x0000FFE0
_08081084: .4byte 0x02022860

	thumb_func_start StatScreen_Init
StatScreen_Init: @ 0x08081088
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08081154 @ =0x08404B76
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #0x80
	lsls r0, r0, #3
	bl SetBlankChr
	ldr r0, _08081158 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	ldr r1, _0808115C @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	bl StartMuralBackgroundAlt
	ldr r0, _08081160 @ =0x083FCE8C
	ldr r1, _08081164 @ =0x06014800
	bl Decompress
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #6
	bl ApplyUiStatBarPal
	movs r0, #1
	movs r1, #0x13
	bl ApplyIconPalette
	ldr r0, _08081168 @ =0x083FC9FC
	ldr r4, _0808116C @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08081170 @ =0x02023460
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_t
	ldr r0, _08081174 @ =0x083FCC90
	ldr r1, _08081178 @ =0x06008C00
	bl Decompress
	ldr r0, _0808117C @ =0x083FCE0C
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08081180 @ =0x02022880
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	movs r1, #0x14
	bl ApplyIconPalette
	ldr r0, _08081184 @ =0x083FD62C
	ldr r1, _08081188 @ =0x06004E00
	bl Decompress
	ldr r0, _0808118C @ =0x083FCBEC
	ldr r1, _08081190 @ =0x06010C00
	bl Decompress
	ldr r0, _08081194 @ =0x081D60F0
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08081198 @ =0x0200310C
	movs r0, #0
	str r0, [r1, #0x10]
	adds r0, r5, #0
	bl StatScreenUnitSlide_End
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081154: .4byte 0x08404B76
_08081158: .4byte 0x02023C60
_0808115C: .4byte 0x0600B000
_08081160: .4byte 0x083FCE8C
_08081164: .4byte 0x06014800
_08081168: .4byte 0x083FC9FC
_0808116C: .4byte 0x02020140
_08081170: .4byte 0x02023460
_08081174: .4byte 0x083FCC90
_08081178: .4byte 0x06008C00
_0808117C: .4byte 0x083FCE0C
_08081180: .4byte 0x02022880
_08081184: .4byte 0x083FD62C
_08081188: .4byte 0x06004E00
_0808118C: .4byte 0x083FCBEC
_08081190: .4byte 0x06010C00
_08081194: .4byte 0x081D60F0
_08081198: .4byte 0x0200310C

	thumb_func_start StatScreen_InitUnit
StatScreen_InitUnit: @ 0x0808119C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080811F8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl GetUnitFid
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080811BC
	adds r4, #1
_080811BC:
	movs r0, #3
	strb r0, [r5, #1]
	bl ResetText
	bl InitIcons
	bl InitStatScreenText
	ldr r1, _080811FC @ =0x02023CA4
	movs r3, #0x9c
	lsls r3, r3, #3
	movs r0, #0xd
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl GetFaceInfo
	ldr r0, [r0]
	cmp r0, #0
	beq _08081204
	ldr r0, _08081200 @ =0x083FCBAC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0808120E
	.align 2, 0
_080811F8: .4byte 0x0200310C
_080811FC: .4byte 0x02023CA4
_08081200: .4byte 0x083FCBAC
_08081204:
	ldr r0, _0808125C @ =0x083FCBCC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_0808120E:
	bl EndAllMus
	ldr r4, _08081260 @ =0x0200310C
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x8a
	bl StartUiMu
	str r0, [r4, #0x10]
	bl PutStatScreenLeftPanelInfo
	ldrb r0, [r4]
	bl PutStatScreenPage
	ldr r0, _08081264 @ =0x0200323C
	ldr r1, _08081268 @ =0x02022CF8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_t
	ldr r0, _0808126C @ =0x0200373C
	ldr r1, _08081270 @ =0x020234F8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_t
	ldr r0, _08081274 @ =0x02003C3C
	ldr r1, _08081278 @ =0x02023CF8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_t
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808125C: .4byte 0x083FCBCC
_08081260: .4byte 0x0200310C
_08081264: .4byte 0x0200323C
_08081268: .4byte 0x02022CF8
_0808126C: .4byte 0x0200373C
_08081270: .4byte 0x020234F8
_08081274: .4byte 0x02003C3C
_08081278: .4byte 0x02023CF8

	thumb_func_start sub_0808127C
sub_0808127C: @ 0x0808127C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _08081304 @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0808131C
	ldr r3, _08081308 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r4, r3, #0
	adds r4, #0x46
	movs r0, #0x10
	strb r0, [r4]
	ldr r0, _0808130C @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08081310 @ =0x02022860
	strh r2, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08081314 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080812FA
	b _08081400
_080812FA:
	ldr r0, _08081318 @ =0x0000038B
	bl m4aSongNumStart
	b _08081400
	.align 2, 0
_08081304: .4byte 0x08B857F8
_08081308: .4byte 0x03002870
_0808130C: .4byte 0x0000FFE0
_08081310: .4byte 0x02022860
_08081314: .4byte 0x0202BBF8
_08081318: .4byte 0x0000038B
_0808131C:
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081340
	ldr r4, _0808133C @ =0x0200310C
	ldrb r1, [r4, #1]
	ldrb r2, [r4]
	adds r0, r2, r1
	subs r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x20
	b _0808135E
	.align 2, 0
_0808133C: .4byte 0x0200310C
_08081340:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0808136C
	ldr r4, _08081368 @ =0x0200310C
	ldrb r1, [r4, #1]
	ldrb r3, [r4]
	adds r0, r3, r1
	adds r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x10
_0808135E:
	adds r2, r5, #0
	bl StartStatScreenPageSlide
	b _08081400
	.align 2, 0
_08081368: .4byte 0x0200310C
_0808136C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808138C
	ldr r0, _08081388 @ =0x0200310C
	ldr r0, [r0, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl sub_0808051C
	adds r2, r0, #0
	adds r1, r4, #0
	b _080813D2
	.align 2, 0
_08081388: .4byte 0x0200310C
_0808138C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080813A8
	ldr r0, _080813A4 @ =0x0200310C
	ldr r0, [r0, #0xc]
	movs r1, #1
	bl sub_0808051C
	adds r2, r0, #0
	movs r1, #1
	b _080813D2
	.align 2, 0
_080813A4: .4byte 0x0200310C
_080813A8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080813E0
	ldr r4, _080813DC @ =0x0200310C
	ldr r2, [r4, #0xc]
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _080813E0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ands r0, r6
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080813D0
	movs r1, #1
_080813D0:
	adds r0, r2, #0
_080813D2:
	adds r2, r5, #0
	bl StartStatScreenUnitSlide
	b _08081400
	.align 2, 0
_080813DC: .4byte 0x0200310C
_080813E0:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081400
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08081408 @ =0x0200310C
	ldrb r0, [r0]
	adds r1, r5, #0
	bl StartStatScreenHelp
_08081400:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081408: .4byte 0x0200310C

	thumb_func_start sub_0808140C
sub_0808140C: @ 0x0808140C
	push {r4, lr}
	ldr r3, _08081438 @ =0x0202BBF8
	movs r1, #0xfc
	ldrb r0, [r3, #0x14]
	ands r1, r0
	ldr r2, _0808143C @ =0x0200310C
	movs r0, #3
	ldrb r4, [r2]
	ands r0, r4
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldr r1, _08081440 @ =0x0203E670
	ldr r0, [r2, #0xc]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #1]
	movs r0, #0
	bl SetOnVMatch
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081438: .4byte 0x0202BBF8
_0808143C: .4byte 0x0200310C
_08081440: .4byte 0x0203E670

	thumb_func_start StatScreen_UpdateLastHelpInfo
StatScreen_UpdateLastHelpInfo: @ 0x08081444
	push {lr}
	bl GetLastHelpBoxInfo
	ldr r1, _08081454 @ =0x0200310C
	str r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_08081454: .4byte 0x0200310C

	thumb_func_start SyncStatScreenBgOffset
SyncStatScreenBgOffset: @ 0x08081458
	push {r4, lr}
	ldr r0, _0808148C @ =0x0200310C
	movs r1, #6
	ldrsh r4, [r0, r1]
	rsbs r4, r4, #0
	movs r0, #0xff
	ands r4, r0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808148C: .4byte 0x0200310C

	thumb_func_start sub_08081490
sub_08081490: @ 0x08081490
	push {lr}
	bl EndMuralBackground
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartStatScreen
StartStatScreen: @ 0x0808149C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _080814E4 @ =0x0200310C
	movs r5, #0
	movs r3, #0
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	ldr r4, _080814E8 @ =0x0202BBF8
	movs r1, #3
	ldrb r7, [r4, #0x14]
	ands r1, r7
	strb r1, [r2]
	str r0, [r2, #0xc]
	str r3, [r2, #0x14]
	strh r3, [r2, #2]
	strb r5, [r2, #8]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PidStatsAddStatView
	adds r4, #0x41
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	cmp r0, #0
	blt _080814D4
	ldr r0, _080814EC @ =0x0000038A
	bl m4aSongNumStart
_080814D4:
	ldr r0, _080814F0 @ =0x08CC1F6C
	adds r1, r6, #0
	bl SpawnProcLocking
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080814E4: .4byte 0x0200310C
_080814E8: .4byte 0x0202BBF8
_080814EC: .4byte 0x0000038A
_080814F0: .4byte 0x08CC1F6C

	thumb_func_start StartStatScreenHelp
StartStatScreenHelp: @ 0x080814F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r1, _0808151C @ =0x0200310C
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0808153C
	cmp r4, #1
	beq _08081530
	cmp r4, #1
	bgt _08081520
	cmp r4, #0
	beq _08081526
	b _0808153C
	.align 2, 0
_0808151C: .4byte 0x0200310C
_08081520:
	cmp r4, #2
	beq _08081538
	b _0808153C
_08081526:
	ldr r0, _0808152C @ =0x08CC2140
	b _0808153A
	.align 2, 0
_0808152C: .4byte 0x08CC2140
_08081530:
	ldr r0, _08081534 @ =0x08CC231C
	b _0808153A
	.align 2, 0
_08081534: .4byte 0x08CC231C
_08081538:
	ldr r0, _0808154C @ =0x08CC24C0
_0808153A:
	str r0, [r1, #0x14]
_0808153C:
	ldr r0, _08081550 @ =0x0200310C
	ldr r0, [r0, #0x14]
	adds r1, r5, #0
	bl StartMovingHelpBox
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808154C: .4byte 0x08CC24C0
_08081550: .4byte 0x0200310C

	thumb_func_start sub_08081554
sub_08081554: @ 0x08081554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808157C @ =0x0200310C
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	bl GetItemDescMsg
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808157C: .4byte 0x0200310C

	thumb_func_start sub_08081580
sub_08081580: @ 0x08081580
	adds r2, r0, #0
	ldr r0, _0808159C @ =0x0200310C
	ldr r0, [r0, #0xc]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #8
	bhi _08081632
	lsls r0, r0, #2
	ldr r1, _080815A0 @ =_080815A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808159C: .4byte 0x0200310C
_080815A0: .4byte _080815A4
_080815A4: @ jump table
	.4byte _080815C8 @ case 0
	.4byte _080815D2 @ case 1
	.4byte _080815E0 @ case 2
	.4byte _080815EC @ case 3
	.4byte _080815F6 @ case 4
	.4byte _08081604 @ case 5
	.4byte _08081610 @ case 6
	.4byte _0808161C @ case 7
	.4byte _08081628 @ case 8
_080815C8:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9c
	lsls r0, r0, #2
	b _08081630
_080815D2:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _080815DC @ =0x00000271
	b _08081630
	.align 2, 0
_080815DC: .4byte 0x00000271
_080815E0:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _080815E8 @ =0x00000272
	b _08081630
	.align 2, 0
_080815E8: .4byte 0x00000272
_080815EC:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9d
	lsls r0, r0, #2
	b _08081630
_080815F6:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081600 @ =0x00000273
	b _08081630
	.align 2, 0
_08081600: .4byte 0x00000273
_08081604:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808160C @ =0x00000275
	b _08081630
	.align 2, 0
_0808160C: .4byte 0x00000275
_08081610:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081618 @ =0x00000276
	b _08081630
	.align 2, 0
_08081618: .4byte 0x00000276
_0808161C:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081624 @ =0x00000277
	b _08081630
	.align 2, 0
_08081624: .4byte 0x00000277
_08081628:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9e
	lsls r0, r0, #2
_08081630:
	strh r0, [r1]
_08081632:
	bx lr

	thumb_func_start sub_08081634
sub_08081634: @ 0x08081634
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081650 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08081658
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _08081654 @ =0x00000265
	b _08081660
	.align 2, 0
_08081650: .4byte 0x0200310C
_08081654: .4byte 0x00000265
_08081658:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0x99
	lsls r0, r0, #2
_08081660:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08081668
sub_08081668: @ 0x08081668
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080816A8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _0808167C
	adds r0, r4, #0
	bl HelpBoxTryRelocateLeft
_0808167C:
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080816B6
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _080816A0
	cmp r0, #0x10
	beq _080816A0
	cmp r0, #0x40
	bne _080816AC
_080816A0:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
	b _080816B6
	.align 2, 0
_080816A8: .4byte 0x0200310C
_080816AC:
	cmp r0, #0x80
	bne _080816B6
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
_080816B6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start HelpBoxPopulateStatScreenWeaponExp
HelpBoxPopulateStatScreenWeaponExp: @ 0x080816BC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _080816F4 @ =0x08404B8E
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r0, [r5, #0x2c]
	ldrh r4, [r0, #0x12]
	ldr r0, _080816F8 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080816E0
	adds r4, #4
_080816E0:
	lsls r0, r4, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080816F4: .4byte 0x08404B8E
_080816F8: .4byte 0x0200310C

	thumb_func_start sub_080816FC
sub_080816FC: @ 0x080816FC
	adds r1, r0, #0
	ldr r0, _08081714 @ =0x0200310C
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _08081718
	adds r0, r1, #0
	adds r0, #0x4c
	strh r2, [r0]
	b _0808171E
	.align 2, 0
_08081714: .4byte 0x0200310C
_08081718:
	adds r1, #0x4c
	ldr r0, _08081720 @ =0x00000396
	strh r0, [r1]
_0808171E:
	bx lr
	.align 2, 0
_08081720: .4byte 0x00000396

	thumb_func_start HelpBoxPopulateStatScreenJInfo
HelpBoxPopulateStatScreenJInfo: @ 0x08081724
	ldr r1, _08081734 @ =0x0200310C
	ldr r1, [r1, #0xc]
	ldr r1, [r1, #4]
	ldrh r1, [r1, #2]
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08081734: .4byte 0x0200310C

	thumb_func_start HelpBoxRedirectStatScreenSupports
HelpBoxRedirectStatScreenSupports: @ 0x08081738
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808175C @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl GetUnitTotalSupportLevel
	cmp r0, #0
	bne _08081766
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0x80
	bne _08081760
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
	b _08081766
	.align 2, 0
_0808175C: .4byte 0x0200310C
_08081760:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
_08081766:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start UpdateHelpBoxDisplay
UpdateHelpBoxDisplay: @ 0x0808176C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r4, r6, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	adds r7, r6, #0
	adds r7, #0x4a
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	strh r0, [r6, #0x30]
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	strh r0, [r6, #0x32]
	adds r0, r6, #0
	adds r0, #0x40
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	strh r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x42
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r4, #0
	ldrsh r0, [r7, r4]
	str r0, [sp]
	adds r0, r5, #0
	bl Interpolate
	strh r0, [r6, #0x36]
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0x34
	ldrsh r2, [r6, r3]
	movs r4, #0x36
	ldrsh r3, [r6, r4]
	adds r4, r6, #0
	adds r4, #0x52
	ldrb r4, [r4]
	str r4, [sp]
	bl PutSpriteTalkBox
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HelpBox_OnOpen
HelpBox_OnOpen: @ 0x08081820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808185C @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08081836
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #1
	strb r0, [r1]
_08081836:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _08081854
	ldr r0, _08081860 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081854
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_08081854:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808185C: .4byte 0x08CC209C
_08081860: .4byte 0x0202BBF8

	thumb_func_start sub_08081864
sub_08081864: @ 0x08081864
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl UpdateHelpBoxDisplay
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _08081886
	adds r0, r3, #1
	strh r0, [r2]
_08081886:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start HelpBox_OnClose
HelpBox_OnClose: @ 0x0808188C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080818D8 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _080818A2
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #0
	strb r0, [r1]
_080818A2:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _080818D0
	ldr r0, _080818DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080818BE
	ldr r0, _080818E0 @ =0x00000391
	bl m4aSongNumStart
_080818BE:
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl SetHelpBoxInitPosition
_080818D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080818D8: .4byte 0x08CC209C
_080818DC: .4byte 0x0202BBF8
_080818E0: .4byte 0x00000391

	thumb_func_start HelpBox_WaitClose
HelpBox_WaitClose: @ 0x080818E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08081904
	adds r0, r4, #0
	bl Proc_Break
_08081904:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartHelpBox
StartHelpBox: @ 0x0808190C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081938 @ =0x0203E674
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	ldr r1, _0808193C @ =0x0203E694
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081938: .4byte 0x0203E674
_0808193C: .4byte 0x0203E694

	thumb_func_start StartHelpBox_Unk
StartHelpBox_Unk: @ 0x08081940
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bge _0808195C
	cmp r3, #0
	bge _0808195C
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r3, r0, #0
_0808195C:
	ldr r0, _08081984 @ =0x0203E674
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r3, [r0, #0x11]
	strh r5, [r0, #0x12]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	ldr r2, _08081988 @ =0x0203E694
	strh r1, [r2]
	strh r1, [r2, #2]
	movs r1, #1
	bl StartHelpBoxExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081984: .4byte 0x0203E674
_08081988: .4byte 0x0203E694

	thumb_func_start StartItemHelpBox
StartItemHelpBox: @ 0x0808198C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080819BC @ =0x0203E674
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	ldr r1, _080819C0 @ =HelpBoxPopulateAutoItem
	str r1, [r0, #0x18]
	ldr r1, _080819C4 @ =0x0203E694
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080819BC: .4byte 0x0203E674
_080819C0: .4byte HelpBoxPopulateAutoItem
_080819C4: .4byte 0x0203E694

	thumb_func_start StartHelpBoxExt
StartHelpBoxExt: @ 0x080819C8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r6, _08081A00 @ =0x08CC2014
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _08081A04
	adds r0, r6, #0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, #0x52
	strb r7, [r0]
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	b _08081A1C
	.align 2, 0
_08081A00: .4byte 0x08CC2014
_08081A04:
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	ldrh r0, [r4, #0x36]
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
_08081A1C:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	adds r7, r4, #0
	adds r7, #0x4e
	strh r1, [r7]
	ldrh r0, [r5, #0x12]
	adds r6, r4, #0
	adds r6, #0x4c
	strh r0, [r6]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _08081A4A
	adds r0, r4, #0
	bl _call_via_r1
_08081A4A:
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r6]
	bl GetMsg
	add r2, sp, #4
	mov r1, sp
	bl GetStringTextBox
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl ApplyHelpBoxContentSize
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl ApplyHelpBoxPosition
	bl ClearHelpBoxText
	ldrh r0, [r7]
	ldrh r1, [r6]
	bl StartHelpBoxTextInit
	ldr r0, _08081A90 @ =0x0203E690
	str r5, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081A90: .4byte 0x0203E690

	thumb_func_start StartHelpBoxExt_Unk
StartHelpBoxExt_Unk: @ 0x08081A94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	mov sb, r2
	ldr r0, _08081B40 @ =0x08CC2014
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	cmp r7, #0
	bge _08081ACA
	cmp r6, #0
	bge _08081ACA
	bl GetUiHandPrevX
	adds r7, r0, #0
	bl GetUiHandPrevY
	adds r6, r0, #0
_08081ACA:
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r5, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	movs r0, #0x4e
	adds r0, r0, r5
	mov r8, r0
	strh r1, [r0]
	adds r4, r5, #0
	adds r4, #0x4c
	mov r1, sb
	strh r1, [r4]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r4]
	bl GetMsg
	add r2, sp, #4
	mov r1, sp
	bl GetStringTextBox
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl ResetHelpBoxInitSize
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl ApplyHelpBoxContentSize
	adds r1, r7, #0
	adds r1, #8
	strh r1, [r5, #0x38]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r5, #0x3a]
	strh r1, [r5, #0x3c]
	strh r0, [r5, #0x3e]
	bl ClearHelpBoxText
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r4]
	bl StartHelpBoxTextInit
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081B40: .4byte 0x08CC2014

	thumb_func_start CloseHelpBox
CloseHelpBox: @ 0x08081B44
	push {r4, lr}
	ldr r0, _08081B64 @ =0x08CC2014
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08081B5E
	bl ClearHelpBoxText
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_08081B5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B64: .4byte 0x08CC2014

	thumb_func_start KillHelpBox
KillHelpBox: @ 0x08081B68
	push {r4, lr}
	ldr r0, _08081B88 @ =0x08CC2014
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08081B80
	bl ClearHelpBoxText
	adds r0, r4, #0
	bl Proc_End
_08081B80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B88: .4byte 0x08CC2014

	thumb_func_start HelpBoxMoveControl_OnInitBox
HelpBoxMoveControl_OnInitBox: @ 0x08081B8C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081BA4
	adds r0, r4, #0
	bl _call_via_r1
_08081BA4:
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08081BB4
sub_08081BB4: @ 0x08081BB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r1, _08081C4C @ =0x0203E694
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	ldr r2, [r5, #0x2c]
	ldrb r3, [r2, #0x10]
	adds r0, r3, r0
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	ldrb r2, [r2, #0x11]
	adds r1, r2, r1
	bl PutUiHand
	ldr r6, _08081C50 @ =0x08B857F8
	ldr r1, [r6]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081BEE
	adds r0, r5, #0
	bl HelpBoxTryRelocateUp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08081BEE:
	ldr r1, [r6]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C06
	adds r0, r5, #0
	bl HelpBoxTryRelocateDown
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C06:
	ldr r1, [r6]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C1E
	adds r0, r5, #0
	bl HelpBoxTryRelocateLeft
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C1E:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C36
	adds r0, r5, #0
	bl HelpBoxTryRelocateRight
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C36:
	ldr r1, [r6]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081C54
	adds r0, r5, #0
	bl Proc_Break
	b _08081C72
	.align 2, 0
_08081C4C: .4byte 0x0203E694
_08081C50: .4byte 0x08B857F8
_08081C54:
	cmp r4, #0
	beq _08081C72
	ldr r0, _08081C78 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081C6A
	ldr r0, _08081C7C @ =0x00000387
	bl m4aSongNumStart
_08081C6A:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_08081C72:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081C78: .4byte 0x0202BBF8
_08081C7C: .4byte 0x00000387

	thumb_func_start sub_08081C80
sub_08081C80: @ 0x08081C80
	push {r4, lr}
	adds r4, r0, #0
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartMovingHelpBox
StartMovingHelpBox: @ 0x08081C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081CB0 @ =0x08CC204C
	bl SpawnProcLocking
	ldr r2, _08081CB4 @ =0x0203E694
	movs r1, #0
	strh r1, [r2]
	strh r1, [r2, #2]
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081CB0: .4byte 0x08CC204C
_08081CB4: .4byte 0x0203E694

	thumb_func_start StartMovingHelpBoxExt
StartMovingHelpBoxExt: @ 0x08081CB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _08081CD4 @ =0x08CC204C
	bl SpawnProcLocking
	ldr r1, _08081CD8 @ =0x0203E694
	strh r4, [r1]
	strh r5, [r1, #2]
	str r6, [r0, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081CD4: .4byte 0x08CC204C
_08081CD8: .4byte 0x0203E694

	thumb_func_start ApplyHelpBoxContentSize
ApplyHelpBoxContentSize: @ 0x08081CDC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl GetHelpBoxItemInfoKind
	cmp r0, #2
	beq _08081D0E
	cmp r0, #2
	bgt _08081D02
	cmp r0, #1
	beq _08081D08
	b _08081D2A
_08081D02:
	cmp r0, #3
	beq _08081D16
	b _08081D2A
_08081D08:
	movs r4, #0xa0
	adds r5, #0x20
	b _08081D2A
_08081D0E:
	cmp r4, #0x5f
	bgt _08081D28
	movs r4, #0x60
	b _08081D28
_08081D16:
	ldr r0, _08081D3C @ =0x0202BBF8
	adds r0, #0x2b
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	movs r4, #0x40
	cmp r1, #0
	beq _08081D28
	movs r4, #0xc0
_08081D28:
	adds r5, #0x10
_08081D2A:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081D3C: .4byte 0x0202BBF8

	thumb_func_start ApplyHelpBoxPosition
ApplyHelpBoxPosition: @ 0x08081D40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	mov r8, r0
	ldr r1, _08081DC8 @ =0x0203E694
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r7, r7, r0
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _08081D8C
	movs r0, #0
	strh r0, [r5, #0x3c]
_08081D8C:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _08081D9C
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_08081D9C:
	adds r0, r7, #0
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r2, #0x3e
	ldrsh r0, [r5, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _08081DB2
	mov r1, r8
	subs r0, r7, r1
	strh r0, [r5, #0x3e]
_08081DB2:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081DC8: .4byte 0x0203E694

	thumb_func_start SetHelpBoxInitPosition
SetHelpBoxInitPosition: @ 0x08081DCC
	push {r4, r5, lr}
	ldr r4, _08081DEC @ =0x0203E694
	movs r5, #0
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r1, r1, r3
	movs r5, #2
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r2, r2, r3
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081DEC: .4byte 0x0203E694

	thumb_func_start ResetHelpBoxInitSize
ResetHelpBoxInitSize: @ 0x08081DF0
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start GetHelpBoxItemInfoKind
GetHelpBoxItemInfoKind: @ 0x08081E00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081E10 @ =0x0000FFFF
	cmp r4, r0
	bne _08081E14
	movs r0, #3
	b _08081E4A
	.align 2, 0
_08081E10: .4byte 0x0000FFFF
_08081E14:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08081E44
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08081E36
	movs r0, #1
	b _08081E4A
_08081E36:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08081E48
_08081E44:
	movs r0, #0
	b _08081E4A
_08081E48:
	movs r0, #2
_08081E4A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start HelpBoxPopulateAutoItem
HelpBoxPopulateAutoItem: @ 0x08081E50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldrh r5, [r0, #0x12]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r5, [r0]
	ldrh r0, [r0]
	bl GetHelpBoxItemInfoKind
	cmp r0, #3
	bne _08081E70
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	b _08081E7A
_08081E70:
	adds r0, r5, #0
	bl GetItemDescMsg
	adds r1, r4, #0
	adds r1, #0x4c
_08081E7A:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateUp
HelpBoxTryRelocateUp: @ 0x08081E84
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	cmp r0, #0
	bne _08081E94
	movs r0, #0
	b _08081EAE
_08081E94:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081EAC
	adds r0, r2, #0
	bl _call_via_r1
_08081EAC:
	movs r0, #1
_08081EAE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateDown
HelpBoxTryRelocateDown: @ 0x08081EB4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _08081EC4
	movs r0, #0
	b _08081EDE
_08081EC4:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x80
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081EDC
	adds r0, r2, #0
	bl _call_via_r1
_08081EDC:
	movs r0, #1
_08081EDE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateLeft
HelpBoxTryRelocateLeft: @ 0x08081EE4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08081EF4
	movs r0, #0
	b _08081F0E
_08081EF4:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081F0C
	adds r0, r2, #0
	bl _call_via_r1
_08081F0C:
	movs r0, #1
_08081F0E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateRight
HelpBoxTryRelocateRight: @ 0x08081F14
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _08081F24
	movs r0, #0
	b _08081F3E
_08081F24:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081F3C
	adds r0, r2, #0
	bl _call_via_r1
_08081F3C:
	movs r0, #1
_08081F3E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08081F44
sub_08081F44: @ 0x08081F44
	push {lr}
	adds r2, r0, #0
	ldr r0, _08081F64 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081F5E
	adds r0, r2, #0
	bl Proc_Break
_08081F5E:
	pop {r0}
	bx r0
	.align 2, 0
_08081F64: .4byte 0x08B857F8

	thumb_func_start sub_08081F68
sub_08081F68: @ 0x08081F68
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	ldr r0, _08081F9C @ =0x08CC207C
	adds r1, r6, #0
	bl SpawnProcLocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08081F9C: .4byte 0x08CC207C

	thumb_func_start HelpPrompt_OnIdle
HelpPrompt_OnIdle: @ 0x08081FA0
	push {lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _08081FB8 @ =0x08CC208C
	movs r0, #0
	str r0, [sp]
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08081FB8: .4byte 0x08CC208C

	thumb_func_start StartHelpPromptSprite
StartHelpPromptSprite: @ 0x08081FBC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _08081FE4 @ =0x08CC209C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08081FD8
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
_08081FD8:
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08081FE4: .4byte 0x08CC209C

	thumb_func_start sub_08081FE8
sub_08081FE8: @ 0x08081FE8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _08082010 @ =0x08CC209C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08082004
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProcLocking
_08082004:
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08082010: .4byte 0x08CC209C

	thumb_func_start EndHelpPromptSprite
EndHelpPromptSprite: @ 0x08082014
	push {lr}
	ldr r0, _08082028 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08082024
	bl Proc_End
_08082024:
	pop {r0}
	bx r0
	.align 2, 0
_08082028: .4byte 0x08CC209C

	thumb_func_start MoveHelpPromptSprite
MoveHelpPromptSprite: @ 0x0808202C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08082048 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08082040
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
_08082040:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082048: .4byte 0x08CC209C

	thumb_func_start GetLastHelpBoxInfo
GetLastHelpBoxInfo: @ 0x0808204C
	ldr r0, _08082054 @ =0x0203E690
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08082054: .4byte 0x0203E690

	thumb_func_start PutChapterTitlePalette
PutChapterTitlePalette: @ 0x08082058
	push {lr}
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08082074
	ldr r0, _08082070 @ =0x08402230
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080820C0
	.align 2, 0
_08082070: .4byte 0x08402230
_08082074:
	movs r0, #1
	ands r0, r2
	ldr r3, _080820C4 @ =0x083FE438
	cmp r0, #0
	beq _08082080
	ldr r3, _080820C8 @ =0x083FE2F8
_08082080:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0808208A
	adds r3, #0x40
_0808208A:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08082094
	adds r3, #0x80
_08082094:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0808209E
	adds r3, #0xc0
_0808209E:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080820AC
	movs r0, #0x80
	lsls r0, r0, #1
	adds r3, r3, r0
_080820AC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080820B6
	adds r3, #0x20
_080820B6:
	lsls r1, r1, #5
	adds r0, r3, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_080820C0:
	pop {r0}
	bx r0
	.align 2, 0
_080820C4: .4byte 0x083FE438
_080820C8: .4byte 0x083FE2F8

	thumb_func_start sub_080820CC
sub_080820CC: @ 0x080820CC
	movs r2, #0
	ldr r1, _080820E4 @ =0x08CC2784
	cmp r0, #0
	beq _080820E0
_080820D4:
	ldrb r3, [r1, #4]
	adds r2, r3, r2
	adds r1, #8
	subs r0, #1
	cmp r0, #0
	bne _080820D4
_080820E0:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_080820E4: .4byte 0x08CC2784

	thumb_func_start sub_080820E8
sub_080820E8: @ 0x080820E8
	push {lr}
	sub sp, #0x20
	adds r2, r0, #0
	ldrb r1, [r2]
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08082102
	adds r0, r1, #0
	subs r0, #0x41
	b _08082162
_08082102:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08082114
	ldrb r0, [r2]
	subs r0, #0x47
	b _08082162
_08082114:
	adds r0, r1, #0
	subs r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _08082126
	ldrb r0, [r2]
	adds r0, #4
	b _08082162
_08082126:
	adds r0, r1, #0
	cmp r0, #0x2d
	bne _08082130
	movs r0, #0x3e
	b _08082162
_08082130:
	cmp r0, #0x27
	bne _08082138
	movs r0, #0x3f
	b _08082162
_08082138:
	cmp r0, #0x3a
	bne _08082140
	movs r0, #0x40
	b _08082162
_08082140:
	cmp r0, #0x2e
	bne _08082148
	movs r0, #0x41
	b _08082162
_08082148:
	cmp r0, #0x20
	beq _08082160
	ldr r1, _0808215C @ =0x08404BA0
	ldrb r2, [r2]
	mov r0, sp
	bl sub_080C0088
	movs r0, #1
	rsbs r0, r0, #0
	b _08082162
	.align 2, 0
_0808215C: .4byte 0x08404BA0
_08082160:
	movs r0, #0x80
_08082162:
	add sp, #0x20
	pop {r1}
	bx r1

	thumb_func_start sub_08082168
sub_08082168: @ 0x08082168
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r2, #0
	str r3, [sp, #8]
	adds r0, r4, #0
	bl sub_080820CC
	movs r1, #0xff
	ands r1, r0
	str r1, [sp, #0xc]
	asrs r0, r0, #8
	lsls r0, r0, #4
	str r0, [sp, #0x10]
	lsls r4, r4, #3
	ldr r0, _08082198 @ =0x08CC2784
	adds r6, r4, r0
	ldrb r2, [r6, #6]
	b _0808220E
	.align 2, 0
_08082198: .4byte 0x08CC2784
_0808219C:
	movs r5, #0
	adds r1, r2, #1
	str r1, [sp, #0x14]
	ldrb r0, [r6, #5]
	cmp r5, r0
	bge _0808220C
	ldr r1, [sp, #0x10]
	adds r0, r1, r2
	asrs r1, r0, #3
	lsls r1, r1, #0xa
	mov sl, r1
	movs r7, #7
	ands r0, r7
	lsls r0, r0, #2
	mov sb, r0
	asrs r0, r2, #3
	lsls r0, r0, #0xa
	mov r8, r0
	ands r2, r7
	lsls r2, r2, #2
	mov ip, r2
_080821C6:
	ldr r2, [sp, #0xc]
	adds r0, r2, r5
	ldr r1, [sp, #8]
	adds r4, r1, r5
	asrs r1, r0, #3
	lsls r1, r1, #5
	ldr r2, [sp]
	adds r1, r2, r1
	add r1, sl
	add r1, sb
	ands r0, r7
	lsls r3, r0, #2
	movs r0, #0xf
	lsls r0, r3
	ldr r2, [r1]
	ands r2, r0
	cmp r2, #0
	beq _08082204
	asrs r0, r4, #3
	lsls r0, r0, #5
	ldr r1, [sp, #4]
	adds r0, r1, r0
	add r0, r8
	add r0, ip
	lsrs r2, r3
	ands r4, r7
	lsls r1, r4, #2
	lsls r2, r1
	ldr r1, [r0]
	orrs r1, r2
	str r1, [r0]
_08082204:
	adds r5, #1
	ldrb r2, [r6, #5]
	cmp r5, r2
	blt _080821C6
_0808220C:
	ldr r2, [sp, #0x14]
_0808220E:
	ldrb r0, [r6, #7]
	cmp r2, r0
	blt _0808219C
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08082224
sub_08082224: @ 0x08082224
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r4, #0
	b _08082288
_0808222E:
	adds r0, r6, #0
	bl sub_080820E8
	cmp r0, #0x80
	bne _08082250
	cmp r4, r5
	bls _08082246
	adds r0, r4, #3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	b _08082286
_08082246:
	adds r0, r5, #3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, r5, #0
	b _08082286
_08082250:
	lsls r1, r0, #3
	ldr r0, _08082268 @ =0x08CC2784
	adds r2, r1, r0
	ldrb r0, [r2]
	subs r1, r4, r0
	ldrb r3, [r2, #1]
	subs r0, r5, r3
	cmp r1, r0
	ble _0808226C
	adds r5, r4, #0
	b _0808226E
	.align 2, 0
_08082268: .4byte 0x08CC2784
_0808226C:
	adds r4, r5, #0
_0808226E:
	adds r0, r4, #0
	adds r0, #0xff
	ldrb r1, [r2, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xff
	ldrb r2, [r2, #3]
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08082286:
	adds r6, #1
_08082288:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08082292
	cmp r0, #0x1f
	bne _0808222E
_08082292:
	adds r1, r4, r5
	asrs r1, r1, #1
	movs r0, #0xc0
	subs r0, r0, r1
	asrs r0, r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080822A4
sub_080822A4: @ 0x080822A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080822AE
	movs r4, #0x4a
_080822AE:
	cmp r4, #0x4b
	beq _080822D0
	cmp r4, #0x4b
	bgt _080822BC
	cmp r4, #0x4a
	beq _080822C2
	b _080822E8
_080822BC:
	cmp r4, #0x4c
	beq _080822DC
	b _080822E8
_080822C2:
	ldr r0, _080822CC @ =0x000005D2
	bl GetMsg
	b _08082302
	.align 2, 0
_080822CC: .4byte 0x000005D2
_080822D0:
	ldr r0, _080822D8 @ =0x000005D3
	bl GetMsg
	b _08082302
	.align 2, 0
_080822D8: .4byte 0x000005D3
_080822DC:
	ldr r0, _080822E4 @ =0x000005D4
	bl GetMsg
	b _08082302
	.align 2, 0
_080822E4: .4byte 0x000005D4
_080822E8:
	movs r0, #0x7f
	ands r0, r4
	bl GetChapterInfo
	asrs r1, r4, #7
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #1
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
_08082302:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start PutChapterTitleGfx
PutChapterTitleGfx: @ 0x08082308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_080822A4
	adds r7, r0, #0
	lsls r0, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r1, r1, r0
	mov r8, r1
	adds r0, r7, #0
	bl sub_08082224
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r1, _08082354 @ =0x0203E698
	ldr r2, _08082358 @ =0x000003FF
	adds r0, r2, #0
	ands r4, r0
	movs r0, #0
	strh r4, [r1, #2]
	str r0, [sp]
	ldr r2, _0808235C @ =0x01000200
	mov r0, sp
	mov r1, r8
	bl CpuFastSet
	ldr r0, _08082360 @ =0x0840260C
	ldr r1, _08082364 @ =0x02020140
	bl Decompress
	b _080823C6
	.align 2, 0
_08082354: .4byte 0x0203E698
_08082358: .4byte 0x000003FF
_0808235C: .4byte 0x01000200
_08082360: .4byte 0x0840260C
_08082364: .4byte 0x02020140
_08082368:
	adds r0, r7, #0
	bl sub_080820E8
	adds r2, r0, #0
	cmp r2, #0x80
	bne _08082386
	cmp r6, r5
	bls _0808237C
	adds r0, r6, #3
	b _0808237E
_0808237C:
	adds r0, r5, #3
_0808237E:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	b _080823C4
_08082386:
	lsls r1, r2, #3
	ldr r0, _0808239C @ =0x08CC2784
	adds r4, r1, r0
	ldrb r3, [r4]
	subs r1, r6, r3
	ldrb r3, [r4, #1]
	subs r0, r5, r3
	cmp r1, r0
	ble _080823A0
	adds r5, r6, #0
	b _080823A2
	.align 2, 0
_0808239C: .4byte 0x08CC2784
_080823A0:
	adds r6, r5, #0
_080823A2:
	ldr r0, _080823DC @ =0x02020140
	mov r1, r8
	adds r3, r6, #0
	bl sub_08082168
	adds r0, r6, #0
	adds r0, #0xff
	ldrb r1, [r4, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xff
	ldrb r4, [r4, #3]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080823C4:
	adds r7, #1
_080823C6:
	ldrb r0, [r7]
	cmp r0, #0
	beq _080823D0
	cmp r0, #0x1f
	bne _08082368
_080823D0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080823DC: .4byte 0x02020140

	thumb_func_start PutChapterTitleBG
PutChapterTitleBG: @ 0x080823E0
	push {lr}
	adds r1, r0, #0
	ldr r3, _08082404 @ =0x0203E698
	ldr r0, _08082408 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _0808240C @ =0x084017F4
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08082404: .4byte 0x0203E698
_08082408: .4byte 0x000003FF
_0808240C: .4byte 0x084017F4

	thumb_func_start sub_08082410
sub_08082410: @ 0x08082410
	push {lr}
	adds r1, r0, #0
	ldr r3, _08082434 @ =0x0203E698
	ldr r0, _08082438 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _0808243C @ =0x08401C2C
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08082434: .4byte 0x0203E698
_08082438: .4byte 0x000003FF
_0808243C: .4byte 0x08401C2C

	thumb_func_start sub_08082440
sub_08082440: @ 0x08082440
	adds r2, r0, #0
	ldr r0, _0808245C @ =0x0203E698
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	movs r1, #0x3f
_0808244C:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0808244C
	bx lr
	.align 2, 0
_0808245C: .4byte 0x0203E698

	thumb_func_start sub_08082460
sub_08082460: @ 0x08082460
	adds r2, r0, #0
	ldr r0, _0808247C @ =0x0203E698
	lsls r1, r1, #0xc
	ldrh r0, [r0]
	adds r0, r0, r1
	movs r1, #0x7f
_0808246C:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0808246C
	bx lr
	.align 2, 0
_0808247C: .4byte 0x0203E698

	thumb_func_start sub_08082480
sub_08082480: @ 0x08082480
	push {lr}
	adds r2, r1, #0
	ldr r1, _0808249C @ =0x0840213C
	ldr r3, _080824A0 @ =0x0203E698
	lsls r2, r2, #0xc
	ldrh r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_t
	pop {r0}
	bx r0
	.align 2, 0
_0808249C: .4byte 0x0840213C
_080824A0: .4byte 0x0203E698

	thumb_func_start GetChapterTitle
GetChapterTitle: @ 0x080824A4
	adds r1, r0, #0
	cmp r1, #0
	bne _080824AE
	movs r0, #0x4a
	b _080824D0
_080824AE:
	movs r0, #0x20
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _080824BC
	movs r0, #0x4b
	b _080824D0
_080824BC:
	ldrb r0, [r1, #0x1b]
	cmp r0, #3
	beq _080824C8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	b _080824D0
_080824C8:
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	movs r1, #0x80
	orrs r0, r1
_080824D0:
	bx lr
	.align 2, 0

	thumb_func_start sub_080824D4
sub_080824D4: @ 0x080824D4
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r5, [sp, #0x14]
	ldr r4, [sp, #0x18]
	asrs r1, r2, #3
	lsls r1, r1, #5
	adds r0, r0, r1
	asrs r1, r3, #3
	lsls r1, r1, #0xa
	adds r0, r0, r1
	movs r6, #7
	ands r3, r6
	lsls r3, r3, #2
	adds r0, r0, r3
	ands r2, r6
	lsls r2, r2, #2
	movs r1, #0xf
	lsls r1, r2
	ldr r3, [r0]
	ands r3, r1
	cmp r3, #0
	beq _08082520
	asrs r1, r5, #3
	lsls r1, r1, #5
	adds r1, r7, r1
	asrs r0, r4, #3
	lsls r0, r0, #0xa
	adds r1, r1, r0
	ands r4, r6
	lsls r0, r4, #2
	adds r1, r1, r0
	lsrs r3, r2
	ands r5, r6
	lsls r0, r5, #2
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_08082520:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LoadHelpBoxGfx
LoadHelpBoxGfx: @ 0x08082528
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	cmp r7, #0
	bne _08082534
	ldr r7, _080825A0 @ =0x06013000
_08082534:
	cmp r5, #0
	bge _0808253A
	movs r5, #5
_0808253A:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _080825A4 @ =0x083FD764
	adds r1, r7, #0
	bl Decompress
	ldr r0, _080825A8 @ =0x08403A6C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r7, r2
	bl Decompress
	ldr r6, _080825AC @ =0x0203E6A0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r6, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x28
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	ldr r0, _080825B0 @ =0x081946B4
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r4
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080825A0: .4byte 0x06013000
_080825A4: .4byte 0x083FD764
_080825A8: .4byte 0x08403A6C
_080825AC: .4byte 0x0203E6A0
_080825B0: .4byte 0x081946B4

	thumb_func_start sub_080825B4
sub_080825B4: @ 0x080825B4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	cmp r7, #0
	bne _080825C0
	ldr r7, _08082628 @ =0x06013000
_080825C0:
	cmp r5, #0
	bge _080825C6
	movs r5, #5
_080825C6:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _0808262C @ =0x083FD764
	adds r1, r7, #0
	bl Decompress
	ldr r0, _08082630 @ =0x08403A6C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r7, r2
	bl Decompress
	ldr r6, _08082634 @ =0x0203E6A0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r6, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	bl SetTextFont
	ldr r0, _08082638 @ =0x081946B4
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r4
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082628: .4byte 0x06013000
_0808262C: .4byte 0x083FD764
_08082630: .4byte 0x08403A6C
_08082634: .4byte 0x0203E6A0
_08082638: .4byte 0x081946B4

	thumb_func_start PutSpriteTalkBox
PutSpriteTalkBox: @ 0x0808263C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	mov sb, r1
	adds r7, r2, #0
	mov r8, r3
	cmp r7, #0x1f
	bgt _08082656
	movs r7, #0x20
_08082656:
	cmp r7, #0xc0
	ble _0808265C
	movs r7, #0xc0
_0808265C:
	mov r0, r8
	cmp r0, #0xf
	bgt _08082666
	movs r1, #0x10
	mov r8, r1
_08082666:
	mov r3, r8
	cmp r3, #0x30
	ble _08082670
	movs r0, #0x30
	mov r8, r0
_08082670:
	adds r0, r7, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _0808267A
	adds r0, #0x1f
_0808267A:
	asrs r0, r0, #5
	mov r1, r8
	adds r1, #0xf
	cmp r1, #0
	bge _08082686
	adds r1, #0xf
_08082686:
	asrs r1, r1, #4
	str r1, [sp, #4]
	subs r6, r0, #1
	str r6, [sp, #0x18]
	mov r1, sb
	subs r1, #8
	str r1, [sp, #0x14]
	mov r3, sb
	add r3, r8
	str r3, [sp, #0xc]
	mov r0, sl
	subs r0, #8
	str r0, [sp, #0x10]
	mov r1, sl
	adds r1, r1, r7
	str r1, [sp, #8]
	cmp r6, #0
	blt _080826F2
_080826AA:
	ldr r5, [sp, #4]
	subs r4, r6, #1
	cmp r5, #0
	blt _080826EC
_080826B2:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _080826BC
	adds r1, r7, #0
_080826BC:
	subs r1, #0x20
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _080826C8
	mov r0, r8
_080826C8:
	subs r0, #0x10
	add r1, sl
	mov r3, sb
	adds r2, r3, r0
	ldr r3, _080827F0 @ =0x0203E6A0
	lsls r0, r6, #2
	ldrh r3, [r3, #0x30]
	adds r0, r3, r0
	lsls r3, r5, #6
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0
	ldr r3, _080827F4 @ =0x08B905F8
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080826B2
_080826EC:
	adds r6, r4, #0
	cmp r6, #0
	bge _080826AA
_080826F2:
	ldr r6, [sp, #0x18]
	cmp r6, #0
	blt _08082734
	ldr r5, _080827F0 @ =0x0203E6A0
_080826FA:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _08082704
	adds r1, r7, #0
_08082704:
	subs r1, #0x20
	mov r0, sl
	adds r4, r0, r1
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _080827F8 @ =0x08B90608
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0xc]
	ldr r3, _080827FC @ =0x08B90618
	bl PutSprite
	subs r6, #1
	cmp r6, #0
	bge _080826FA
_08082734:
	ldr r5, [sp, #4]
	cmp r5, #0
	blt _08082776
	ldr r6, _080827F0 @ =0x0203E6A0
_0808273C:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08082746
	mov r0, r8
_08082746:
	subs r0, #0x10
	mov r1, sb
	adds r4, r1, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, _08082800 @ =0x08B905D0
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r4, #0
	ldr r3, _08082804 @ =0x08B90620
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808273C
_08082776:
	ldr r3, _08082808 @ =0x08B905B0
	ldr r4, _080827F0 @ =0x0203E6A0
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _0808280C @ =0x08B90628
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _08082810 @ =0x08B90630
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r3, _08082814 @ =0x08B90638
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _080827DE
	mov r2, sb
	subs r2, #0xb
	ldr r3, _080827F4 @ =0x08B905F8
	ldr r0, _08082818 @ =0x000003FF
	ldrh r4, [r4, #0x30]
	ands r0, r4
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	bl PutSprite
_080827DE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080827F0: .4byte 0x0203E6A0
_080827F4: .4byte 0x08B905F8
_080827F8: .4byte 0x08B90608
_080827FC: .4byte 0x08B90618
_08082800: .4byte 0x08B905D0
_08082804: .4byte 0x08B90620
_08082808: .4byte 0x08B905B0
_0808280C: .4byte 0x08B90628
_08082810: .4byte 0x08B90630
_08082814: .4byte 0x08B90638
_08082818: .4byte 0x000003FF

	thumb_func_start DrawHelpBoxWeaponLabels
DrawHelpBoxWeaponLabels: @ 0x0808281C
	push {r4, lr}
	ldr r4, _08082898 @ =0x0203E6B8
	bl GetItemKind
	bl GetItemKindString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _0808289C @ =0x0000110C
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828A0 @ =0x0000110E
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #8
	bl Text_InsertDrawString
	adds r4, #8
	ldr r0, _080828A4 @ =0x0000110F
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828A8 @ =0x00001104
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828AC @ =0x0000110D
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #8
	bl Text_InsertDrawString
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082898: .4byte 0x0203E6B8
_0808289C: .4byte 0x0000110C
_080828A0: .4byte 0x0000110E
_080828A4: .4byte 0x0000110F
_080828A8: .4byte 0x00001104
_080828AC: .4byte 0x0000110D

	thumb_func_start DrawHelpBoxWeaponStats
DrawHelpBoxWeaponStats: @ 0x080828B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08082928 @ =0x0203E6B8
	bl GetWeaponLevelStringFromExp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x44
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemWeight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r4, #8
	adds r0, r5, #0
	bl GetItemMight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemHit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemCrit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082928: .4byte 0x0203E6B8

	thumb_func_start DrawHelpBoxStaffLabels
DrawHelpBoxStaffLabels: @ 0x0808292C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08082984 @ =0x0203E6B8
	ldr r0, _08082988 @ =0x00001115
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetWeaponLevelStringFromExp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawString
	ldr r0, _0808298C @ =0x0000110C
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x44
	movs r2, #7
	bl Text_InsertDrawString
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08082984: .4byte 0x0203E6B8
_08082988: .4byte 0x00001115
_0808298C: .4byte 0x0000110C

	thumb_func_start DrawHelpBoxSaveMenuLabels
DrawHelpBoxSaveMenuLabels: @ 0x08082990
	push {r4, lr}
	ldr r1, _080829DC @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080829EC
	ldr r4, _080829E0 @ =0x0203E6B8
	movs r0, #0x88
	lsls r0, r0, #5
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080829E4 @ =0x000012AF
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080829E8 @ =0x000010F2
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #8
	bl Text_InsertDrawString
	b _08082A00
	.align 2, 0
_080829DC: .4byte 0x0202BBF8
_080829E0: .4byte 0x0203E6B8
_080829E4: .4byte 0x000012AF
_080829E8: .4byte 0x000010F2
_080829EC:
	ldr r4, _08082A08 @ =0x0203E6B8
	ldr r0, _08082A0C @ =0x00001290
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #7
	bl Text_InsertDrawString
_08082A00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082A08: .4byte 0x0203E6B8
_08082A0C: .4byte 0x00001290

	thumb_func_start DrawHelpBoxSaveMenuStats
DrawHelpBoxSaveMenuStats: @ 0x08082A10
	push {r4, r5, r6, r7, lr}
	ldr r7, _08082A6C @ =0x0202BBF8
	adds r5, r7, #0
	adds r5, #0x2b
	movs r0, #1
	ldrb r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _08082AC8
	bl GetTacticianName
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, #0
	bne _08082A7C
	ldr r4, _08082A70 @ =0x0203E6B8
	ldr r5, _08082A74 @ =0x0000127C
	adds r0, r5, #0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #7
	bl Text_InsertDrawString
	ldr r0, _08082A78 @ =0x0000127E
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawString
	b _08082AC8
	.align 2, 0
_08082A6C: .4byte 0x0202BBF8
_08082A70: .4byte 0x0203E6B8
_08082A74: .4byte 0x0000127C
_08082A78: .4byte 0x0000127E
_08082A7C:
	ldr r4, _08082AD0 @ =0x0203E6B8
	ldr r1, _08082AD4 @ =0x081C3AC0
	ldrb r5, [r5]
	lsrs r0, r5, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080A6DD0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x8a
	movs r2, #7
	adds r3, r6, #0
	bl Text_InsertDrawString
_08082AC8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082AD0: .4byte 0x0203E6B8
_08082AD4: .4byte 0x081C3AC0

	thumb_func_start HelpBoxTextScroll_OnLoop
HelpBoxTextScroll_OnLoop: @ 0x08082AD8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08082B66
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r6, r1
	bge _08082B60
	adds r5, r4, #0
	adds r5, #0x5c
_08082B0E:
	ldr r0, [r4, #0x2c]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq _08082B30
	cmp r2, #1
	bgt _08082B22
	cmp r2, #0
	beq _08082B28
	b _08082B40
_08082B22:
	cmp r2, #4
	beq _08082B3C
	b _08082B40
_08082B28:
	adds r0, r4, #0
	bl Proc_Break
	b _08082B60
_08082B30:
	adds r0, r3, #1
	str r0, [r4, #0x2c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08082B56
_08082B3C:
	adds r0, r3, #1
	b _08082B54
_08082B40:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl Text_DrawCharacter
_08082B54:
	str r0, [r4, #0x2c]
_08082B56:
	adds r6, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r6, r0
	blt _08082B0E
_08082B60:
	movs r0, #0
	bl SetTextFont
_08082B66:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HelpBoxDrawOneLineExt
HelpBoxDrawOneLineExt: @ 0x08082B6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
_08082B78:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldrb r1, [r5, #4]
	lsls r0, r1, #3
	ldr r1, [r4, #0x2c]
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetCursor
_08082B94:
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _08082BB4
	cmp r1, #1
	bgt _08082BA6
	cmp r1, #0
	beq _08082BCC
	b _08082BC0
_08082BA6:
	cmp r1, #5
	bgt _08082BC0
	cmp r1, #4
	blt _08082BC0
	adds r0, #1
	str r0, [r4, #0x2c]
	b _08082B94
_08082BB4:
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r6, #1
	cmp r6, #5
	ble _08082B78
	b _08082BCC
_08082BC0:
	ldr r1, [r4, #0x2c]
	adds r0, r5, #0
	bl Text_DrawCharacter
	str r0, [r4, #0x2c]
	b _08082B94
_08082BCC:
	ldr r0, [r4, #0x30]
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start HelpBoxSetupstringLines
HelpBoxSetupstringLines: @ 0x08082BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08082C00 @ =0x0203E6A0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	adds r1, r0, #0
	cmp r1, #1
	beq _08082C16
	cmp r1, #1
	bgt _08082C04
	cmp r1, #0
	beq _08082C0E
	b _08082C38
	.align 2, 0
_08082C00: .4byte 0x0203E6A0
_08082C04:
	cmp r1, #2
	beq _08082C24
	cmp r1, #3
	beq _08082C2C
	b _08082C38
_08082C0E:
	adds r0, r5, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08082C38
_08082C16:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponLabels
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #2
	b _08082C36
_08082C24:
	adds r0, r4, #0
	bl DrawHelpBoxStaffLabels
	b _08082C30
_08082C2C:
	bl DrawHelpBoxSaveMenuLabels
_08082C30:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
_08082C36:
	strh r0, [r1]
_08082C38:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HelpBoxDrawstring
HelpBoxDrawstring: @ 0x08082C4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08082C68 @ =0x0203E6A0
	bl SetTextFont
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	cmp r0, #1
	beq _08082C6C
	cmp r0, #3
	beq _08082C74
	b _08082C78
	.align 2, 0
_08082C68: .4byte 0x0203E6A0
_08082C6C:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponStats
	b _08082C78
_08082C74:
	bl DrawHelpBoxSaveMenuStats
_08082C78:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

