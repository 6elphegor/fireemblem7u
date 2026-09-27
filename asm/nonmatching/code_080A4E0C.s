	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4E0C
sub_080A4E0C: @ 0x080A4E0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4E1C @ =0x08CE3F24
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A4E1C: .4byte 0x08CE3F24
