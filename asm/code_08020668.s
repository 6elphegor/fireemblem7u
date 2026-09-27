	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcDanceAnim_Init
ProcDanceAnim_Init: @ 0x08020668
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080206F8 @ =0x081B9BDC
	ldr r1, _080206FC @ =0x06002000
	bl Decompress
	ldr r0, _08020700 @ =0x081BABFC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020704 @ =0x081BA9C0
	ldr r4, _08020708 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0x90
	lsls r5, r5, #2
_08020692:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020692
	ldr r0, _0802070C @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r3, _08020710 @ =0x03002870
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
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020714 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020718 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080206F8: .4byte 0x081B9BDC
_080206FC: .4byte 0x06002000
_08020700: .4byte 0x081BABFC
_08020704: .4byte 0x081BA9C0
_08020708: .4byte 0x0200323C
_0802070C: .4byte 0x02022C60
_08020710: .4byte 0x03002870
_08020714: .4byte 0x0000FFE0
_08020718: .4byte 0x0000E0FF
