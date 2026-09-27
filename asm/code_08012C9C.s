	.include "macro.inc"

	.syntax unified

	thumb_func_start DecodeMsgInBuffer
DecodeMsgInBuffer: @ 0x08012C9C
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08012CB8 @ =0x08B808AC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	bl DecodeStringRam
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08012CB8: .4byte 0x08B808AC
