	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08085CDC
sub_08085CDC: @ 0x08085CDC
	ldr r0, _08085CF4 @ =0x0202BBB8
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x40
	bgt _08085CF8
	movs r0, #0
	b _08085CFA
	.align 2, 0
_08085CF4: .4byte 0x0202BBB8
_08085CF8:
	movs r0, #1
_08085CFA:
	bx lr
