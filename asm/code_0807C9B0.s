	.include "macro.inc"

	.syntax unified

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
