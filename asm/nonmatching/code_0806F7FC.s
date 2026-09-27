	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806F7FC
sub_0806F7FC: @ 0x0806F7FC
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _0806F844 @ =0x083F4068
	movs r0, #1
	bl GetBgChrOffset
	ldr r2, _0806F848 @ =0x06000020
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _0806F84C @ =0x083F9F74
	adds r0, r1, #0
	bl UnpackManimWindowGraphics
	ldr r1, _0806F850 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806F854
	cmp r0, #2
	beq _0806F862
	b _0806F8C8
	.align 2, 0
_0806F844: .4byte 0x083F4068
_0806F848: .4byte 0x06000020
_0806F84C: .4byte 0x083F9F74
_0806F850: .4byte 0x0203E0FC
_0806F854:
	movs r2, #5
	rsbs r2, r2, #0
	ldr r0, [r7]
	movs r1, #0
	bl sub_0806FBA4
	b _0806F8C8
_0806F862:
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806F884 @ =0x0203E0FC
	ldr r0, [r1]
	ldr r1, _0806F884 @ =0x0203E0FC
	ldr r2, [r1, #0x14]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r0, r1
	ble _0806F888
	movs r0, #1
	str r0, [r7, #4]
	b _0806F8A8
	.align 2, 0
_0806F884: .4byte 0x0203E0FC
_0806F888:
	ldr r0, _0806F8C4 @ =0x0203E0FC
	ldr r1, [r0]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, _0806F8C4 @ =0x0203E0FC
	ldr r2, [r1, #0x14]
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r2, #0xc0
	ands r1, r2
	cmp r0, r1
	ble _0806F8A8
	movs r0, #1
	str r0, [r7, #4]
_0806F8A8:
	ldr r1, [r7, #4]
	movs r2, #0xa
	rsbs r2, r2, #0
	ldr r0, [r7]
	bl sub_0806FBA4
	movs r0, #1
	ldr r2, [r7, #4]
	subs r1, r0, r2
	ldr r0, [r7]
	movs r2, #0
	bl sub_0806FBA4
	b _0806F8C8
	.align 2, 0
_0806F8C4: .4byte 0x0203E0FC
_0806F8C8:
	bl InitScanlineEffect
	ldr r0, _0806F908 @ =0x0203E0FC
	ldrb r1, [r0, #0x11]
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, _0806F908 @ =0x0203E0FC
	ldrb r2, [r1, #0x11]
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #0x20
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r3, _0806F90C @ =0x02022860
	ldrh r2, [r3, #0x22]
	ldr r4, _0806F90C @ =0x02022860
	adds r3, r4, #0
	adds r4, #0x42
	ldrh r3, [r4]
	bl StartManimFrameGradientScanlineEffect2
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F908: .4byte 0x0203E0FC
_0806F90C: .4byte 0x02022860
