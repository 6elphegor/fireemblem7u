	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADB7C
sub_080ADB7C: @ 0x080ADB7C
	push {lr}
	ldr r0, _080ADB88 @ =0x08CE58BE
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
_080ADB88: .4byte 0x08CE58BE
