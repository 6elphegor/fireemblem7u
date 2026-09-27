	.include "macro.inc"

	.syntax unified

	thumb_func_start CountDigits
CountDigits: @ 0x080AAD00
	push {r4, lr}
	movs r4, #0
_080AAD04:
	adds r4, #1
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	bne _080AAD04
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
