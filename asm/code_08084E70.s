	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084E70
sub_08084E70: @ 0x08084E70
	ldr r0, _08084E88 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x6f
	ble _08084E8C
	movs r0, #1
	rsbs r0, r0, #0
	b _08084E8E
	.align 2, 0
_08084E88: .4byte 0x0202BBB8
_08084E8C:
	movs r0, #1
_08084E8E:
	bx lr
