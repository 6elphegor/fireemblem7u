	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADB8C
sub_080ADB8C: @ 0x080ADB8C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, _080ADC0C @ =0x02024460
	cmp r5, #0
	bne _080ADBA6
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r5, r0, r1
_080ADBA6:
	cmp r6, #0
	bge _080ADBAC
	movs r6, #0xe
_080ADBAC:
	ldr r0, _080ADC10 @ =0x08418E44
	adds r1, r5, #0
	bl Decompress
	ldr r0, _080ADC14 @ =0x0841E2D8
	lsls r1, r6, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r5, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r6
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _080ADC18 @ =0x0000027F
_080ADBD6:
	adds r0, r2, r1
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, r3
	ble _080ADBD6
	ldr r4, _080ADC1C @ =0x02024520
	ldr r3, _080ADC20 @ =0x08CC1C5C
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	movs r2, #0xe0
	lsls r2, r2, #1
_080ADBF0:
	ldrh r5, [r4]
	adds r0, r1, r5
	strh r0, [r4]
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bne _080ADBF0
	adds r0, r3, #0
	adds r1, r7, #0
	bl Proc_Start
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC0C: .4byte 0x02024460
_080ADC10: .4byte 0x08418E44
_080ADC14: .4byte 0x0841E2D8
_080ADC18: .4byte 0x0000027F
_080ADC1C: .4byte 0x02024520
_080ADC20: .4byte 0x08CC1C5C
