	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitListScreenField
StartUnitListScreenField: @ 0x0808AAF4
	push {lr}
	ldr r0, _0808AB08 @ =0x08CC3194
	movs r1, #3
	bl Proc_Start
	adds r0, #0x39
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0808AB08: .4byte 0x08CC3194
