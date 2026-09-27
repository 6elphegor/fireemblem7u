	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBanimHensei
CheckBanimHensei: @ 0x0806B78C
	ldr r1, _0806B7A0 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0806B7A4
	movs r0, #0
	b _0806B7A6
	.align 2, 0
_0806B7A0: .4byte 0x0203A3D8
_0806B7A4:
	movs r0, #1
_0806B7A6:
	bx lr
