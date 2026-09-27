	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012EFC
sub_08012EFC: @ 0x08012EFC
	b _08012F04
_08012EFE:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
_08012F04:
	ldrb r2, [r0]
	cmp r2, #0
	bne _08012EFE
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	bx lr
	.align 2, 0
