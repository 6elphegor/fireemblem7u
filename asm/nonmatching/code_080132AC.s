	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyBitmapLine
ApplyBitmapLine: @ 0x080132AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r7, #0
	ble _080132CE
	adds r4, r7, #0
_080132BA:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ApplyBitmapTile
	adds r6, #8
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bne _080132BA
_080132CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
