	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809ACFC
sub_0809ACFC: @ 0x0809ACFC
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
