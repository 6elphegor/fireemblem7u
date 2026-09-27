	.include "macro.inc"

	.syntax unified

	thumb_func_start SioReleaseIrq
SioReleaseIrq: @ 0x0803C4F8
	push {lr}
	ldr r1, _0803C53C @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0803C540 @ =0x030046B8
	ldr r1, _0803C544 @ =0x030046B4
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0803C548 @ =0x03004748
	str r0, [r1]
	ldr r1, _0803C54C @ =0x030013CC
	subs r0, #1
	str r0, [r1]
	movs r0, #7
	movs r1, #0
	bl SetIrqFunc
	movs r0, #6
	movs r1, #0
	bl SetIrqFunc
	ldr r2, _0803C550 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0803C554 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0803C53C: .4byte 0x04000134
_0803C540: .4byte 0x030046B8
_0803C544: .4byte 0x030046B4
_0803C548: .4byte 0x03004748
_0803C54C: .4byte 0x030013CC
_0803C550: .4byte 0x04000200
_0803C554: .4byte 0x0000FF3F
