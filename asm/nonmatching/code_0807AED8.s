	.include "macro.inc"

	.syntax unified

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
