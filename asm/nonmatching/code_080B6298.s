	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6298
sub_080B6298: @ 0x080B6298
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B62C0 @ =0x08CE7818
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #5
	ands r3, r2
	adds r1, r1, r3
	lsls r1, r1, #5
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B62C0: .4byte 0x08CE7818
