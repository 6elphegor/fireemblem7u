	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021CDC
sub_08021CDC: @ 0x08021CDC
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08021CEE
	bl HideMoveRangeGraphics
_08021CEE:
	movs r0, #0
	pop {r1}
	bx r1
