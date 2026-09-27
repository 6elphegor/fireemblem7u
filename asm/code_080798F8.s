	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckFlag
CheckFlag: @ 0x080798F8
	push {lr}
	cmp r0, #0x63
	ble _08079904
	bl CheckChapterFlag
	b _08079908
_08079904:
	bl CheckPermanentFlag
_08079908:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
