	.include "macro.inc"

	.syntax unified

	thumb_func_start AiUpdateGetUnitIsHealing
AiUpdateGetUnitIsHealing: @ 0x0803975C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r3, [r5, #0xa]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080397AC
	ldr r2, _080397A8 @ =0x08B9727C
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #7
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r4
	bhi _080397D2
	movs r0, #0xfe
	ands r0, r3
	strb r0, [r5, #0xa]
	movs r0, #0
	b _080397D4
	.align 2, 0
_080397A8: .4byte 0x08B9727C
_080397AC:
	ldr r2, _080397C8 @ =0x08B9727C
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #7
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, r4
	bhi _080397CC
	movs r0, #0
	b _080397D4
	.align 2, 0
_080397C8: .4byte 0x08B9727C
_080397CC:
	movs r0, #1
	orrs r0, r3
	strb r0, [r5, #0xa]
_080397D2:
	movs r0, #1
_080397D4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
