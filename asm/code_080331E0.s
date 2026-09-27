	.include "macro.inc"

	.syntax unified

	thumb_func_start TrapDamageDisplay_Display
TrapDamageDisplay_Display: @ 0x080331E0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080332AE
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x64
	beq _08033238
	cmp r0, #0x64
	bgt _0803321A
	cmp r0, #6
	beq _0803328C
	cmp r0, #6
	bgt _08033214
	cmp r0, #4
	beq _08033228
	b _0803329A
_08033214:
	cmp r0, #7
	beq _08033280
	b _0803329A
_0803321A:
	cmp r0, #0x66
	beq _0803325C
	cmp r0, #0x66
	blt _0803324A
	cmp r0, #0x67
	beq _0803326E
	b _0803329A
_08033228:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl StartFireTrapAnim1
	b _0803329A
_08033238:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #3
	bl StartGasTrapAnim
	b _0803329A
_0803324A:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #2
	bl StartGasTrapAnim
	b _0803329A
_0803325C:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl StartGasTrapAnim
	b _0803329A
_0803326E:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #1
	bl StartGasTrapAnim
	b _0803329A
_08033280:
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl StartArrowTrapAnim
	b _0803329A
_0803328C:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl StartShowMapChangeAnim
_0803329A:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _080332EA
_080332AE:
	ldr r5, _080332D8 @ =0x0203A85C
	strb r1, [r5, #0xc]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl HideUnitSprite
	ldrb r0, [r5, #0x15]
	cmp r0, #5
	bhi _080332DC
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl BeginUnitPoisonDamageAnim
	b _080332EA
	.align 2, 0
_080332D8: .4byte 0x0203A85C
_080332DC:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl BeginUnitCritDamageAnim
_080332EA:
	pop {r4, r5}
	pop {r0}
	bx r0
