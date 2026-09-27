	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078650
sub_08078650: @ 0x08078650
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _080786A8 @ =0x03004690
	ldr r2, [r0]
	ldrb r0, [r2, #0x11]
	mov ip, r0
	ldr r3, [r5]
	ldr r1, [r3, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r4, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r7, r0, #0x10
	lsrs r6, r1, #0x18
	movs r0, #8
	ldrsb r0, [r3, r0]
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r0, r2
	bgt _080786AC
	lsls r1, r4, #0x18
	mov r4, ip
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
	cmp r1, r0
	bgt _080786AC
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	blt _080786AC
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	blt _080786AC
	ldr r0, [r3, #4]
	str r0, [r5, #4]
	ldrh r0, [r3, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _080786AE
	.align 2, 0
_080786A8: .4byte 0x03004690
_080786AC:
	movs r0, #0
_080786AE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
