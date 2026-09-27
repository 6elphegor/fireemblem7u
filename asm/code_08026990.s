	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAffinityBonuses
GetAffinityBonuses: @ 0x08026990
	adds r2, r0, #0
	ldr r1, _08026998 @ =0x08C9A1C0
	b _080269A8
	.align 2, 0
_08026998: .4byte 0x08C9A1C0
_0802699C:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080269A6
	adds r0, r1, #0
	b _080269AE
_080269A6:
	adds r1, #8
_080269A8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0802699C
_080269AE:
	bx lr
