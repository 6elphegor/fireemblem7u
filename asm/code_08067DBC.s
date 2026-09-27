	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxCheckRetaliation
EfxCheckRetaliation: @ 0x08067DBC
	ldr r2, _08067DD4 @ =0x0203A4F0
	movs r1, #8
	ldrb r2, [r2, #2]
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	rsbs r1, r1, #0
	lsrs r1, r1, #0x1f
	cmp r0, r1
	beq _08067DD8
	movs r0, #0
	b _08067DDA
	.align 2, 0
_08067DD4: .4byte 0x0203A4F0
_08067DD8:
	movs r0, #1
_08067DDA:
	bx lr
