	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08009EE0
sub_08009EE0: @ 0x08009EE0
	ldr r0, _08009EFC @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	ldrb r2, [r1, #0x11]
	cmp r0, r2
	bne _08009F00
	ldrb r0, [r1, #0x10]
	ldrb r2, [r1, #0xe]
	cmp r0, r2
	bne _08009F00
	movs r0, #1
	b _08009F02
	.align 2, 0
_08009EFC: .4byte 0x08B909B8
_08009F00:
	movs r0, #0
_08009F02:
	bx lr
