	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6B34
sub_080A6B34: @ 0x080A6B34
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	bl EndMuralBackground_
	adds r0, r4, #0
	bl EndAllProcChildren
	pop {r4}
	pop {r0}
	bx r0
