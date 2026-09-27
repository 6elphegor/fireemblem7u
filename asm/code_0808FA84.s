	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepSpecialCharEffect
StartPrepSpecialCharEffect: @ 0x0808FA84
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808FAA4 @ =0x08CC4134
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808FAA4: .4byte 0x08CC4134
