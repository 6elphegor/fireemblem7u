	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9654
sub_080B9654: @ 0x080B9654
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	asrs r5, r0, #6
	adds r2, r5, #0
	subs r2, #0x88
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ands r0, r5
	cmp r0, #0
	bne _080B96D6
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	adds r2, r5, #0
	adds r5, r0, #0
	cmp r2, #0
	bge _080B9684
	adds r2, #0xf
_080B9684:
	asrs r0, r2, #4
	cmp r1, r0
	bne _080B96D6
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r2, [r0]
	ldr r0, [r4, #0x2c]
	cmp r0, r2
	blt _080B96BA
	subs r0, r0, r2
	cmp r0, #1
	bne _080B96A6
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080B9340
	b _080B96CA
_080B96A6:
	cmp r0, #2
	ble _080B96B2
	adds r0, r4, #0
	bl Proc_Break
	b _080B96CA
_080B96B2:
	movs r0, #0
	bl sub_080B9340
	b _080B96CA
_080B96BA:
	bl GetChapterStats
	ldrb r1, [r5]
	bl sub_080B9340
	ldr r1, [r4, #0x2c]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
_080B96CA:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080B96D6:
	ldr r0, _080B96F8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	ldr r1, [r4, #0x34]
	cmp r0, #0
	beq _080B96EC
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_080B96EC:
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B96F8: .4byte 0x08B857F8
