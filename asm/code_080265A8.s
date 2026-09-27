	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSpriteHideFlag
GetUnitSpriteHideFlag: @ 0x080265A8
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _080265BC
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080265BE
_080265BC:
	movs r0, #0x80
_080265BE:
	bx lr
