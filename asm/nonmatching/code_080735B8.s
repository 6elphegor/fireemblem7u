	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080735B8
sub_080735B8: @ 0x080735B8
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x83
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SetDefaultManimScreenConf
	ldr r4, _080736C4 @ =0x083F8FBC
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080736C8 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080736CC @ =0x083F8B7C
	ldr r1, _080736D0 @ =0x06013800
	bl Decompress
	ldr r1, _080736D4 @ =0x083F90CC
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080736D4 @ =0x083F90CC
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080736D8 @ =0x083F90EC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, _080736DC @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080736E0 @ =0x030028AC
	ldr r1, _080736E0 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _080736E4 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080736E0 @ =0x030028AC
	ldr r1, _080736E0 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080736C4: .4byte 0x083F8FBC
_080736C8: .4byte 0x06002800
_080736CC: .4byte 0x083F8B7C
_080736D0: .4byte 0x06013800
_080736D4: .4byte 0x083F90CC
_080736D8: .4byte 0x083F90EC
_080736DC: .4byte 0x000041C0
_080736E0: .4byte 0x030028AC
_080736E4: .4byte 0x0000FFE0
_080736E8: .4byte 0x03002870
