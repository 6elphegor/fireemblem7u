	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080215B0
sub_080215B0: @ 0x080215B0
	push {lr}
	ldr r0, _080215C0 @ =0x08CE5BF0
	movs r1, #3
	bl Proc_Start
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215C0: .4byte 0x08CE5BF0
