	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7A0C
sub_080B7A0C: @ 0x080B7A0C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x44
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x46
	strh r2, [r0]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
