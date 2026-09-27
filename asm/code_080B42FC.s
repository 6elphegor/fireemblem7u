	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B42FC
sub_080B42FC: @ 0x080B42FC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B430C @ =0x08CE7688
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B430C: .4byte 0x08CE7688
