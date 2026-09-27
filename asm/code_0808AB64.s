	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitListScreenForSoloAnim
StartUnitListScreenForSoloAnim: @ 0x0808AB64
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808AB7C
	ldr r0, _0808AB78 @ =0x08CC336C
	movs r1, #3
	bl Proc_Start
	b _0808AB82
	.align 2, 0
_0808AB78: .4byte 0x08CC336C
_0808AB7C:
	ldr r0, _0808AB90 @ =0x08CC336C
	bl Proc_StartBlocking
_0808AB82:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808AB90: .4byte 0x08CC336C
