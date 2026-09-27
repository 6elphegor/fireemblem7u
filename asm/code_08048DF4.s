	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048DF4
sub_08048DF4: @ 0x08048DF4
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, #0
	beq _08048E0A
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_08048E0A:
	bx lr
