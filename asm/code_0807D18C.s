	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D18C
sub_0807D18C: @ 0x0807D18C
	push {r4, lr}
	movs r0, #0xe
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xf
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D1AC
	adds r4, #1
_0807D1AC:
	movs r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D1BE
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0807D1BE:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
