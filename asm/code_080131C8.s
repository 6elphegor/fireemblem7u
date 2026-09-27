	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080131C8
sub_080131C8: @ 0x080131C8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5]
	adds r0, r4, #0
	bl Decompress
	adds r0, r4, #0
	bl GetDataSize
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	ldr r1, [r5, #4]
	cmp r0, #0
	bge _080131EA
	adds r0, #0x1f
_080131EA:
	asrs r0, r0, #5
	adds r0, r1, r0
	str r0, [r5, #4]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
