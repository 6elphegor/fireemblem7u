	.include "macro.inc"

	.syntax unified

	thumb_func_start GetDeadEnemyAmount
GetDeadEnemyAmount: @ 0x08079FB0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08079FB6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08079FD8
	ldr r0, [r1]
	cmp r0, #0
	beq _08079FD8
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079FD8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08079FD8:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079FB6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
