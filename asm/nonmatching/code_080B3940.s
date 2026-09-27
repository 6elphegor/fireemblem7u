	.include "macro.inc"

	.syntax unified

	thumb_func_start WmSpriteAnims_Loop
WmSpriteAnims_Loop: @ 0x080B3940
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B39CE
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r3, [r0]
	cmp r3, #0
	beq _080B396C
	adds r0, #1
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080B3966
	bl EndAllWmSpriteAnims
	b _080B39A6
_080B3966:
	subs r0, r1, #1
	strb r0, [r4]
	b _080B39A6
_080B396C:
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #0x10
	bne _080B3980
	strb r3, [r1]
_080B3980:
	ldrb r1, [r1]
	lsrs r1, r1, #3
	movs r0, #0xf
	ands r0, r1
	cmp r0, #7
	bls _080B3996
	movs r0, #7
	ands r1, r0
	movs r0, #0xa
	subs r0, r0, r1
	b _080B399C
_080B3996:
	movs r0, #7
	ands r1, r0
	adds r0, r1, #2
_080B399C:
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r4, r0, #0
_080B39A6:
	ldr r3, _080B39D4 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldrb r4, [r4]
	lsrs r1, r4, #2
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
_080B39CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B39D4: .4byte 0x03002870
