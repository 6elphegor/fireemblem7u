	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7BDC
sub_080A7BDC: @ 0x080A7BDC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080A7C00 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7BF0
	str r5, [r0, #0x34]
	str r4, [r0, #0x38]
_080A7BF0:
	ldr r1, _080A7C04 @ =0x02000000
	adds r0, r4, #0
	subs r0, #0x3c
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C00: .4byte 0x08CE48F0
_080A7C04: .4byte 0x02000000
