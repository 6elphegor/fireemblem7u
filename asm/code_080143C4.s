	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080143C4
sub_080143C4: @ 0x080143C4
	push {lr}
	ldr r0, _080143DC @ =0x08B929AC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080143D6
	movs r0, #0
	str r0, [r1, #0x4c]
_080143D6:
	pop {r0}
	bx r0
	.align 2, 0
_080143DC: .4byte 0x08B929AC
