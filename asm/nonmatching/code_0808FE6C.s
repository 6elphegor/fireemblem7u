	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPrepScreenMenuOnBPress
SetPrepScreenMenuOnBPress: @ 0x0808FE6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808FE84 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FE7C
	str r4, [r0, #0x58]
_0808FE7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FE84: .4byte 0x08CC416C
