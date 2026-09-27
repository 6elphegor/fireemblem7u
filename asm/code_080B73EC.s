	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B73EC
sub_080B73EC: @ 0x080B73EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B7404 @ =0x08CEDE5C
	bl Proc_Start
	str r4, [r0, #0x38]
	strh r5, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7404: .4byte 0x08CEDE5C
