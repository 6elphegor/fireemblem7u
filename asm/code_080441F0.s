	.include "macro.inc"

	.syntax unified

	thumb_func_start LAPointsBox_LoadBoxes
LAPointsBox_LoadBoxes: @ 0x080441F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080442B0 @ =0x081C79B4
	ldr r1, _080442B4 @ =0x06002800
	bl Decompress
	ldr r0, _080442B8 @ =0x081C7F04
	movs r1, #0x40
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	movs r0, #0
	mov sb, r0
	ldr r0, _080442BC @ =0x081D5470
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x2c
	ldr r7, _080442C0 @ =0x081D54E0
_08044228:
	ldr r0, _080442C4 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, sb
	add r0, sl
	ldrb r5, [r0]
	adds r0, r5, #0
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804428C
	ldr r0, _080442C8 @ =0x0203DC9C
	mov r8, r0
	adds r0, #0xa
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r4, r5, #2
	cmp r0, #0
	bne _08044260
	lsls r1, r4, #5
	ldr r0, _080442CC @ =0x081C8164
	movs r2, #0x20
	bl ApplyPaletteExt
_08044260:
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #4
	bl InitTextDb
	ldrb r1, [r7]
	ldrb r2, [r7, #1]
	lsls r0, r5, #2
	mov r3, r8
	adds r3, #0x14
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r4, #0
	bl DrawLinkArenaPointsBox
_0804428C:
	adds r6, #8
	adds r7, #2
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #3
	ble _08044228
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080442B0: .4byte 0x081C79B4
_080442B4: .4byte 0x06002800
_080442B8: .4byte 0x081C7F04
_080442BC: .4byte 0x081D5470
_080442C0: .4byte 0x081D54E0
_080442C4: .4byte 0x08B98AEC
_080442C8: .4byte 0x0203DC9C
_080442CC: .4byte 0x081C8164
