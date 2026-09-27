	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4C94
sub_080A4C94: @ 0x080A4C94
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080A4D2C @ =0x02023460
	movs r1, #0
	bl TmFill
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A4D30 @ =0x084130A4
	ldr r1, _080A4D34 @ =0x06013800
	bl Decompress
	ldr r0, _080A4D38 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080A4D3C @ =0x084120A0
	ldr r1, _080A4D40 @ =0x06010800
	bl Decompress
	ldr r0, _080A4D44 @ =0x02022C60
	ldr r1, _080A4D48 @ =0x0840FA00
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r1, _080A4D4C @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A4D50 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	bl sub_080A5EF0
	adds r0, r4, #0
	bl SaveMenuPutChapterTitle
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_080A649C
	movs r0, #0xc
	bl Proc_UnblockEachMarked
	movs r0, #0xd
	bl Proc_UnblockEachMarked
	movs r0, #3
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	beq _080A4D24
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xdc
	strb r0, [r1]
_080A4D24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4D2C: .4byte 0x02023460
_080A4D30: .4byte 0x084130A4
_080A4D34: .4byte 0x06013800
_080A4D38: .4byte 0x084138F0
_080A4D3C: .4byte 0x084120A0
_080A4D40: .4byte 0x06010800
_080A4D44: .4byte 0x02022C60
_080A4D48: .4byte 0x0840FA00
_080A4D4C: .4byte 0x02000000
_080A4D50: .4byte 0x02000001
