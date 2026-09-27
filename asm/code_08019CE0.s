	.include "macro.inc"

	.syntax unified

	thumb_func_start SetWorkingMoveTable
SetWorkingMoveTable: @ 0x08019CE0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _08019CFC @ =0x030043F0
_08019CE8:
	adds r0, r2, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x40
	ble _08019CE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019CFC: .4byte 0x030043F0
