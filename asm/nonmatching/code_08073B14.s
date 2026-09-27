	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073B14
sub_08073B14: @ 0x08073B14
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8d
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08073C28 @ =0x083F70C4
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08073C2C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08073C30 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08073B50
	adds r1, #7
_08073B50:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08073B60
	adds r2, #7
_08073B60:
	asrs r3, r2, #3
	subs r2, r3, #2
	ldr r3, _08073C34 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	ldr r4, _08073C38 @ =0x083F71E4
	str r4, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	bl sub_080149A8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073C3C @ =0x083F7050
	ldr r1, _08073C40 @ =0x06013800
	bl Decompress
	ldr r0, _08073C44 @ =0x083F70A4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073C48 @ =0x083F71C4
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorReverse
	bl InitScanlineEffect
	bl sub_0807689C
	bl sub_08073D80
	ldr r0, _08073C4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C4C @ =0x03002870
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
	ldr r0, _08073C4C @ =0x03002870
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
	ldr r0, _08073C4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
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
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073C28: .4byte 0x083F70C4
_08073C2C: .4byte 0x06002800
_08073C30: .4byte 0x02023C60
_08073C34: .4byte 0x00004140
_08073C38: .4byte 0x083F71E4
_08073C3C: .4byte 0x083F7050
_08073C40: .4byte 0x06013800
_08073C44: .4byte 0x083F70A4
_08073C48: .4byte 0x083F71C4
_08073C4C: .4byte 0x03002870
