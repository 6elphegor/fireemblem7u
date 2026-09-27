	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintessenceFx_Init_Main
QuintessenceFx_Init_Main: @ 0x0807C044
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
	bl Proc_Start
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
