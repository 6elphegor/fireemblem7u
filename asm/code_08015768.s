	.include "macro.inc"

	.syntax unified

	thumb_func_start HandleMoveCameraWithMapCursor
HandleMoveCameraWithMapCursor: @ 0x08015768
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r2, _08015790 @ =0x0202BBB8
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r3, #0x22
	ldrsh r5, [r2, r3]
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	adds r0, #0x30
	cmp r0, r1
	ble _080157AC
	adds r0, r1, #0
	subs r0, #0x30
	cmp r0, #0
	bge _08015794
	strh r6, [r2, #0xc]
	b _080157AC
	.align 2, 0
_08015790: .4byte 0x0202BBB8
_08015794:
	movs r6, #1
	ldrh r3, [r2, #0xc]
	subs r0, r3, r4
	strh r0, [r2, #0xc]
	rsbs r0, r4, #0
	adds r3, r2, #0
	adds r3, #0x36
	strb r0, [r3]
	movs r0, #0xf
	ldrh r3, [r2, #0xc]
	ands r0, r3
	strh r0, [r2, #0x32]
_080157AC:
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	adds r0, #0xb0
	cmp r0, r1
	bge _080157DC
	subs r1, #0xb0
	movs r3, #0x28
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _080157C6
	ldrh r0, [r2, #0x28]
	strh r0, [r2, #0xc]
	b _080157DC
_080157C6:
	movs r6, #1
	ldrh r1, [r2, #0xc]
	adds r0, r1, r4
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x36
	strb r4, [r0]
	movs r0, #0xf
	ldrh r3, [r2, #0xc]
	ands r0, r3
	strh r0, [r2, #0x32]
_080157DC:
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	adds r0, #0x20
	cmp r0, r5
	ble _0801580C
	adds r0, r5, #0
	subs r0, #0x20
	cmp r0, #0
	bge _080157F4
	movs r0, #0
	strh r0, [r2, #0xe]
	b _0801580C
_080157F4:
	movs r6, #1
	ldrh r3, [r2, #0xe]
	subs r0, r3, r4
	strh r0, [r2, #0xe]
	rsbs r0, r4, #0
	adds r1, r2, #0
	adds r1, #0x37
	strb r0, [r1]
	movs r0, #0xf
	ldrh r1, [r2, #0xe]
	ands r0, r1
	strh r0, [r2, #0x34]
_0801580C:
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	adds r0, #0x70
	cmp r0, r5
	bge _0801583E
	adds r1, r5, #0
	subs r1, #0x70
	movs r3, #0x2a
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08015828
	ldrh r0, [r2, #0x2a]
	strh r0, [r2, #0xe]
	b _0801583E
_08015828:
	movs r6, #1
	ldrh r1, [r2, #0xe]
	adds r0, r1, r4
	strh r0, [r2, #0xe]
	adds r0, r2, #0
	adds r0, #0x37
	strb r4, [r0]
	movs r0, #0xf
	ldrh r3, [r2, #0xe]
	ands r0, r3
	strh r0, [r2, #0x34]
_0801583E:
	cmp r6, #0
	bne _0801588C
	adds r3, r2, #0
	ldrh r1, [r3, #0x32]
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _08015868
	adds r4, r3, #0
	adds r4, #0x36
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r3, #0x32]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrh r1, [r3, #0xc]
	adds r0, r1, r0
	strh r0, [r3, #0xc]
_08015868:
	ldrh r1, [r2, #0x34]
	movs r3, #0x34
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0801588C
	adds r3, r2, #0
	adds r3, #0x37
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrh r4, [r2, #0xe]
	adds r0, r4, r0
	strh r0, [r2, #0xe]
_0801588C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
