	.include "macro.inc"

	.syntax unified

	thumb_func_start ShowUnitSprite
ShowUnitSprite: @ 0x08026598
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _080265A6
	movs r0, #0x7f
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
_080265A6:
	bx lr
