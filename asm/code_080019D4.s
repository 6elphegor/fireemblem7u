	.include "macro.inc"

	.syntax unified

	thumb_func_start RunMainFunc
RunMainFunc: @ 0x080019D4
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080019F0 @ =0x02024C70
	ldr r1, [r0]
	cmp r1, #0
	beq _080019E8
	ldr r0, _080019F0 @ =0x02024C70
	ldr r4, [r0]
	bl _call_via_r4
_080019E8:
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019F0: .4byte 0x02024C70
