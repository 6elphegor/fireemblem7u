	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSwingSwordfx
StartSwingSwordfx: @ 0x08021234
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080212B4 @ =0x081BAC1C
	ldr r1, _080212B8 @ =0x06005000
	bl Decompress
	ldr r0, _080212BC @ =0x081BAFD4
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080212C0 @ =0x02022C64
	ldr r1, _080212C4 @ =0x081BB1D4
	movs r2, #0x8a
	lsls r2, r2, #6
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080212C8 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _080212CC @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	ldr r1, _080212D0 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _080212D4 @ =0x08B93D0C
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080212B4: .4byte 0x081BAC1C
_080212B8: .4byte 0x06005000
_080212BC: .4byte 0x081BAFD4
_080212C0: .4byte 0x02022C64
_080212C4: .4byte 0x081BB1D4
_080212C8: .4byte 0x03002870
_080212CC: .4byte 0x0000FFE0
_080212D0: .4byte 0x0000E0FF
_080212D4: .4byte 0x08B93D0C
