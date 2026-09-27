	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805FB94
sub_0805FB94: @ 0x0805FB94
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r7, #0x14
	str r7, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x32
	bl Interpolate
	ldrh r2, [r4, #0x30]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r6, #0
	strh r1, [r4, #0x30]
	lsrs r2, r1, #8
	ldr r3, _0805FC24 @ =0x080C5A48
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r4, #0x3a]
	adds r0, r3, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0805FBFC
	strh r7, [r4, #0x2c]
_0805FBFC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0805FC1C
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _0805FC28 @ =0x08BD2C2C
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_0805FC1C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FC24: .4byte 0x080C5A48
_0805FC28: .4byte 0x08BD2C2C
