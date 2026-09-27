	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D28C
sub_0805D28C: @ 0x0805D28C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805D2B4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D2B8 @ =0x08BA30E8
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0805D2C0
	ldr r0, _0805D2BC @ =0x081E8D0A
	b _0805D2CE
	.align 2, 0
_0805D2B4: .4byte 0x0201774C
_0805D2B8: .4byte 0x08BA30E8
_0805D2BC: .4byte 0x081E8D0A
_0805D2C0:
	cmp r5, #1
	bne _0805D2CC
	ldr r0, _0805D2C8 @ =0x081E8D4C
	b _0805D2CE
	.align 2, 0
_0805D2C8: .4byte 0x081E8D4C
_0805D2CC:
	ldr r0, _0805D2D8 @ =0x081E8D7E
_0805D2CE:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805D2E0
	ldr r0, _0805D2DC @ =0x0826A7E8
	b _0805D2EE
	.align 2, 0
_0805D2D8: .4byte 0x081E8D7E
_0805D2DC: .4byte 0x0826A7E8
_0805D2E0:
	cmp r5, #1
	bne _0805D2EC
	ldr r0, _0805D2E8 @ =0x0826C934
	b _0805D2EE
	.align 2, 0
_0805D2E8: .4byte 0x0826C934
_0805D2EC:
	ldr r0, _0805D2F8 @ =0x0826C714
_0805D2EE:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2F8: .4byte 0x0826C714
