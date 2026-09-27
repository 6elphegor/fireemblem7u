	.include "macro.inc"

	.syntax unified

	thumb_func_start AppendCharacter
AppendCharacter: @ 0x080AAA9C
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	bx lr
