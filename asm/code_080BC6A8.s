	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC6A8
sub_080BC6A8: @ 0x080BC6A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #3
	bl __modsi3
	cmp r0, #1
	beq _080BC6E0
	cmp r0, #1
	bgt _080BC6C2
	cmp r0, #0
	beq _080BC6C8
	b _080BC71C
_080BC6C2:
	cmp r0, #2
	beq _080BC6F8
	b _080BC71C
_080BC6C8:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r2, _080BC6DC @ =0x0600C000
	adds r1, r1, r2
	bl Decompress
	b _080BC71C
	.align 2, 0
_080BC6DC: .4byte 0x0600C000
_080BC6E0:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0, #4]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r3, _080BC6F4 @ =0x0600D000
	adds r1, r1, r3
	bl Decompress
	b _080BC71C
	.align 2, 0
_080BC6F4: .4byte 0x0600D000
_080BC6F8:
	ldr r0, _080BC780 @ =0x02024460
	ldr r1, [r4, #0x3c]
	ldr r1, [r1, #8]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #0x18
	movs r3, #0xf2
	lsls r3, r3, #0x18
	adds r2, r2, r3
	lsrs r2, r2, #0x10
	bl PutCompressedTsa
	ldr r1, [r4, #0x30]
	movs r0, #1
	subs r0, r0, r1
	str r0, [r4, #0x30]
	movs r0, #8
	bl EnableBgSync
_080BC71C:
	ldr r0, [r4, #0x2c]
	adds r5, r0, #1
	str r5, [r4, #0x2c]
	lsls r0, r5, #4
	ldr r6, [r4, #0x34]
	lsls r1, r6, #1
	adds r1, r1, r6
	bl __divsi3
	adds r7, r0, #0
	ldr r3, _080BC784 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r7
	lsls r2, r0, #1
	cmp r2, #0x10
	ble _080BC74E
	movs r2, #0x10
_080BC74E:
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _080BC788
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r4, #0x3c]
	adds r1, #0xc
	str r1, [r4, #0x3c]
	cmp r0, r6
	bne _080BC788
	movs r0, #1
	b _080BC78A
	.align 2, 0
_080BC780: .4byte 0x02024460
_080BC784: .4byte 0x03002870
_080BC788:
	movs r0, #0
_080BC78A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
