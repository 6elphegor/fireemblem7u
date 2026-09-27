	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemCrit
GetItemCrit: @ 0x08017328
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801733C @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0801733C: .4byte 0x08BE222C
