	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenuHandSTAL
TradeMenuHandSTAL: @ 0x0802B828
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B84C @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #3
	beq _0802B846
	cmp r0, #5
	beq _0802B846
	cmp r0, #8
	beq _0802B846
	ldr r0, _0802B850 @ =0x08B94400
	bl Proc_StartBlocking
_0802B846:
	pop {r0}
	bx r0
	.align 2, 0
_0802B84C: .4byte 0x0203A514
_0802B850: .4byte 0x08B94400
