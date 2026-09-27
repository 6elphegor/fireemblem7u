	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079BE0
sub_08079BE0: @ 0x08079BE0
	ldr r0, _08079BF4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08079BF8
	movs r0, #1
	b _08079BFA
	.align 2, 0
_08079BF4: .4byte 0x08B857F8
_08079BF8:
	movs r0, #0
_08079BFA:
	bx lr
