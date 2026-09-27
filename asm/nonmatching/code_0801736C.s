	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemMinRange
GetItemMinRange: @ 0x0801736C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017380 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #0x19]
	lsrs r0, r1, #4
	bx lr
	.align 2, 0
_08017380: .4byte 0x08BE222C
