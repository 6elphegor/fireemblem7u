	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080781B4
sub_080781B4: @ 0x080781B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080781CA
	movs r0, #0
	b _080781D6
_080781CA:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_080781D6:
	pop {r4}
	pop {r1}
	bx r1
