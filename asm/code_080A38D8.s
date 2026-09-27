	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenu_LoadExtraMenuGraphics
SaveMenu_LoadExtraMenuGraphics: @ 0x080A38D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080A3908 @ =0x084130A4
	ldr r1, _080A390C @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl InitSaveMenuChoice
	adds r6, r5, #0
	adds r6, #0x42
	ldrh r0, [r6]
	cmp r0, #0x20
	bne _080A3910
	movs r0, #0x20
	adds r1, r5, #0
	bl SaveMenuGetValidMenuAmt
	adds r1, r5, #0
	adds r1, #0x2b
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x2e
	b _080A393E
	.align 2, 0
_080A3908: .4byte 0x084130A4
_080A390C: .4byte 0x06013800
_080A3910:
	adds r4, r5, #0
	adds r4, #0x2e
	movs r1, #0
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0x2b
	strb r1, [r2]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x16
	ldrb r0, [r0]
	ldrb r1, [r2]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
_080A393E:
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A394C
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
_080A394C:
	ldrb r4, [r4]
	cmp r4, #5
	bne _080A395A
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
_080A395A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
