	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF344
sub_080AF344: @ 0x080AF344
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080AF35C @ =0x08CE5EC0
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AF35C: .4byte 0x08CE5EC0
