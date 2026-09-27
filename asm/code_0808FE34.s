	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMenu_OnEnd
PrepMenu_OnEnd: @ 0x0808FE34
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _0808FE42
	ldr r0, [r0, #0x14]
	bl _call_via_r1
_0808FE42:
	pop {r0}
	bx r0
	.align 2, 0
