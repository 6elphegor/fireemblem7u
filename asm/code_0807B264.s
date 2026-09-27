	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B264
sub_0807B264: @ 0x0807B264
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807B274 @ =0x08CA762C
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807B274: .4byte 0x08CA762C
