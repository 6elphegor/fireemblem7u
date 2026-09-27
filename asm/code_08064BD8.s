	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonIntroDone
EkrDragonIntroDone: @ 0x08064BD8
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08064BEE
	movs r0, #0
	b _08064BF0
_08064BEE:
	movs r0, #1
_08064BF0:
	pop {r1}
	bx r1
