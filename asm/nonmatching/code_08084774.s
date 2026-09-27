	.include "macro.inc"

	.syntax unified

	thumb_func_start PutMapUiHpBarLeft
PutMapUiHpBarLeft: @ 0x08084774
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _08084782
	movs r0, #5
_08084782:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r3]
	bx lr
