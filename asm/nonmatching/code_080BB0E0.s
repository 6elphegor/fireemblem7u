	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB0E0
sub_080BB0E0: @ 0x080BB0E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _080BB19C @ =0x02007018
	ldr r0, [r1, #4]
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp, #8]
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [r1, #0xc]
	str r0, [sp, #0x10]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x10]
	str r0, [sp, #0x18]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x1c]
	ldr r0, [r1, #0x18]
	cmp r0, #0
	bne _080BB1AC
	movs r0, #1
	mov sb, r0
	ldr r1, _080BB1A0 @ =0x080C5A48
	mov sl, r1
	ldr r2, _080BB1A4 @ =0x00000FFF
	mov r8, r2
_080BB120:
	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8
	ldr r3, _080BB1A8 @ =0x020072B4
	ldr r5, [r3]
	add r5, sb
	movs r4, #0xff
	ands r4, r6
	lsls r0, r4, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]
	ldr r2, _080BB1A8 @ =0x020072B4
	ldr r5, [r2]
	add r5, sb
	adds r5, #0xa0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sl
	movs r3, #0
	ldrsh r0, [r4, r3]
	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x9f
	ble _080BB120
	b _080BB27E
	.align 2, 0
_080BB19C: .4byte 0x02007018
_080BB1A0: .4byte 0x080C5A48
_080BB1A4: .4byte 0x00000FFF
_080BB1A8: .4byte 0x020072B4
_080BB1AC:
	adds r2, r0, #0
	muls r2, r0, r2
	mov sl, r2
	movs r3, #9
	mov sb, r3
_080BB1B6:
	ldr r1, _080BB29C @ =0x02007018
	ldr r0, [r1, #0x14]
	mov r2, sb
	subs r0, r0, r2
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	mov r1, sl
	subs r0, r1, r0
	lsls r0, r0, #8
	bl __divsi3
	mov r8, r0
	cmp r0, #0
	ble _080BB274
	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8
	movs r1, #0xff
	ands r1, r6
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r3, _080BB2A0 @ =0x080C5A48
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080BB2A4 @ =0x00000FFF
	adds r0, r0, r3
	adds r6, r0, #0
	asrs r7, r0, #0x1f
	lsls r1, r1, #1
	ldr r0, _080BB2A0 @ =0x080C5A48
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, r0, r3
	str r0, [sp, #0x20]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	mov r4, r8
	asrs r5, r4, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #0x1c
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	orrs r3, r2
	str r3, [sp, #0x20]
	asrs r0, r1, #0x1c
	str r0, [sp, #0x24]
	ldr r1, _080BB2A8 @ =0x020072B4
	ldr r0, [r1]
	add r0, sb
	strb r6, [r0]
	ldr r0, [r1]
	add r0, sb
	adds r0, #0xa0
	add r3, sp, #0x20
	ldrb r3, [r3]
	strb r3, [r0]
_080BB274:
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x7f
	ble _080BB1B6
_080BB27E:
	bl SwapOpScanlineBufs
	ldr r0, _080BB29C @ =0x02007018
	ldr r1, [r0]
	ldr r2, [r0, #8]
	adds r1, r1, r2
	str r1, [r0]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB29C: .4byte 0x02007018
_080BB2A0: .4byte 0x080C5A48
_080BB2A4: .4byte 0x00000FFF
_080BB2A8: .4byte 0x020072B4
