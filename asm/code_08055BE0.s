	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055BE0
sub_08055BE0: @ 0x08055BE0
	ldr r0, _08055BFC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055BFA
	ldr r3, _08055C00 @ =0x04000014
	ldr r2, _08055C04 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055BFA:
	bx lr
	.align 2, 0
_08055BFC: .4byte 0x04000004
_08055C00: .4byte 0x04000014
_08055C04: .4byte 0x0201FDB4
