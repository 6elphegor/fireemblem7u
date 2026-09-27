	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddUnitToTradeTargetList
TryAddUnitToTradeTargetList: @ 0x08023CC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08023D60 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023D5A
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08023D1E
	ldr r0, [r5]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08023CF8
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08023D1E
_08023CF8:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023D1E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023D1E:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023D5A
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _08023D5A
	ldr r0, _08023D60 @ =0x02033E40
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08023D4C
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq _08023D5A
_08023D4C:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0
	bl EnlistTarget
_08023D5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023D60: .4byte 0x02033E40
