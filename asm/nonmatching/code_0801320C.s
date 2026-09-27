	.include "macro.inc"

	.syntax unified

	thumb_func_start Register2dChrMove
Register2dChrMove: @ 0x0801320C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _08013232
	adds r4, r3, #0
_0801321A:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl RegisterDataMove
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _0801321A
_08013232:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
