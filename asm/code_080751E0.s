	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080751E0
sub_080751E0: @ 0x080751E0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080751F4 @ =0x08C9DF44
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080751F4: .4byte 0x08C9DF44
