	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMuralBackground
EndMuralBackground: @ 0x0807FA04
	push {lr}
	ldr r0, _0807FA10 @ =0x08CC1C5C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807FA10: .4byte 0x08CC1C5C
