	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022B1C
sub_08022B1C: @ 0x08022B1C
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08022B2E
	bl HideMoveRangeGraphics
_08022B2E:
	movs r0, #0
	pop {r1}
	bx r1
