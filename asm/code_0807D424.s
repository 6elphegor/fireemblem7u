	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D424
sub_0807D424: @ 0x0807D424
	push {lr}
	movs r0, #7
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D442
	movs r0, #0xd
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D442
	movs r0, #1
	b _0807D444
_0807D442:
	movs r0, #0
_0807D444:
	pop {r1}
	bx r1
