	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B76F8
sub_080B76F8: @ 0x080B76F8
	push {lr}
	ldr r0, _080B7708 @ =0x08CEDEA4
	bl Proc_Find
	cmp r0, #0
	bne _080B770C
	movs r0, #0
	b _080B770E
	.align 2, 0
_080B7708: .4byte 0x08CEDEA4
_080B770C:
	movs r0, #1
_080B770E:
	pop {r1}
	bx r1
	.align 2, 0
