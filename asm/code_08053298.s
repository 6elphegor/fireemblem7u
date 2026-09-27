	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAllegienceId
GetAllegienceId: @ 0x08053298
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x40
	beq _080532B4
	cmp r0, #0x40
	ble _080532BC
	cmp r1, #0x80
	beq _080532B0
	cmp r1, #0xc0
	beq _080532B8
	b _080532BC
_080532B0:
	movs r0, #1
	b _080532BE
_080532B4:
	movs r0, #2
	b _080532BE
_080532B8:
	movs r0, #3
	b _080532BE
_080532BC:
	movs r0, #0
_080532BE:
	bx lr
