	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC78C
sub_080AC78C: @ 0x080AC78C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AC79C @ =0x08CE56E4
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080AC79C: .4byte 0x08CE56E4
