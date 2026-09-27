	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072C90
sub_08072C90: @ 0x08072C90
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x87
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_08073D80
	ldr r0, _08072CFC @ =0x083F87B4
	ldr r1, _08072D00 @ =0x06013800
	bl Decompress
	ldr r0, _08072D04 @ =0x083F8A8C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08072D08 @ =0x083F8AAC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08072D0C @ =0x000041C0
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
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072CFC: .4byte 0x083F87B4
_08072D00: .4byte 0x06013800
_08072D04: .4byte 0x083F8A8C
_08072D08: .4byte 0x083F8AAC
_08072D0C: .4byte 0x000041C0
