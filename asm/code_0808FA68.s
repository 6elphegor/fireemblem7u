	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepSpecialChar_BlinkButtonStart
PrepSpecialChar_BlinkButtonStart: @ 0x0808FA68
	push {lr}
	ldr r0, _0808FA80 @ =0x08CC4134
	bl Proc_Find
	cmp r0, #0
	beq _0808FA7C
	adds r1, r0, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
_0808FA7C:
	pop {r0}
	bx r0
	.align 2, 0
_0808FA80: .4byte 0x08CC4134
