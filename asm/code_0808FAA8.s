	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPrepSpecialCharEffect
EndPrepSpecialCharEffect: @ 0x0808FAA8
	push {lr}
	ldr r0, _0808FAB8 @ =0x08CC4134
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0808FAB8: .4byte 0x08CC4134
