	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D4EC
sub_0807D4EC: @ 0x0807D4EC
	push {r4, lr}
	movs r0, #9
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D50C
	adds r4, #1
_0807D50C:
	movs r0, #0xb
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D51A
	adds r4, #1
_0807D51A:
	movs r0, #0
	cmp r4, #1
	bgt _0807D522
	movs r0, #1
_0807D522:
	pop {r4}
	pop {r1}
	bx r1
