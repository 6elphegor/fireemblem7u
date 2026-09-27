	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809945C
sub_0809945C: @ 0x0809945C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099470 @ =0x08CC5114
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099470: .4byte 0x08CC5114
