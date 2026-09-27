	.include "macro.inc"

	.syntax unified

	thumb_func_start SetUnitStatus
SetUnitStatus: @ 0x080175E8
	adds r2, r1, #0
	cmp r2, #0
	bne _080175F2
	adds r0, #0x30
	b _080175FC
_080175F2:
	adds r0, #0x30
	movs r1, #0xf
	ands r2, r1
	movs r1, #0x50
	orrs r2, r1
_080175FC:
	strb r2, [r0]
	bx lr
