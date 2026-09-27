	.include "macro.inc"

	.syntax unified

	thumb_func_start KillAllRedUnits_Loop
KillAllRedUnits_Loop: @ 0x080329C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r4, [r6, r0]
	bl CountTargets
	cmp r4, r0
	bne _080329E6
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08032A5A
_080329E6:
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl UnitKill
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	ldr r1, _08032A40 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r2, #0xf0
	bhi _08032A2A
	cmp r0, #0
	blt _08032A2A
	cmp r0, #0xa0
	ble _08032A44
_08032A2A:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08032A5A
	.align 2, 0
_08032A40: .4byte 0x0202BBB8
_08032A44:
	adds r0, r4, #0
	bl StartMu
	bl StartMuDeathFade
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r0, r5, #0
	bl Proc_Break
_08032A5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
