	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitAddItem
UnitAddItem: @ 0x08017654
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x1e
_0801765A:
	ldrh r0, [r2]
	cmp r0, #0
	bne _08017666
	strh r1, [r2]
	movs r0, #1
	b _08017670
_08017666:
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _0801765A
	movs r0, #0
_08017670:
	bx lr
	.align 2, 0
