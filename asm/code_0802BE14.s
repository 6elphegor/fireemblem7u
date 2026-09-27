	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitHideIfUnderRoof
UnitHideIfUnderRoof: @ 0x0802BE14
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802BE3C @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0802BE38
	ldr r0, [r2, #0xc]
	movs r1, #0x81
	orrs r0, r1
	str r0, [r2, #0xc]
_0802BE38:
	bx lr
	.align 2, 0
_0802BE3C: .4byte 0x0202E3E0
