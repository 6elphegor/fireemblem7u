	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805FC2C
sub_0805FC2C: @ 0x0805FC2C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r3, #0x32
	ldrh r1, [r4, #0x30]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r6, #0
	strh r0, [r4, #0x30]
	lsrs r0, r0, #8
	ldr r2, _0805FCA4 @ =0x080C5A48
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r1, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r3, r0
	asrs r1, r1, #0xc
	ldrh r2, [r4, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0xc
	ldrh r2, [r4, #0x3a]
	adds r0, r2, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0805FC7C
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
_0805FC7C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0805FC9C
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _0805FCA8 @ =0x08BD2A04
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_0805FC9C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FCA4: .4byte 0x080C5A48
_0805FCA8: .4byte 0x08BD2A04
