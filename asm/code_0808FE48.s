	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808FE48
sub_0808FE48: @ 0x0808FE48
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808FE68 @ =0x08CC416C
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FE68: .4byte 0x08CC416C
