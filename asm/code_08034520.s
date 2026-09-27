	.include "macro.inc"

	.syntax unified

	thumb_func_start HandlePostActionTraps
HandlePostActionTraps: @ 0x08034520
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08034540 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitCurrentHp
	cmp r0, #0
	ble _0803453A
	ldr r0, [r4]
	bl GetPickTrapType
	cmp r0, #0
	bne _08034544
_0803453A:
	movs r0, #1
	b _0803456C
	.align 2, 0
_08034540: .4byte 0x03004690
_08034544:
	ldr r1, _08034574 @ =0x0203A85C
	movs r0, #1
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x11]
	movs r0, #3
	bl WriteSuspendSave
	bl GetBattleAnimType
	cmp r0, #1
	bne _0803455E
	bl RefreshUnitSprites
_0803455E:
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0803456C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08034574: .4byte 0x0203A85C
