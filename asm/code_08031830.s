	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitInfoWindowX
GetUnitInfoWindowX: @ 0x08031830
	adds r2, r1, #0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _0803184C @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r0, #0x77
	ble _08031850
	movs r0, #0
	b _08031854
	.align 2, 0
_0803184C: .4byte 0x0202BBB8
_08031850:
	movs r0, #0x1e
	subs r0, r0, r2
_08031854:
	bx lr
	.align 2, 0
