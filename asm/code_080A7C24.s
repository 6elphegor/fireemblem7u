	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7C24
sub_080A7C24: @ 0x080A7C24
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080A7C48 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7C42
	adds r1, r0, #0
	adds r1, #0x4d
	strb r4, [r1]
	adds r0, #0x4e
	strb r5, [r0]
_080A7C42:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C48: .4byte 0x08CE48F0
