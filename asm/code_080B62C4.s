	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B62C4
sub_080B62C4: @ 0x080B62C4
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B62F0 @ =0x08CE7848
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r4, #0x1f
	adds r2, r4, #0
	bics r2, r1
	lsls r2, r2, #6
	adds r2, #2
	adds r0, r0, r2
	ands r3, r4
	lsls r3, r3, #1
	adds r0, r0, r3
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B62F0: .4byte 0x08CE7848
