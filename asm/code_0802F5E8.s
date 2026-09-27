	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F5E8
sub_0802F5E8: @ 0x0802F5E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F684 @ =0x0203A85C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0802F618
	ldrb r4, [r4, #0x12]
	adds r0, r5, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _0802F618
	ldr r0, [r5, #0xc]
	ldr r1, _0802F688 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r5, #0xc]
_0802F618:
	ldr r5, _0802F684 @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	ldrb r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl UnitAddItem
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r4, _0802F68C @ =0x0203A470
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl InitBattleUnit
	adds r4, #0x48
	strh r6, [r4]
	adds r0, r7, #0
	bl BattleApplyMiscAction
	bl EndAllMus
	bl sub_0806F0DC
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F684: .4byte 0x0203A85C
_0802F688: .4byte 0xFFFFEFFF
_0802F68C: .4byte 0x0203A470
