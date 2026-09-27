	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A3080
sub_080A3080: @ 0x080A3080
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r1, _080A3140 @ =0x0202BBB8
	movs r0, #0xc
	ldrsh r4, [r1, r0]
	movs r2, #0xe
	ldrsh r5, [r1, r2]
	movs r2, #0xf
	adds r0, r4, #0
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	bne _080A310A
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _080A310A
	str r0, [r3, #0x2c]
	str r0, [r3, #0x30]
	ldr r2, _080A3144 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080A30C2
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r3, #0x2c]
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A30C2:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r2, [r1, #4]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _080A30DC
	movs r0, #8
	str r0, [r3, #0x2c]
	adds r2, r3, #0
	adds r2, #0x4a
	movs r0, #1
	strh r0, [r2]
_080A30DC:
	movs r0, #0x40
	ldrh r6, [r6, #4]
	ands r0, r6
	cmp r0, #0
	beq _080A30F4
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r3, #0x30]
	adds r2, r3, #0
	adds r2, #0x4a
	movs r0, #1
	strh r0, [r2]
_080A30F4:
	movs r0, #0x80
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080A310A
	movs r0, #8
	str r0, [r3, #0x30]
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A310A:
	ldr r0, [r3, #0x2c]
	adds r4, r4, r0
	ldr r0, [r3, #0x30]
	adds r5, r5, r0
	cmp r4, #0
	bge _080A3118
	movs r4, #0
_080A3118:
	adds r1, r7, #0
	movs r2, #0x28
	ldrsh r0, [r1, r2]
	cmp r4, r0
	ble _080A3124
	adds r4, r0, #0
_080A3124:
	cmp r5, #0
	bge _080A312A
	movs r5, #0
_080A312A:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	cmp r5, r0
	ble _080A3134
	adds r5, r0, #0
_080A3134:
	strh r4, [r7, #0xc]
	strh r5, [r7, #0xe]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3140: .4byte 0x0202BBB8
_080A3144: .4byte 0x08B857F8
