	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08092C34
sub_08092C34: @ 0x08092C34
	cmp r0, #0x60
	bhi _08092C40
	cmp r1, #0x1f
	ble _08092C40
	movs r0, #1
	b _08092C42
_08092C40:
	movs r0, #0
_08092C42:
	bx lr
