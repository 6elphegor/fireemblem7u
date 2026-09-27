	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPrepareScreenFx
EfxPrepareScreenFx: @ 0x0804D1D4
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0804D214 @ =0x08194674
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0804D218 @ =0x02017648
	ldr r1, _0804D21C @ =0x06001400
	movs r2, #0xa0
	movs r3, #2
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, _0804D220 @ =0x081D88B4
	ldr r1, _0804D224 @ =0x06001000
	bl LZ77UnCompVram
	ldr r0, _0804D228 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D230
	ldr r5, _0804D22C @ =0x08B9A998
	b _0804D23E
	.align 2, 0
_0804D214: .4byte 0x08194674
_0804D218: .4byte 0x02017648
_0804D21C: .4byte 0x06001400
_0804D220: .4byte 0x081D88B4
_0804D224: .4byte 0x06001000
_0804D228: .4byte 0x0203E010
_0804D22C: .4byte 0x08B9A998
_0804D230:
	ldr r0, _0804D278 @ =0x0203E094
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
_0804D23E:
	ldr r4, _0804D27C @ =0x02017660
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D280 @ =0x081D8ABC
	ldr r1, _0804D284 @ =0x06001400
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804D288 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D290
	ldr r5, _0804D28C @ =0x08B9A998
	b _0804D29E
	.align 2, 0
_0804D278: .4byte 0x0203E094
_0804D27C: .4byte 0x02017660
_0804D280: .4byte 0x081D8ABC
_0804D284: .4byte 0x06001400
_0804D288: .4byte 0x0203E010
_0804D28C: .4byte 0x08B9A998
_0804D290:
	ldr r0, _0804D2D8 @ =0x0203E094
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804D29E:
	ldr r4, _0804D2DC @ =0x02017670
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D2E0 @ =0x081D8B0C
	ldr r1, _0804D2E4 @ =0x06001580
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804D2E8 @ =0x0203E010
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D2F0
	ldr r5, _0804D2EC @ =0x08B9A998
	b _0804D2FE
	.align 2, 0
_0804D2D8: .4byte 0x0203E094
_0804D2DC: .4byte 0x02017670
_0804D2E0: .4byte 0x081D8B0C
_0804D2E4: .4byte 0x06001580
_0804D2E8: .4byte 0x0203E010
_0804D2EC: .4byte 0x08B9A998
_0804D2F0:
	ldr r0, _0804D338 @ =0x0203E098
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
_0804D2FE:
	ldr r4, _0804D33C @ =0x02017678
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D340 @ =0x081D8B78
	ldr r1, _0804D344 @ =0x06001740
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804D348 @ =0x0203E010
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D350
	ldr r5, _0804D34C @ =0x08B9A998
	b _0804D35E
	.align 2, 0
_0804D338: .4byte 0x0203E098
_0804D33C: .4byte 0x02017678
_0804D340: .4byte 0x081D8B78
_0804D344: .4byte 0x06001740
_0804D348: .4byte 0x0203E010
_0804D34C: .4byte 0x08B9A998
_0804D350:
	ldr r0, _0804D414 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804D35E:
	ldr r4, _0804D418 @ =0x02017668
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D41C @ =0x081D8BC8
	ldr r1, _0804D420 @ =0x060018C0
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r4, _0804D424 @ =0x02022C60
	adds r0, r4, #0
	movs r1, #0x9f
	bl TmFill
	ldr r0, _0804D428 @ =0x081D8F50
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl EfxTmCpyBG
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl sub_0806693C
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl sub_0806693C
	movs r0, #1
	bl EnableBgSync
	ldr r6, _0804D42C @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804D430 @ =0x081D8FA0
	adds r0, r0, r5
	ldr r4, _0804D434 @ =0x020228A0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r1, _0804D438 @ =0x02000038
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D414: .4byte 0x0203E098
_0804D418: .4byte 0x02017668
_0804D41C: .4byte 0x081D8BC8
_0804D420: .4byte 0x060018C0
_0804D424: .4byte 0x02022C60
_0804D428: .4byte 0x081D8F50
_0804D42C: .4byte 0x0203E020
_0804D430: .4byte 0x081D8FA0
_0804D434: .4byte 0x020228A0
_0804D438: .4byte 0x02000038
