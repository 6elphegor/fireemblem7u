	.include "macro.inc"

	.syntax unified

	thumb_func_start NewTargetSelection_Specialized
NewTargetSelection_Specialized: @ 0x0804AEF0
	push {r4, lr}
	adds r4, r1, #0
	bl StartMapSelect
	str r4, [r0, #0x38]
	pop {r4}
	pop {r1}
	bx r1
