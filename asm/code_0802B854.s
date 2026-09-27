	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B854
sub_0802B854: @ 0x0802B854
	push {lr}
	adds r1, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802B866
	ldr r0, _0802B86C @ =0x08B94418
	bl StartEventInternal
_0802B866:
	pop {r0}
	bx r0
	.align 2, 0
_0802B86C: .4byte 0x08B94418
