	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemAttributes
GetItemAttributes: @ 0x0801727C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017290 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08017290: .4byte 0x08BE222C
