	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepAtMenu
StartPrepAtMenu: @ 0x0808EEC8
	push {lr}
	ldr r0, _0808EED8 @ =0x08CC3BDC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808EED8: .4byte 0x08CC3BDC
