	.include "macro.inc"

	.syntax unified

	thumb_func_start StringCopy
StringCopy: @ 0x080130DC
	adds r3, r0, #0
	b _080130E6
_080130E0:
	strb r2, [r3]
	adds r1, #1
	adds r3, #1
_080130E6:
	ldrb r2, [r1]
	cmp r2, #0
	bne _080130E0
	ldrb r0, [r1]
	strb r0, [r3]
	bx lr
	.align 2, 0
