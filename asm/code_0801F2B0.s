	.include "macro.inc"

	.syntax unified

	thumb_func_start NewPopup2_SendItem
NewPopup2_SendItem: @ 0x0801F2B0
	push {lr}
	ldr r2, _0801F2C0 @ =0x0000075F
	movs r3, #0xec
	lsls r3, r3, #3
	bl NewPopup2_PlanD
	pop {r0}
	bx r0
	.align 2, 0
_0801F2C0: .4byte 0x0000075F
