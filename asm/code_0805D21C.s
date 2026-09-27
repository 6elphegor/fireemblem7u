	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D21C
sub_0805D21C: @ 0x0805D21C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805D244 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D248 @ =0x08BA30E8
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0805D250
	ldr r0, _0805D24C @ =0x081E8CC8
	b _0805D25E
	.align 2, 0
_0805D244: .4byte 0x0201774C
_0805D248: .4byte 0x08BA30E8
_0805D24C: .4byte 0x081E8CC8
_0805D250:
	cmp r5, #1
	bne _0805D25C
	ldr r0, _0805D258 @ =0x081E8D4C
	b _0805D25E
	.align 2, 0
_0805D258: .4byte 0x081E8D4C
_0805D25C:
	ldr r0, _0805D268 @ =0x081E8D7E
_0805D25E:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805D270
	ldr r0, _0805D26C @ =0x0826A7E8
	b _0805D27E
	.align 2, 0
_0805D268: .4byte 0x081E8D7E
_0805D26C: .4byte 0x0826A7E8
_0805D270:
	cmp r5, #1
	bne _0805D27C
	ldr r0, _0805D278 @ =0x0826C934
	b _0805D27E
	.align 2, 0
_0805D278: .4byte 0x0826C934
_0805D27C:
	ldr r0, _0805D288 @ =0x0826C714
_0805D27E:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D288: .4byte 0x0826C714
