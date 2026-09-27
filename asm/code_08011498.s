	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011498
sub_08011498: @ 0x08011498
	push {lr}
	ldr r0, _080114A8 @ =0x08B92140
	bl Proc_Find
	cmp r0, #0
	bne _080114AC
	movs r0, #0
	b _080114AE
	.align 2, 0
_080114A8: .4byte 0x08B92140
_080114AC:
	movs r0, #1
_080114AE:
	pop {r1}
	bx r1
	.align 2, 0
