	.include "macro.inc"

	.syntax unified

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

	thumb_func_start DragonGatefx_DrawLight
DragonGatefx_DrawLight: @ 0x0807AED8
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
	ldr r0, _0807AF98 @ =DragonGatefx_LightHBlank
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
_0807AF98: .4byte DragonGatefx_LightHBlank
_0807AF9C: .4byte DragonGatefx_DistortionHandler

	thumb_func_start DragonGatefx_DrawDragon
DragonGatefx_DrawDragon: @ 0x0807AFA0
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

	thumb_func_start DragonGatefx_MergeDragon
DragonGatefx_MergeDragon: @ 0x0807B070
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
	ldr r0, _0807B184 @ =DragonGatefx_LightHBlank
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0807B184: .4byte DragonGatefx_LightHBlank

	thumb_func_start DragonGatefx_End
DragonGatefx_End: @ 0x0807B188
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
	bl Proc_Start
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

	thumb_func_start EndDragonGatefx
EndDragonGatefx: @ 0x0807B20C
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
	bl GetUnitFromCharId
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
	bl Proc_Start
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

	thumb_func_start DragonFlamefx_Init
DragonFlamefx_Init: @ 0x0807B388
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl EndMixPalette
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

	thumb_func_start DragonFlamefx_Rotation
DragonFlamefx_Rotation: @ 0x0807B494
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

	thumb_func_start DragonFlamefx_RefrainBlendAlpha
DragonFlamefx_RefrainBlendAlpha: @ 0x0807B528
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
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807B65E
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807B65E:
	movs r0, #0x86
	bl GetUnitFromCharId
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
	bl Proc_Start
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

	thumb_func_start DeadDragonFlame_Init
DeadDragonFlame_Init: @ 0x0807B818
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

	thumb_func_start DeadDragonFlame_Rotation
DeadDragonFlame_Rotation: @ 0x0807B910
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
	bl GetUnitFromCharId
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
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF4: .4byte 0x08CA76DC
