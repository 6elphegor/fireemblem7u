	.include "macro.inc"

	.syntax unified

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
