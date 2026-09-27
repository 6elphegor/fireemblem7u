	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097324
sub_08097324: @ 0x08097324
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809734C
	ldr r0, _08097348 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080973E8
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _0809742A
	.align 2, 0
_08097348: .4byte 0x08B857F8
_0809734C:
	ldr r0, _08097380 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097384
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809742A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809742A
	.align 2, 0
_08097380: .4byte 0x08B857F8
_08097384:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080973BC
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_08090EE8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080973B4
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080973B0 @ =0x000003AE
	adds r0, r1, #0
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _0809742A
	.align 2, 0
_080973B0: .4byte 0x000003AE
_080973B4:
	adds r0, r4, #0
	bl sub_08097204
	b _0809742A
_080973BC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080973E8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080973E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809742A
	ldr r0, _080973E4 @ =0x0000038B
	bl m4aSongNumStart
	b _0809742A
	.align 2, 0
_080973E0: .4byte 0x0202BBF8
_080973E4: .4byte 0x0000038B
_080973E8:
	adds r0, r4, #0
	bl sub_0809714C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809742A
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809742A
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809742A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809742A:
	pop {r4, r5}
	pop {r0}
	bx r0
