	.include "macro.inc"

	.syntax unified

	thumb_func_start SramInit
SramInit: @ 0x0809E404
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _0809E45C @ =0x12345678
	str r0, [sp]
	ldr r0, _0809E460 @ =0x87654321
	str r0, [sp, #4]
	bl SetSramFastFunc
	ldr r2, _0809E464 @ =0x04000200
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r5, _0809E468 @ =0x08CE3B58
	ldr r1, [r5]
	ldr r4, _0809E46C @ =0x000073B8
	adds r1, r1, r4
	mov r0, sp
	movs r2, #4
	bl WriteSramFast
	ldr r2, _0809E470 @ =0x03005E70
	ldr r0, [r5]
	adds r0, r0, r4
	add r1, sp, #4
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	ldr r3, _0809E474 @ =0x0203E79A
	movs r2, #0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bne _0809E450
	movs r2, #1
_0809E450:
	strb r2, [r3]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E45C: .4byte 0x12345678
_0809E460: .4byte 0x87654321
_0809E464: .4byte 0x04000200
_0809E468: .4byte 0x08CE3B58
_0809E46C: .4byte 0x000073B8
_0809E470: .4byte 0x03005E70
_0809E474: .4byte 0x0203E79A
