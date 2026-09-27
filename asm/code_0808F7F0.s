	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F7F0
sub_0808F7F0: @ 0x0808F7F0
	push {lr}
	ldr r0, _0808F804 @ =0x08CC3BDC
	bl Proc_Find
	cmp r0, #0
	beq _0808F7FE
	movs r0, #1
_0808F7FE:
	pop {r1}
	bx r1
	.align 2, 0
_0808F804: .4byte 0x08CC3BDC
