	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047670
sub_08047670: @ 0x08047670
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080476BC @ =0x08B9A250
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _080476C0 @ =0x02022860
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #0x14
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, _080476C4 @ =0x08B9A268
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080476BC: .4byte 0x08B9A250
_080476C0: .4byte 0x02022860
_080476C4: .4byte 0x08B9A268
