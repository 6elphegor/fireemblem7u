	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassStatsDisplay_Init
ClassStatsDisplay_Init: @ 0x080B00A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x30]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r2, r5, #0
	adds r2, #0x34
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #0xfa
	strb r0, [r1]
	movs r6, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B010C
	adds r4, r2, #0
_080B00D4:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetClassDisplayFontInfo
	cmp r0, #0
	beq _080B00F2
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	subs r0, r1, r2
	ldrb r1, [r4]
	adds r0, r1, r0
	b _080B00F6
_080B00F2:
	ldrb r0, [r4]
	adds r0, #4
_080B00F6:
	strb r0, [r4]
	adds r6, #1
	cmp r6, #0xe
	bgt _080B010C
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B00D4
_080B010C:
	ldr r0, _080B0128 @ =0x0841FA5C
	ldr r1, _080B012C @ =0x06010000
	bl Decompress
	ldr r0, _080B0130 @ =0x084205A8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0128: .4byte 0x0841FA5C
_080B012C: .4byte 0x06010000
_080B0130: .4byte 0x084205A8
