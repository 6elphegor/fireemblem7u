	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F7C4
sub_0808F7C4: @ 0x0808F7C4
	push {lr}
	ldr r0, _0808F7D4 @ =0x08CC3E2C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808F7D4: .4byte 0x08CC3E2C
