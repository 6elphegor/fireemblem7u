	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F7D8
sub_0808F7D8: @ 0x0808F7D8
	push {lr}
	ldr r0, _0808F7EC @ =0x08CC3E2C
	bl Proc_Find
	cmp r0, #0
	beq _0808F7E6
	movs r0, #1
_0808F7E6:
	pop {r1}
	bx r1
	.align 2, 0
_0808F7EC: .4byte 0x08CC3E2C
