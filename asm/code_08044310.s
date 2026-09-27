	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044310
sub_08044310: @ 0x08044310
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r1, _08044360 @ =0x081D5480
	adds r2, r5, #0
	adds r2, #0x32
	ldr r0, _08044364 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08044368
	ldrb r0, [r4, #0x10]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	subs r0, #0x10
	strh r0, [r5, #0x2a]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	strh r0, [r5, #0x2c]
	lsls r2, r2, #1
	b _08044390
	.align 2, 0
_08044360: .4byte 0x081D5480
_08044364: .4byte 0x08B98AEC
_08044368:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _080443CC @ =0x08B99AF0
	lsls r0, r2, #3
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	subs r0, #0xc
	strh r0, [r5, #0x2a]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r2, r2, #1
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r1, r0, r1
	strh r1, [r5, #0x2c]
_08044390:
	ldr r1, _080443D0 @ =0x081D54E0
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	movs r4, #0
	strh r0, [r5, #0x2e]
	adds r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x30]
	ldr r0, _080443D4 @ =0x02000C60
	bl SetTextFont
	ldr r0, _080443D8 @ =0x02000C78
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x18
	ldr r3, [r5, #0x34]
	movs r2, #2
	bl SioDrawNumber
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080443CC: .4byte 0x08B99AF0
_080443D0: .4byte 0x081D54E0
_080443D4: .4byte 0x02000C60
_080443D8: .4byte 0x02000C78
