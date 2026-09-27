	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPrepScreenMenuOnEnd
SetPrepScreenMenuOnEnd: @ 0x0808FEA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808FEBC @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FEB4
	str r4, [r0, #0x60]
_0808FEB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FEBC: .4byte 0x08CC416C
