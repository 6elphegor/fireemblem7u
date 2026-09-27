	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803EE4C
sub_0803EE4C: @ 0x0803EE4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r0, _0803EEB0 @ =0x081D5263
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803EE6C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0803EE6C:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803EEB8
	ldr r3, _0803EEB4 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b _0803EECC
	.align 2, 0
_0803EEB0: .4byte 0x081D5263
_0803EEB4: .4byte 0x03002870
_0803EEB8:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0803EE34
_0803EECC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
