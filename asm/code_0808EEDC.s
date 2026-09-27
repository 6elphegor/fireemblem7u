	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepAtMenuWithConfig
StartPrepAtMenuWithConfig: @ 0x0808EEDC
	push {lr}
	ldr r0, _0808EEF4 @ =0x08CC3BDC
	movs r1, #3
	bl Proc_Start
	bl RemoveSomeUnitItems
	bl ResetSioPidPool
	pop {r0}
	bx r0
	.align 2, 0
_0808EEF4: .4byte 0x08CC3BDC
