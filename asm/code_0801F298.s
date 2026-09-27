	.include "macro.inc"

	.syntax unified

	thumb_func_start NewPopup2_DropItem
NewPopup2_DropItem: @ 0x0801F298
	push {lr}
	ldr r2, _0801F2A8 @ =0x0000075E
	ldr r3, _0801F2AC @ =0x000012B2
	bl NewPopup2_PlanD
	pop {r0}
	bx r0
	.align 2, 0
_0801F2A8: .4byte 0x0000075E
_0801F2AC: .4byte 0x000012B2
