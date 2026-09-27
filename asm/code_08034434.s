	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecTrap
ExecTrap: @ 0x08034434
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl GetPickTrapType
	cmp r0, #0xb
	beq _08034464
	cmp r0, #0xb
	bgt _08034450
	cmp r0, #8
	beq _0803445A
	b _08034510
_08034450:
	cmp r0, #0xe
	beq _0803448C
	cmp r0, #0xf
	beq _080344CC
	b _08034510
_0803445A:
	ldr r0, _08034460 @ =0x08B96DE0
	b _08034478
	.align 2, 0
_08034460: .4byte 0x08B96DE0
_08034464:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	bl GetTypedTrapAt
	bl RemoveTrap
	ldr r0, _08034488 @ =0x08B96E30
_08034478:
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x50
	strh r4, [r0]
	str r5, [r1, #0x54]
	b _08034510
	.align 2, 0
_08034488: .4byte 0x08B96E30
_0803448C:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _080344C4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080344AE
	movs r0, #0xb1
	bl m4aSongNumStart
_080344AE:
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _080344C8 @ =0x0000071A
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	b _08034510
	.align 2, 0
_080344C4: .4byte 0x0202BBF8
_080344C8: .4byte 0x0000071A
_080344CC:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _08034518 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080344EE
	movs r0, #0xb1
	bl m4aSongNumStart
_080344EE:
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _0803451C @ =0x0000071B
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	movs r0, #0x79
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
_08034510:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034518: .4byte 0x0202BBF8
_0803451C: .4byte 0x0000071B
