	.include "macro.inc"

	.syntax unified

	thumb_func_start ADJUSTFROMXI_MoveCameraOnSomeUnit
ADJUSTFROMXI_MoveCameraOnSomeUnit: @ 0x0801D77C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetLastStatScreenUnitId
	bl GetUnit
	cmp r0, #0
	beq _0801D7A6
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
_0801D7A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
