	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084E90
sub_08084E90: @ 0x08084E90
	ldr r0, _08084EA8 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x70
	bgt _08084EAC
	movs r0, #1
	b _08084EB0
	.align 2, 0
_08084EA8: .4byte 0x0202BBB8
_08084EAC:
	movs r0, #1
	rsbs r0, r0, #0
_08084EB0:
	bx lr
	.align 2, 0
