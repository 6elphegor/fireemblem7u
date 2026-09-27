	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemEncodedRange
GetItemEncodedRange: @ 0x080173A0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173B4 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	bx lr
	.align 2, 0
_080173B4: .4byte 0x08BE222C
