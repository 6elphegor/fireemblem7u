	.include "macro.inc"

	.syntax unified

	thumb_func_start SioRegisterIrq
SioRegisterIrq: @ 0x0803C47C
	push {r4, lr}
	ldr r0, _0803C4CC @ =0x04000134
	movs r3, #0
	strh r3, [r0]
	ldr r2, _0803C4D0 @ =0x04000128
	ldr r1, _0803C4D4 @ =0x030013C8
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0803C4D8 @ =0x0400010E
	strh r3, [r0]
	ldr r2, _0803C4DC @ =0x030046B8
	ldr r1, _0803C4E0 @ =0x030046B4
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0803C4E4 @ =0x03004748
	str r0, [r1]
	ldr r1, _0803C4E8 @ =0x030013CC
	subs r0, #1
	str r0, [r1]
	ldr r1, _0803C4EC @ =sub_0803C558
	movs r0, #7
	bl SetIrqFunc
	ldr r1, _0803C4F0 @ =sub_0803C8E8
	movs r0, #6
	bl SetIrqFunc
	ldr r2, _0803C4F4 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C4CC: .4byte 0x04000134
_0803C4D0: .4byte 0x04000128
_0803C4D4: .4byte 0x030013C8
_0803C4D8: .4byte 0x0400010E
_0803C4DC: .4byte 0x030046B8
_0803C4E0: .4byte 0x030046B4
_0803C4E4: .4byte 0x03004748
_0803C4E8: .4byte 0x030013CC
_0803C4EC: .4byte sub_0803C558
_0803C4F0: .4byte sub_0803C8E8
_0803C4F4: .4byte 0x04000200
