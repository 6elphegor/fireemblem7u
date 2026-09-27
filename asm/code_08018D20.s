	.include "macro.inc"

	.syntax unified

	thumb_func_start GetClassData
GetClassData: @ 0x08018D20
	adds r1, r0, #0
	cmp r1, #0
	ble _08018D34
	movs r0, #0x54
	muls r0, r1, r0
	ldr r1, _08018D30 @ =0x08BE015C
	adds r0, r0, r1
	b _08018D36
	.align 2, 0
_08018D30: .4byte 0x08BE015C
_08018D34:
	movs r0, #0
_08018D36:
	bx lr
