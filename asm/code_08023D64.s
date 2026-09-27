	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeTradeTargetList
MakeTradeTargetList: @ 0x08023D64
	push {r4, r5, r6, r7, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r6, _08023DCC @ =0x02033E40
	str r0, [r6]
	ldr r0, _08023DD0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r7, _08023DD4 @ =TryAddUnitToTradeTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ForEachAdjacentUnit
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023DC6
	bl CountTargets
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	bl sub_080BFC68
	bl CountTargets
	cmp r4, r0
	beq _08023DC6
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x11]
	strb r1, [r0, #1]
_08023DC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023DCC: .4byte 0x02033E40
_08023DD0: .4byte 0x0202E3E8
_08023DD4: .4byte TryAddUnitToTradeTargetList
