	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0294
sub_080B0294: @ 0x080B0294
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B02A4 @ =0x08CE6030
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B02A4: .4byte 0x08CE6030
