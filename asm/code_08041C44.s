	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041C44
sub_08041C44: @ 0x08041C44
	cmp r0, #6
	ble _08041C4C
	movs r0, #5
	b _08041C58
_08041C4C:
	subs r0, #2
	cmp r0, #0
	bge _08041C54
	movs r0, #0
_08041C54:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08041C58:
	bx lr
	.align 2, 0
