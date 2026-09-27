	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08092ED4
sub_08092ED4: @ 0x08092ED4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x32]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _08092F00
	lsls r6, r1, #0x18
_08092EE8:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl sub_08092B6C
	adds r4, #1
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #4
	adds r0, #4
	cmp r4, r0
	blt _08092EE8
_08092F00:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
