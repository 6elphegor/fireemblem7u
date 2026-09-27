	.include "macro.inc"

	.syntax unified

	thumb_func_start PointInCameraBounds
PointInCameraBounds: @ 0x0803020C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08030244 @ =0x0202BBB8
	movs r6, #0xe
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble _08030248
	cmp r1, #0x9f
	bgt _08030248
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmn r0, r5
	ble _08030248
	cmp r0, #0xef
	bgt _08030248
	movs r0, #1
	b _0803024A
	.align 2, 0
_08030244: .4byte 0x0202BBB8
_08030248:
	movs r0, #0
_0803024A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
