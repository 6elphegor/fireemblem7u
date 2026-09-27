	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034B6C
sub_08034B6C: @ 0x08034B6C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x1d
	ldrsb r1, [r5, r1]
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, r0
	adds r0, r5, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r6, r2, #0
	ldr r3, [r5]
	ldr r0, [r5, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08034BA2
	adds r0, r4, #0
	subs r0, #0x95
	b _08034BDE
_08034BA2:
	movs r0, #1
	ldrb r7, [r5, #0xa]
	ands r0, r7
	cmp r0, #0
	bne _08034BDC
	lsls r0, r2, #8
	adds r4, r4, r0
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08034BBE
	adds r0, r4, #0
	adds r0, #0x3c
	b _08034BDE
_08034BBE:
	ldrb r0, [r3, #4]
	cmp r0, r6
	beq _08034BCE
	movs r0, #0x80
	lsls r0, r0, #6
	ands r1, r0
	cmp r1, #0
	beq _08034BD4
_08034BCE:
	adds r0, r4, #0
	adds r0, #0x57
	b _08034BDE
_08034BD4:
	adds r0, r5, #0
	bl GetUnitBattleAiPriority
	adds r4, r4, r0
_08034BDC:
	adds r0, r4, #0
_08034BDE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
