	.include "macro.inc"

	.syntax unified

	thumb_func_start CanPrepScreenCheckMap
CanPrepScreenCheckMap: @ 0x0808DC48
	ldr r0, _0808DC54 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2e
	beq _0808DC58
	movs r0, #1
	b _0808DC5A
	.align 2, 0
_0808DC54: .4byte 0x0202BBF8
_0808DC58:
	movs r0, #0
_0808DC5A:
	bx lr
