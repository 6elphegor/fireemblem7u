	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitAidIconId
GetUnitAidIconId: @ 0x08018578
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08018588
	movs r0, #0x81
	b _080185A8
_08018588:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _08018596
	movs r0, #0x82
	b _080185A8
_08018596:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080185A6
	movs r0, #1
	rsbs r0, r0, #0
	b _080185A8
_080185A6:
	movs r0, #0x83
_080185A8:
	bx lr
	.align 2, 0
