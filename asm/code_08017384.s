	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemMaxRange
GetItemMaxRange: @ 0x08017384
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801739C @ =0x08BE222C
	adds r1, r1, r0
	movs r0, #0xf
	ldrb r1, [r1, #0x19]
	ands r0, r1
	bx lr
	.align 2, 0
_0801739C: .4byte 0x08BE222C
