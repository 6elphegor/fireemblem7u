	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPrepScreenMenuOnStartPress
SetPrepScreenMenuOnStartPress: @ 0x0808FE88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808FEA0 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FE98
	str r4, [r0, #0x5c]
_0808FE98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FEA0: .4byte 0x08CC416C
