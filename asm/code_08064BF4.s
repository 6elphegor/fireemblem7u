	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEkrDragonEndingDone
CheckEkrDragonEndingDone: @ 0x08064BF4
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08064C0A
	movs r0, #0
	b _08064C0C
_08064C0A:
	movs r0, #1
_08064C0C:
	pop {r1}
	bx r1
