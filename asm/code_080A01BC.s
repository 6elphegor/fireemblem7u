	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A01BC
sub_080A01BC: @ 0x080A01BC
	movs r3, #0
	ldr r2, _080A01D8 @ =0x0203E7A0
	movs r1, #0x45
_080A01C2:
	ldr r0, [r2, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A01C2
	adds r0, r3, #0
	bx lr
	.align 2, 0
_080A01D8: .4byte 0x0203E7A0
