	.include "macro.inc"

	.syntax unified

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
