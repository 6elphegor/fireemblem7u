	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseAntitoxinItem
CanUnitUseAntitoxinItem: @ 0x08027340
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	bne _08027350
	movs r0, #1
	b _08027352
_08027350:
	movs r0, #0
_08027352:
	bx lr
