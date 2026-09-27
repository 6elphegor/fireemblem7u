	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A3004
sub_080A3004: @ 0x080A3004
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _080A3074 @ =0x0202E3D8
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r1, r0, #2
	movs r0, #0xa0
	subs r0, r0, r1
	asrs r4, r0, #1
	cmp r1, #0x90
	ble _080A3048
	adds r4, r1, #0
	subs r4, #0x90
	ldr r1, _080A3078 @ =0x0202BBB8
	ldrh r2, [r1, #0xe]
	lsls r0, r2, #0x10
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	bl __divsi3
	muls r0, r4, r0
	cmp r0, #0
	bge _080A3042
	ldr r1, _080A307C @ =0x0000FFFF
	adds r0, r0, r1
_080A3042:
	asrs r4, r0, #0x10
	movs r0, #8
	subs r4, r0, r4
_080A3048:
	str r5, [r6, #0x3c]
	str r4, [r6, #0x40]
	rsbs r5, r5, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3074: .4byte 0x0202E3D8
_080A3078: .4byte 0x0202BBB8
_080A307C: .4byte 0x0000FFFF
