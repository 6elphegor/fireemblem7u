	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7BB4
sub_080A7BB4: @ 0x080A7BB4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080A7BD8 @ =0x08CE48F0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A7BD2
	str r5, [r4, #0x40]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, #0
	bl __divsi3
	str r0, [r4, #0x44]
_080A7BD2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BD8: .4byte 0x08CE48F0
