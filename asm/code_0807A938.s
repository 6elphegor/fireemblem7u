	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A938
sub_0807A938: @ 0x0807A938
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807A956
	bl LockBmDisplay
	bl LockMus
	movs r0, #0
	strb r0, [r4]
_0807A956:
	pop {r4}
	pop {r0}
	bx r0
