	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitListScreenUnk
StartUnitListScreenUnk: @ 0x0808AB94
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808ABAC
	ldr r0, _0808ABA8 @ =0x08CC32A4
	movs r1, #3
	bl Proc_Start
	b _0808ABB2
	.align 2, 0
_0808ABA8: .4byte 0x08CC32A4
_0808ABAC:
	ldr r0, _0808ABC0 @ =0x08CC32A4
	bl Proc_StartBlocking
_0808ABB2:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808ABC0: .4byte 0x08CC32A4
