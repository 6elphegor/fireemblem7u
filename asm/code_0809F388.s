	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F388
sub_0809F388: @ 0x0809F388
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	add r0, sp, #4
	movs r1, #0
	mov r8, r1
	mov r2, sb
	strh r2, [r0]
	ldr r2, _0809F494 @ =0x0100000C
	adds r1, r7, #0
	bl CpuSet
	movs r6, #1
	ldrb r0, [r7]
	orrs r0, r6
	strb r0, [r7]
	movs r0, #3
	ands r4, r0
	lsls r4, r4, #3
	movs r0, #0x19
	rsbs r0, r0, #0
	ldrb r3, [r7, #2]
	ands r0, r3
	orrs r0, r4
	ands r5, r6
	lsls r5, r5, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r7, #2]
	bl sub_08017120
	movs r2, #7
	ands r2, r0
	lsls r2, r2, #5
	movs r1, #0x1f
	ldrb r3, [r7, #7]
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #7]
	lsls r0, r0, #8
	lsrs r0, r0, #0xb
	ldr r1, [r7, #8]
	ldr r2, _0809F498 @ =0xFFE00000
	ands r1, r2
	orrs r1, r0
	str r1, [r7, #8]
	ldr r2, _0809F49C @ =0x0202BBF8
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ands r0, r6
	lsls r0, r0, #6
	movs r1, #0x41
	rsbs r1, r1, #0
	ldrb r3, [r7, #2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #2]
	ldrh r2, [r2, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #7
	ldr r0, _0809F4A0 @ =0xFFFF807F
	ldrh r2, [r7, #2]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #2]
	bl sub_0809FCB0
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	mov r6, sp
	adds r6, #0xa
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl FormatTime
	ldr r1, _0809F4A4 @ =0x000003FF
	ldrh r4, [r4]
	ands r1, r4
	lsls r1, r1, #7
	ldr r0, [r7, #4]
	ldr r2, _0809F4A8 @ =0xFFFE007F
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #4]
	movs r1, #0x3f
	ldrh r5, [r5]
	ands r1, r5
	lsls r1, r1, #1
	movs r0, #0x7f
	rsbs r0, r0, #0
	ldrb r3, [r7, #6]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #6]
	movs r1, #0x3f
	ldrh r6, [r6]
	ands r1, r6
	lsls r1, r1, #7
	ldr r0, _0809F4AC @ =0xFFFFE07F
	ldrh r2, [r7, #6]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #6]
	movs r0, #0x7f
	ldrb r3, [r7, #3]
	ands r0, r3
	strb r0, [r7, #3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r7, #4]
	ands r0, r1
	strb r0, [r7, #4]
	mov r2, r8
	strb r2, [r7, #0x17]
	movs r4, #1
	b _0809F4B8
	.align 2, 0
_0809F494: .4byte 0x0100000C
_0809F498: .4byte 0xFFE00000
_0809F49C: .4byte 0x0202BBF8
_0809F4A0: .4byte 0xFFFF807F
_0809F4A4: .4byte 0x000003FF
_0809F4A8: .4byte 0xFFFE007F
_0809F4AC: .4byte 0xFFFFE07F
_0809F4B0:
	ldrb r0, [r2, #4]
	strb r0, [r7, #0x17]
	b _0809F4E0
_0809F4B6:
	adds r4, #1
_0809F4B8:
	cmp r4, #0x3f
	bgt _0809F4E0
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809F4B6
	ldr r2, [r0]
	cmp r2, #0
	beq _0809F4B6
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0809F4B6
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809F4B0
_0809F4E0:
	movs r5, #1
	movs r3, #0xc
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0x7f
	mov r8, r0
	movs r6, #0x7f
_0809F4EE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0809F548
	ldr r2, [r4]
	cmp r2, #0
	beq _0809F548
	ldr r0, [r4, #0xc]
	ldr r1, _0809F60C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809F548
	ldrb r0, [r2, #4]
	bl sub_080A0210
	cmp r0, sb
	ble _0809F548
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_080A0210
	mov sb, r0
	ldr r0, [r4]
	ldrb r2, [r0, #4]
	movs r1, #1
	ands r1, r2
	lsls r1, r1, #7
	adds r0, r6, #0
	ldrb r3, [r7, #3]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	lsrs r2, r2, #1
	ands r2, r6
	mov r0, r8
	ands r2, r0
	movs r1, #0x80
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r7, #4]
_0809F548:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809F4EE
	bl sub_080B62F4
	movs r5, #7
	ands r0, r5
	lsls r0, r0, #4
	movs r1, #0x71
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl sub_080B6550
	ands r0, r5
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_080B63EC
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _0809F610 @ =0xFFFFFC7F
	ldrh r2, [r7]
	ands r1, r2
	orrs r1, r0
	strh r1, [r7]
	bl sub_080B6424
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_080B651C
	ands r0, r5
	movs r4, #8
	rsbs r4, r4, #0
	ldrb r1, [r7, #2]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7, #2]
	ldrb r2, [r7]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	ldrh r3, [r7]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x1d
	ldrb r3, [r7, #1]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1d
	lsrs r3, r3, #5
	lsls r4, r4, #0x1d
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl sub_080B65F0
	ands r0, r5
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl sub_0809FB70
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _0809F614 @ =0xFFFFF81F
	ldrh r3, [r7, #0xa]
	ands r1, r3
	orrs r1, r0
	strh r1, [r7, #0xa]
	bl sub_0802E6E4
	adds r1, r0, #0
	mov r0, sl
	bl strcpy
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F60C: .4byte 0x00010004
_0809F610: .4byte 0xFFFFFC7F
_0809F614: .4byte 0xFFFFF81F

	thumb_func_start sub_0809F618
sub_0809F618: @ 0x0809F618
	push {r4, r5, r6, lr}
	sub sp, #0x30
	bl sub_0809F218
	adds r6, r0, #0
	ldr r0, _0809F664 @ =0x0202BBF8
	ldrb r0, [r0, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	add r5, sp, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0809F388
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0809F224
	mov r0, sp
	adds r1, r5, #0
	bl sub_0809F2C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F65A
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0809F288
_0809F65A:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F664: .4byte 0x0202BBF8

	thumb_func_start sub_0809F668
sub_0809F668: @ 0x0809F668
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F688 @ =0x01000012
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_0809F6E4
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
_0809F688: .4byte 0x01000012

	thumb_func_start sub_0809F68C
sub_0809F68C: @ 0x0809F68C
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl sub_0809E478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F6D8
	cmp r4, #0
	bne _0809F6A2
	mov r4, sp
_0809F6A2:
	ldr r1, _0809F6CC @ =0x03005E70
	ldr r0, _0809F6D0 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F6D4 @ =0x000070FC
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_0809E4C4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x20]
	cmp r4, r0
	bne _0809F6D8
	movs r0, #1
	b _0809F6DA
	.align 2, 0
_0809F6CC: .4byte 0x03005E70
_0809F6D0: .4byte 0x08CE3B58
_0809F6D4: .4byte 0x000070FC
_0809F6D8:
	movs r0, #0
_0809F6DA:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809F6E4
sub_0809F6E4: @ 0x0809F6E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	bl sub_0809E4C4
	strh r0, [r4, #0x20]
	ldr r0, _0809F708 @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F70C @ =0x000070FC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F708: .4byte 0x08CE3B58
_0809F70C: .4byte 0x000070FC

	thumb_func_start sub_0809F710
sub_0809F710: @ 0x0809F710
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F724
	mov r4, sp
	mov r0, sp
	bl sub_0809F68C
_0809F724:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809F73E
	movs r0, #0
	b _0809F740
_0809F73E:
	movs r0, #1
_0809F740:
	add sp, #0x24
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0809F748
sub_0809F748: @ 0x0809F748
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F762
	mov r4, sp
	mov r0, sp
	bl sub_0809F68C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F784
_0809F762:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0809F784
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl sub_0809F6E4
_0809F784:
	add sp, #0x24
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0809F78C
sub_0809F78C: @ 0x0809F78C
	push {lr}
	sub sp, #0x18
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F7AC @ =0x0100000A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_0809F808
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0809F7AC: .4byte 0x0100000A

	thumb_func_start sub_0809F7B0
sub_0809F7B0: @ 0x0809F7B0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl sub_0809E478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F7FC
	cmp r4, #0
	bne _0809F7C6
	mov r4, sp
_0809F7C6:
	ldr r1, _0809F7F0 @ =0x03005E70
	ldr r0, _0809F7F4 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r2, _0809F7F8 @ =0x00007120
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_0809E4C4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x10]
	cmp r4, r0
	bne _0809F7FC
	movs r0, #1
	b _0809F7FE
	.align 2, 0
_0809F7F0: .4byte 0x03005E70
_0809F7F4: .4byte 0x08CE3B58
_0809F7F8: .4byte 0x00007120
_0809F7FC:
	movs r0, #0
_0809F7FE:
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809F808
sub_0809F808: @ 0x0809F808
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl sub_0809E4C4
	strh r0, [r4, #0x10]
	ldr r0, _0809F82C @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F830 @ =0x00007120
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F82C: .4byte 0x08CE3B58
_0809F830: .4byte 0x00007120

	thumb_func_start sub_0809F834
sub_0809F834: @ 0x0809F834
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F848
	mov r4, sp
	mov r0, sp
	bl sub_0809F7B0
_0809F848:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809F862
	movs r0, #0
	b _0809F864
_0809F862:
	movs r0, #1
_0809F864:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0809F86C
sub_0809F86C: @ 0x0809F86C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809F886
	mov r4, sp
	mov r0, sp
	bl sub_0809F7B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F8A8
_0809F886:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0809F8A8
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl sub_0809F808
_0809F8A8:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0809F8B0
sub_0809F8B0: @ 0x0809F8B0
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F8E6
	mov r0, sp
	ldrb r3, [r0, #0x13]
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1b
	cmp r0, r4
	beq _0809F8E6
	mov r2, sp
	movs r0, #0x1f
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x13]
	mov r0, sp
	bl SaveMetaSave
_0809F8E6:
	adds r0, r4, #0
	bl SetLang
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0809F8F4
sub_0809F8F4: @ 0x0809F8F4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F908
	movs r0, #0
	b _0809F91C
_0809F908:
	mov r0, sp
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	bl SetLang
	mov r0, sp
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
_0809F91C:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809F924
sub_0809F924: @ 0x0809F924
	push {lr}
	movs r0, #0
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F936
	bl sub_0809E5AC
_0809F936:
	movs r0, #0
	bl sub_0809F134
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F946
	bl sub_0809E6AC
_0809F946:
	movs r0, #0
	bl sub_0809F000
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F956
	bl sub_0809E688
_0809F956:
	movs r0, #0
	bl sub_0809F0D8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F966
	bl sub_0809F1F4
_0809F966:
	movs r0, #0
	bl sub_0809F68C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F976
	bl sub_0809F668
_0809F976:
	movs r0, #0
	bl sub_0809F7B0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F986
	bl sub_0809F78C
_0809F986:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0809F98C
sub_0809F98C: @ 0x0809F98C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, _0809FA14 @ =0x0203E7A0
	ldr r2, _0809FA18 @ =0x01000230
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _0809FA1C @ =0x0203EC00
	ldr r2, _0809FA20 @ =0x01000060
	bl CpuSet
	adds r7, r5, #0
	movs r6, #0x86
	lsls r6, r6, #4
	add r6, r8
	adds r4, r7, #0
	movs r5, #0x45
_0809F9C0:
	ldr r0, [r4]
	ldr r1, _0809FA24 @ =0xFF0000FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r6, #0x10
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _0809F9C0
	movs r4, #0xcc
	lsls r4, r4, #4
	add r4, r8
	movs r5, #0x2f
_0809F9EA:
	ldr r0, _0809FA1C @ =0x0203EC00
	adds r1, r4, #0
	movs r2, #4
	bl WriteAndVerifySramFast
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0809F9EA
	ldr r1, _0809FA28 @ =0x0203E79C
	movs r0, #0x86
	lsls r0, r0, #4
	add r0, r8
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA14: .4byte 0x0203E7A0
_0809FA18: .4byte 0x01000230
_0809FA1C: .4byte 0x0203EC00
_0809FA20: .4byte 0x01000060
_0809FA24: .4byte 0xFF0000FF
_0809FA28: .4byte 0x0203E79C

	thumb_func_start sub_0809FA2C
sub_0809FA2C: @ 0x0809FA2C
	push {lr}
	ldr r1, _0809FA48 @ =0x0202BBF8
	ldr r0, _0809FA4C @ =0xFFFFE00F
	ldrh r2, [r1, #0x2c]
	ands r0, r2
	strh r0, [r1, #0x2c]
	movs r0, #0
	bl SetGold
	bl sub_0809FA50
	pop {r0}
	bx r0
	.align 2, 0
_0809FA48: .4byte 0x0202BBF8
_0809FA4C: .4byte 0xFFFFE00F

	thumb_func_start sub_0809FA50
sub_0809FA50: @ 0x0809FA50
	push {r4, r5, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r1, _0809FA90 @ =0x0203E7A0
	ldr r2, _0809FA94 @ =0x01000230
	bl CpuSet
	ldr r4, _0809FA98 @ =0x0202BBF8
	ldr r0, [r4, #0x38]
	ldr r1, _0809FA9C @ =0xF00000FF
	ands r0, r1
	str r0, [r4, #0x38]
	movs r0, #0xf
	ldrh r1, [r4, #0x36]
	ands r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x38
	strb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _0809FAA0 @ =0xFFF00000
	ands r0, r1
	str r0, [r4, #0x34]
	bl sub_08017120
	str r0, [r4, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA90: .4byte 0x0203E7A0
_0809FA94: .4byte 0x01000230
_0809FA98: .4byte 0x0202BBF8
_0809FA9C: .4byte 0xF00000FF
_0809FAA0: .4byte 0xFFF00000

	thumb_func_start sub_0809FAA4
sub_0809FAA4: @ 0x0809FAA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FAC4 @ =0x03005E70
	ldr r1, _0809FAC8 @ =0x0203E7A0
	movs r2, #0x8c
	lsls r2, r2, #3
	ldr r3, [r0]
	adds r0, r4, #0
	bl _call_via_r3
	ldr r0, _0809FACC @ =0x0203E79C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FAC4: .4byte 0x03005E70
_0809FAC8: .4byte 0x0203E7A0
_0809FACC: .4byte 0x0203E79C

	thumb_func_start sub_0809FAD0
sub_0809FAD0: @ 0x0809FAD0
	push {lr}
	ldr r2, _0809FAE4 @ =0x03005E70
	ldr r1, _0809FAE8 @ =0x0203EC00
	ldr r3, [r2]
	movs r2, #0xc0
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_0809FAE4: .4byte 0x03005E70
_0809FAE8: .4byte 0x0203EC00

	thumb_func_start sub_0809FAEC
sub_0809FAEC: @ 0x0809FAEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FB08 @ =0x0203E7A0
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	ldr r0, _0809FB0C @ =0x0203E79C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FB08: .4byte 0x0203E7A0
_0809FB0C: .4byte 0x0203E79C

	thumb_func_start sub_0809FB10
sub_0809FB10: @ 0x0809FB10
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809FB20 @ =0x0203EC00
	movs r2, #0xc0
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_0809FB20: .4byte 0x0203EC00

	thumb_func_start GetChapterCompletionStatsEnt
GetChapterCompletionStatsEnt: @ 0x0809FB24
	lsls r0, r0, #2
	ldr r1, _0809FB2C @ =0x0203EC00
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0809FB2C: .4byte 0x0203EC00

	thumb_func_start sub_0809FB30
sub_0809FB30: @ 0x0809FB30
	ldr r1, _0809FB40 @ =0x0000FF80
	ldrh r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0809FB40: .4byte 0x0000FF80

	thumb_func_start GetChapterCompletionStatsListCount
GetChapterCompletionStatsListCount: @ 0x0809FB44
	push {r4, lr}
	movs r0, #0
	bl GetChapterCompletionStatsEnt
	adds r1, r0, #0
	movs r2, #0
	ldr r3, _0809FB54 @ =0x0000FF80
	b _0809FB5C
	.align 2, 0
_0809FB54: .4byte 0x0000FF80
_0809FB58:
	adds r2, #1
	adds r1, #4
_0809FB5C:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _0809FB58
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809FB70
sub_0809FB70: @ 0x0809FB70
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetChapterCompletionStatsEnt
	adds r4, r0, #0
	movs r5, #0
	ldr r1, _0809FBB0 @ =0x0000FF80
	adds r0, r1, #0
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0809FBA6
	adds r6, r1, #0
_0809FB8A:
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FB9C
	adds r5, #1
_0809FB9C:
	adds r4, #4
	ldrh r0, [r4]
	ands r0, r6
	cmp r0, #0
	bne _0809FB8A
_0809FBA6:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809FBB0: .4byte 0x0000FF80

	thumb_func_start sub_0809FBB4
sub_0809FBB4: @ 0x0809FBB4
	push {lr}
	bl GetChapterCompletionStatsListCount
	cmp r0, #0
	beq _0809FBCC
	subs r0, #1
	bl GetChapterCompletionStatsEnt
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	b _0809FBD0
_0809FBCC:
	movs r0, #1
	rsbs r0, r0, #0
_0809FBD0:
	pop {r1}
	bx r1

	thumb_func_start sub_0809FBD4
sub_0809FBD4: @ 0x0809FBD4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetChapterCompletionStatsListCount
	bl GetChapterCompletionStatsEnt
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r3, r0, #0
	ldr r0, _0809FC2C @ =0x0000EA60
	cmp r3, r0
	ble _0809FBFA
	adds r3, r0, #0
_0809FBFA:
	ldrh r2, [r4, #0x10]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r2, r0
	ble _0809FC06
	adds r2, r0, #0
_0809FC06:
	movs r1, #0x7f
	ldrb r4, [r4, #0xe]
	ands r1, r4
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r4, [r5]
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	lsls r1, r2, #7
	movs r0, #0x7f
	ldrh r2, [r5]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	strh r3, [r5, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC2C: .4byte 0x0000EA60

	thumb_func_start sub_0809FC30
sub_0809FC30: @ 0x0809FC30
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetChapterCompletionStatsListCount
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _0809FC54
	movs r7, #0xb4
_0809FC42:
	adds r0, r4, #0
	bl GetChapterCompletionStatsEnt
	ldrh r0, [r0, #2]
	muls r0, r7, r0
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _0809FC42
_0809FC54:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0809FC5C
sub_0809FC5C: @ 0x0809FC5C
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetChapterCompletionStatsListCount
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _0809FC80
_0809FC6C:
	adds r0, r4, #0
	bl GetChapterCompletionStatsEnt
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _0809FC6C
_0809FC80:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start IsChapterPartOfCurrentMode
IsChapterPartOfCurrentMode: @ 0x0809FC88
	adds r1, r0, #0
	ldr r0, _0809FC9C @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _0809FCA0
	cmp r1, #0xb
	bgt _0809FCAC
_0809FC96:
	movs r0, #1
	b _0809FCAE
	.align 2, 0
_0809FC9C: .4byte 0x0202BBF8
_0809FCA0:
	cmp r0, #1
	blt _0809FCAC
	cmp r0, #3
	bgt _0809FCAC
	cmp r1, #0xb
	bgt _0809FC96
_0809FCAC:
	movs r0, #0
_0809FCAE:
	bx lr

	thumb_func_start sub_0809FCB0
sub_0809FCB0: @ 0x0809FCB0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetChapterCompletionStatsListCount
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _0809FCE6
_0809FCC0:
	adds r0, r5, #0
	bl GetChapterCompletionStatsEnt
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FCE0
	movs r0, #0xb4
	ldrh r4, [r4, #2]
	muls r0, r4, r0
	adds r7, r7, r0
_0809FCE0:
	adds r5, #1
	cmp r5, r6
	blt _0809FCC0
_0809FCE6:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetTotalTurnCountUpUntilNow
GetTotalTurnCountUpUntilNow: @ 0x0809FCF0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetChapterCompletionStatsListCount
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _0809FD26
_0809FD00:
	adds r0, r5, #0
	bl GetChapterCompletionStatsEnt
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FD20
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
_0809FD20:
	adds r5, #1
	cmp r5, r6
	blt _0809FD00
_0809FD26:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0809FD30
sub_0809FD30: @ 0x0809FD30
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0809FD84
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r5, r0, #0
	cmp r0, #0x45
	bhi _0809FD84
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FD84
	lsls r1, r5, #4
	ldr r0, _0809FD8C @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _0809FD84
	ldrh r3, [r2, #0xc]
	lsls r0, r3, #0x12
	lsrs r1, r0, #0x14
	ldr r0, _0809FD90 @ =0x00000F9F
	cmp r1, r0
	bgt _0809FD7A
	adds r0, r1, #1
	ldr r5, _0809FD94 @ =0x00000FFF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _0809FD98 @ =0xFFFFC003
	ands r1, r3
	orrs r1, r0
	strh r1, [r2, #0xc]
_0809FD7A:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #4
	bl sub_080A0248
_0809FD84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD8C: .4byte 0x0203E790
_0809FD90: .4byte 0x00000F9F
_0809FD94: .4byte 0x00000FFF
_0809FD98: .4byte 0xFFFFC003

	thumb_func_start sub_0809FD9C
sub_0809FD9C: @ 0x0809FD9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FDEE
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FDEE
	lsls r1, r4, #4
	ldr r0, _0809FDF4 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _0809FDEE
	movs r3, #3
	adds r0, r3, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r1, r0, #8
	ldrb r0, [r2, #0xb]
	orrs r1, r0
	ldr r0, _0809FDF8 @ =0x000003E7
	cmp r1, r0
	bgt _0809FDE6
	adds r1, #1
	strb r1, [r2, #0xb]
	lsrs r1, r1, #8
	ands r1, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xc]
_0809FDE6:
	adds r0, r5, #0
	movs r1, #0x10
	bl sub_080A0248
_0809FDEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDF4: .4byte 0x0203E790
_0809FDF8: .4byte 0x000003E7

	thumb_func_start sub_0809FDFC
sub_0809FDFC: @ 0x0809FDFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	bl sub_0809E478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FECC
	cmp r4, #0x45
	bhi _0809FECC
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FECC
	mov r0, r8
	lsls r6, r0, #4
	ldr r0, _0809FED8 @ =0x0203E790
	adds r5, r6, r0
	cmp r5, #0
	beq _0809FECC
	ldr r1, _0809FEDC @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _0809FECC
	ldr r7, _0809FEE0 @ =0x0202BBF8
	ldrb r2, [r7, #0x14]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0809FECC
	ldrb r1, [r1, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0809FECC
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0809FECC
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0809FECC
	ldrb r0, [r5]
	cmp r0, #0xc7
	bhi _0809FECC
	adds r0, #1
	strb r0, [r5]
	movs r1, #0x80
	rsbs r1, r1, #0
	mov r0, r8
	bl sub_080A0248
	bl sub_080A1918
	adds r4, r0, #0
	adds r4, #3
	adds r0, r4, #0
	bl sub_0809E870
	adds r1, r0, #0
	ldr r2, _0809FEE4 @ =0x000019DC
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #1
	bl WriteAndVerifySramFast
	mov r0, sp
	adds r1, r4, #0
	bl sub_0809E6FC
	mov r0, sp
	adds r1, r4, #0
	bl sub_0809E7A0
	ldrb r0, [r7, #0xc]
	bl sub_0809E870
	adds r1, r0, #0
	movs r2, #0x85
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #3
	bl WriteAndVerifySramFast
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl sub_0809E6FC
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl sub_0809E7A0
_0809FECC:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FED8: .4byte 0x0203E790
_0809FEDC: .4byte 0x0202BBB8
_0809FEE0: .4byte 0x0202BBF8
_0809FEE4: .4byte 0x000019DC

	thumb_func_start sub_0809FEE8
sub_0809FEE8: @ 0x0809FEE8
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0x45
	bhi _0809FF52
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FF52
	lsls r1, r5, #4
	ldr r0, _0809FF58 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _0809FF52
	ldr r2, _0809FF5C @ =0x0202BBF8
	movs r1, #0xe
	ldrsb r1, [r2, r1]
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ldrb r5, [r3, #5]
	ands r0, r5
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r1, _0809FF60 @ =0x000003FF
	ldrh r2, [r2, #0x10]
	ands r1, r2
	lsls r1, r1, #0xe
	ldr r0, [r3, #4]
	ldr r2, _0809FF64 @ =0xFF003FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #4]
	lsls r2, r6, #0xe
	ldr r0, [r3, #0xc]
	ldr r1, _0809FF68 @ =0xFF803FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #0xc]
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r3, #9]
	ands r0, r1
	orrs r0, r4
	strb r0, [r3, #9]
_0809FF52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF58: .4byte 0x0203E790
_0809FF5C: .4byte 0x0202BBF8
_0809FF60: .4byte 0x000003FF
_0809FF64: .4byte 0xFF003FFF
_0809FF68: .4byte 0xFF803FFF

	thumb_func_start sub_0809FF6C
sub_0809FF6C: @ 0x0809FF6C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FFA0
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FFA0
	lsls r1, r4, #4
	ldr r0, _0809FFA8 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	beq _0809FFA0
	ldrb r0, [r1, #3]
	cmp r0, #0xc7
	bhi _0809FF98
	adds r0, #1
	strb r0, [r1, #3]
_0809FF98:
	adds r0, r5, #0
	movs r1, #2
	bl sub_080A0248
_0809FFA0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FFA8: .4byte 0x0203E790

	thumb_func_start sub_0809FFAC
sub_0809FFAC: @ 0x0809FFAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FFE0
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FFE0
	lsls r1, r4, #4
	ldr r0, _0809FFE8 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	beq _0809FFE0
	ldrb r0, [r1, #4]
	cmp r0, #0xc7
	bhi _0809FFD8
	adds r0, #1
	strb r0, [r1, #4]
_0809FFD8:
	adds r0, r5, #0
	movs r1, #2
	bl sub_080A0248
_0809FFE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FFE8: .4byte 0x0203E790

	thumb_func_start sub_0809FFEC
sub_0809FFEC: @ 0x0809FFEC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A0030
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0030
	lsls r1, r4, #4
	ldr r0, _080A0038 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _080A0030
	ldrb r3, [r2, #7]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #0x3b
	bgt _080A0028
	adds r1, r0, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
_080A0028:
	adds r0, r5, #0
	movs r1, #0x40
	bl sub_080A0248
_080A0030:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0038: .4byte 0x0203E790

	thumb_func_start sub_080A003C
sub_080A003C: @ 0x080A003C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A0090
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0090
	lsls r1, r4, #4
	ldr r0, _080A0098 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _080A0090
	ldrb r4, [r3, #7]
	lsrs r1, r4, #6
	ldrb r2, [r3, #8]
	lsls r0, r2, #2
	orrs r0, r1
	adds r2, r0, r5
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble _080A0076
	adds r2, r0, #0
_080A0076:
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #6
	movs r1, #0x3f
	ands r1, r4
	orrs r1, r0
	strb r1, [r3, #7]
	lsrs r0, r2, #2
	strb r0, [r3, #8]
	adds r0, r6, #0
	movs r1, #2
	bl sub_080A0248
_080A0090:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0098: .4byte 0x0203E790

	thumb_func_start PidStatsAddExpGained
PidStatsAddExpGained: @ 0x080A009C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A00E8
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A00E8
	lsls r1, r4, #4
	ldr r0, _080A00F0 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _080A00E8
	ldr r3, [r2, #8]
	lsls r0, r3, #8
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	movs r1, #0xfa
	lsls r1, r1, #4
	cmp r0, r1
	ble _080A00D2
	adds r0, r1, #0
_080A00D2:
	ldr r1, _080A00F4 @ =0x00000FFF
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, _080A00F8 @ =0xFF000FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r2, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080A0248
_080A00E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A00F0: .4byte 0x0203E790
_080A00F4: .4byte 0x00000FFF
_080A00F8: .4byte 0xFF000FFF

	thumb_func_start sub_080A00FC
sub_080A00FC: @ 0x080A00FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	rsbs r1, r1, #0
	bl sub_080A0248
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A0110
sub_080A0110: @ 0x080A0110
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080A0120 @ =0xFFFFFF00
	bl sub_080A0248
	pop {r0}
	bx r0
	.align 2, 0
_080A0120: .4byte 0xFFFFFF00

	thumb_func_start sub_080A0124
sub_080A0124: @ 0x080A0124
	push {r4, lr}
	movs r3, #0
	ldr r2, _080A0144 @ =0x0203E7A0
	movs r1, #0x45
_080A012C:
	ldrh r4, [r2, #0xc]
	lsls r0, r4, #0x12
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A012C
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A0144: .4byte 0x0203E7A0

	thumb_func_start sub_080A0148
sub_080A0148: @ 0x080A0148
	push {r4, r5, lr}
	movs r3, #0
	ldr r0, _080A0174 @ =0x0203E7A0
	movs r4, #3
	adds r1, r0, #0
	adds r1, #0xb
	movs r2, #0x45
_080A0156:
	adds r0, r4, #0
	ldrb r5, [r1, #1]
	ands r0, r5
	lsls r0, r0, #8
	ldrb r5, [r1]
	orrs r0, r5
	adds r3, r3, r0
	adds r1, #0x10
	subs r2, #1
	cmp r2, #0
	bge _080A0156
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0174: .4byte 0x0203E7A0

	thumb_func_start sub_080A0178
sub_080A0178: @ 0x080A0178
	movs r0, #0
	ldr r2, _080A018C @ =0x0203E7A0
	movs r1, #0x45
_080A017E:
	ldrb r3, [r2]
	adds r0, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A017E
	bx lr
	.align 2, 0
_080A018C: .4byte 0x0203E7A0

	thumb_func_start sub_080A0190
sub_080A0190: @ 0x080A0190
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _080A01B8 @ =0x0203E7A0
	movs r4, #0x45
_080A0198:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge _080A0198
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A01B8: .4byte 0x0203E7A0

	thumb_func_start sub_080A01BC
sub_080A01BC: @ 0x080A01BC
	movs r3, #0
	ldr r2, _080A01D8 @ =0x0203E7A0
	movs r1, #0x45
_080A01C2:
	ldr r0, [r2, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A01C2
	adds r0, r3, #0
	bx lr
	.align 2, 0
_080A01D8: .4byte 0x0203E7A0

	thumb_func_start sub_080A01DC
sub_080A01DC: @ 0x080A01DC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A01FC
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A01FC
	lsls r1, r4, #4
	ldr r0, _080A0200 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	bne _080A0204
_080A01FC:
	movs r0, #0
	b _080A020A
	.align 2, 0
_080A0200: .4byte 0x0203E790
_080A0204:
	ldr r0, [r1, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
_080A020A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A0210
sub_080A0210: @ 0x080A0210
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A0230
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0230
	lsls r1, r4, #4
	ldr r0, _080A0238 @ =0x0203E790
	adds r0, r1, r0
	cmp r0, #0
	bne _080A023C
_080A0230:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080A0242
	.align 2, 0
_080A0238: .4byte 0x0203E790
_080A023C:
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
_080A0242:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A0248
sub_080A0248: @ 0x080A0248
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A02AA
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A02AA
	lsls r1, r4, #4
	ldr r0, _080A0284 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _080A02AA
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	ble _080A028C
	ldr r0, _080A0288 @ =0xFF0000FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xf
	b _080A02A6
	.align 2, 0
_080A0284: .4byte 0x0203E790
_080A0288: .4byte 0xFF0000FF
_080A028C:
	cmp r1, #0
	bge _080A029C
	ldr r0, _080A0298 @ =0xFF0000FF
	ands r2, r0
	str r2, [r3]
	b _080A02AA
	.align 2, 0
_080A0298: .4byte 0xFF0000FF
_080A029C:
	ldr r0, _080A02B0 @ =0x0000FFFF
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, _080A02B4 @ =0xFF0000FF
	ands r0, r2
_080A02A6:
	orrs r0, r1
	str r0, [r3]
_080A02AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A02B0: .4byte 0x0000FFFF
_080A02B4: .4byte 0xFF0000FF

	thumb_func_start sub_080A02B8
sub_080A02B8: @ 0x080A02B8
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r5, #0
	ldr r4, _080A0314 @ =0x0203A3F0
	adds r0, r4, #0
	bl sub_08018A70
	cmp r0, #0
	bne _080A02CE
	adds r7, r4, #0
	ldr r5, _080A0318 @ =0x0203A470
_080A02CE:
	ldr r6, _080A0318 @ =0x0203A470
	adds r0, r6, #0
	bl sub_08018A70
	cmp r0, #0
	bne _080A02DE
	adds r7, r6, #0
	adds r5, r4, #0
_080A02DE:
	cmp r7, #0
	beq _080A030E
	cmp r5, #0
	beq _080A02F8
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A02F8
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_0809FD9C
_080A02F8:
	cmp r7, #0
	beq _080A030E
	movs r0, #0xc0
	ldrb r1, [r7, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A030E
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl sub_0809FDFC
_080A030E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0314: .4byte 0x0203A3F0
_080A0318: .4byte 0x0203A470

	thumb_func_start sub_080A031C
sub_080A031C: @ 0x080A031C
	push {r4, r5, r6, lr}
	sub sp, #0xac
	adds r6, r0, #0
	mov r0, sp
	bl LoadMetaSave
	movs r4, #0
	add r1, sp, #0x14
_080A032C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080A0358
	adds r4, #1
	cmp r4, #0xb
	ble _080A032C
	movs r4, #0
	add r5, sp, #0x64
_080A033E:
	adds r0, r4, #0
	bl sub_080A09A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A035C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080A09B4
	ldrb r0, [r5, #0x18]
	cmp r0, r6
	bne _080A035C
_080A0358:
	movs r0, #0
	b _080A0364
_080A035C:
	adds r4, #1
	cmp r4, #2
	ble _080A033E
	movs r0, #1
_080A0364:
	add sp, #0xac
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080A036C
sub_080A036C: @ 0x080A036C
	push {r4, lr}
	movs r4, #1
_080A0370:
	adds r0, r4, #0
	bl sub_080A031C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0380
	adds r0, r4, #0
	b _080A0386
_080A0380:
	adds r4, #1
	cmp r4, #0xff
	ble _080A0370
_080A0386:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start MetaSave_CountCompletedPlaythroughs
MetaSave_CountCompletedPlaythroughs: @ 0x080A038C
	movs r2, #0
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x14
_080A0394:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A039E
	adds r2, #1
_080A039E:
	adds r1, #1
	cmp r1, #0xb
	ble _080A0394
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_080A03A8
sub_080A03A8: @ 0x080A03A8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A03C0
	mov r0, sp
	bl MetaSave_CountCompletedPlaythroughs
	b _080A03C2
_080A03C0:
	movs r0, #0
_080A03C2:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start sub_080A03C8
sub_080A03C8: @ 0x080A03C8
	push {r4, lr}
	movs r3, #0
	adds r4, r0, #0
	adds r4, #0x14
	adds r2, r4, #0
_080A03D2:
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	beq _080A03F6
	adds r3, #1
	cmp r3, #0xb
	ble _080A03D2
	movs r3, #0
_080A03E2:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A03F0
	strb r1, [r2]
	movs r0, #1
	b _080A03F8
_080A03F0:
	adds r3, #1
	cmp r3, #0xb
	ble _080A03E2
_080A03F6:
	movs r0, #0
_080A03F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A0400
sub_080A0400: @ 0x080A0400
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A041A
	bl sub_0809E5AC
	mov r0, sp
	bl LoadMetaSave
_080A041A:
	mov r1, sp
	movs r0, #2
	ldrb r2, [r1, #0xe]
	orrs r0, r2
	strb r0, [r1, #0xe]
	mov r0, sp
	bl SaveMetaSave
	add sp, #0x64
	pop {r0}
	bx r0

	thumb_func_start sub_080A0430
sub_080A0430: @ 0x080A0430
	push {r4, lr}
	movs r0, #0
	bl GetChapterCompletionStatsEnt
	adds r4, r0, #0
	bl GetChapterCompletionStatsListCount
	cmp r0, #0
	beq _080A044C
	movs r0, #0x7f
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _080A0450
_080A044C:
	movs r0, #0
	b _080A0452
_080A0450:
	movs r0, #1
_080A0452:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A0458
sub_080A0458: @ 0x080A0458
	push {lr}
	bl sub_080A0430
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A047C
	ldr r0, _080A0470 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A0474
	movs r0, #0
	b _080A0496
	.align 2, 0
_080A0470: .4byte 0x0202BBF8
_080A0474:
	cmp r0, #3
	bne _080A047C
	movs r0, #2
	b _080A0496
_080A047C:
	ldr r0, _080A0488 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A048C
	movs r0, #1
	b _080A0496
	.align 2, 0
_080A0488: .4byte 0x0202BBF8
_080A048C:
	cmp r0, #3
	beq _080A0494
	movs r0, #4
	b _080A0496
_080A0494:
	movs r0, #3
_080A0496:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A049C
sub_080A049C: @ 0x080A049C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	bl sub_080A0458
	adds r5, r0, #0
	ldr r7, _080A04E8 @ =0x0202BBF8
	ldrb r0, [r7, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	adds r6, r4, #0
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A04C8
	bl sub_0809E5AC
	mov r0, sp
	bl LoadMetaSave
_080A04C8:
	ldrb r1, [r7, #0x18]
	mov r0, sp
	bl sub_080A03C8
	mov r1, sp
	movs r0, #1
	ldrb r2, [r1, #0xe]
	orrs r2, r0
	strb r2, [r1, #0xe]
	cmp r5, #1
	beq _080A050A
	cmp r5, #1
	bgt _080A04EC
	cmp r5, #0
	beq _080A04FA
	b _080A0522
	.align 2, 0
_080A04E8: .4byte 0x0202BBF8
_080A04EC:
	cmp r5, #3
	bgt _080A0522
	cmp r4, #0
	beq _080A051A
	mov r1, sp
	movs r0, #0x80
	b _080A051E
_080A04FA:
	cmp r4, #0
	beq _080A0504
	mov r1, sp
	movs r0, #0x20
	b _080A051E
_080A0504:
	mov r1, sp
	movs r0, #4
	b _080A051E
_080A050A:
	cmp r6, #0
	beq _080A0514
	mov r1, sp
	movs r0, #0x40
	b _080A051E
_080A0514:
	mov r1, sp
	movs r0, #8
	b _080A051E
_080A051A:
	mov r1, sp
	movs r0, #0x10
_080A051E:
	orrs r2, r0
	strb r2, [r1, #0xe]
_080A0522:
	mov r0, sp
	bl SaveMetaSave
	cmp r5, #0
	blt _080A0546
	cmp r5, #1
	bgt _080A053A
	movs r0, #0
	movs r1, #0x70
	bl sub_0809F748
	b _080A0546
_080A053A:
	cmp r5, #3
	bgt _080A0546
	movs r0, #0
	movs r1, #0x71
	bl sub_0809F748
_080A0546:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A0550
sub_080A0550: @ 0x080A0550
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x45
	bhi _080A0574
	adds r0, r4, #0
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0574
	lsls r0, r4, #4
	ldr r1, _080A0570 @ =0x0203E790
	adds r0, r0, r1
	b _080A0576
	.align 2, 0
_080A0570: .4byte 0x0203E790
_080A0574:
	movs r0, #0
_080A0576:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A057C
sub_080A057C: @ 0x080A057C
	ldr r0, _080A0584 @ =0x0203ECC0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A0584: .4byte 0x0203ECC0

	thumb_func_start sub_080A0588
sub_080A0588: @ 0x080A0588
	ldr r1, _080A0590 @ =0x0203ECC0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0590: .4byte 0x0203ECC0

	thumb_func_start sub_080A0594
sub_080A0594: @ 0x080A0594
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A05A8 @ =0x0203ECC0
	ldr r2, _080A05AC @ =0x00000D88
	adds r1, r1, r2
	movs r2, #4
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A05A8: .4byte 0x0203ECC0
_080A05AC: .4byte 0x00000D88

	thumb_func_start sub_080A05B0
sub_080A05B0: @ 0x080A05B0
	push {lr}
	ldr r2, _080A05C8 @ =0x03005E70
	ldr r1, _080A05CC @ =0x00000D88
	adds r0, r0, r1
	ldr r1, _080A05D0 @ =0x0203ECC0
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_080A05C8: .4byte 0x03005E70
_080A05CC: .4byte 0x00000D88
_080A05D0: .4byte 0x0203ECC0

	thumb_func_start sub_080A05D4
sub_080A05D4: @ 0x080A05D4
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl LoadMetaSave
	mov r0, sp
	adds r0, #0x62
	strb r4, [r0]
	mov r0, sp
	bl sub_0809E598
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A05F4
sub_080A05F4: @ 0x080A05F4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0612
	mov r0, sp
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt _080A0612
	cmp r0, #0
	bge _080A0614
_080A0612:
	movs r0, #0
_080A0614:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A061C
sub_080A061C: @ 0x080A061C
	push {r4, r5, lr}
	sub sp, #0x58
	adds r5, r0, #0
	movs r0, #3
	bl sub_080A1384
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0644
	add r4, sp, #0x10
	movs r0, #3
	adds r1, r4, #0
	bl sub_080A13D8
	ldrb r0, [r4, #0xc]
	cmp r0, r5
	bne _080A0644
	movs r0, #3
	bl sub_080A10D8
_080A0644:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl sub_0809E7A0
	add sp, #0x58
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A065C
sub_080A065C: @ 0x080A065C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov sb, r1
	bl sub_0809E918
	adds r6, r0, #0
	mov r0, sb
	bl sub_0809E870
	mov r8, r0
	ldr r0, _080A06B4 @ =0x03005E70
	ldr r4, _080A06B8 @ =0x02020140
	ldr r5, _080A06BC @ =0x00000D8C
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A06C0 @ =0x00011217
	str r0, [sp]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, sb
	bl sub_0809E7A0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A06B4: .4byte 0x03005E70
_080A06B8: .4byte 0x02020140
_080A06BC: .4byte 0x00000D8C
_080A06C0: .4byte 0x00011217

	thumb_func_start SaveNewGame
SaveNewGame: @ 0x080A06C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x38
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	bl sub_0809E870
	adds r7, r0, #0
	cmp r5, #0
	bne _080A06E0
	ldr r0, _080A07F4 @ =0x0202BBF8
	ldrb r5, [r0, #0x1b]
_080A06E0:
	movs r0, #0
	bl SetGameTime
	adds r0, r4, #0
	bl InitPlayConfig
	bl sub_080174D8
	bl sub_0802E708
	bl ClearPermanentFlags
	movs r0, #3
	bl sub_080A10D8
	ldr r4, _080A07F4 @ =0x0202BBF8
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _080A07F8 @ =0xFFFFE00F
	ldrh r1, [r4, #0x2c]
	ands r0, r1
	strh r0, [r4, #0x2c]
	add r0, sp, #0x34
	movs r6, #0
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x30
	ldr r2, _080A07FC @ =0x01000008
	bl CpuSet
	ldr r0, [r4, #0x2c]
	ldr r1, _080A0800 @ =0xFF801FFF
	ands r0, r1
	str r0, [r4, #0x2c]
	strb r5, [r4, #0x1b]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x20
	strb r6, [r0]
	cmp r5, #1
	bne _080A0748
	strb r6, [r4, #0xe]
_080A0748:
	cmp r5, #2
	bne _080A0750
	movs r0, #0xc
	strb r0, [r4, #0xe]
_080A0750:
	cmp r5, #3
	bne _080A0758
	movs r0, #0xd
	strb r0, [r4, #0xe]
_080A0758:
	bl sub_080A036C
	strb r0, [r4, #0x18]
	mov r0, r8
	strb r0, [r4, #0xc]
	bl sub_080A03A8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _080A0804 @ =0xFFFFF07F
	ldrh r2, [r4, #0x2e]
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, #0x2e]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	movs r0, #0
	bl sub_080A0588
	adds r0, r7, #0
	bl sub_080A0594
	mov r0, sp
	adds r0, #0x36
	movs r1, #0
	strh r1, [r0]
	add r4, sp, #0x10
	ldr r2, _080A0808 @ =0x01000012
	adds r1, r4, #0
	bl CpuSet
	adds r6, r4, #0
	adds r4, r7, #0
	adds r4, #0x48
	movs r5, #0x33
_080A07A6:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A07A6
	movs r4, #0
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_0809E9C4
	adds r0, r7, #0
	bl sub_0809F98C
	movs r2, #0xd8
	lsls r2, r2, #4
	adds r0, r7, r2
	bl sub_0809E954
	ldr r0, _080A080C @ =0x00011217
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, r8
	bl sub_0809E7A0
	mov r0, r8
	bl sub_080A05D4
	add sp, #0x38
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A07F4: .4byte 0x0202BBF8
_080A07F8: .4byte 0xFFFFE00F
_080A07FC: .4byte 0x01000008
_080A0800: .4byte 0xFF801FFF
_080A0804: .4byte 0xFFFFF07F
_080A0808: .4byte 0x01000012
_080A080C: .4byte 0x00011217

	thumb_func_start sub_080A0810
sub_080A0810: @ 0x080A0810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	mov sb, r0
	bl sub_0809E870
	adds r7, r0, #0
	movs r0, #3
	bl sub_080A10D8
	ldr r4, _080A08E0 @ =0x0202BBF8
	mov r0, sb
	strb r0, [r4, #0xc]
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	add r1, sp, #0x10
	mov r8, r1
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #0
	ldr r0, _080A08E4 @ =0x0202BD50
	mov sl, r0
	movs r5, #0x33
_080A0850:
	mov r1, sl
	adds r0, r6, r1
	adds r1, r4, #0
	bl sub_080A0A60
	adds r4, #0x24
	adds r6, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A0850
	mov r0, r8
	bl LoadMetaSave
	movs r4, #0
	ldr r6, _080A08E4 @ =0x0202BD50
	movs r5, #0x33
_080A0870:
	adds r0, r4, r6
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	mov r1, r8
	bl MetaSave_SetMetCharacter
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A0870
	movs r4, #0
	mov r0, r8
	bl SaveMetaSave
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_0809E9C4
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809FAEC
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809FB10
	adds r0, r7, #0
	bl sub_080A0594
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809E954
	ldr r0, _080A08E8 @ =0x00011217
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sb
	bl sub_0809E7A0
	mov r0, sb
	bl sub_080A05D4
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A08E0: .4byte 0x0202BBF8
_080A08E4: .4byte 0x0202BD50
_080A08E8: .4byte 0x00011217

	thumb_func_start sub_080A08EC
sub_080A08EC: @ 0x080A08EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	bl sub_0809E918
	adds r7, r0, #0
	bl ClearMenuOverrides
	ldr r1, _080A0990 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A0912
	movs r0, #3
	bl sub_080A10D8
_080A0912:
	ldr r0, _080A0994 @ =0x03005E70
	ldr r4, _080A0998 @ =0x0202BBF8
	ldr r3, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	mov r0, sb
	strb r0, [r4, #0xc]
	bl sub_080174D8
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x48
	ldr r1, _080A099C @ =0x0202BD50
	mov r8, r1
	movs r5, #0x33
_080A093C:
	mov r0, r8
	adds r1, r6, r0
	adds r0, r4, #0
	bl sub_080A0E9C
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A093C
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_0809E9DC
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809E99C
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809FAA4
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809FAD0
	adds r0, r7, #0
	bl sub_080A05B0
	mov r0, sb
	bl sub_080A05D4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0990: .4byte 0x0202BBB8
_080A0994: .4byte 0x03005E70
_080A0998: .4byte 0x0202BBF8
_080A099C: .4byte 0x0202BD50

	thumb_func_start sub_080A09A0
sub_080A09A0: @ 0x080A09A0
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_0809E6FC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A09B4
sub_080A09B4: @ 0x080A09B4
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0809E918
	ldr r1, _080A09D0 @ =0x03005E70
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A09D0: .4byte 0x03005E70

	thumb_func_start sub_080A09D4
sub_080A09D4: @ 0x080A09D4
	push {lr}
	sub sp, #4
	bl sub_0809E918
	ldr r1, _080A09F4 @ =0x03005E70
	ldr r2, _080A09F8 @ =0x00000D88
	adds r0, r0, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #4
	bl _call_via_r3
	ldr r0, [sp]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080A09F4: .4byte 0x03005E70
_080A09F8: .4byte 0x00000D88

	thumb_func_start sub_080A09FC
sub_080A09FC: @ 0x080A09FC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	bgt _080A0A0A
	movs r0, #0
	b _080A0A0C
_080A0A0A:
	movs r0, #1
_080A0A0C:
	bx lr
	.align 2, 0

	thumb_func_start sub_080A0A10
sub_080A0A10: @ 0x080A0A10
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	bgt _080A0A22
	cmp r0, #0
	ble _080A0A2A
	movs r0, #1
	b _080A0A2C
_080A0A22:
	cmp r0, #0xd
	ble _080A0A2A
	movs r0, #1
	b _080A0A2C
_080A0A2A:
	movs r0, #0
_080A0A2C:
	bx lr
	.align 2, 0

	thumb_func_start sub_080A0A30
sub_080A0A30: @ 0x080A0A30
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl sub_080A09A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0A54
	adds r0, r4, #0
	mov r1, sp
	bl sub_080A09B4
	mov r0, sp
	bl sub_080A0A10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A0A56
_080A0A54:
	movs r0, #0
_080A0A56:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A0A60
sub_080A0A60: @ 0x080A0A60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	adds r7, r0, #0
	str r1, [sp, #0x6c]
	mov r1, sp
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x14]
	mov r2, sp
	ldr r0, [r7, #4]
	movs r1, #0x7f
	ldrb r0, [r0, #4]
	ands r1, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r4, [r7]
	cmp r4, #0
	bne _080A0AAC
	add r7, sp, #0x24
	adds r0, r7, #0
	bl ClearUnit
	mov r0, sp
	strb r4, [r0, #0x14]
	mov r1, sp
	adds r0, r5, #0
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
_080A0AAC:
	mov r2, sp
	movs r1, #8
	ldrsb r1, [r7, r1]
	movs r5, #0x1f
	mov r8, r5
	mov r6, r8
	ands r1, r6
	lsls r1, r1, #7
	ldr r3, _080A0E6C @ =0xFFFFF07F
	adds r0, r3, #0
	ldrh r4, [r2]
	ands r0, r4
	orrs r0, r1
	strh r0, [r2]
	movs r5, #0x7f
	mov sb, r5
	mov r1, sb
	ldrb r6, [r7, #9]
	ands r1, r6
	lsls r1, r1, #0xc
	ldr r0, [sp]
	ldr r2, _080A0E70 @ =0xFFF80FFF
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	mov r4, sp
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #3
	ldrh r2, [r4, #2]
	ldr r0, _080A0E74 @ =0xFFFFFE07
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x7f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r2, #0x12
	ldrsb r2, [r7, r2]
	movs r5, #0x3f
	ands r2, r5
	lsls r2, r2, #0xc
	ldr r0, [sp, #4]
	ldr r1, _080A0E78 @ =0xFFFC0FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	movs r4, #0x1f
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r6, [r2, #6]
	ands r0, r6
	orrs r0, r1
	strb r0, [r2, #6]
	mov r1, sp
	movs r0, #0x15
	ldrsb r0, [r7, r0]
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #7
	ldrh r6, [r1, #6]
	ands r3, r6
	orrs r3, r0
	strh r3, [r1, #6]
	mov r3, sp
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	movs r6, #0xf
	adds r1, r2, #0
	ands r1, r6
	lsls r1, r1, #4
	mov sl, r1
	adds r0, r6, #0
	ldrb r1, [r3, #7]
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3, #7]
	lsrs r2, r2, #4
	movs r0, #1
	mov ip, r0
	ands r2, r0
	subs r0, #3
	ldrb r1, [r3, #8]
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #8]
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	ands r1, r4
	lsls r1, r1, #1
	movs r2, #0x3f
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	mov r2, sp
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	mov r3, r8
	ands r1, r3
	lsls r1, r1, #6
	ldr r0, _080A0E7C @ =0xFFFFF83F
	ldrh r3, [r2, #8]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #8]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	movs r0, #7
	ldrb r3, [r2, #9]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #9]
	movs r1, #0x1a
	ldrsb r1, [r7, r1]
	ands r1, r4
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r4, [r2, #0xa]
	ands r0, r4
	orrs r0, r1
	strb r0, [r2, #0xa]
	movs r1, #0x1d
	ldrsb r1, [r7, r1]
	mov r0, r8
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A0E80 @ =0xFFFFFC1F
	ldrh r3, [r2, #0xa]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #0xa]
	mov r3, sp
	ldrh r2, [r7, #0x1e]
	adds r1, r2, #0
	ands r1, r5
	lsls r1, r1, #2
	mov r8, r1
	movs r4, #3
	adds r0, r4, #0
	ldrb r1, [r3, #0xb]
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #0xb]
	lsrs r2, r2, #6
	strb r2, [r3, #0xc]
	ldr r3, _080A0E84 @ =0x00003FFF
	adds r1, r3, #0
	ldrh r2, [r7, #0x20]
	ands r1, r2
	lsls r1, r1, #8
	ldr r0, [sp, #0xc]
	ldr r2, _080A0E88 @ =0xFFC000FF
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0xc]
	mov r2, sp
	ldrh r1, [r7, #0x22]
	ldr r0, _080A0E8C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #6
	mov r8, r0
	ldrh r0, [r2, #0xe]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strh r5, [r2, #0xe]
	lsrs r1, r1, #0xa
	ands r1, r6
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r5, [r2, #0x10]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrh r6, [r7, #0x24]
	ands r3, r6
	lsls r3, r3, #4
	ldr r0, [sp, #0x10]
	ldr r1, _080A0E90 @ =0xFFFC000F
	ands r0, r1
	orrs r0, r3
	str r0, [sp, #0x10]
	mov r1, sp
	ldrh r2, [r7, #0x26]
	lsls r0, r2, #2
	ldrh r3, [r1, #0x12]
	ands r4, r3
	orrs r4, r0
	strh r4, [r1, #0x12]
	ldrb r0, [r1, #3]
	mov r5, sb
	ands r5, r0
	strb r5, [r1, #3]
	ldr r6, _080A0E94 @ =0xFFFFF000
	adds r0, r6, #0
	ldrh r4, [r1, #4]
	ands r0, r4
	strh r0, [r1, #4]
	ldr r0, [r7, #0xc]
	movs r1, #4
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	beq _080A0C90
	mov r3, sp
	mov r0, sp
	ldr r2, _080A0E98 @ =0x00000FFF
	mov sl, r2
	ldrh r0, [r0, #4]
	ands r2, r0
	mov r4, ip
	lsrs r1, r4, #1
	lsls r0, r4, #7
	orrs r0, r5
	strb r0, [r3, #3]
	orrs r1, r2
	mov r5, sl
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0C90:
	ldr r0, [r7, #0xc]
	movs r3, #8
	mov sl, r3
	ands r0, r3
	cmp r0, #0
	beq _080A0CD2
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0CD2:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080A0D14
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, r8
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D14:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080A0D56
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, sl
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D56:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080A0D98
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x10
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0D98:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _080A0DDA
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x20
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0DDA:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080A0E1C
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A0E98 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x40
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A0E1C:
	movs r2, #0
	mov r5, sp
	adds r5, #0x1d
	adds r6, r7, #0
	adds r6, #0x32
	mov r4, sp
	adds r4, #0x15
	adds r3, r7, #0
	adds r3, #0x28
_080A0E2E:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A0E2E
	movs r2, #0
	adds r4, r5, #0
	adds r3, r6, #0
_080A0E42:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A0E42
	mov r0, sp
	ldr r1, [sp, #0x6c]
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x70
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080A0E6A:
	.byte 0x17, 0xE0
_080A0E6C: .4byte 0xFFFFF07F
_080A0E70: .4byte 0xFFF80FFF
_080A0E74: .4byte 0xFFFFFE07
_080A0E78: .4byte 0xFFFC0FFF
_080A0E7C: .4byte 0xFFFFF83F
_080A0E80: .4byte 0xFFFFFC1F
_080A0E84: .4byte 0x00003FFF
_080A0E88: .4byte 0xFFC000FF
_080A0E8C: .4byte 0x000003FF
_080A0E90: .4byte 0xFFFC000F
_080A0E94: .4byte 0xFFFFF000
_080A0E98: .4byte 0x00000FFF

	thumb_func_start sub_080A0E9C
sub_080A0E9C: @ 0x080A0E9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080A10D0 @ =0x03005E70
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0, #0x14]
	bl sub_08018D38
	str r0, [r4]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl GetJobInfo
	str r0, [r4, #4]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #8]
	ldr r0, [sp]
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x19
	strb r3, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x11]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x12]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x14]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x15]
	mov r1, sp
	ldrb r0, [r1, #7]
	lsrs r2, r0, #4
	movs r5, #1
	adds r0, r5, #0
	ldrb r1, [r1, #8]
	ands r0, r1
	lsls r0, r0, #4
	orrs r0, r2
	strb r0, [r4, #0x16]
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x17]
	mov r0, sp
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x18]
	mov r0, sp
	ldrb r0, [r0, #9]
	lsrs r0, r0, #3
	strb r0, [r4, #0x19]
	mov r0, sp
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1a]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1d]
	mov r0, sp
	ldrb r2, [r0, #0xb]
	lsrs r1, r2, #2
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #6
	orrs r0, r1
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x20]
	mov r1, sp
	ldrh r0, [r1, #0xe]
	lsrs r2, r0, #6
	movs r0, #0xf
	ldrb r1, [r1, #0x10]
	ands r0, r1
	lsls r0, r0, #0xa
	orrs r0, r2
	strh r0, [r4, #0x22]
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x24]
	mov r0, sp
	ldrh r0, [r0, #0x12]
	lsrs r0, r0, #2
	strh r0, [r4, #0x26]
	cmp r3, #0x63
	bls _080A0F90
	movs r0, #0xff
	strb r0, [r4, #9]
_080A0F90:
	movs r0, #0
	str r0, [r4, #0xc]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	ldr r3, _080A10D4 @ =0x00000FFF
	adds r0, r3, #0
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _080A0FB0
	movs r0, #5
	str r0, [r4, #0xc]
_080A0FB0:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080A0FCA
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A0FCA:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A0FE6
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0xc]
_080A0FE6:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080A1002
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r4, #0xc]
_080A1002:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A101E
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
_080A101E:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _080A103A
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A103A:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080A1056
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	orrs r0, r1
	str r0, [r4, #0xc]
_080A1056:
	movs r2, #0
	adds r6, r4, #0
	adds r6, #0x32
	mov r7, sp
	adds r7, #0x1d
	movs r1, #0x39
	adds r1, r1, r4
	mov r8, r1
	adds r5, r4, #0
	adds r5, #0x28
	mov r3, sp
	adds r3, #0x15
_080A106E:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A106E
	movs r2, #0
	adds r5, r6, #0
	adds r3, r7, #0
_080A1082:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1082
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08018C40
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r4, #9]
	cmp r0, #0x7f
	bne _080A10AE
	movs r0, #0xff
	strb r0, [r4, #9]
_080A10AE:
	ldrb r0, [r4, #0x10]
	cmp r0, #0x3f
	bne _080A10B8
	movs r0, #0xff
	strb r0, [r4, #0x10]
_080A10B8:
	ldrb r0, [r4, #0x11]
	cmp r0, #0x3f
	bne _080A10C2
	movs r0, #0xff
	strb r0, [r4, #0x11]
_080A10C2:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A10D0: .4byte 0x03005E70
_080A10D4: .4byte 0x00000FFF

	thumb_func_start sub_080A10D8
sub_080A10D8: @ 0x080A10D8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r4, #0
	bl sub_0809E7A0
	cmp r4, #3
	bne _080A10F8
	mov r0, sp
	movs r1, #4
	bl sub_0809E7A0
_080A10F8:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A1100
sub_080A1100: @ 0x080A1100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	ldr r4, _080A121C @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080A120C
	bl sub_0809E478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A120C
	bl sub_080A1938
	add r8, r0
	mov r0, r8
	bl sub_0809E870
	adds r7, r0, #0
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	bl sub_0802F1F8
	ldr r0, _080A1220 @ =0x0203A85C
	adds r1, r7, #0
	adds r1, #0x48
	movs r2, #0x1c
	bl WriteAndVerifySramFast
	ldr r5, _080A1224 @ =0x02020140
	add r0, sp, #0x10
	mov sl, r0
	ldr r6, _080A1228 @ =0x0202BD50
	movs r4, #0x33
_080A115C:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl sub_080A13EC
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A115C
	movs r1, #0x64
	adds r1, r1, r7
	mov sb, r1
	ldr r6, _080A122C @ =0x0202CEC0
	movs r4, #0x31
_080A1178:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl sub_080A13EC
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A1178
	ldr r6, _080A1230 @ =0x0202DCD0
	movs r4, #9
_080A118E:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl sub_080A13EC
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A118E
	movs r4, #0
	ldr r0, _080A1224 @ =0x02020140
	movs r2, #0xb6
	lsls r2, r2, #5
	mov r1, sb
	bl WriteSramFast
	ldr r1, _080A1234 @ =0x00001F1C
	adds r0, r7, r1
	bl sub_0809E954
	ldr r1, _080A1238 @ =0x00001F24
	adds r0, r7, r1
	bl sub_0809E934
	ldr r1, _080A123C @ =0x00001924
	adds r0, r7, r1
	bl sub_0809E9C4
	ldr r1, _080A1240 @ =0x000019EC
	adds r0, r7, r1
	bl sub_0809FAEC
	ldr r1, _080A1244 @ =0x00001E4C
	adds r0, r7, r1
	bl sub_0809FB10
	ldr r1, _080A1248 @ =0x00001724
	adds r0, r7, r1
	bl sub_080A18D8
	mov r0, sl
	bl sub_0804ABB4
	ldr r0, _080A124C @ =0x00001F0C
	adds r1, r7, r0
	mov r0, sl
	movs r2, #0x10
	bl WriteAndVerifySramFast
	ldr r0, _080A1250 @ =0x00020509
	str r0, [sp]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, r8
	bl sub_0809E7A0
	ldr r0, _080A1254 @ =0x0202BBB8
	adds r0, #0x3c
	strb r4, [r0]
	bl sub_080A1948
_080A120C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A121C: .4byte 0x0202BBF8
_080A1220: .4byte 0x0203A85C
_080A1224: .4byte 0x02020140
_080A1228: .4byte 0x0202BD50
_080A122C: .4byte 0x0202CEC0
_080A1230: .4byte 0x0202DCD0
_080A1234: .4byte 0x00001F1C
_080A1238: .4byte 0x00001F24
_080A123C: .4byte 0x00001924
_080A1240: .4byte 0x000019EC
_080A1244: .4byte 0x00001E4C
_080A1248: .4byte 0x00001724
_080A124C: .4byte 0x00001F0C
_080A1250: .4byte 0x00020509
_080A1254: .4byte 0x0202BBB8

	thumb_func_start sub_080A1258
sub_080A1258: @ 0x080A1258
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _080A1344 @ =0x0203ECC4
	ldrb r1, [r1]
	adds r0, r1, r0
	bl sub_0809E918
	adds r6, r0, #0
	ldr r5, _080A1348 @ =0x03005E70
	ldr r4, _080A134C @ =0x0202BBF8
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	adds r0, r6, #0
	adds r0, #0x48
	ldr r1, _080A1350 @ =0x0203A85C
	ldr r3, [r5]
	movs r2, #0x1c
	bl _call_via_r3
	bl sub_0802F208
	bl sub_080174D8
	movs r4, #0
	movs r5, #0
_080A1296:
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, #0x64
	adds r0, r6, r0
	ldr r1, _080A1354 @ =0x0202BD50
	adds r1, r5, r1
	bl sub_080A16C0
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x33
	ble _080A1296
	movs r4, #0
	movs r5, #0
_080A12B2:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r1, _080A1358 @ =0x00000AF4
	adds r0, r0, r1
	adds r0, r6, r0
	ldr r1, _080A135C @ =0x0202CEC0
	adds r1, r5, r1
	bl sub_080A16C0
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x31
	ble _080A12B2
	movs r4, #0
	movs r5, #0
_080A12D0:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r2, _080A1360 @ =0x0000151C
	adds r0, r0, r2
	adds r0, r6, r0
	ldr r1, _080A1364 @ =0x0202DCD0
	adds r1, r5, r1
	bl sub_080A16C0
	adds r5, #0x48
	adds r4, #1
	cmp r4, #9
	ble _080A12D0
	ldr r1, _080A1368 @ =0x000019EC
	adds r0, r6, r1
	bl sub_0809FAA4
	ldr r2, _080A136C @ =0x00001E4C
	adds r0, r6, r2
	bl sub_0809FAD0
	ldr r1, _080A1370 @ =0x00001924
	adds r0, r6, r1
	bl sub_0809E9DC
	ldr r2, _080A1374 @ =0x00001F1C
	adds r0, r6, r2
	bl sub_0809E99C
	ldr r1, _080A1378 @ =0x00001F24
	adds r0, r6, r1
	bl sub_0809E974
	ldr r2, _080A137C @ =0x00001724
	adds r0, r6, r2
	bl sub_080A18F4
	ldr r1, _080A1348 @ =0x03005E70
	ldr r2, _080A1380 @ =0x00001F0C
	adds r0, r6, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x10
	bl _call_via_r3
	mov r0, sp
	bl sub_0804ABF4
	ldr r0, _080A134C @ =0x0202BBF8
	ldrb r0, [r0, #0xc]
	bl sub_080A09D4
	bl sub_080A0588
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1344: .4byte 0x0203ECC4
_080A1348: .4byte 0x03005E70
_080A134C: .4byte 0x0202BBF8
_080A1350: .4byte 0x0203A85C
_080A1354: .4byte 0x0202BD50
_080A1358: .4byte 0x00000AF4
_080A135C: .4byte 0x0202CEC0
_080A1360: .4byte 0x0000151C
_080A1364: .4byte 0x0202DCD0
_080A1368: .4byte 0x000019EC
_080A136C: .4byte 0x00001E4C
_080A1370: .4byte 0x00001924
_080A1374: .4byte 0x00001F1C
_080A1378: .4byte 0x00001F24
_080A137C: .4byte 0x00001724
_080A1380: .4byte 0x00001F0C

	thumb_func_start sub_080A1384
sub_080A1384: @ 0x080A1384
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0809E478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A13C8
	cmp r4, #3
	bne _080A13C8
	ldr r4, _080A13CC @ =0x0203ECC4
	bl sub_080A1918
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl sub_0809E6FC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A13D0
	bl sub_080A1938
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl sub_0809E6FC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A13D0
	movs r0, #0x7f
	strb r0, [r4]
_080A13C8:
	movs r0, #0
	b _080A13D2
	.align 2, 0
_080A13CC: .4byte 0x0203ECC4
_080A13D0:
	movs r0, #1
_080A13D2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A13D8
sub_080A13D8: @ 0x080A13D8
	push {lr}
	ldr r2, _080A13E8 @ =0x0203ECC4
	ldrb r2, [r2]
	adds r0, r2, r0
	bl sub_080A09B4
	pop {r0}
	bx r0
	.align 2, 0
_080A13E8: .4byte 0x0203ECC4

	thumb_func_start sub_080A13EC
sub_080A13EC: @ 0x080A13EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	mov ip, r1
	ldr r0, [r6]
	cmp r0, #0
	bne _080A1406
	strb r0, [r1]
	b _080A1690
_080A1406:
	ldrb r0, [r0, #4]
	mov r1, ip
	strb r0, [r1]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	strb r0, [r1, #1]
	movs r1, #8
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x24
	movs r4, #0x1f
	ands r1, r4
	movs r3, #0x20
	rsbs r3, r3, #0
	adds r0, r3, #0
	ldrb r5, [r2]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6, #9]
	mov r7, ip
	strb r0, [r7, #0x10]
	ldr r0, [r6, #0xc]
	str r0, [r7, #4]
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A16A0 @ =0xFFFFF81F
	ldrh r2, [r7, #0x24]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x24]
	movs r1, #0x3f
	ldrb r5, [r6, #0x11]
	ands r1, r5
	lsls r1, r1, #0xb
	ldr r0, [r7, #0x24]
	ldr r2, _080A16A4 @ =0xFFFE07FF
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x24]
	ldrb r0, [r6, #0x12]
	strb r0, [r7, #0xe]
	ldrb r0, [r6, #0x13]
	strb r0, [r7, #0xf]
	movs r1, #0x14
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x26
	ands r1, r4
	lsls r1, r1, #1
	movs r0, #0x3f
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x15
	ldrsb r1, [r6, r1]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r0, _080A16A8 @ =0xFFFFF83F
	mov r5, ip
	ldrh r5, [r5, #0x26]
	ands r0, r5
	orrs r0, r1
	mov r7, ip
	strh r0, [r7, #0x26]
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	movs r0, #0x27
	add r0, ip
	mov r8, r0
	lsls r1, r1, #3
	movs r5, #7
	mov sb, r5
	movs r0, #7
	mov r7, r8
	ldrb r7, [r7]
	ands r0, r7
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	mov r1, ip
	adds r1, #0x28
	ands r0, r4
	ldrb r5, [r1]
	ands r3, r5
	orrs r3, r0
	strb r3, [r1]
	movs r1, #0x18
	ldrsb r1, [r6, r1]
	ands r1, r2
	lsls r1, r1, #5
	ldr r0, _080A16AC @ =0xFFFFFC1F
	mov r7, ip
	ldrh r7, [r7, #0x28]
	ands r0, r7
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x28]
	movs r1, #0x19
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x29
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r2, #0x1a
	ldrsb r2, [r6, r2]
	movs r3, #0x1f
	ands r2, r3
	lsls r2, r2, #0xf
	mov r4, ip
	ldr r0, [r4, #0x28]
	ldr r1, _080A16B0 @ =0xFFF07FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0x28]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #0x2a
	mov r5, sb
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0x71
	rsbs r0, r0, #0
	ldrb r7, [r4]
	ands r0, r7
	orrs r0, r1
	strb r0, [r4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #7
	ldr r0, _080A16B4 @ =0xFFFFFC7F
	mov r1, ip
	ldrh r1, [r1, #0x2a]
	ands r0, r1
	orrs r0, r2
	mov r2, ip
	strh r0, [r2, #0x2a]
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #1
	ands r1, r5
	lsls r1, r1, #2
	movs r0, #0x1d
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	orrs r0, r1
	lsrs r2, r2, #4
	lsls r2, r2, #5
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldrb r0, [r6, #0x1b]
	mov r7, ip
	strb r0, [r7, #3]
	movs r1, #0x1d
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x2c
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x7f
	ldrb r4, [r6, #0x1c]
	ands r1, r4
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #7
	orrs r1, r0
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	ldr r2, _080A16B8 @ =0x00003FFF
	adds r1, r2, #0
	ldrh r5, [r6, #0x1e]
	ands r1, r5
	movs r0, #6
	ands r0, r3
	lsls r0, r0, #0xd
	orrs r1, r0
	strh r1, [r7, #8]
	adds r1, r2, #0
	ldrh r7, [r6, #0x20]
	ands r1, r7
	movs r0, #0x18
	ands r0, r3
	lsls r0, r0, #0xb
	orrs r1, r0
	mov r0, ip
	strh r1, [r0, #0xa]
	adds r1, r2, #0
	ldrh r4, [r6, #0x22]
	ands r1, r4
	movs r0, #0x60
	ands r0, r3
	lsls r0, r0, #9
	orrs r1, r0
	mov r5, ip
	strh r1, [r5, #0xc]
	ldrh r7, [r6, #0x24]
	ands r2, r7
	lsls r2, r2, #4
	ldr r0, [r5, #0x2c]
	ldr r1, _080A16BC @ =0xFFFC000F
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #0x2c]
	ldrh r0, [r6, #0x26]
	lsls r1, r0, #2
	movs r0, #3
	ldrh r2, [r5, #0x2e]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2e]
	movs r2, #0
	adds r5, #0x1a
	adds r7, r6, #0
	adds r7, #0x32
	movs r3, #0x42
	adds r3, r3, r6
	mov r8, r3
	adds r4, r6, #0
	adds r4, #0x43
	str r4, [sp, #0xc]
	movs r0, #0x21
	add r0, ip
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x44
	str r1, [sp, #0x10]
	movs r3, #0x22
	add r3, ip
	mov sl, r3
	adds r4, #2
	str r4, [sp, #0x14]
	mov r0, ip
	adds r0, #0x23
	str r0, [sp]
	subs r1, #4
	str r1, [sp, #8]
	adds r3, r6, #0
	adds r3, #0x46
	str r3, [sp, #0x18]
	mov r4, ip
	adds r4, #0x31
	str r4, [sp, #4]
	ldrb r1, [r6, #0xa]
	mov r0, sp
	strb r1, [r0, #0x1c]
	subs r4, #0x1f
	subs r3, #0x1e
_080A1638:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A1638
	movs r2, #0
	adds r4, r5, #0
	adds r3, r7, #0
_080A164C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A164C
	mov r2, r8
	ldrb r0, [r2]
	mov r3, ip
	strb r0, [r3, #2]
	ldr r4, [sp, #0xc]
	ldrb r0, [r4]
	mov r5, sb
	strb r0, [r5]
	ldr r7, [sp, #0x10]
	ldrb r0, [r7]
	mov r1, sl
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldr r3, [sp]
	strb r0, [r3]
	ldr r4, [sp, #8]
	ldrh r0, [r4]
	mov r5, ip
	strh r0, [r5, #0x32]
	ldr r7, [sp, #0x18]
	ldrb r0, [r7]
	ldr r1, [sp, #4]
	strb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x1c]
	strb r2, [r5, #0x11]
_080A1690:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A16A0: .4byte 0xFFFFF81F
_080A16A4: .4byte 0xFFFE07FF
_080A16A8: .4byte 0xFFFFF83F
_080A16AC: .4byte 0xFFFFFC1F
_080A16B0: .4byte 0xFFF07FFF
_080A16B4: .4byte 0xFFFFFC7F
_080A16B8: .4byte 0x00003FFF
_080A16BC: .4byte 0xFFFC000F

	thumb_func_start sub_080A16C0
sub_080A16C0: @ 0x080A16C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r6, r1, #0
	ldr r1, _080A18D0 @ =0x03005E70
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x34
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0]
	bl sub_08018D38
	str r0, [r6]
	mov r0, sp
	ldrb r0, [r0, #1]
	bl GetJobInfo
	str r0, [r6, #4]
	add r0, sp, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #8]
	mov r0, sp
	ldrb r0, [r0, #0x10]
	strb r0, [r6, #9]
	ldr r0, [sp, #4]
	str r0, [r6, #0xc]
	mov r0, sp
	ldrh r0, [r0, #0x24]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x10]
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x11]
	mov r0, sp
	ldrb r0, [r0, #0xe]
	strb r0, [r6, #0x12]
	mov r0, sp
	ldrb r0, [r0, #0xf]
	strb r0, [r6, #0x13]
	mov r0, sp
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x14]
	mov r0, sp
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x15]
	mov r0, sp
	adds r0, #0x27
	ldrb r0, [r0]
	lsrs r0, r0, #3
	strb r0, [r6, #0x16]
	add r0, sp, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x28]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x18]
	mov r0, sp
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x19]
	ldr r0, [sp, #0x28]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x1a]
	mov r0, sp
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #0x19
	adds r2, r6, #0
	adds r2, #0x30
	mov r0, sp
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r1, r0, #0x1b
	adds r2, #1
	lsrs r0, r0, #5
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r6, #0x1b]
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r6, #0x1d]
	add r0, sp, #0x30
	ldrb r2, [r0]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r6, #0x1c]
	mov r0, sp
	ldrh r5, [r0, #8]
	ldr r1, _080A18D4 @ =0x00003FFF
	adds r0, r1, #0
	ands r0, r5
	strh r0, [r6, #0x1e]
	mov r0, sp
	ldrh r4, [r0, #0xa]
	adds r0, r1, #0
	ands r0, r4
	strh r0, [r6, #0x20]
	mov r0, sp
	ldrh r3, [r0, #0xc]
	ands r1, r3
	strh r1, [r6, #0x22]
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r6, #0x24]
	mov r0, sp
	ldrh r1, [r0, #0x2e]
	lsrs r0, r1, #2
	strh r0, [r6, #0x26]
	movs r1, #0x80
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r5
	lsrs r0, r0, #0xd
	orrs r0, r1
	adds r1, r2, #0
	ands r1, r4
	lsrs r1, r1, #0xb
	orrs r1, r0
	ands r2, r3
	lsrs r2, r2, #9
	orrs r2, r1
	adds r0, r6, #0
	adds r0, #0x39
	strb r2, [r0]
	movs r2, #0
	movs r0, #0x1a
	add r0, sp
	mov sl, r0
	mov r1, sp
	adds r1, #0x21
	str r1, [sp, #0x34]
	mov r0, sp
	adds r0, #0x22
	str r0, [sp, #0x38]
	adds r1, #2
	str r1, [sp, #0x3c]
	adds r0, #0xf
	str r0, [sp, #0x40]
	adds r4, r6, #0
	adds r4, #0x28
	mov r3, sp
	adds r3, #0x12
_080A182C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A182C
	movs r2, #0
	adds r5, r6, #0
	adds r5, #0x42
	movs r1, #0x43
	adds r1, r1, r6
	mov ip, r1
	adds r7, r6, #0
	adds r7, #0x44
	movs r0, #0x45
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x40
	adds r1, r1, r6
	mov sb, r1
	adds r0, r6, #0
	adds r0, #0x46
	str r0, [sp, #0x44]
	adds r4, r6, #0
	adds r4, #0x32
	mov r3, sl
_080A1862:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1862
	mov r0, sp
	ldrb r0, [r0, #2]
	strb r0, [r5]
	ldr r1, [sp, #0x34]
	ldrb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	ldr r1, [sp, #0x38]
	ldrb r0, [r1]
	strb r0, [r7]
	ldr r1, [sp, #0x3c]
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #0x32]
	mov r1, sb
	strh r0, [r1]
	ldr r1, [sp, #0x40]
	ldrb r0, [r1]
	ldr r1, [sp, #0x44]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #0x11]
	strb r0, [r6, #0xa]
	ldrb r0, [r6, #9]
	cmp r0, #0x7f
	bne _080A18AC
	movs r0, #0xff
	strb r0, [r6, #9]
_080A18AC:
	ldrb r0, [r6, #0x10]
	cmp r0, #0x3f
	bne _080A18B6
	movs r0, #0xff
	strb r0, [r6, #0x10]
_080A18B6:
	ldrb r0, [r6, #0x11]
	cmp r0, #0x3f
	bne _080A18C0
	movs r0, #0xff
	strb r0, [r6, #0x11]
_080A18C0:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A18D0: .4byte 0x03005E70
_080A18D4: .4byte 0x00003FFF

	thumb_func_start sub_080A18D8
sub_080A18D8: @ 0x080A18D8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetTrap
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A18F4
sub_080A18F4: @ 0x080A18F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A1914 @ =0x03005E70
	movs r0, #0
	bl GetTrap
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	ldr r3, [r4]
	adds r0, r5, #0
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1914: .4byte 0x03005E70

	thumb_func_start sub_080A1918
sub_080A1918: @ 0x080A1918
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	mov r0, sp
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A1930
	movs r0, #0
	b _080A1932
_080A1930:
	movs r0, #1
_080A1932:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start sub_080A1938
sub_080A1938: @ 0x080A1938
	push {lr}
	bl sub_080A1918
	adds r1, r0, #0
	movs r0, #1
	subs r0, r0, r1
	pop {r1}
	bx r1

	thumb_func_start sub_080A1948
sub_080A1948: @ 0x080A1948
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadMetaSave
	movs r2, #0
	mov r1, sp
	adds r1, #0x63
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A1960
	movs r2, #1
_080A1960:
	strb r2, [r1]
	mov r0, sp
	bl sub_0809E598
	add sp, #0x64
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A1970
sub_080A1970: @ 0x080A1970
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _080A1990 @ =0x03005E70
	ldr r4, _080A1994 @ =0x02020140
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080C57D4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A1990: .4byte 0x03005E70
_080A1994: .4byte 0x02020140

	thumb_func_start sub_080A1998
sub_080A1998: @ 0x080A1998
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl sub_0809E6D8
	adds r1, r5, #0
	bl sub_080A1970
	ldr r1, [r4, #0xc]
	cmp r1, r0
	bne _080A19B4
	movs r0, #1
	b _080A19B6
_080A19B4:
	movs r0, #0
_080A19B6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080A19BC
sub_080A19BC: @ 0x080A19BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl sub_0809E6D8
	adds r1, r5, #0
	bl sub_080A1970
	str r0, [r4, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A19D8
sub_080A19D8: @ 0x080A19D8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080A1AA0 @ =0x0202BD50
	movs r5, #0x33
_080A19E0:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A19F8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_080A1970
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A19F8:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A19E0
	ldr r4, _080A1AA4 @ =0x0202CEC0
	movs r5, #0x31
_080A1A04:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A1A1C
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_080A1970
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A1A1C:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A1A04
	ldr r4, _080A1AA8 @ =0x0202DCD0
	movs r5, #9
_080A1A28:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A1A40
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_080A1970
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A1A40:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A1A28
	bl sub_08079924
	adds r4, r0, #0
	bl sub_0807992C
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl sub_080A1970
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_08079930
	adds r4, r0, #0
	bl sub_08079938
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl sub_080A1970
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	bl GetTrap
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_080A1970
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A1AA0: .4byte 0x0202BD50
_080A1AA4: .4byte 0x0202CEC0
_080A1AA8: .4byte 0x0202DCD0

	thumb_func_start sub_080A1AAC
sub_080A1AAC: @ 0x080A1AAC
	sub sp, #8
	add sp, #8
	bx lr
	.align 2, 0

	thumb_func_start sub_080A1AB4
sub_080A1AB4: @ 0x080A1AB4
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_0809E6FC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A1AC8
sub_080A1AC8: @ 0x080A1AC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	movs r0, #5
	bl sub_0809E870
	mov r8, r0
	add r0, sp, #0x50
	movs r4, #0
	strh r4, [r0]
	add r5, sp, #0x10
	ldr r2, _080A1BFC @ =0x01000012
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x52
	strh r4, [r0]
	add r4, sp, #0x34
	ldr r2, _080A1C00 @ =0x01000005
	adds r1, r4, #0
	bl CpuSet
	movs r7, #0
	mov sb, r5
	add r0, sp, #0x54
	mov sl, r0
	mov r1, sp
	adds r1, #0x40
	str r1, [sp, #0x58]
	mov r3, sp
	adds r3, #0x44
	str r3, [sp, #0x5c]
	mov r6, r8
_080A1B12:
	movs r0, #0xc8
	muls r0, r7, r0
	adds r0, #0x14
	mov r1, r8
	adds r4, r1, r0
	movs r5, #4
_080A1B1E:
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A1B1E
	add r0, sp, #0x34
	adds r1, r6, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	adds r6, #0xc8
	adds r7, #1
	cmp r7, #9
	ble _080A1B12
	movs r0, #7
	mov r3, sl
	strh r0, [r3]
	movs r1, #0xfa
	lsls r1, r1, #3
	add r1, r8
	mov r0, sl
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r6, [sp, #0x58]
	mov sl, r6
	ldr r0, _080A1C04 @ =0x0840F438
	movs r1, #3
	mov sb, r1
	ldr r5, _080A1C08 @ =0x000007D4
	add r5, r8
	adds r3, r0, #4
	mov r8, r3
	adds r4, r0, #0
	movs r7, #9
_080A1B6C:
	ldrb r3, [r4]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1e
	mov r6, sb
	ands r0, r6
	movs r1, #4
	rsbs r1, r1, #0
	adds r2, r1, #0
	mov r6, sl
	ldrb r6, [r6]
	ands r2, r6
	orrs r2, r0
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #2
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r2, r1
	orrs r2, r0
	movs r1, #0x10
	ands r1, r3
	movs r3, #0x11
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	mov r6, sl
	strb r2, [r6]
	ldr r2, [r4]
	lsrs r2, r2, #5
	lsls r2, r2, #5
	ldr r0, [sp, #0x40]
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0x40]
	mov r0, r8
	ldr r1, [sp, #0x5c]
	bl sub_0803D948
	mov r0, sl
	adds r1, r5, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r5, #0x10
	movs r0, #0x10
	add r8, r0
	adds r4, #0x10
	subs r7, #1
	cmp r7, #0
	bge _080A1B6C
	ldr r0, _080A1C0C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1BFC: .4byte 0x01000012
_080A1C00: .4byte 0x01000005
_080A1C04: .4byte 0x0840F438
_080A1C08: .4byte 0x000007D4
_080A1C0C: .4byte 0x00020112

	thumb_func_start sub_080A1C10
sub_080A1C10: @ 0x080A1C10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl sub_0809E918
	ldr r2, _080A1C38 @ =0x03005E70
	movs r1, #0xc8
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	ldrb r0, [r5]
	cmp r0, #0
	beq _080A1C3C
	movs r0, #1
	b _080A1C3E
	.align 2, 0
_080A1C38: .4byte 0x03005E70
_080A1C3C:
	movs r0, #0
_080A1C3E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080A1C44
sub_080A1C44: @ 0x080A1C44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl sub_0809E918
	ldr r2, _080A1C78 @ =0x03005E70
	movs r1, #0xc8
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r4, _080A1C7C @ =0x0203ECC8
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0xc8
	bl _call_via_r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A1C80
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803D948
	movs r0, #1
	b _080A1C82
	.align 2, 0
_080A1C78: .4byte 0x03005E70
_080A1C7C: .4byte 0x0203ECC8
_080A1C80:
	movs r0, #0
_080A1C82:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080A1C88
sub_080A1C88: @ 0x080A1C88
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl sub_0809E870
	adds r1, r0, #0
	movs r0, #0xc8
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	ldr r0, _080A1CC0 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CC0: .4byte 0x00020112

	thumb_func_start sub_080A1CC4
sub_080A1CC4: @ 0x080A1CC4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #5
	bl sub_0809E870
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r1, #0
	strh r1, [r0]
	ldr r5, _080A1D0C @ =0x0203ECC8
	ldr r2, _080A1D10 @ =0x01000064
	adds r1, r5, #0
	bl CpuSet
	movs r0, #0xc8
	muls r0, r6, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1D14 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D0C: .4byte 0x0203ECC8
_080A1D10: .4byte 0x01000064
_080A1D14: .4byte 0x00020112

	thumb_func_start sub_080A1D18
sub_080A1D18: @ 0x080A1D18
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	movs r0, #5
	bl sub_0809E918
	adds r4, r0, #0
	movs r0, #5
	bl sub_0809E870
	adds r5, r0, #0
	ldr r1, _080A1D84 @ =0x03005E70
	movs r0, #0xc8
	mov r8, r0
	mov r0, r8
	muls r0, r6, r0
	adds r4, r4, r0
	ldr r6, _080A1D88 @ =0x0203ECC8
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xc8
	bl _call_via_r3
	mov r1, r8
	mov r0, sb
	muls r0, r1, r0
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1D8C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D84: .4byte 0x03005E70
_080A1D88: .4byte 0x0203ECC8
_080A1D8C: .4byte 0x00020112

	thumb_func_start sub_080A1D90
sub_080A1D90: @ 0x080A1D90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov sl, r1
	movs r0, #5
	bl sub_0809E918
	adds r5, r0, #0
	movs r0, #5
	bl sub_0809E870
	adds r6, r0, #0
	ldr r0, _080A1E1C @ =0x03005E70
	mov sb, r0
	movs r4, #0xc8
	mov r7, r8
	muls r7, r4, r7
	adds r0, r5, r7
	mov r1, sb
	ldr r3, [r1]
	ldr r1, _080A1E20 @ =0x0203ECC8
	movs r2, #0xc8
	bl _call_via_r3
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	adds r5, r5, r4
	ldr r1, _080A1E24 @ =0x0203ED90
	mov r8, r1
	mov r0, sb
	ldr r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	adds r4, r6, r4
	ldr r0, _080A1E20 @ =0x0203ECC8
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	adds r6, r6, r7
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1E28 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E1C: .4byte 0x03005E70
_080A1E20: .4byte 0x0203ECC8
_080A1E24: .4byte 0x0203ED90
_080A1E28: .4byte 0x00020112

	thumb_func_start sub_080A1E2C
sub_080A1E2C: @ 0x080A1E2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #5
	bl sub_0809E870
	adds r5, r0, #0
	movs r0, #0xc8
	muls r4, r0, r4
	adds r1, r5, r4
	adds r0, r6, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	adds r4, #0x14
	adds r5, r5, r4
	mov r4, r8
	movs r6, #4
_080A1E58:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080A0A60
	adds r5, #0x24
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _080A1E58
	ldr r0, _080A1E88 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E88: .4byte 0x00020112

	thumb_func_start sub_080A1E8C
sub_080A1E8C: @ 0x080A1E8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #5
	bl sub_0809E918
	adds r7, r0, #0
	ldr r1, _080A1EE0 @ =0x03005E70
	movs r0, #0xc8
	mov r4, r8
	muls r4, r0, r4
	adds r0, r7, r4
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0xa
	bl _call_via_r3
	adds r4, #0x14
	adds r4, r7, r4
	movs r5, #4
_080A1EBA:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080A0E9C
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A1EBA
	movs r0, #0xc8
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A1EE4
	movs r0, #1
	b _080A1EE6
	.align 2, 0
_080A1EE0: .4byte 0x03005E70
_080A1EE4:
	movs r0, #0
_080A1EE6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080A1EF0
sub_080A1EF0: @ 0x080A1EF0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl sub_0809E870
	adds r1, r0, #0
	ldr r0, _080A1F24 @ =0x000007D4
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xa0
	bl WriteAndVerifySramFast
	ldr r0, _080A1F28 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F24: .4byte 0x000007D4
_080A1F28: .4byte 0x00020112

	thumb_func_start sub_080A1F2C
sub_080A1F2C: @ 0x080A1F2C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl sub_0809E918
	ldr r1, _080A1F4C @ =0x03005E70
	ldr r2, _080A1F50 @ =0x000007D4
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0xa0
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F4C: .4byte 0x03005E70
_080A1F50: .4byte 0x000007D4

	thumb_func_start sub_080A1F54
sub_080A1F54: @ 0x080A1F54
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl sub_0809E870
	adds r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r0, _080A1F8C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_0809E7A0
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F8C: .4byte 0x00020112

	thumb_func_start sub_080A1F90
sub_080A1F90: @ 0x080A1F90
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl sub_0809E918
	ldr r1, _080A1FB4 @ =0x03005E70
	movs r2, #0xfa
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #2
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1FB4: .4byte 0x03005E70

	thumb_func_start sub_080A1FB8
sub_080A1FB8: @ 0x080A1FB8
	push {r4, lr}
	sub sp, #0xc
	movs r0, #5
	bl sub_080A1AB4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A1FCE
	b _080A1FE6
_080A1FCA:
	movs r0, #1
	b _080A1FE8
_080A1FCE:
	movs r4, #0
_080A1FD0:
	adds r0, r4, #0
	mov r1, sp
	bl sub_080A1C44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080A1FCA
	adds r4, #1
	cmp r4, #9
	ble _080A1FD0
_080A1FE6:
	movs r0, #0
_080A1FE8:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A1FF0
sub_080A1FF0: @ 0x080A1FF0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080A2040 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r0, r4
	ldrb r3, [r5]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2010
	movs r2, #1
_080A2010:
	lsls r2, r2, #1
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2020
	adds r2, #1
_080A2020:
	lsls r2, r2, #1
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _080A202A
	adds r2, #1
_080A202A:
	lsls r2, r2, #1
	subs r0, r5, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2036
	adds r2, #1
_080A2036:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2040: .4byte 0x0202E3E0

	thumb_func_start sub_080A2044
sub_080A2044: @ 0x080A2044
	cmp r0, #0x36
	beq _080A2056
	cmp r0, #0x36
	bgt _080A2052
	cmp r0, #0
	beq _080A2056
	b _080A2058
_080A2052:
	cmp r0, #0x3d
	bne _080A2058
_080A2056:
	movs r0, #0x15
_080A2058:
	bx lr
	.align 2, 0

	thumb_func_start sub_080A205C
sub_080A205C: @ 0x080A205C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A20EC @ =0x0202E3E0
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_080A2044
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_080A2044
	cmp r0, r7
	bne _080A2092
	movs r4, #1
_080A2092:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_080A2044
	cmp r0, r7
	bne _080A20AC
	adds r4, #1
_080A20AC:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl sub_080A2044
	cmp r0, r7
	bne _080A20C4
	adds r4, #1
_080A20C4:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl sub_080A2044
	cmp r0, r7
	bne _080A20DE
	adds r4, #1
_080A20DE:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A20EC: .4byte 0x0202E3E0

	thumb_func_start sub_080A20F0
sub_080A20F0: @ 0x080A20F0
	cmp r0, #0x17
	beq _080A2106
	cmp r0, #0x17
	bgt _080A20FE
	cmp r0, #0
	beq _080A2106
	b _080A2108
_080A20FE:
	cmp r0, #0x1a
	beq _080A2106
	cmp r0, #0x3f
	bne _080A2108
_080A2106:
	movs r0, #0x3c
_080A2108:
	bx lr
	.align 2, 0

	thumb_func_start sub_080A210C
sub_080A210C: @ 0x080A210C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A219C @ =0x0202E3E0
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_080A20F0
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_080A20F0
	cmp r0, r7
	bne _080A2142
	movs r4, #1
_080A2142:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_080A20F0
	cmp r0, r7
	bne _080A215C
	adds r4, #1
_080A215C:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl sub_080A20F0
	cmp r0, r7
	bne _080A2174
	adds r4, #1
_080A2174:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl sub_080A20F0
	cmp r0, r7
	bne _080A218E
	adds r4, #1
_080A218E:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A219C: .4byte 0x0202E3E0

	thumb_func_start sub_080A21A0
sub_080A21A0: @ 0x080A21A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	ldr r2, _080A2240 @ =0x0202E3E0
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A21CA
	cmp r0, #0x15
	beq _080A21CA
	cmp r0, #0x36
	beq _080A21CA
	cmp r0, #0x16
	beq _080A21CA
	cmp r0, #0x13
	bne _080A21CC
_080A21CA:
	adds r3, #1
_080A21CC:
	lsls r3, r3, #1
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, r1, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A21F0
	cmp r0, #0x15
	beq _080A21F0
	cmp r0, #0x36
	beq _080A21F0
	cmp r0, #0x16
	beq _080A21F0
	cmp r0, #0x13
	bne _080A21F2
_080A21F0:
	adds r3, #1
_080A21F2:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r0, [r0, #1]
	cmp r0, #0x10
	beq _080A2212
	cmp r0, #0x15
	beq _080A2212
	cmp r0, #0x36
	beq _080A2212
	cmp r0, #0x16
	beq _080A2212
	cmp r0, #0x13
	bne _080A2214
_080A2212:
	adds r3, #1
_080A2214:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A2236
	cmp r0, #0x15
	beq _080A2236
	cmp r0, #0x36
	beq _080A2236
	cmp r0, #0x16
	beq _080A2236
	cmp r0, #0x13
	bne _080A2238
_080A2236:
	adds r3, #1
_080A2238:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2240: .4byte 0x0202E3E0

	thumb_func_start sub_080A2244
sub_080A2244: @ 0x080A2244
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080A227C @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, r0, r4
	ldrb r3, [r2]
	subs r0, r2, #1
	ldrb r6, [r0]
	cmp r6, r3
	beq _080A2264
	ldrb r5, [r2, #1]
	cmp r5, r3
	bne _080A229E
_080A2264:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2278
	cmp r2, #0x36
	beq _080A2278
	cmp r2, #0x16
	bne _080A2280
_080A2278:
	movs r0, #4
	b _080A2364
	.align 2, 0
_080A227C: .4byte 0x0202E3E0
_080A2280:
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _080A2292
	cmp r0, #0x36
	beq _080A2292
	cmp r0, #0x16
	bne _080A2296
_080A2292:
	movs r0, #0
	b _080A2364
_080A2296:
	cmp r2, #0xf
	bne _080A2362
	movs r0, #0xc
	b _080A2364
_080A229E:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, r3
	beq _080A22B4
	ldr r0, [r1, #4]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _080A22E4
_080A22B4:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A22C2
	cmp r0, #0x36
	beq _080A22C2
	cmp r0, #0x16
	bne _080A22C6
_080A22C2:
	movs r0, #2
	b _080A2364
_080A22C6:
	adds r1, r6, #0
	cmp r1, #0x15
	beq _080A22D4
	cmp r1, #0x36
	beq _080A22D4
	cmp r1, #0x16
	bne _080A22D8
_080A22D4:
	movs r0, #6
	b _080A2364
_080A22D8:
	cmp r0, #0xf
	bne _080A22E0
	movs r0, #0xd
	b _080A2364
_080A22E0:
	movs r0, #9
	b _080A2364
_080A22E4:
	subs r0, r1, #1
	ldrb r5, [r0]
	cmp r5, r3
	beq _080A22F2
	ldrb r4, [r2, #1]
	cmp r4, r3
	bne _080A2324
_080A22F2:
	subs r0, r2, #1
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2302
	cmp r2, #0x36
	beq _080A2302
	cmp r2, #0x16
	bne _080A2306
_080A2302:
	movs r0, #5
	b _080A2364
_080A2306:
	ldrb r0, [r1, #1]
	cmp r0, #0x15
	beq _080A2314
	cmp r0, #0x36
	beq _080A2314
	cmp r0, #0x16
	bne _080A2318
_080A2314:
	movs r0, #1
	b _080A2364
_080A2318:
	cmp r2, #0xf
	bne _080A2320
	movs r0, #0xe
	b _080A2364
_080A2320:
	movs r0, #0xa
	b _080A2364
_080A2324:
	ldrb r1, [r1, #1]
	cmp r1, r3
	beq _080A2332
	subs r0, r2, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2362
_080A2332:
	adds r1, r4, #0
	cmp r1, #0x15
	beq _080A2340
	cmp r1, #0x36
	beq _080A2340
	cmp r1, #0x16
	bne _080A2344
_080A2340:
	movs r0, #3
	b _080A2364
_080A2344:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A2352
	cmp r0, #0x36
	beq _080A2352
	cmp r0, #0x16
	bne _080A2356
_080A2352:
	movs r0, #7
	b _080A2364
_080A2356:
	cmp r1, #0xf
	bne _080A235E
	movs r0, #0xf
	b _080A2364
_080A235E:
	movs r0, #0xb
	b _080A2364
_080A2362:
	movs r0, #8
_080A2364:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A236C
sub_080A236C: @ 0x080A236C
	adds r2, r0, #0
	ldr r0, _080A23A4 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldr r0, [r1, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldr r0, [r1]
	adds r1, r2, r0
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldrb r1, [r1, #1]
	cmp r1, #0x2d
	bne _080A23A8
_080A239E:
	movs r0, #0x12
	b _080A23AA
	.align 2, 0
_080A23A4: .4byte 0x0202E3E0
_080A23A8:
	movs r0, #0x11
_080A23AA:
	bx lr

	thumb_func_start sub_080A23AC
sub_080A23AC: @ 0x080A23AC
	ldr r2, _080A23C4 @ =0x0202E3E0
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	cmp r1, #0x1e
	bne _080A23C8
	movs r0, #0x16
	b _080A23D6
	.align 2, 0
_080A23C4: .4byte 0x0202E3E0
_080A23C8:
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080A23D4
	movs r0, #7
	b _080A23D6
_080A23D4:
	movs r0, #0x17
_080A23D6:
	bx lr

	thumb_func_start sub_080A23D8
sub_080A23D8: @ 0x080A23D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _080A2420 @ =0x0202E3E0
	ldr r0, [r7]
	lsls r6, r1, #2
	adds r2, r6, r0
	ldr r0, [r2]
	adds r0, r4, r0
	ldrb r1, [r0, #1]
	cmp r1, #0x13
	beq _080A241C
	subs r0, #1
	ldrb r3, [r0]
	cmp r3, #0x13
	beq _080A241C
	ldr r0, [r2, #4]
	adds r0, r0, r4
	ldrb r5, [r0]
	cmp r5, #0x13
	beq _080A242C
	subs r0, r2, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x13
	beq _080A242C
	cmp r1, #0x10
	beq _080A242C
	cmp r3, #0x10
	beq _080A242C
	cmp r5, #0x10
	beq _080A241C
	cmp r0, #0x10
	bne _080A2424
_080A241C:
	movs r0, #0x10
	b _080A244C
	.align 2, 0
_080A2420: .4byte 0x0202E3E0
_080A2424:
	cmp r1, #0x16
	beq _080A242C
	cmp r3, #0x16
	bne _080A2430
_080A242C:
	movs r0, #0x18
	b _080A244C
_080A2430:
	ldr r0, [r7]
	adds r1, r6, r0
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _080A244A
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _080A244C
_080A244A:
	movs r0, #0x10
_080A244C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A2454
sub_080A2454: @ 0x080A2454
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _080A2478 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x40
	bls _080A246E
	b _080A263A
_080A246E:
	lsls r0, r0, #2
	ldr r1, _080A247C @ =_080A2480
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A2478: .4byte 0x0202E3E0
_080A247C: .4byte _080A2480
_080A2480: @ jump table
	.4byte _080A263A @ case 0
	.4byte _080A2584 @ case 1
	.4byte _080A2588 @ case 2
	.4byte _080A2594 @ case 3
	.4byte _080A2594 @ case 4
	.4byte _080A2594 @ case 5
	.4byte _080A2598 @ case 6
	.4byte _080A2598 @ case 7
	.4byte _080A259C @ case 8
	.4byte _080A263A @ case 9
	.4byte _080A25A0 @ case 10
	.4byte _080A25A4 @ case 11
	.4byte _080A25A8 @ case 12
	.4byte _080A25AC @ case 13
	.4byte _080A25B0 @ case 14
	.4byte _080A25B0 @ case 15
	.4byte _080A25B4 @ case 16
	.4byte _080A25C0 @ case 17
	.4byte _080A25C4 @ case 18
	.4byte _080A25C8 @ case 19
	.4byte _080A263A @ case 20
	.4byte _080A25DE @ case 21
	.4byte _080A25DE @ case 22
	.4byte _080A25EA @ case 23
	.4byte _080A25EA @ case 24
	.4byte _080A262A @ case 25
	.4byte _080A262A @ case 26
	.4byte _080A262A @ case 27
	.4byte _080A262A @ case 28
	.4byte _080A25EE @ case 29
	.4byte _080A25F2 @ case 30
	.4byte _080A25FC @ case 31
	.4byte _080A2600 @ case 32
	.4byte _080A2600 @ case 33
	.4byte _080A262A @ case 34
	.4byte _080A263A @ case 35
	.4byte _080A263A @ case 36
	.4byte _080A2604 @ case 37
	.4byte _080A260C @ case 38
	.4byte _080A2618 @ case 39
	.4byte _080A2618 @ case 40
	.4byte _080A2618 @ case 41
	.4byte _080A261C @ case 42
	.4byte _080A262A @ case 43
	.4byte _080A262A @ case 44
	.4byte _080A2620 @ case 45
	.4byte _080A262A @ case 46
	.4byte _080A25DE @ case 47
	.4byte _080A263A @ case 48
	.4byte _080A2636 @ case 49
	.4byte _080A263A @ case 50
	.4byte _080A25A8 @ case 51
	.4byte _080A25C8 @ case 52
	.4byte _080A25DE @ case 53
	.4byte _080A25DE @ case 54
	.4byte _080A25A4 @ case 55
	.4byte _080A2594 @ case 56
	.4byte _080A262A @ case 57
	.4byte _080A260C @ case 58
	.4byte _080A2608 @ case 59
	.4byte _080A25D2 @ case 60
	.4byte _080A262A @ case 61
	.4byte _080A25EA @ case 62
	.4byte _080A262A @ case 63
	.4byte _080A262A @ case 64
_080A2584:
	movs r0, #1
	b _080A263C
_080A2588:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A1FF0
	adds r0, #0x40
	b _080A263C
_080A2594:
	movs r0, #2
	b _080A263C
_080A2598:
	movs r0, #3
	b _080A263C
_080A259C:
	movs r0, #4
	b _080A263C
_080A25A0:
	movs r0, #5
	b _080A263C
_080A25A4:
	movs r0, #6
	b _080A263C
_080A25A8:
	movs r0, #8
	b _080A263C
_080A25AC:
	movs r0, #9
	b _080A263C
_080A25B0:
	movs r0, #0xa
	b _080A263C
_080A25B4:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A21A0
	adds r0, #0x60
	b _080A263C
_080A25C0:
	movs r0, #0xb
	b _080A263C
_080A25C4:
	movs r0, #0x14
	b _080A263C
_080A25C8:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A23D8
	b _080A263C
_080A25D2:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A210C
	adds r0, #0x30
	b _080A263C
_080A25DE:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A205C
	adds r0, #0x30
	b _080A263C
_080A25EA:
	movs r0, #0xc
	b _080A263C
_080A25EE:
	movs r0, #0xd
	b _080A263C
_080A25F2:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A23AC
	b _080A263C
_080A25FC:
	movs r0, #0xe
	b _080A263C
_080A2600:
	movs r0, #0xf
	b _080A263C
_080A2604:
	movs r0, #0x1a
	b _080A263C
_080A2608:
	movs r0, #0x1b
	b _080A263C
_080A260C:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A2244
	adds r0, #0x50
	b _080A263C
_080A2618:
	movs r0, #0x13
	b _080A263C
_080A261C:
	movs r0, #0x3a
	b _080A263C
_080A2620:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A236C
	b _080A263C
_080A262A:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080A1FF0
	adds r0, #0x20
	b _080A263C
_080A2636:
	movs r0, #0x19
	b _080A263C
_080A263A:
	movs r0, #0
_080A263C:
	pop {r1}
	bx r1

	thumb_func_start sub_080A2640
sub_080A2640: @ 0x080A2640
	push {lr}
	bl sub_080A2454
	lsls r0, r0, #5
	ldr r1, _080A2650 @ =0x02020140
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080A2650: .4byte 0x02020140

	thumb_func_start sub_080A2654
sub_080A2654: @ 0x080A2654
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080A2688 @ =0x0840F950
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _080A268C @ =0x0202E3DC
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2694
	asrs r0, r0, #6
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080A2690 @ =0x02020140
	adds r0, r0, r1
	b _080A2696
	.align 2, 0
_080A2688: .4byte 0x0840F950
_080A268C: .4byte 0x0202E3DC
_080A2690: .4byte 0x02020140
_080A2694:
	ldr r0, _080A26A0 @ =0x02020140
_080A2696:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A26A0: .4byte 0x02020140

	thumb_func_start sub_080A26A4
sub_080A26A4: @ 0x080A26A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp]
	cmp r4, #0
	bne _080A26BA
	ldr r4, _080A26CC @ =0x06000020
_080A26BA:
	lsls r0, r4, #0xf
	lsrs r7, r0, #0x14
	ldr r0, [sp]
	cmp r0, #0
	bge _080A26C8
	movs r1, #3
	str r1, [sp]
_080A26C8:
	movs r2, #0
	b _080A289E
	.align 2, 0
_080A26CC: .4byte 0x06000020
_080A26D0:
	movs r6, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, r8
	adds r3, #2
	str r3, [sp, #0xc]
	cmp r6, r0
	blt _080A26E2
	b _080A289C
_080A26E2:
	movs r0, #1
	add r0, r8
	mov sb, r0
	mov r1, r8
	lsrs r0, r1, #0x1f
	add r0, r8
	asrs r0, r0, #1
	lsls r0, r0, #5
	str r0, [sp, #4]
	movs r2, #1
	mov sl, r2
_080A26F8:
	adds r0, r6, #0
	mov r1, r8
	bl sub_080A2640
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl sub_080A2640
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl sub_080A2640
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl sub_080A2640
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A28BC @ =0x02023460
	asrs r2, r6, #0x1f
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r3, [sp]
	lsls r0, r3, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
	ldr r0, _080A28C0 @ =0x0202E3DC
	ldr r1, [r0]
	mov r3, r8
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r0, [r3]
	adds r1, r0, r6
	ldrb r0, [r1]
	str r2, [sp, #8]
	cmp r0, #0
	bne _080A27D6
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _080A27D6
	ldr r0, [r3, #4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A27D6
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _080A288A
_080A27D6:
	adds r0, r6, #0
	mov r1, r8
	bl sub_080A2654
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl sub_080A2654
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl sub_080A2654
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl sub_080A2654
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A28C4 @ =0x02022C60
	ldr r2, [sp, #8]
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
_080A288A:
	movs r0, #2
	add sl, r0
	adds r6, #2
	ldr r0, _080A28C8 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r6, r0
	bge _080A289C
	b _080A26F8
_080A289C:
	ldr r2, [sp, #0xc]
_080A289E:
	mov r8, r2
	ldr r1, _080A28C8 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r8, r0
	bge _080A28AC
	b _080A26D0
_080A28AC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A28BC: .4byte 0x02023460
_080A28C0: .4byte 0x0202E3DC
_080A28C4: .4byte 0x02022C60
_080A28C8: .4byte 0x0202E3D8

	thumb_func_start sub_080A28CC
sub_080A28CC: @ 0x080A28CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A2908 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A28E4
	movs r0, #0xe6
	lsls r0, r0, #2
	bl sub_080BE594
_080A28E4:
	adds r0, r4, #0
	bl sub_080A3148
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	bl sub_080A2E6C
	movs r0, #0
	adds r1, r4, #0
	bl sub_080A26A4
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2908: .4byte 0x0202BBF8

	thumb_func_start sub_080A290C
sub_080A290C: @ 0x080A290C
	ldr r0, _080A2938 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _080A293C @ =0x02000508
	cmp r1, #0xa0
	bls _080A2924
	ldr r0, _080A2940 @ =0x02000500
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_080A2924:
	ldr r2, _080A2944 @ =0x04000040
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_080A2938: .4byte 0x04000006
_080A293C: .4byte 0x02000508
_080A2940: .4byte 0x02000500
_080A2944: .4byte 0x04000040

	thumb_func_start sub_080A2948
sub_080A2948: @ 0x080A2948
	ldr r2, _080A2958 @ =0x02000500
	ldr r3, [r2]
	ldr r1, _080A295C @ =0x02000504
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_080A2958: .4byte 0x02000500
_080A295C: .4byte 0x02000504

	thumb_func_start sub_080A2960
sub_080A2960: @ 0x080A2960
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A2A60 @ =0x02000500
	ldr r2, _080A2A64 @ =0x02000280
	str r2, [r1]
	ldr r3, _080A2A68 @ =0x02000504
	ldr r4, _080A2A6C @ =0xFFFFFD80
	adds r1, r2, r4
	str r1, [r3]
	ldr r1, _080A2A70 @ =0x02000508
	str r2, [r1]
	ldr r7, _080A2A74 @ =0x03002870
	mov ip, r7
	movs r1, #0x20
	mov r8, r1
	mov r1, r8
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r1, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r3, ip
	strb r1, [r3, #1]
	movs r4, #0x34
	add r4, ip
	mov sb, r4
	movs r4, #1
	mov r7, sb
	ldrb r7, [r7]
	orrs r4, r7
	movs r1, #2
	orrs r4, r1
	movs r6, #4
	orrs r4, r6
	movs r5, #8
	orrs r4, r5
	movs r2, #0x10
	orrs r4, r2
	movs r1, #0x36
	add r1, ip
	mov sl, r1
	movs r3, #2
	rsbs r3, r3, #0
	ldrb r7, [r1]
	ands r3, r7
	movs r1, #3
	rsbs r1, r1, #0
	ands r3, r1
	orrs r3, r6
	orrs r3, r5
	orrs r3, r2
	mov r2, ip
	adds r2, #0x2d
	movs r5, #0
	movs r1, #0xf0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x31
	strb r5, [r1]
	subs r1, #5
	strb r5, [r1]
	adds r2, #3
	movs r1, #0xa0
	strb r1, [r2]
	mov r6, ip
	adds r6, #0x3c
	ldr r1, _080A2A78 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r1, r2
	movs r2, #0xc
	orrs r1, r2
	ldr r2, _080A2A7C @ =0x0000E0FF
	ands r1, r2
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r2, r7, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r2, #0x3d
	mov r1, r8
	ldrb r7, [r2]
	orrs r1, r7
	strb r1, [r2]
	movs r1, #0xc0
	ldrb r2, [r6]
	orrs r1, r2
	strb r1, [r6]
	mov r2, ip
	adds r2, #0x44
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x45
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	mov r7, r8
	orrs r4, r7
	mov r1, sb
	strb r4, [r1]
	subs r2, #0xf
	mov r1, r8
	ldrb r4, [r2]
	orrs r1, r4
	strb r1, [r2]
	orrs r3, r7
	mov r1, sl
	strb r3, [r1]
	adds r0, #0x4c
	strh r5, [r0]
	ldr r0, _080A2A80 @ =sub_080A290C
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A60: .4byte 0x02000500
_080A2A64: .4byte 0x02000280
_080A2A68: .4byte 0x02000504
_080A2A6C: .4byte 0xFFFFFD80
_080A2A70: .4byte 0x02000508
_080A2A74: .4byte 0x03002870
_080A2A78: .4byte 0x0000FFE0
_080A2A7C: .4byte 0x0000E0FF
_080A2A80: .4byte sub_080A290C

	thumb_func_start sub_080A2A84
sub_080A2A84: @ 0x080A2A84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r2, _080A2C24 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r6, [sp, #0x14]
	adds r6, #0x4c
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, #0
	bge _080A2ABC
	adds r1, #3
_080A2ABC:
	asrs r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl sub_08012FE8
	adds r7, r0, #0
	adds r1, r7, #0
	cmp r7, #0
	bge _080A2AE0
	adds r1, r7, #3
_080A2AE0:
	asrs r1, r1, #2
	subs r1, #0x40
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	rsbs r5, r2, #0
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	rsbs r3, r4, #0
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A2C28 @ =0x02000504
	mov sl, r4
	ldr r2, _080A2C2C @ =0x080C5A48
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A2B22:
	mov r0, sb
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A2B22
	mov r3, sl
	ldr r0, [r3]
	bl sub_080133A8
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	bl sub_080A2948
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A2C14
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A2C14:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C24: .4byte 0x03002870
_080A2C28: .4byte 0x02000504
_080A2C2C: .4byte 0x080C5A48

	thumb_func_start sub_080A2C30
sub_080A2C30: @ 0x080A2C30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A2C94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2C46
	ldr r0, _080A2C98 @ =0x00000399
	bl sub_080BE594
_080A2C46:
	ldr r2, _080A2C9C @ =0x030028AC
	ldr r0, _080A2CA0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A2CA4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r5, [r2]
	orrs r0, r5
	strb r0, [r2]
	movs r3, #0
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
	ldr r0, _080A2CA8 @ =0x02000500
	ldr r1, _080A2CAC @ =0x02000280
	str r1, [r0]
	ldr r2, _080A2CB0 @ =0x02000504
	ldr r5, _080A2CB4 @ =0xFFFFFD80
	adds r0, r1, r5
	str r0, [r2]
	ldr r0, _080A2CB8 @ =0x02000508
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	strh r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C94: .4byte 0x0202BBF8
_080A2C98: .4byte 0x00000399
_080A2C9C: .4byte 0x030028AC
_080A2CA0: .4byte 0x0000FFE0
_080A2CA4: .4byte 0x0000E0FF
_080A2CA8: .4byte 0x02000500
_080A2CAC: .4byte 0x02000280
_080A2CB0: .4byte 0x02000504
_080A2CB4: .4byte 0xFFFFFD80
_080A2CB8: .4byte 0x02000508

	thumb_func_start sub_080A2CBC
sub_080A2CBC: @ 0x080A2CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r2, _080A2E60 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r6, [sp, #0x14]
	adds r6, #0x4c
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, #0
	bge _080A2CF4
	adds r1, #3
_080A2CF4:
	asrs r1, r1, #2
	movs r0, #4
	subs r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x46
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	bl sub_08012FE8
	adds r7, r0, #0
	cmp r7, #0
	bge _080A2D1A
	adds r0, r7, #3
_080A2D1A:
	asrs r0, r0, #2
	movs r1, #0x40
	subs r1, r1, r0
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	rsbs r5, r2, #0
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	rsbs r3, r4, #0
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A2E64 @ =0x02000504
	mov sl, r4
	ldr r2, _080A2E68 @ =0x080C5A48
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A2D5E:
	mov r0, sb
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A2D5E
	mov r3, sl
	ldr r0, [r3]
	bl sub_080133A8
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_080133C8
	bl sub_080A2948
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A2E50
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A2E50:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E60: .4byte 0x03002870
_080A2E64: .4byte 0x02000504
_080A2E68: .4byte 0x080C5A48

	thumb_func_start sub_080A2E6C
sub_080A2E6C: @ 0x080A2E6C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080A2E76
	movs r4, #3
_080A2E76:
	ldr r0, _080A2E9C @ =0x0840F4D8
	ldr r1, _080A2EA0 @ =0x02020140
	bl Decompress
	ldr r0, _080A2EA4 @ =0x0840F8B0
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A2EA8 @ =0x0840F8D0
	adds r1, r4, #1
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E9C: .4byte 0x0840F4D8
_080A2EA0: .4byte 0x02020140
_080A2EA4: .4byte 0x0840F8B0
_080A2EA8: .4byte 0x0840F8D0

	thumb_func_start sub_080A2EAC
sub_080A2EAC: @ 0x080A2EAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A2F2C @ =0x0200050C
	ldr r0, _080A2F30 @ =0x02020140
	str r0, [r1]
	movs r2, #1
	ldr r0, _080A2F34 @ =0x02022860
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
	mov sb, r1
_080A2EC8:
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r5, r0, #0
	mov r1, r8
	ands r5, r1
	asrs r4, r0, #5
	ands r4, r1
	asrs r3, r0, #0xa
	ands r3, r1
	adds r0, r2, #1
	mov ip, r0
	lsls r6, r2, #1
	movs r7, #7
_080A2EE8:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r6, r0
	lsls r1, r3, #0xa
	lsls r2, r4, #5
	adds r1, r1, r2
	adds r1, r1, r5
	strh r1, [r0]
	adds r5, #3
	cmp r5, #0x1f
	ble _080A2F00
	movs r5, #0x1f
_080A2F00:
	adds r4, #3
	cmp r4, #0x1f
	ble _080A2F08
	movs r4, #0x1f
_080A2F08:
	adds r3, #3
	cmp r3, #0x1f
	ble _080A2F10
	movs r3, #0x1f
_080A2F10:
	adds r6, #0x20
	subs r7, #1
	cmp r7, #0
	bge _080A2EE8
	mov r2, ip
	cmp r2, #0xf
	ble _080A2EC8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2F2C: .4byte 0x0200050C
_080A2F30: .4byte 0x02020140
_080A2F34: .4byte 0x02022860

	thumb_func_start sub_080A2F38
sub_080A2F38: @ 0x080A2F38
	push {lr}
	sub sp, #0x10
	ldr r1, _080A2F6C @ =0x0840F953
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	add r0, sp
	ldr r1, _080A2F70 @ =0x0200050C
	ldrb r0, [r0]
	lsls r2, r0, #5
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A2F6C: .4byte 0x0840F953
_080A2F70: .4byte 0x0200050C

	thumb_func_start sub_080A2F74
sub_080A2F74: @ 0x080A2F74
	push {lr}
	sub sp, #0x20
	ldr r1, _080A2FB0 @ =0x0840F963
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	bl GetGameTime
	movs r1, #0x1f
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r3, [r0]
	adds r3, #0x10
	ldr r2, _080A2FB4 @ =0x02022860
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0x87
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
_080A2FB0: .4byte 0x0840F963
_080A2FB4: .4byte 0x02022860

	thumb_func_start sub_080A2FB8
sub_080A2FB8: @ 0x080A2FB8
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _080A2FFC @ =0x0840F984
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	ldr r3, _080A3000 @ =0x0202BBB8
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _080A2FD4
	adds r1, #3
_080A2FD4:
	asrs r1, r1, #2
	ldr r0, [r4, #0x3c]
	adds r2, r0, r1
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080A2FE4
	adds r0, #3
_080A2FE4:
	asrs r0, r0, #2
	ldr r1, [r4, #0x40]
	adds r1, r1, r0
	adds r0, r2, #0
	mov r2, sp
	movs r3, #0
	bl PutOamHiRam
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2FFC: .4byte 0x0840F984
_080A3000: .4byte 0x0202BBB8

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

	thumb_func_start sub_080A3148
sub_080A3148: @ 0x080A3148
	adds r2, r0, #0
	adds r2, #0x4a
	movs r1, #0
	strh r1, [r2]
	ldr r2, _080A3164 @ =0x0202E3D8
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
_080A3164: .4byte 0x0202E3D8

	thumb_func_start sub_080A3168
sub_080A3168: @ 0x080A3168
	push {lr}
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080A3196
	ldr r1, _080A31A0 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080A3180
	adds r0, #0xf
_080A3180:
	asrs r0, r0, #4
	adds r0, #7
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bge _080A318E
	adds r1, #0xf
_080A318E:
	asrs r1, r1, #4
	adds r1, #5
	bl SetMapCursorPosition
_080A3196:
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080A31A0: .4byte 0x0202BBB8

	thumb_func_start sub_080A31A4
sub_080A31A4: @ 0x080A31A4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080A2F38
	adds r0, r4, #0
	bl sub_080A2F74
	adds r0, r4, #0
	bl sub_080A3004
	adds r0, r4, #0
	bl sub_080A2FB8
	adds r0, r4, #0
	bl sub_080A3080
	ldr r0, _080A3208 @ =0x08B857F8
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #2
	ldrh r0, [r0, #4]
	ands r3, r0
	cmp r3, #0
	beq _080A3218
	ldr r2, _080A320C @ =0x030028AC
	ldr r0, _080A3210 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080A3214 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	movs r0, #8
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	b _080A3244
	.align 2, 0
_080A3208: .4byte 0x08B857F8
_080A320C: .4byte 0x030028AC
_080A3210: .4byte 0x0000FFE0
_080A3214: .4byte 0x0000E0FF
_080A3218:
	ldr r2, _080A326C @ =0x030028AC
	ldr r0, _080A3270 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A3274 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
_080A3244:
	ldr r0, _080A3278 @ =0x0202BBB8
	ldr r0, [r0, #0xc]
	ldr r1, _080A327C @ =0x000F000F
	ands r0, r1
	cmp r0, #0
	bne _080A3264
	ldr r0, _080A3280 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A3264
	adds r0, r4, #0
	bl Proc_Break
_080A3264:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A326C: .4byte 0x030028AC
_080A3270: .4byte 0x0000FFE0
_080A3274: .4byte 0x0000E0FF
_080A3278: .4byte 0x0202BBB8
_080A327C: .4byte 0x000F000F
_080A3280: .4byte 0x08B857F8

	thumb_func_start sub_080A3284
sub_080A3284: @ 0x080A3284
	push {lr}
	ldr r0, _080A3294 @ =0x08CE3B6C
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_080A3294: .4byte 0x08CE3B6C

	thumb_func_start sub_080A3298
sub_080A3298: @ 0x080A3298
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080A32CC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080A32D0 @ =0x02023460
	movs r1, #0
	bl TmFill
	adds r0, r5, #0
	bl InitChapterPreviewMap
	adds r0, r4, #0
	bl sub_080A2E6C
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080A26A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A32CC: .4byte 0x02022C60
_080A32D0: .4byte 0x02023460

	thumb_func_start sub_080A32D4
sub_080A32D4: @ 0x080A32D4
	push {lr}
	ldr r0, _080A3310 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080A32E6
	movs r2, #0
_080A32E6:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080A3342
	ldr r3, _080A3314 @ =0x02000000
	ldrb r0, [r3]
	cmp r2, r0
	bhs _080A3328
	ldr r0, _080A3318 @ =0x04000050
	movs r1, #0xc1
	strh r1, [r0]
	ldrb r0, [r3]
	cmp r0, #0
	beq _080A331C
	adds r1, r0, #0
	subs r0, r1, r2
	lsls r0, r0, #4
	bl __divsi3
	adds r1, r0, #0
	b _080A331E
	.align 2, 0
_080A3310: .4byte 0x04000006
_080A3314: .4byte 0x02000000
_080A3318: .4byte 0x04000050
_080A331C:
	movs r1, #0
_080A331E:
	ldr r0, _080A3324 @ =0x04000054
	strh r1, [r0]
	b _080A3342
	.align 2, 0
_080A3324: .4byte 0x04000054
_080A3328:
	ldr r1, _080A3348 @ =0x04000050
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080A334C @ =0x04000052
	ldr r1, _080A3350 @ =0x02000001
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_080A3342:
	pop {r0}
	bx r0
	.align 2, 0
_080A3348: .4byte 0x04000050
_080A334C: .4byte 0x04000052
_080A3350: .4byte 0x02000001

	thumb_func_start sub_080A3354
sub_080A3354: @ 0x080A3354
	push {lr}
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start sub_080A336C
sub_080A336C: @ 0x080A336C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A337A:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A3394
	cmp r5, r3
	bne _080A3392
	adds r0, r1, #0
	lsls r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080A339C
_080A3392:
	adds r3, #1
_080A3394:
	adds r2, #1
	cmp r2, #7
	ble _080A337A
	movs r0, #0xff
_080A339C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A33A4
sub_080A33A4: @ 0x080A33A4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A33B4:
	adds r0, r5, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A33D0
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A33CE
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	b _080A33D8
_080A33CE:
	adds r3, #1
_080A33D0:
	adds r2, #1
	cmp r2, #7
	ble _080A33B4
	movs r0, #0xff
_080A33D8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A33E0
sub_080A33E0: @ 0x080A33E0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	movs r3, #1
_080A33E8:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _080A33F8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _080A3400
_080A33F8:
	adds r1, #1
	cmp r1, #7
	ble _080A33E8
	movs r0, #0xff
_080A3400:
	bx lr
	.align 2, 0

	thumb_func_start sub_080A3404
sub_080A3404: @ 0x080A3404
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A341A
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A3428
_080A341A:
	bl sub_08081B44
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	b _080A3464
_080A3428:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0x10
	beq _080A3440
	cmp r1, #0x10
	bgt _080A343C
	cmp r1, #2
	beq _080A3440
	b _080A3464
_080A343C:
	cmp r1, #0x20
	bne _080A3464
_080A3440:
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3464
	adds r4, #0x3e
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A3464
	ldr r0, _080A346C @ =0x06013800
	movs r1, #9
	bl sub_08082528
	ldr r2, _080A3470 @ =0x000003B2
	movs r0, #0x30
	movs r1, #0x30
	bl sub_08081A94
	movs r0, #1
	strb r0, [r4]
_080A3464:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A346C: .4byte 0x06013800
_080A3470: .4byte 0x000003B2

	thumb_func_start sub_080A3474
sub_080A3474: @ 0x080A3474
	push {r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl sub_080A09A0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3488
	movs r0, #0
	b _080A350E
_080A3488:
	adds r0, r4, #0
	mov r1, sp
	bl sub_080A09B4
	mov r1, sp
	adds r1, #0x2b
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	bne _080A34B8
	ldr r1, _080A34B4 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	movs r0, #1
	b _080A350E
	.align 2, 0
_080A34B4: .4byte 0x0202BBF8
_080A34B8:
	ldr r2, _080A34D8 @ =0x0202BBF8
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r5, [r1]
	orrs r0, r5
	strb r0, [r1]
	add r0, sp, #0x20
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A34DC
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	b _080A34E0
	.align 2, 0
_080A34D8: .4byte 0x0202BBF8
_080A34DC:
	bl sub_0802E6EC
_080A34E0:
	ldr r2, _080A3518 @ =0x0202BBF8
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #0x1f
	adds r3, r2, #0
	adds r3, #0x2c
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r5, [r3]
	ands r0, r5
	orrs r0, r1
	strb r0, [r3]
	ldrb r4, [r4]
	lsrs r1, r4, #4
	adds r2, #0x2b
	lsls r1, r1, #4
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
_080A350E:
	add sp, #0x48
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A3518: .4byte 0x0202BBF8

	thumb_func_start sub_080A351C
sub_080A351C: @ 0x080A351C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	movs r6, #8
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A35C6
	adds r0, r2, #0
	adds r0, #0x40
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r0, #8
	bne _080A3554
	ldr r0, _080A3550 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf9
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A35B0
	bl sub_08081B44
	movs r0, #7
	strb r0, [r5]
	b _080A35B0
	.align 2, 0
_080A3550: .4byte 0x08B857F8
_080A3554:
	ldr r0, _080A3588 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A35B0
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	bl sub_080A3474
	cmp r0, #0
	bne _080A3590
	ldr r0, _080A358C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A35B0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl sub_080BE594
	b _080A35B0
	.align 2, 0
_080A3588: .4byte 0x08B857F8
_080A358C: .4byte 0x0202BBF8
_080A3590:
	cmp r0, #0
	blt _080A35B0
	cmp r0, #2
	bgt _080A35B0
	ldr r0, _080A35CC @ =0x06013800
	movs r1, #9
	bl sub_08082528
	ldrb r4, [r4]
	lsls r1, r4, #5
	adds r1, #0x2c
	ldr r2, _080A35D0 @ =0x0000FFFF
	movs r0, #0x48
	bl sub_0808198C
	strb r6, [r5]
_080A35B0:
	adds r1, r5, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A35C6
	cmp r0, r6
	bge _080A35C0
	subs r0, #1
	strb r0, [r1]
_080A35C0:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A35D4
_080A35C6:
	movs r0, #0
	b _080A35D6
	.align 2, 0
_080A35CC: .4byte 0x06013800
_080A35D0: .4byte 0x0000FFFF
_080A35D4:
	movs r0, #1
_080A35D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080A35DC
sub_080A35DC: @ 0x080A35DC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_080823E0
	movs r4, #0
	ldr r6, _080A360C @ =0x0001FFFF
	movs r5, #0xb4
	lsls r5, r5, #9
_080A35F0:
	adds r0, r7, #0
	adds r0, #0x37
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A3610
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	ldrb r1, [r1]
	bl sub_08082308
	b _080A361E
	.align 2, 0
_080A360C: .4byte 0x0001FFFF
_080A3610:
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_08082308
_080A361E:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #2
	ble _080A35F0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080A3630
sub_080A3630: @ 0x080A3630
	push {lr}
	ldr r0, _080A36A4 @ =0x08CE3C0C
	bl InitBgs
	bl ResetText
	ldr r2, _080A36A8 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x3f
	ldrb r1, [r2, #0x15]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	movs r0, #3
	ldrb r3, [r2, #0xc]
	orrs r0, r3
	strb r0, [r2, #0xc]
	adds r1, #0x1d
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	strb r0, [r2, #0x10]
	adds r0, r1, #0
	ldrb r3, [r2, #0x14]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_080A36A4: .4byte 0x08CE3C0C
_080A36A8: .4byte 0x03002870

	thumb_func_start sub_080A36AC
sub_080A36AC: @ 0x080A36AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A3888 @ =0x0840F9A0
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r4, _080A388C @ =0x08418E44
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A3890 @ =0x02022C60
	ldr r1, _080A3894 @ =0x0840FA00
	movs r2, #0
	bl TmApplyTsa_t
	ldr r0, _080A3898 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r2, r5, #0
	bl ApplyPaletteExt
	ldr r0, _080A389C @ =0x084139F0
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A38A0 @ =0x08413A10
	ldr r1, _080A38A4 @ =0x02000004
	movs r2, #2
	bl sub_080A5130
	movs r0, #0xf
	bl EnableBgSync
	mov r0, r8
	adds r0, #0x29
	movs r4, #0
	strb r4, [r0]
	ldr r2, _080A38A8 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x35
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A38AC @ =0x084120A0
	ldr r1, _080A38B0 @ =0x06010800
	bl Decompress
	mov r0, r8
	adds r0, #0x36
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3d
	strb r4, [r0]
	bl sub_080A5FD0
	movs r7, #0
	ldr r2, _080A38B4 @ =0x080C5A48
	mov sl, r2
	mov sb, r5
_080A375E:
	ldr r1, _080A38B8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080A38B8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08003388
	adds r7, #1
	cmp r7, #3
	ble _080A375E
	mov r1, r8
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #5
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3e
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	ldr r1, _080A38BC @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A38C0 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A38C4 @ =sub_080A32D4
	bl SetOnHBlankA
	ldr r4, _080A38C8 @ =0x0840FEB4
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A38CC @ =0x02024460
	ldr r1, _080A38D0 @ =0x08411F34
	movs r2, #0
	movs r3, #5
	bl sub_08001F3C
	movs r0, #8
	bl EnableBgSync
	movs r7, #0
	mov r4, r8
	adds r4, #0x2c
_080A381E:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	bl sub_080A6398
	adds r7, #1
	cmp r7, #3
	ble _080A381E
	ldrb r0, [r4]
	bl sub_080A649C
	bl sub_080A5EF0
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080A38A8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080A38D4 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	mov r0, r8
	bl sub_080A35DC
	mov r0, r8
	bl sub_080A5C48
	mov r2, r8
	str r0, [r2, #0x58]
	mov r0, r8
	bl sub_080A5CE0
	mov r1, r8
	str r0, [r1, #0x5c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3888: .4byte 0x0840F9A0
_080A388C: .4byte 0x08418E44
_080A3890: .4byte 0x02022C60
_080A3894: .4byte 0x0840FA00
_080A3898: .4byte 0x084138F0
_080A389C: .4byte 0x084139F0
_080A38A0: .4byte 0x08413A10
_080A38A4: .4byte 0x02000004
_080A38A8: .4byte 0x03002870
_080A38AC: .4byte 0x084120A0
_080A38B0: .4byte 0x06010800
_080A38B4: .4byte 0x080C5A48
_080A38B8: .4byte 0x080C5AC8
_080A38BC: .4byte 0x02000000
_080A38C0: .4byte 0x02000001
_080A38C4: .4byte sub_080A32D4
_080A38C8: .4byte 0x0840FEB4
_080A38CC: .4byte 0x02024460
_080A38D0: .4byte 0x08411F34
_080A38D4: .4byte 0x02022860

	thumb_func_start sub_080A38D8
sub_080A38D8: @ 0x080A38D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080A3908 @ =0x084130A4
	ldr r1, _080A390C @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl sub_080A602C
	adds r6, r5, #0
	adds r6, #0x42
	ldrh r0, [r6]
	cmp r0, #0x20
	bne _080A3910
	movs r0, #0x20
	adds r1, r5, #0
	bl sub_080A6634
	adds r1, r5, #0
	adds r1, #0x2b
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x2e
	b _080A393E
	.align 2, 0
_080A3908: .4byte 0x084130A4
_080A390C: .4byte 0x06013800
_080A3910:
	adds r4, r5, #0
	adds r4, #0x2e
	movs r1, #0
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0x2b
	strb r1, [r2]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x16
	ldrb r0, [r0]
	ldrb r1, [r2]
	bl sub_080A336C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
_080A393E:
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A394C
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
_080A394C:
	ldrb r4, [r4]
	cmp r4, #5
	bne _080A395A
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
_080A395A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080A3960
sub_080A3960: @ 0x080A3960
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl sub_080A05F4
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A39A4
sub_080A39A4: @ 0x080A39A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl sub_080A05F4
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A39E8
sub_080A39E8: @ 0x080A39E8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_080A39F8
sub_080A39F8: @ 0x080A39F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080A3A28 @ =0x08B857F8
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080A3A40
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A3A2C
	subs r0, #1
	b _080A3A5E
	.align 2, 0
_080A3A28: .4byte 0x08B857F8
_080A3A2C:
	adds r0, r2, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A3A9A
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	b _080A3A5E
_080A3A40:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A3A9A
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A3A7C
	adds r0, r2, #1
_080A3A5E:
	strb r0, [r1]
	ldr r0, _080A3A74 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3A9A
	ldr r0, _080A3A78 @ =0x00000386
	bl sub_080BE594
	b _080A3A9A
	.align 2, 0
_080A3A74: .4byte 0x0202BBF8
_080A3A78: .4byte 0x00000386
_080A3A7C:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A3A9A
	strb r4, [r1]
	ldr r0, _080A3AF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3A9A
	ldr r0, _080A3AF8 @ =0x00000386
	bl sub_080BE594
_080A3A9A:
	ldr r0, _080A3AFC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A3AAA
	b _080A3C3C
_080A3AAA:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	bl sub_080A336C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x42
	strh r0, [r4]
	ldr r0, _080A3AF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3AD6
	ldr r0, _080A3B00 @ =0x0000038A
	bl sub_080BE594
_080A3AD6:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bls _080A3AE8
	b _080A3C68
_080A3AE8:
	lsls r0, r0, #2
	ldr r1, _080A3B04 @ =_080A3B08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A3AF4: .4byte 0x0202BBF8
_080A3AF8: .4byte 0x00000386
_080A3AFC: .4byte 0x08B857F8
_080A3B00: .4byte 0x0000038A
_080A3B04: .4byte _080A3B08
_080A3B08: @ jump table
	.4byte _080A3B88 @ case 0
	.4byte _080A3B94 @ case 1
	.4byte _080A3C68 @ case 2
	.4byte _080A3BAC @ case 3
	.4byte _080A3C68 @ case 4
	.4byte _080A3C68 @ case 5
	.4byte _080A3C68 @ case 6
	.4byte _080A3BC4 @ case 7
	.4byte _080A3C68 @ case 8
	.4byte _080A3C68 @ case 9
	.4byte _080A3C68 @ case 10
	.4byte _080A3C68 @ case 11
	.4byte _080A3C68 @ case 12
	.4byte _080A3C68 @ case 13
	.4byte _080A3C68 @ case 14
	.4byte _080A3BDC @ case 15
	.4byte _080A3C68 @ case 16
	.4byte _080A3C68 @ case 17
	.4byte _080A3C68 @ case 18
	.4byte _080A3C68 @ case 19
	.4byte _080A3C68 @ case 20
	.4byte _080A3C68 @ case 21
	.4byte _080A3C68 @ case 22
	.4byte _080A3C68 @ case 23
	.4byte _080A3C68 @ case 24
	.4byte _080A3C68 @ case 25
	.4byte _080A3C68 @ case 26
	.4byte _080A3C68 @ case 27
	.4byte _080A3C68 @ case 28
	.4byte _080A3C68 @ case 29
	.4byte _080A3C68 @ case 30
	.4byte _080A3C1E @ case 31
_080A3B88:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	subs r0, #0x13
	strb r1, [r0]
	b _080A3BFC
_080A3B94:
	bl sub_080A05F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_080A6114
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BAC:
	bl sub_080A05F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_080A6114
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BC4:
	bl sub_080A05F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_080A6114
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	b _080A3BFC
_080A3BDC:
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #1
	bl sub_080A6114
	strb r0, [r4]
	bl sub_0809E9FC
	cmp r0, #0
	bne _080A3C06
	movs r0, #0
	movs r1, #0
	bl sub_080A4E34
_080A3BFC:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080A3C68
_080A3C06:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A3C68
_080A3C1E:
	adds r1, r5, #0
	adds r1, #0x34
	adds r0, r5, #0
	adds r0, #0x33
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r2, r0
	blo _080A3C32
	movs r0, #0
	strb r0, [r1]
_080A3C32:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080A3C68
_080A3C3C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A3C68
	ldr r0, _080A3C70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3C56
	ldr r0, _080A3C74 @ =0x0000038B
	bl sub_080BE594
_080A3C56:
	adds r0, r5, #0
	movs r1, #0x12
	bl Proc_Goto
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_080A3C68:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3C70: .4byte 0x0202BBF8
_080A3C74: .4byte 0x0000038B

	thumb_func_start sub_080A3C78
sub_080A3C78: @ 0x080A3C78
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #1
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r4, [r1]
	rsbs r0, r4, #0
	orrs r0, r4
	lsrs r1, r0, #0x1f
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A3C96
	movs r2, #2
_080A3C96:
	cmp r0, #2
	bne _080A3C9C
	movs r2, #3
_080A3C9C:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl SaveNewGame
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A3CAC
sub_080A3CAC: @ 0x080A3CAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A3D5C
	ldr r0, _080A3CE4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3CCC
	ldr r0, _080A3CE8 @ =0x0000038A
	bl sub_080BE594
_080A3CCC:
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A3D32
	cmp r0, #8
	bgt _080A3CEC
	cmp r0, #2
	beq _080A3D44
	cmp r0, #4
	beq _080A3D00
	b _080A3D54
	.align 2, 0
_080A3CE4: .4byte 0x0202BBF8
_080A3CE8: .4byte 0x0000038A
_080A3CEC:
	cmp r0, #0x20
	beq _080A3D44
	cmp r0, #0x20
	bgt _080A3CFA
	cmp r0, #0x10
	beq _080A3D44
	b _080A3D54
_080A3CFA:
	cmp r0, #0x40
	beq _080A3D36
	b _080A3D54
_080A3D00:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080A3D1C
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A6184
	b _080A3E88
_080A3D1C:
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	bl sub_080A065C
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080A3E88
_080A3D32:
	movs r0, #2
	b _080A3D38
_080A3D36:
	movs r0, #1
_080A3D38:
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A5F98
	b _080A3D54
_080A3D44:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A5F98
_080A3D54:
	adds r0, r4, #0
	bl sub_080A3404
	b _080A3E88
_080A3D5C:
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r0, [r5]
	cmp r0, #0x10
	beq _080A3DC8
	cmp r0, #0x10
	bgt _080A3D74
	cmp r0, #2
	beq _080A3D9A
	cmp r0, #8
	beq _080A3DD4
	b _080A3E7A
_080A3D74:
	cmp r0, #0x20
	beq _080A3D7E
	cmp r0, #0x40
	beq _080A3E24
	b _080A3E7A
_080A3D7E:
	cmp r1, #1
	bne _080A3E08
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_080A08EC
	adds r0, r4, #0
	movs r1, #0xe
	b _080A3DE6
_080A3D9A:
	cmp r1, #1
	bne _080A3E08
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _080A3DC0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3DB8
	ldr r0, _080A3DC4 @ =0x0000038A
	bl sub_080BE594
_080A3DB8:
	adds r0, r4, #0
	bl sub_080A3354
	b _080A3E7A
	.align 2, 0
_080A3DC0: .4byte 0x0202BBF8
_080A3DC4: .4byte 0x0000038A
_080A3DC8:
	cmp r1, #1
	bne _080A3E08
	adds r0, r4, #0
	bl sub_080A3C78
	b _080A3E32
_080A3DD4:
	cmp r1, #1
	bne _080A3E08
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_080A061C
	adds r0, r4, #0
	movs r1, #6
_080A3DE6:
	bl Proc_Goto
	ldr r0, _080A3E00 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E04 @ =0x0000038A
	bl sub_080BE594
	b _080A3E7A
	.align 2, 0
_080A3E00: .4byte 0x0202BBF8
_080A3E04: .4byte 0x0000038A
_080A3E08:
	ldr r0, _080A3E1C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E20 @ =0x0000038B
	bl sub_080BE594
	b _080A3E7A
	.align 2, 0
_080A3E1C: .4byte 0x0202BBF8
_080A3E20: .4byte 0x0000038B
_080A3E24:
	cmp r1, #1
	bne _080A3E54
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_080A0810
_080A3E32:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A3E50 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	movs r0, #0xe0
	lsls r0, r0, #2
	bl sub_080BE594
	b _080A3E7A
	.align 2, 0
_080A3E50: .4byte 0x0202BBF8
_080A3E54:
	adds r0, r4, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080A3E90 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E94 @ =0x0000038B
	bl sub_080BE594
_080A3E7A:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A5F98
	adds r0, r4, #0
	bl sub_080A3404
_080A3E88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3E90: .4byte 0x0202BBF8
_080A3E94: .4byte 0x0000038B

	thumb_func_start sub_080A3E98
sub_080A3E98: @ 0x080A3E98
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_080A351C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3EB2
	b _080A40E4
_080A3EB2:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080A3F0C
	ldr r0, _080A3ED4 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A3ED8
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	b _080A3EE4
	.align 2, 0
_080A3ED4: .4byte 0x08B857F8
_080A3ED8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A3F70
	adds r0, r5, #0
	movs r1, #1
_080A3EE4:
	bl sub_080A6184
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3F70
	ldr r0, _080A3F04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F70
	ldr r0, _080A3F08 @ =0x00000386
	bl sub_080BE594
	b _080A3F70
	.align 2, 0
_080A3F04: .4byte 0x0202BBF8
_080A3F08: .4byte 0x00000386
_080A3F0C:
	ldr r0, _080A3F3C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A3F48
	cmp r1, #1
	beq _080A3F70
	movs r0, #1
	strb r0, [r4]
	ldr r0, _080A3F40 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F34
	ldr r0, _080A3F44 @ =0x00000387
	bl sub_080BE594
_080A3F34:
	adds r0, r5, #0
	bl sub_080A3404
	b _080A3F70
	.align 2, 0
_080A3F3C: .4byte 0x08B857F8
_080A3F40: .4byte 0x0202BBF8
_080A3F44: .4byte 0x00000387
_080A3F48:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A3F70
	cmp r1, #2
	beq _080A3F70
	movs r0, #2
	strb r0, [r4]
	ldr r0, _080A3FA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3F6A
	ldr r0, _080A3FA8 @ =0x00000387
	bl sub_080BE594
_080A3F6A:
	adds r0, r5, #0
	bl sub_080A3404
_080A3F70:
	ldr r0, _080A3FAC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A4060
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A4028
	cmp r0, #8
	bgt _080A3FB6
	cmp r0, #2
	beq _080A3FCA
	cmp r0, #2
	bgt _080A3FB0
	cmp r0, #1
	beq _080A3FE8
	b _080A40E4
	.align 2, 0
_080A3FA4: .4byte 0x0202BBF8
_080A3FA8: .4byte 0x00000387
_080A3FAC: .4byte 0x08B857F8
_080A3FB0:
	cmp r0, #4
	beq _080A4028
	b _080A40E4
_080A3FB6:
	cmp r0, #0x40
	beq _080A4028
	cmp r0, #0x40
	bgt _080A3FC4
	cmp r0, #0x10
	beq _080A400C
	b _080A40E4
_080A3FC4:
	cmp r0, #0x80
	beq _080A3FD6
	b _080A40E4
_080A3FCA:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A4028
	b _080A3FE8
_080A3FD6:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A3FE8
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
_080A3FE8:
	ldr r0, _080A4004 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3FFA
	ldr r0, _080A4008 @ =0x0000038A
	bl sub_080BE594
_080A3FFA:
	adds r0, r5, #0
	bl sub_080A3354
	b _080A40E4
	.align 2, 0
_080A4004: .4byte 0x0202BBF8
_080A4008: .4byte 0x0000038A
_080A400C:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4038
	ldr r0, _080A4030 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4028
	ldr r0, _080A4034 @ =0x0000038A
	bl sub_080BE594
_080A4028:
	adds r0, r5, #0
	bl sub_080A3CAC
	b _080A40E4
	.align 2, 0
_080A4030: .4byte 0x0202BBF8
_080A4034: .4byte 0x0000038A
_080A4038:
	adds r0, r5, #0
	bl sub_080A3C78
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A405C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A40E4
	movs r0, #0xe0
	lsls r0, r0, #2
	bl sub_080BE594
	b _080A40E4
	.align 2, 0
_080A405C: .4byte 0x0202BBF8
_080A4060:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A40E4
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	ldr r0, _080A4098 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4080
	ldr r0, _080A409C @ =0x0000038B
	bl sub_080BE594
_080A4080:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A40A0
	adds r0, r5, #0
	movs r1, #0
	bl sub_080A5F98
	adds r0, r5, #0
	bl sub_080A3404
	b _080A40E4
	.align 2, 0
_080A4098: .4byte 0x0202BBF8
_080A409C: .4byte 0x0000038B
_080A40A0:
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A40B8
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A40E4
_080A40B8:
	adds r4, r5, #0
	adds r4, #0x42
	movs r0, #0xc0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080A40DC
	adds r0, r5, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	b _080A40E4
_080A40DC:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080A40E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A40EC
sub_080A40EC: @ 0x080A40EC
	push {lr}
	bl sub_080A3CAC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A40F8
sub_080A40F8: @ 0x080A40F8
	adds r3, r0, #0
	adds r3, #0x2e
	movs r2, #0
	movs r1, #6
	strb r1, [r3]
	adds r0, #0x29
	strb r2, [r0]
	bx lr

	thumb_func_start sub_080A4108
sub_080A4108: @ 0x080A4108
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	cmp r0, #8
	bne _080A4180
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_080A6398
	movs r0, #4
	adds r1, r7, #0
	bl sub_080A6398
	ldrb r1, [r4]
	adds r0, r7, #0
	adds r0, #0x37
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080A415C
	lsls r0, r1, #0xb
	movs r1, #0xb4
	lsls r1, r1, #9
	adds r0, r0, r1
	ldr r1, _080A4158 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	ldrb r1, [r2]
	bl sub_08082308
	b _080A4172
	.align 2, 0
_080A4158: .4byte 0x0001FFFF
_080A415C:
	lsls r0, r1, #0xb
	movs r2, #0xb4
	lsls r2, r2, #9
	adds r0, r0, r2
	ldr r1, _080A417C @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_08082308
_080A4172:
	ldrb r0, [r4]
	bl sub_080A649C
	b _080A4248
	.align 2, 0
_080A417C: .4byte 0x0001FFFF
_080A4180:
	cmp r0, #0x20
	bne _080A41F6
	adds r0, r7, #0
	bl sub_080A602C
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _080A41AA
	adds r0, r7, #0
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A4248
_080A41AA:
	cmp r0, #0x40
	bne _080A41B8
	adds r0, r7, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080A4248
_080A41B8:
	adds r0, r7, #0
	bl sub_080A6220
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4248
	adds r2, r7, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A41DC
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A41EC
_080A41DC:
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #1
	bl sub_080A6114
	strb r0, [r4]
_080A41EC:
	adds r0, r7, #0
	movs r1, #5
	bl Proc_Goto
	b _080A4248
_080A41F6:
	cmp r0, #0x30
	bne _080A4248
	adds r0, r7, #0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x2d
	movs r0, #0xff
	strb r0, [r2]
	strb r1, [r3]
	adds r0, r7, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, #5
	ldrb r0, [r0]
	bl sub_080A336C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, _080A4240 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4236
	ldr r0, _080A4244 @ =0x0000038B
	bl sub_080BE594
_080A4236:
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _080A43CC
	.align 2, 0
_080A4240: .4byte 0x0202BBF8
_080A4244: .4byte 0x0000038B
_080A4248:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0x10
	bne _080A42C0
	ldr r4, _080A42BC @ =0x080C5A48
	movs r3, #0x80
	adds r3, r3, r4
	mov sb, r3
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	b _080A4338
	.align 2, 0
_080A42BC: .4byte 0x080C5A48
_080A42C0:
	cmp r1, #7
	bhi _080A4348
	ldr r4, _080A4344 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, r6, r1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	adds r1, r6, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r6, r6, r1
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
_080A4338:
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08003388
	b _080A43C4
	.align 2, 0
_080A4344: .4byte 0x080C5A48
_080A4348:
	cmp r1, #0xf
	bhi _080A43C4
	ldr r4, _080A43DC @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, #0xe0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r1, #0xe0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08003388
_080A43C4:
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A43CC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A43DC: .4byte 0x080C5A48

	thumb_func_start sub_080A43E0
sub_080A43E0: @ 0x080A43E0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0x24
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A4422
	adds r0, r5, #0
	bl Proc_Break
_080A4422:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4428
sub_080A4428: @ 0x080A4428
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #4
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A446A
	ldr r0, _080A4470 @ =0x084130A4
	ldr r1, _080A4474 @ =0x06013800
	bl Decompress
	adds r0, r5, #0
	bl Proc_Break
_080A446A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4470: .4byte 0x084130A4
_080A4474: .4byte 0x06013800

	thumb_func_start sub_080A4478
sub_080A4478: @ 0x080A4478
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r1, #0xdc
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A44B8
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A44B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A44C0
sub_080A44C0: @ 0x080A44C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A44FC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080A44FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A4504
sub_080A4504: @ 0x080A4504
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xc
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	adds r1, #0x24
	subs r0, #0x17
	strb r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A454E
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_080A454E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4554
sub_080A4554: @ 0x080A4554
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xd
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r0, #0xdc
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, #0x24
	subs r1, #0x17
	strb r0, [r1]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A4598
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A4598:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A45A0
sub_080A45A0: @ 0x080A45A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r7, [r2]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A45E4 @ =0x08B857F8
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A45E8
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A45DE
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A4612
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
_080A45DE:
	subs r0, #1
	strb r0, [r2]
	b _080A4612
	.align 2, 0
_080A45E4: .4byte 0x08B857F8
_080A45E8:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A4612
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A4606
	adds r0, r1, #1
	strb r0, [r2]
	b _080A4612
_080A4606:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080A4612
	strb r5, [r2]
_080A4612:
	adds r0, r4, #0
	adds r0, #0x34
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r7, r0
	beq _080A4630
	ldr r0, _080A4680 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4630
	ldr r0, _080A4684 @ =0x00000386
	bl sub_080BE594
_080A4630:
	ldr r0, _080A4688 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A4712
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	ldrb r1, [r5]
	bl sub_080A336C
	adds r5, r4, #0
	adds r5, #0x35
	movs r6, #0
	strb r0, [r5]
	ldr r0, _080A4680 @ =0x0202BBF8
	adds r7, r0, #0
	adds r7, #0x41
	ldrb r1, [r7]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _080A4666
	ldr r0, _080A468C @ =0x0000038A
	bl sub_080BE594
_080A4666:
	adds r0, r4, #0
	adds r0, #0x29
	strb r6, [r0]
	ldrb r0, [r5]
	cmp r0, #8
	beq _080A46DE
	cmp r0, #8
	bgt _080A4690
	cmp r0, #2
	beq _080A46D4
	cmp r0, #4
	beq _080A46E8
	b _080A4702
	.align 2, 0
_080A4680: .4byte 0x0202BBF8
_080A4684: .4byte 0x00000386
_080A4688: .4byte 0x08B857F8
_080A468C: .4byte 0x0000038A
_080A4690:
	cmp r0, #0x20
	beq _080A4698
	cmp r0, #0x40
	bne _080A4702
_080A4698:
	bl sub_080A05F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_080A6114
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A474C
	ldrb r7, [r7]
	lsls r0, r7, #0x1e
	cmp r0, #0
	blt _080A46C4
	ldr r0, _080A46D0 @ =0x0000038A
	bl sub_080BE594
_080A46C4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080A473A
	.align 2, 0
_080A46D0: .4byte 0x0000038A
_080A46D4:
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	b _080A46F2
_080A46DE:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x29
	b _080A46F0
_080A46E8:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x30
_080A46F0:
	movs r1, #0xc0
_080A46F2:
	movs r3, #0x18
	bl sub_080040F8
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A473A
_080A4702:
	adds r0, r4, #0
	bl sub_080A3354
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080A473A
_080A4712:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A473A
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r0, _080A4744 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A473A
	ldr r0, _080A4748 @ =0x0000038B
	bl sub_080BE594
_080A473A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4744: .4byte 0x0202BBF8
_080A4748: .4byte 0x0000038B

	thumb_func_start sub_080A474C
sub_080A474C: @ 0x080A474C
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r4, [r2]
	cmp r4, #2
	bls _080A475E
	movs r0, #0
	strb r0, [r2]
_080A475E:
	cmp r1, #0
	bne _080A4766
_080A4762:
	movs r0, #1
	b _080A47AE
_080A4766:
	cmp r1, #0
	ble _080A4778
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080A4774
	adds r0, #1
	b _080A4784
_080A4774:
	movs r0, #0
	b _080A4784
_080A4778:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A4782
	movs r0, #2
	b _080A4784
_080A4782:
	subs r0, #1
_080A4784:
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r4, r0
	beq _080A47AC
	ldr r0, _080A47A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4762
	ldr r0, _080A47A8 @ =0x00000386
	bl sub_080BE594
	b _080A4762
	.align 2, 0
_080A47A4: .4byte 0x0202BBF8
_080A47A8: .4byte 0x00000386
_080A47AC:
	movs r0, #0
_080A47AE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A47B4
sub_080A47B4: @ 0x080A47B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A47E4 @ =0x06013800
	movs r1, #9
	bl sub_08082528
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl sub_08081A94
	ldr r0, _080A47E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A47DE
	movs r0, #0xe4
	lsls r0, r0, #2
	bl sub_080BE594
_080A47DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A47E4: .4byte 0x06013800
_080A47E8: .4byte 0x0202BBF8

	thumb_func_start sub_080A47EC
sub_080A47EC: @ 0x080A47EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A4820 @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _080A4824 @ =0x00000103
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A481A
	ldr r0, _080A4828 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4810
	ldr r0, _080A482C @ =0x00000391
	bl sub_080BE594
_080A4810:
	bl sub_08081B44
	adds r0, r4, #0
	bl Proc_Break
_080A481A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4820: .4byte 0x08B857F8
_080A4824: .4byte 0x00000103
_080A4828: .4byte 0x0202BBF8
_080A482C: .4byte 0x00000391

	thumb_func_start sub_080A4830
sub_080A4830: @ 0x080A4830
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080A484C @ =0x08CE3C24
	bl SpawnProcLocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A484C: .4byte 0x08CE3C24

	thumb_func_start sub_080A4850
sub_080A4850: @ 0x080A4850
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x36
	ldrb r1, [r3]
	cmp r1, #0
	bne _080A4896
	ldr r0, _080A4880 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A4884
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_080A474C
	b _080A48EE
	.align 2, 0
_080A4880: .4byte 0x08B857F8
_080A4884:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A48EE
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A474C
	b _080A48EE
_080A4896:
	ldr r0, _080A48C0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A48CC
	cmp r1, #1
	beq _080A48EE
	movs r0, #1
	strb r0, [r3]
	ldr r0, _080A48C4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A48EE
	ldr r0, _080A48C8 @ =0x00000387
	bl sub_080BE594
	b _080A48EE
	.align 2, 0
_080A48C0: .4byte 0x08B857F8
_080A48C4: .4byte 0x0202BBF8
_080A48C8: .4byte 0x00000387
_080A48CC:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A48EE
	cmp r1, #2
	beq _080A48EE
	movs r0, #2
	strb r0, [r3]
	ldr r0, _080A4930 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A48EE
	ldr r0, _080A4934 @ =0x00000387
	bl sub_080BE594
_080A48EE:
	ldr r0, _080A4938 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A49AC
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _080A4946
	cmp r0, #0x40
	bne _080A49FE
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	adds r0, r3, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A493C
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A4966
	b _080A4990
	.align 2, 0
_080A4930: .4byte 0x0202BBF8
_080A4934: .4byte 0x00000387
_080A4938: .4byte 0x08B857F8
_080A493C:
	movs r2, #0xed
	lsls r2, r2, #3
	movs r0, #0x40
	movs r1, #0x30
	b _080A499E
_080A4946:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r2
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A4998
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A4990
_080A4966:
	adds r0, r2, #0
	bl sub_080A08EC
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	ldr r0, _080A4988 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A49FE
	ldr r0, _080A498C @ =0x0000038A
	bl sub_080BE594
	b _080A49FE
	.align 2, 0
_080A4988: .4byte 0x0202BBF8
_080A498C: .4byte 0x0000038A
_080A4990:
	adds r0, r4, #0
	bl sub_080A3CAC
	b _080A49FE
_080A4998:
	ldr r2, _080A49A8 @ =0x00000767
	movs r0, #0x2e
	movs r1, #0x38
_080A499E:
	adds r3, r4, #0
	bl sub_080A4830
	b _080A49FE
	.align 2, 0
_080A49A8: .4byte 0x00000767
_080A49AC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A49FE
	ldr r0, _080A49E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A49C6
	ldr r0, _080A49E4 @ =0x0000038B
	bl sub_080BE594
_080A49C6:
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r5, [r0]
	cmp r5, #0
	beq _080A49E8
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A5F98
	adds r0, r4, #0
	bl sub_080A3404
	b _080A49FE
	.align 2, 0
_080A49E0: .4byte 0x0202BBF8
_080A49E4: .4byte 0x0000038B
_080A49E8:
	ldr r0, _080A4A04 @ =0x084130A4
	ldr r1, _080A4A08 @ =0x06013800
	bl Decompress
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_080A49FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4A04: .4byte 0x084130A4
_080A4A08: .4byte 0x06013800

	thumb_func_start sub_080A4A0C
sub_080A4A0C: @ 0x080A4A0C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	movs r2, #2
	bl sub_080A6334
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4A24
sub_080A4A24: @ 0x080A4A24
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A4A32
	bl sub_080124F8
_080A4A32:
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r2, [r5]
	cmp r2, #0x20
	bne _080A4A60
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A4AD6
	movs r0, #6
	bl SetNextGameAction
	b _080A4AD6
_080A4A60:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080A4AD6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080A4A98
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _080A4A90
	movs r0, #0xb
	bl SetNextGameAction
	b _080A4AD6
_080A4A90:
	movs r0, #5
	bl SetNextGameAction
	b _080A4AD6
_080A4A98:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A4AAE
	movs r0, #3
	bl sub_080A1258
	movs r0, #4
	bl SetNextGameAction
	b _080A4AD6
_080A4AAE:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0
	beq _080A4AC8
	adds r4, #0x2c
	ldrb r0, [r4]
	bl sub_080A08EC
	ldrb r0, [r4]
	adds r0, #1
	bl SetNextGameAction
	b _080A4AD6
_080A4AC8:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A4AD6
	movs r0, #0
	bl SetNextGameAction
_080A4AD6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A4ADC
sub_080A4ADC: @ 0x080A4ADC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0x20
	strh r0, [r1]
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080A4B04
	bl sub_080124F8
_080A4B04:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #4
	beq _080A4B30
	cmp r0, #4
	bgt _080A4B18
	cmp r0, #2
	beq _080A4B28
	b _080A4B40
_080A4B18:
	cmp r0, #8
	beq _080A4B38
	cmp r0, #0x20
	bne _080A4B40
	adds r0, r4, #0
	bl sub_080ADAF8
	b _080A4B40
_080A4B28:
	adds r0, r4, #0
	bl sub_080AC2AC
	b _080A4B40
_080A4B30:
	adds r0, r4, #0
	bl sub_0809BE68
	b _080A4B40
_080A4B38:
	ldr r0, _080A4B48 @ =0x08CC51D0
	adds r1, r4, #0
	bl SpawnProcLocking
_080A4B40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B48: .4byte 0x08CC51D0

	thumb_func_start sub_080A4B4C
sub_080A4B4C: @ 0x080A4B4C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #4
	beq _080A4B72
	cmp r1, #4
	bgt _080A4B62
	cmp r1, #2
	beq _080A4B72
	b _080A4B78
_080A4B62:
	cmp r1, #8
	beq _080A4B72
	cmp r1, #0x20
	bne _080A4B78
	movs r1, #0xb
	bl Proc_Goto
	b _080A4B78
_080A4B72:
	movs r1, #0xa
	bl Proc_Goto
_080A4B78:
	pop {r0}
	bx r0

	thumb_func_start sub_080A4B7C
sub_080A4B7C: @ 0x080A4B7C
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r2, _080A4BD4 @ =0x03002870
	movs r0, #0x20
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080A4BD4: .4byte 0x03002870

	thumb_func_start sub_080A4BD8
sub_080A4BD8: @ 0x080A4BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r4, [r0]
	adds r4, #1
	strb r4, [r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080A4BF6
	adds r0, #0xff
_080A4BF6:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080A4C30 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x50
	subs r0, r0, r2
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r2, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080A4C2A
	adds r0, r5, #0
	bl Proc_Break
_080A4C2A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4C30: .4byte 0x03002870

	thumb_func_start sub_080A4C34
sub_080A4C34: @ 0x080A4C34
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r4, [r0]
	adds r4, #1
	strb r4, [r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080A4C52
	adds r0, #0xff
_080A4C52:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080A4C90 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080A4C8A
	adds r0, r5, #0
	bl Proc_Break
_080A4C8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4C90: .4byte 0x03002870

	thumb_func_start sub_080A4C94
sub_080A4C94: @ 0x080A4C94
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080A4D2C @ =0x02023460
	movs r1, #0
	bl TmFill
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A4D30 @ =0x084130A4
	ldr r1, _080A4D34 @ =0x06013800
	bl Decompress
	ldr r0, _080A4D38 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080A4D3C @ =0x084120A0
	ldr r1, _080A4D40 @ =0x06010800
	bl Decompress
	ldr r0, _080A4D44 @ =0x02022C60
	ldr r1, _080A4D48 @ =0x0840FA00
	movs r2, #0
	bl TmApplyTsa_t
	ldr r1, _080A4D4C @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A4D50 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	bl sub_080A5EF0
	adds r0, r4, #0
	bl sub_080A35DC
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_080A649C
	movs r0, #0xc
	bl sub_0800480C
	movs r0, #0xd
	bl sub_0800480C
	movs r0, #3
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	beq _080A4D24
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xdc
	strb r0, [r1]
_080A4D24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4D2C: .4byte 0x02023460
_080A4D30: .4byte 0x084130A4
_080A4D34: .4byte 0x06013800
_080A4D38: .4byte 0x084138F0
_080A4D3C: .4byte 0x084120A0
_080A4D40: .4byte 0x06010800
_080A4D44: .4byte 0x02022C60
_080A4D48: .4byte 0x0840FA00
_080A4D4C: .4byte 0x02000000
_080A4D50: .4byte 0x02000001

	thumb_func_start sub_080A4D54
sub_080A4D54: @ 0x080A4D54
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	cmp r1, #3
	bne _080A4D68
	movs r1, #2
	bl Proc_Goto
	b _080A4D6E
_080A4D68:
	movs r1, #5
	bl Proc_Goto
_080A4D6E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A4D74
sub_080A4D74: @ 0x080A4D74
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A4D8E
	movs r0, #0xc0
	movs r1, #8
	bl sub_08081FBC
_080A4D8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A4D94
sub_080A4D94: @ 0x080A4D94
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #0x20
	bne _080A4DA4
	bl sub_080A511C
_080A4DA4:
	pop {r0}
	bx r0

	thumb_func_start sub_080A4DA8
sub_080A4DA8: @ 0x080A4DA8
	push {lr}
	bl sub_08082014
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A4DB4
sub_080A4DB4: @ 0x080A4DB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4DE4 @ =0x08CE3C54
	bl SpawnProcLocking
	adds r3, r0, #0
	adds r3, #0x42
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	adds r0, #0x35
	strb r2, [r0]
	ldr r2, _080A4DE8 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080A4DE4: .4byte 0x08CE3C54
_080A4DE8: .4byte 0x0202BBF8

	thumb_func_start sub_080A4DEC
sub_080A4DEC: @ 0x080A4DEC
	push {lr}
	adds r2, r0, #0
	ldr r1, _080A4E08 @ =0x0202BBB8
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A4E04
	adds r0, r2, #0
	movs r1, #0x14
	bl Proc_Goto
_080A4E04:
	pop {r0}
	bx r0
	.align 2, 0
_080A4E08: .4byte 0x0202BBB8

	thumb_func_start sub_080A4E0C
sub_080A4E0C: @ 0x080A4E0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4E1C @ =0x08CE3F24
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080A4E1C: .4byte 0x08CE3F24

	thumb_func_start sub_080A4E20
sub_080A4E20: @ 0x080A4E20
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4E30 @ =0x08CE4034
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080A4E30: .4byte 0x08CE4034

	thumb_func_start sub_080A4E34
sub_080A4E34: @ 0x080A4E34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080A4E54 @ =0x08CE3C54
	bl Proc_Find
	cmp r0, #0
	beq _080A4E4E
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	adds r0, #0x3d
	strb r5, [r0]
_080A4E4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E54: .4byte 0x08CE3C54

	thumb_func_start sub_080A4E58
sub_080A4E58: @ 0x080A4E58
	push {r4, r5, lr}
	ldr r0, _080A4F40 @ =0x08CE3C0C
	bl InitBgs
	ldr r4, _080A4F44 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x3f
	ldrb r2, [r4, #0x15]
	ands r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #0x15]
	movs r0, #3
	ldrb r1, [r4, #0xc]
	orrs r0, r1
	strb r0, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	strb r0, [r4, #0x10]
	adds r0, r1, #0
	ldrb r2, [r4, #0x14]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #0x18]
	bl EndAllMus
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	ldr r1, _080A4F48 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	ldr r1, _080A4F4C @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _080A4F50 @ =sub_080A32D4
	bl SetOnHBlankA
	ldr r0, _080A4F54 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080A4F58 @ =0x0840F9A0
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r4, _080A4F5C @ =0x08418E44
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A4F60 @ =0x02022C60
	ldr r1, _080A4F64 @ =0x0840FA00
	movs r2, #0
	bl TmApplyTsa_t
	ldr r4, _080A4F68 @ =0x0840FEB4
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A4F6C @ =0x02024460
	ldr r1, _080A4F70 @ =0x08411F34
	movs r2, #0
	movs r3, #5
	bl sub_08001F3C
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4F40: .4byte 0x08CE3C0C
_080A4F44: .4byte 0x03002870
_080A4F48: .4byte 0x02000001
_080A4F4C: .4byte 0x02000000
_080A4F50: .4byte sub_080A32D4
_080A4F54: .4byte 0x084138F0
_080A4F58: .4byte 0x0840F9A0
_080A4F5C: .4byte 0x08418E44
_080A4F60: .4byte 0x02022C60
_080A4F64: .4byte 0x0840FA00
_080A4F68: .4byte 0x0840FEB4
_080A4F6C: .4byte 0x02024460
_080A4F70: .4byte 0x08411F34

	thumb_func_start sub_080A4F74
sub_080A4F74: @ 0x080A4F74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080A5018 @ =0x08CE40F4
	ldr r1, [r4]
	ldr r2, _080A501C @ =0x01000142
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	bl sub_0809F134
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A500C
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov sb, r0
	movs r7, #0x1f
_080A4FAE:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	movs r4, #3
	ldrb r2, [r1]
	ands r4, r2
	cmp r4, #1
	bne _080A4FF8
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _080A4FD8
	str r4, [r5, #0x58]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x75
	bl sub_0809F748
_080A4FD8:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	ldrb r2, [r1, #1]
	cmp r2, #4
	bne _080A4FF8
	str r4, [r5, #0x5c]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x76
	bl sub_0809F748
_080A4FF8:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080A4FAE
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080A5020
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080A5020
_080A500C:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080A5028
	.align 2, 0
_080A5018: .4byte 0x08CE40F4
_080A501C: .4byte 0x01000142
_080A5020:
	ldr r0, _080A5038 @ =0x06013800
	movs r1, #9
	bl sub_08082528
_080A5028:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5038: .4byte 0x06013800

	thumb_func_start sub_080A503C
sub_080A503C: @ 0x080A503C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080A5078
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A506C @ =0x00000765
	movs r0, #0x40
	movs r1, #0x30
	bl sub_08081A94
	ldr r0, _080A5070 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5080
	ldr r0, _080A5074 @ =0x0000037B
	bl sub_080BE594
	b _080A5080
	.align 2, 0
_080A506C: .4byte 0x00000765
_080A5070: .4byte 0x0202BBF8
_080A5074: .4byte 0x0000037B
_080A5078:
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_080A5080:
	pop {r0}
	bx r0

	thumb_func_start sub_080A5084
sub_080A5084: @ 0x080A5084
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080A50C0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A50B4 @ =0x00000766
	movs r0, #0x40
	movs r1, #0x30
	bl sub_08081A94
	ldr r0, _080A50B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A50C8
	ldr r0, _080A50BC @ =0x0000037B
	bl sub_080BE594
	b _080A50C8
	.align 2, 0
_080A50B4: .4byte 0x00000766
_080A50B8: .4byte 0x0202BBF8
_080A50BC: .4byte 0x0000037B
_080A50C0:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A50C8:
	pop {r0}
	bx r0

	thumb_func_start sub_080A50CC
sub_080A50CC: @ 0x080A50CC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080A50FC
	ldr r0, _080A50F8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A5100
	bl sub_08081B44
	adds r0, r4, #0
	bl Proc_Break
	b _080A5100
	.align 2, 0
_080A50F8: .4byte 0x08B857F8
_080A50FC:
	adds r0, r2, #1
	strh r0, [r1]
_080A5100:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A5108
sub_080A5108: @ 0x080A5108
	push {lr}
	ldr r0, _080A5118 @ =0x08CE40F4
	ldr r0, [r0]
	bl sub_0809F190
	pop {r0}
	bx r0
	.align 2, 0
_080A5118: .4byte 0x08CE40F4

	thumb_func_start sub_080A511C
sub_080A511C: @ 0x080A511C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A512C @ =0x08CE40F8
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080A512C: .4byte 0x08CE40F8

	thumb_func_start sub_080A5130
sub_080A5130: @ 0x080A5130
	lsls r2, r2, #4
	cmp r2, #0
	ble _080A5146
	adds r3, r0, #0
_080A5138:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080A5138
_080A5146:
	bx lr

	thumb_func_start sub_080A5148
sub_080A5148: @ 0x080A5148
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	movs r0, #0x3f
	ands r5, r0
	movs r1, #0x20
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080A5168
	movs r0, #0x1f
	ands r0, r5
	subs r5, r1, r0
_080A5168:
	movs r0, #1
	mov ip, r0
	ldr r0, _080A520C @ =0x02000004
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	subs r6, r1, r5
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r0, #0x22
	mov r8, r0
	movs r4, #0x1f
	mov sl, r4
_080A5182:
	mov r0, ip
	subs r0, #8
	cmp r0, #2
	bls _080A51EC
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _080A5210 @ =0x02022860
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r2, r8
	ldrh r4, [r2]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	adds r3, r0, #0
	muls r3, r6, r3
	adds r0, r4, #0
	ands r0, r2
	muls r0, r5, r0
	adds r3, r3, r0
	asrs r3, r3, #5
	ands r3, r2
	adds r0, r1, #0
	ands r0, r7
	adds r2, r0, #0
	muls r2, r6, r2
	adds r0, r4, #0
	ands r0, r7
	muls r0, r5, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r7
	mov r0, sl
	ands r1, r0
	muls r1, r6, r1
	ands r4, r0
	adds r0, r4, #0
	muls r0, r5, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	movs r4, #0x1f
	ands r1, r4
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r4, _080A5210 @ =0x02022860
	adds r0, r0, r4
	orrs r3, r2
	orrs r1, r3
	strh r1, [r0]
_080A51EC:
	movs r0, #2
	add r8, r0
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #0xf
	ble _080A5182
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A520C: .4byte 0x02000004
_080A5210: .4byte 0x02022860

	thumb_func_start sub_080A5214
sub_080A5214: @ 0x080A5214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r7, r1, #0x18
	movs r1, #0x8f
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5260
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	b _080A5280
_080A5260:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
_080A5280:
	mov r1, sb
	adds r1, #8
	adds r2, r7, #0
	subs r2, #0xe
	ldr r3, _080A5410 @ =0x08CE41BC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl sub_08006A34
	mov r1, sb
	adds r1, #0x10
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _080A5414 @ =0x08CE4286
	movs r0, #0xc0
	lsls r0, r0, #7
	mov r8, r0
	str r0, [sp]
	movs r0, #0xd
	bl sub_08006A34
	add r0, sp, #4
	adds r6, r7, #0
	subs r6, #8
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _080A52FE
	mov r5, sb
	adds r5, #0x12
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0x64
	mov sl, r1
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08006A34
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	subs r4, r4, r0
	strh r4, [r5]
_080A52FE:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080A532C
	mov r5, sb
	adds r5, #0x1a
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08006A34
_080A532C:
	mov r5, sb
	adds r5, #0x22
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r1, r8
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08006A34
	mov r1, sb
	adds r1, #0x2a
	subs r2, r7, #7
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl sub_08006A34
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08006A34
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08006A34
	mov r1, sb
	adds r1, #0x42
	adds r2, r7, #1
	ldr r4, _080A541C @ =0x08CE4294
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl sub_08006A34
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08006A34
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08006A34
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5410: .4byte 0x08CE41BC
_080A5414: .4byte 0x08CE4286
_080A5418: .4byte 0x08CE42C0
_080A541C: .4byte 0x08CE4294

	thumb_func_start sub_080A5420
sub_080A5420: @ 0x080A5420
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	movs r7, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x3b
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_08003388
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_08003388
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_08003388
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_080A5EDC
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080A5490
	str r7, [r1, #0x60]
	b _080A54AE
_080A5490:
	ldr r0, _080A54C4 @ =0x08413A50
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xb0
	lsls r3, r3, #1
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_0801245C
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080A54AE:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	strb r1, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A54C4: .4byte 0x08413A50

	thumb_func_start sub_080A54C8
sub_080A54C8: @ 0x080A54C8
	push {lr}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A54F4
	ldr r2, _080A54F0 @ =0x02022860
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080A5502
	.align 2, 0
_080A54F0: .4byte 0x02022860
_080A54F4:
	ldr r0, _080A550C @ =0x02022860
	ldr r2, _080A5510 @ =0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080A5502:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080A550C: .4byte 0x02022860
_080A5510: .4byte 0x0000033A

	thumb_func_start sub_080A5514
sub_080A5514: @ 0x080A5514
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A5584 @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A5588 @ =0x08CE4158
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl sub_08006A34
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #9
	add r8, r1
	ldr r0, _080A558C @ =0x08CE4584
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl sub_08006A34
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5584: .4byte 0x000001FF
_080A5588: .4byte 0x08CE4158
_080A558C: .4byte 0x08CE4584

	thumb_func_start sub_080A5590
sub_080A5590: @ 0x080A5590
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A5600 @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A5604 @ =0x08CE4158
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl sub_08006A34
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #9
	add r8, r1
	ldr r0, _080A5608 @ =0x08CE456C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl sub_08006A34
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5600: .4byte 0x000001FF
_080A5604: .4byte 0x08CE4158
_080A5608: .4byte 0x08CE456C

	thumb_func_start sub_080A560C
sub_080A560C: @ 0x080A560C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x3c
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r1, [r4]
	ldrb r2, [r0]
	cmp r1, r2
	beq _080A5636
	ldrb r0, [r0]
	bl sub_080A649C
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4]
_080A5636:
	ldrh r0, [r7, #0x2a]
	ldrb r1, [r4]
	bl sub_080A652C
	ldr r2, _080A5684 @ =0x02022860
	ldr r3, _080A5688 @ =0x02000004
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r7, #0x14]
	adds r4, r1, #0
	adds r4, #0x3f
	ldrb r3, [r4]
	adds r0, r3, #0
	cmp r0, #0xff
	beq _080A572A
	adds r5, r1, #0
	adds r5, #0x44
	ldrh r2, [r5]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080A572A
	cmp r1, #0xf
	bhi _080A568C
	movs r0, #0xff
	strb r0, [r4]
	b _080A5720
	.align 2, 0
_080A5684: .4byte 0x02022860
_080A5688: .4byte 0x02000004
_080A568C:
	ldr r0, _080A5744 @ =0x080C5A48
	mov sb, r0
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r5]
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	ands r4, r0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_08003388
_080A5720:
	ldr r0, [r7, #0x14]
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #0x10
	strh r1, [r0]
_080A572A:
	ldrh r0, [r7, #0x2a]
	bl sub_080A5148
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5744: .4byte 0x080C5A48

	thumb_func_start sub_080A5748
sub_080A5748: @ 0x080A5748
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	adds r1, #0x2f
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r5, r0, r1
	ldr r2, _080A57AC @ =0x000001FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _080A57B0 @ =0x08CE4158
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	adds r2, r5, #0
	bl sub_08006A34
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A57DC
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_080A33E0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _080A57B8
	adds r2, r5, #0
	adds r2, #9
	ldr r0, _080A57AC @ =0x000001FF
	ands r2, r0
	ldr r0, _080A57B4 @ =0x08CE4584
	ldr r3, [r0, #0x24]
	b _080A57C4
	.align 2, 0
_080A57AC: .4byte 0x000001FF
_080A57B0: .4byte 0x08CE4158
_080A57B4: .4byte 0x08CE4584
_080A57B8:
	adds r2, r5, #0
	adds r2, #9
	ldr r0, _080A57D4 @ =0x000001FF
	ands r2, r0
	ldr r0, _080A57D8 @ =0x08CE4584
	ldr r3, [r0, #0x20]
_080A57C4:
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl sub_08006A34
	b _080A5806
	.align 2, 0
_080A57D4: .4byte 0x000001FF
_080A57D8: .4byte 0x08CE4584
_080A57DC:
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_080A33E0
	lsls r0, r0, #0x18
	adds r2, r5, #0
	adds r2, #9
	ldr r1, _080A5810 @ =0x000001FF
	ands r2, r1
	ldr r1, _080A5814 @ =0x08CE4584
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl sub_08006A34
_080A5806:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5810: .4byte 0x000001FF
_080A5814: .4byte 0x08CE4584

	thumb_func_start sub_080A5818
sub_080A5818: @ 0x080A5818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080A584A
	cmp r1, #0x20
	bne _080A5844
	adds r0, #0x35
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x33
	strb r0, [r1]
	b _080A584A
_080A5844:
	mov r0, r8
	adds r0, #0x33
	strb r2, [r0]
_080A584A:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x2f
	adds r1, r2, #0
	adds r1, #0x46
	ldrh r1, [r1]
	ldrb r0, [r0]
	adds r5, r1, r0
	cmp r5, #0xdb
	bgt _080A590A
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	movs r1, #0x44
	subs r6, r1, r0
	cmp r6, #1
	bgt _080A5876
	movs r6, #2
_080A5876:
	movs r7, #0
	cmp r7, r3
	bge _080A58E2
	adds r4, r6, #0
	movs r1, #0x38
	mov sb, r1
_080A5882:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r7, #0
	bl sub_080A336C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080A33E0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A58BE
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_080A5514
	b _080A58D2
_080A58BE:
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_080A5514
_080A58D2:
	adds r4, #0x18
	adds r7, #1
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r7, r0
	blt _080A5882
_080A58E2:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #2
	bne _080A590A
	adds r0, #0x2b
	ldrb r3, [r0]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r2, r6, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_080A5E8C
_080A590A:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x46
	ldrh r1, [r1]
	subs r1, #1
	lsls r1, r1, #0x10
	movs r2, #0xdb
	lsls r2, r2, #0x11
	adds r3, r0, #0
	cmp r1, r2
	bhi _080A59EC
	adds r1, r3, #0
	adds r1, #0x33
	ldrb r2, [r1]
	cmp r2, #7
	bne _080A5932
	movs r5, #2
	movs r6, #0x15
	b _080A5946
_080A5932:
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	movs r1, #0x44
	subs r5, r1, r0
	cmp r5, #1
	bgt _080A5944
	movs r5, #2
_080A5944:
	movs r6, #0x18
_080A5946:
	movs r7, #0
	adds r0, r3, #0
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	bge _080A59C6
	adds r4, r5, #0
_080A5956:
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r7, #0
	bl sub_080A336C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080A33E0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A5998
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_080A5590
	b _080A59B4
_080A5998:
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_080A5590
_080A59B4:
	adds r4, r4, r6
	adds r7, #1
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	blt _080A5956
_080A59C6:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0xa
	bne _080A59EC
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r5, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_080A5E8C
_080A59EC:
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A59FA
	b _080A5B78
_080A59FA:
	mov r0, r8
	bl sub_080A5214
	mov r0, r8
	bl sub_080A5748
	movs r7, #0
	movs r0, #0xf
	mov sl, r0
_080A5A0C:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	movs r2, #0
	mov sb, r2
	ldrb r1, [r1]
	cmp r1, #6
	bne _080A5A2C
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080A5A2C
	movs r3, #0x80
	lsls r3, r3, #1
	mov sb, r3
_080A5A2C:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xe8
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A5AE8 @ =0x000001FF
	ands r1, r2
	lsls r5, r7, #5
	adds r2, r5, #0
	adds r2, #0x20
	add r2, sb
	ldr r0, _080A5AEC @ =0x08CE45B4
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	mov ip, r0
	lsls r4, r7, #1
	adds r0, r4, #0
	adds r0, #0xa
	mov r3, sl
	ands r0, r3
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r3, ip
	bl sub_08006A34
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xf4
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A5AE8 @ =0x000001FF
	ands r1, r2
	adds r5, #0x21
	add r5, sb
	adds r5, #8
	ldr r0, _080A5AF0 @ =0x08CE45A8
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r0, sl
	ands r4, r0
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl sub_08006A34
	adds r7, #1
	cmp r7, #2
	ble _080A5A0C
	mov r1, r8
	ldr r2, [r1, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080A5B78
	adds r1, r2, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	beq _080A5B18
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080A5AC6
	bl sub_080124F8
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080A5AC6:
	mov r3, r8
	ldr r2, [r3, #0x14]
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A5AF8
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5AF4 @ =0x08CE41B4
	movs r0, #0
	b _080A5B08
	.align 2, 0
_080A5AE8: .4byte 0x000001FF
_080A5AEC: .4byte 0x08CE45B4
_080A5AF0: .4byte 0x08CE45A8
_080A5AF4: .4byte 0x08CE41B4
_080A5AF8:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5B14 @ =0x08CE41B4
	movs r0, #0xc0
	lsls r0, r0, #7
_080A5B08:
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl sub_08006A34
	b _080A5B78
	.align 2, 0
_080A5B14: .4byte 0x08CE41B4
_080A5B18:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5B3E
	ldr r0, [r2, #0x60]
	adds r2, #0x2f
	movs r1, #0xda
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl sub_080124DC
	b _080A5B78
_080A5B3E:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl sub_080124DC
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	adds r2, #0x2f
	movs r1, #0xd3
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5BE8 @ =0x08CE41B4
	movs r0, #0xc0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl sub_08006A34
_080A5B78:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080A5C30
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A5BF0
	ldr r3, _080A5BEC @ =0x08CE4172
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x80
	bl sub_08006A34
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x34
	movs r1, #0x88
	bl sub_08049F58
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #0x1d
	movs r3, #0x80
	lsls r3, r3, #0x16
	adds r2, r2, r3
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_080A5E8C
	b _080A5C0E
	.align 2, 0
_080A5BE8: .4byte 0x08CE41B4
_080A5BEC: .4byte 0x08CE4172
_080A5BF0:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A5C0E
	ldrb r1, [r1]
	lsls r2, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_080A5E8C
_080A5C0E:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A5C30
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	movs r2, #0x80
	lsls r2, r2, #0x16
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	movs r0, #1
	mov r2, r8
	bl sub_080A5EAC
_080A5C30:
	mov r0, r8
	bl sub_080A560C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A5C48
sub_080A5C48: @ 0x080A5C48
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5C58 @ =0x08CE42EC
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080A5C58: .4byte 0x08CE42EC

	thumb_func_start sub_080A5C5C
sub_080A5C5C: @ 0x080A5C5C
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x35
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_080A5C90
sub_080A5C90: @ 0x080A5C90
	push {lr}
	sub sp, #8
	ldrh r1, [r0, #0x2a]
	adds r1, #1
	strh r1, [r0, #0x2a]
	ldr r1, [r0, #0x2c]
	subs r1, #4
	str r1, [r0, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_080A9DE8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	bl sub_080A9E7C
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r1, #0x78
	movs r2, #0xa0
	movs r3, #0x4c
	bl sub_080A9ECC
	bl sub_080011B0
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A5CE0
sub_080A5CE0: @ 0x080A5CE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A5CF4 @ =0x08CE4314
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A5CF4: .4byte 0x08CE4314

	thumb_func_start sub_080A5CF8
sub_080A5CF8: @ 0x080A5CF8
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x2d
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_080A5D2C
sub_080A5D2C: @ 0x080A5D2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _080A5DA4 @ =0x08418DA0
	add r0, sp, #4
	movs r2, #8
	bl memcpy
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	cmp r0, #3
	bhi _080A5D58
	adds r0, #1
	strb r0, [r2]
_080A5D58:
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0
	beq _080A5E34
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	mov sb, r1
	mov ip, r0
	adds r4, r7, #0
	adds r4, #0x30
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r2, [r2]
	cmp r2, #3
	bhi _080A5D92
	ldrb r0, [r4]
	add r0, r8
	lsrs r0, r0, #1
	mov r8, r0
	ldrb r1, [r5]
	adds r0, r1, r3
	lsrs r3, r0, #1
_080A5D92:
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A5DA8
	adds r0, r3, #0
	adds r0, #0x86
	b _080A5DAC
	.align 2, 0
_080A5DA4: .4byte 0x08418DA0
_080A5DA8:
	adds r0, r3, #0
	adds r0, #0xb0
_080A5DAC:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	strb r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	strb r0, [r5]
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A5E08
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r5, #7
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r0, _080A5E04 @ =0x08CE41AC
	mov sb, r0
	movs r4, #0x80
	lsls r4, r4, #5
	str r4, [sp]
	movs r0, #4
	adds r1, r3, #0
	mov r3, sb
	bl sub_08006A34
	orrs r6, r4
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #3
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r3, sb
	bl sub_08006A34
	b _080A5E28
	.align 2, 0
_080A5E04: .4byte 0x08CE41AC
_080A5E08:
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r1, #7
	ands r0, r1
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r3, _080A5E30 @ =0x08CE41AC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	bl sub_08006A34
_080A5E28:
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	b _080A5E3E
	.align 2, 0
_080A5E30: .4byte 0x08CE41AC
_080A5E34:
	ldrb r2, [r2]
	cmp r2, #4
	bne _080A5E40
	movs r0, #0
	mov r1, sl
_080A5E3E:
	strb r0, [r1]
_080A5E40:
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A5E60
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r2, [r0]
	ldr r3, _080A5E88 @ =0x08CE41AC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	bl sub_08006A34
_080A5E60:
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A5E6E
	movs r0, #0
	strb r0, [r4]
_080A5E6E:
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	movs r0, #1
	strb r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E88: .4byte 0x08CE41AC

	thumb_func_start sub_080A5E8C
sub_080A5E8C: @ 0x080A5E8C
	push {r4, lr}
	ldr r3, [r3, #0x34]
	movs r4, #0x2f
	strb r2, [r4, r3]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	adds r2, #4
	movs r1, #1
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A5EAC
sub_080A5EAC: @ 0x080A5EAC
	push {r4, lr}
	ldr r3, [r2, #0x34]
	movs r2, #0x32
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r4, ip
	strb r1, [r4]
	movs r1, #0x33
	adds r1, r1, r3
	mov ip, r1
	movs r1, #1
	mov r4, ip
	strb r1, [r4]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A5EDC
sub_080A5EDC: @ 0x080A5EDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5EEC @ =0x08CE433C
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080A5EEC: .4byte 0x08CE433C

	thumb_func_start sub_080A5EF0
sub_080A5EF0: @ 0x080A5EF0
	push {lr}
	ldr r0, _080A5F0C @ =0x02000044
	ldr r1, _080A5F10 @ =0x0600C020
	movs r2, #1
	movs r3, #4
	bl InitTextFont
	ldr r0, _080A5F14 @ =0x0200005C
	movs r1, #0xa
	bl InitText
	pop {r0}
	bx r0
	.align 2, 0
_080A5F0C: .4byte 0x02000044
_080A5F10: .4byte 0x0600C020
_080A5F14: .4byte 0x0200005C

	thumb_func_start sub_080A5F18
sub_080A5F18: @ 0x080A5F18
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080A5F7C
	bl GetMsg
	adds r5, r0, #0
	ldr r0, _080A5F6C @ =0x02000044
	bl SetTextFont
	ldr r4, _080A5F70 @ =0x0200005C
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x28
	bl Text_SetCursor
	ldr r0, _080A5F74 @ =0x00001265
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _080A5F78 @ =0x020238AE
	adds r0, r4, #0
	bl sub_08005590
	b _080A5F88
	.align 2, 0
_080A5F6C: .4byte 0x02000044
_080A5F70: .4byte 0x0200005C
_080A5F74: .4byte 0x00001265
_080A5F78: .4byte 0x020238AE
_080A5F7C:
	ldr r0, _080A5F94 @ =0x020238AE
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
_080A5F88:
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5F94: .4byte 0x020238AE

	thumb_func_start sub_080A5F98
sub_080A5F98: @ 0x080A5F98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080A5FCC @ =0x08CE435C
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_080A33E0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r4, #0
	bl sub_080A5F18
	cmp r4, #0
	bne _080A5FC6
	adds r0, r6, #0
	adds r0, #0x36
	strb r4, [r0]
_080A5FC6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FCC: .4byte 0x08CE435C

	thumb_func_start sub_080A5FD0
sub_080A5FD0: @ 0x080A5FD0
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r1, _080A5FF8 @ =0x06008000
	ldr r5, _080A5FFC @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080A6000 @ =0x0600C000
	adds r2, r5, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FF8: .4byte 0x06008000
_080A5FFC: .4byte 0x01000200
_080A6000: .4byte 0x0600C000

	thumb_func_start sub_080A6004
sub_080A6004: @ 0x080A6004
	adds r2, r0, #0
	adds r2, #0x30
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x31
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080A6018
sub_080A6018: @ 0x080A6018
	adds r2, r0, #0
	adds r2, #0x32
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x33
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080A602C
sub_080A602C: @ 0x080A602C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x31
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	adds r6, r4, #0
	adds r6, #0x32
	strb r5, [r6]
	adds r0, #3
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080A605A
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A6004
_080A605A:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x37
_080A6060:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A606A
	adds r5, #1
_080A606A:
	adds r1, #1
	cmp r1, #2
	ble _080A6060
	cmp r5, #0
	ble _080A6090
	adds r0, r4, #0
	movs r1, #2
	bl sub_080A6004
	cmp r5, #2
	bgt _080A6088
	adds r0, r4, #0
	movs r1, #4
	bl sub_080A6004
_080A6088:
	adds r0, r4, #0
	movs r1, #8
	bl sub_080A6004
_080A6090:
	cmp r5, #2
	bgt _080A609C
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_080A6004
_080A609C:
	bl sub_0809EA80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60AE
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A6018
_080A60AE:
	bl sub_0809EAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60C0
	adds r0, r4, #0
	movs r1, #2
	bl sub_080A6018
_080A60C0:
	bl sub_0809EAE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60D2
	adds r0, r4, #0
	movs r1, #4
	bl sub_080A6018
_080A60D2:
	bl sub_0809EAFC
	cmp r0, #0
	beq _080A60E2
	adds r0, r4, #0
	movs r1, #8
	bl sub_080A6018
_080A60E2:
	bl sub_0809EB78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60F4
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_080A6018
_080A60F4:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080A610E
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A610E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080A6114
sub_080A6114: @ 0x080A6114
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	cmp r2, #0
	ble _080A6152
	movs r5, #0
	lsls r6, r1, #0x18
_080A6128:
	adds r0, r4, #0
	bl sub_080A09A0
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A614E
	cmp r4, #2
	bne _080A613C
	movs r4, #0
	b _080A6142
_080A613C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6142:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6128
	b _080A617A
_080A614E:
	adds r0, r4, #0
	b _080A617C
_080A6152:
	movs r5, #0
	lsls r6, r1, #0x18
_080A6156:
	adds r0, r4, #0
	bl sub_080A09A0
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A614E
	cmp r4, #0
	bne _080A616A
	movs r4, #2
	b _080A6170
_080A616A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6170:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6156
_080A617A:
	movs r0, #0xff
_080A617C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080A6184
sub_080A6184: @ 0x080A6184
	push {r4, r5, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	adds r0, #0x16
	ldrh r0, [r0]
	cmp r0, #4
	beq _080A61BC
	cmp r0, #4
	bgt _080A61A8
	cmp r0, #1
	beq _080A6218
	cmp r0, #2
	beq _080A61C6
	b _080A61C8
_080A61A8:
	cmp r0, #0x10
	beq _080A61C8
	cmp r0, #0x10
	bgt _080A61B6
	cmp r0, #8
	beq _080A61C6
	b _080A61C8
_080A61B6:
	cmp r0, #0x80
	bne _080A61C8
	b _080A61C6
_080A61BC:
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A61C8
_080A61C6:
	movs r1, #1
_080A61C8:
	lsls r0, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	ble _080A61E4
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #2
	bne _080A61E0
	movs r0, #0
	b _080A61F6
_080A61E0:
	adds r0, r3, #1
	b _080A61F6
_080A61E4:
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #0
	bne _080A61F4
	movs r0, #2
	b _080A61F6
_080A61F4:
	subs r0, r3, #1
_080A61F6:
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A6214
	ldrb r0, [r4]
	asrs r2, r2, #0x18
	bl sub_080A6114
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080A6218
_080A6214:
	movs r0, #1
	b _080A621A
_080A6218:
	movs r0, #0
_080A621A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080A6220
sub_080A6220: @ 0x080A6220
	adds r1, r0, #0
	adds r1, #0x42
	adds r0, #0x30
	ldrb r0, [r0]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A6234
	movs r0, #0
	b _080A6236
_080A6234:
	movs r0, #1
_080A6236:
	bx lr

	thumb_func_start sub_080A6238
sub_080A6238: @ 0x080A6238
	push {r4, lr}
	mov ip, r0
	mov r2, ip
	adds r2, #0x29
	adds r0, #0x2b
	ldrb r1, [r2]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r2]
	ldr r3, _080A62A8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080A62AC
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r1, #4
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r1, r4, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldrb r2, [r2]
	lsls r1, r2, #1
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x32
	b _080A62E0
	.align 2, 0
_080A62A8: .4byte 0x03002870
_080A62AC:
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r1, #0x78
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #1
	movs r0, #0x50
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x33
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x78
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, #0x50
	adds r1, #4
_080A62E0:
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r4, [r2]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _080A632C
	mov r0, ip
	bl Proc_Break
_080A632C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A6334
sub_080A6334: @ 0x080A6334
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080A6364 @ =0x08CE4378
	adds r1, r3, #0
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r2, #0x2a
	movs r1, #0
	strb r4, [r2]
	adds r2, #1
	strb r5, [r2]
	adds r0, #0x29
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6364: .4byte 0x08CE4378

	thumb_func_start sub_080A6368
sub_080A6368: @ 0x080A6368
	push {lr}
	ldr r0, _080A637C @ =0x02023C60
	ldr r1, _080A6380 @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08003078
	pop {r0}
	bx r0
	.align 2, 0
_080A637C: .4byte 0x02023C60
_080A6380: .4byte 0x06007000

	thumb_func_start sub_080A6384
sub_080A6384: @ 0x080A6384
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6394 @ =0x08CE4398
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080A6394: .4byte 0x08CE4398

	thumb_func_start sub_080A6398
sub_080A6398: @ 0x080A6398
	push {r4, r5, r6, lr}
	sub sp, #0x48
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #2
	bhi _080A645C
	adds r0, r4, #0
	bl sub_080A09A0
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080A6428
	adds r0, r4, #0
	mov r1, sp
	bl sub_080A09B4
	mov r0, sp
	bl sub_080824A4
	adds r1, r5, #0
	adds r1, #0x37
	adds r1, r1, r4
	movs r2, #0
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r1, [sp]
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r5, r0, r4
	strb r2, [r5]
	adds r0, r4, #0
	bl sub_080A0A10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A63F6
	movs r0, #1
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A63F6:
	mov r0, sp
	bl sub_080A09FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A640A
	movs r0, #2
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A640A:
	ldr r0, _080A6420 @ =0x02000064
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x14]
	strb r1, [r0]
	ldr r0, _080A6424 @ =0x02000068
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x1b]
	strb r1, [r0]
	b _080A6492
	.align 2, 0
_080A6420: .4byte 0x02000064
_080A6424: .4byte 0x02000068
_080A6428:
	adds r0, r5, #0
	adds r0, #0x37
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r0, r0, r6
	strb r2, [r0]
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	str r2, [r0]
	ldr r0, _080A6454 @ =0x02000064
	adds r0, r6, r0
	strb r2, [r0]
	ldr r0, _080A6458 @ =0x02000068
	adds r0, r6, r0
	strb r2, [r0]
	b _080A6492
	.align 2, 0
_080A6454: .4byte 0x02000064
_080A6458: .4byte 0x02000068
_080A645C:
	adds r4, r5, #0
	adds r4, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r4]
	cmp r1, r0
	bne _080A6492
	movs r0, #3
	bl sub_080A1384
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A648E
	movs r0, #3
	mov r1, sp
	bl sub_080A13D8
	mov r0, sp
	ldrb r0, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r0, [sp]
	str r0, [r5, #0x54]
	b _080A6492
_080A648E:
	movs r0, #0xf0
	strh r0, [r4]
_080A6492:
	add sp, #0x48
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A649C
sub_080A649C: @ 0x080A649C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	movs r7, #0x1b
	movs r6, #0x1a
_080A64AE:
	ldr r1, _080A6524 @ =0x02000064
	adds r1, r5, r1
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldr r0, _080A6528 @ =0x02000068
	adds r0, r5, r0
	ldrb r1, [r0]
	cmp r1, #1
	bne _080A64D2
	movs r0, #0x10
	orrs r4, r0
_080A64D2:
	cmp r1, #2
	bne _080A64DE
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64DE:
	cmp r1, #3
	bne _080A64EA
	movs r0, #0x40
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64EA:
	cmp r5, r8
	beq _080A64F6
	movs r0, #2
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64F6:
	movs r1, #1
	adds r0, r4, #0
	orrs r0, r1
	adds r1, r6, #0
	bl sub_08082058
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08082058
	adds r7, #2
	adds r6, #2
	adds r5, #1
	cmp r5, #2
	ble _080A64AE
	bl EnablePalSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6524: .4byte 0x02000064
_080A6528: .4byte 0x02000068

	thumb_func_start sub_080A652C
sub_080A652C: @ 0x080A652C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0x10
	ble _080A654E
	movs r0, #0xf
	ands r0, r5
	movs r1, #0x10
	subs r5, r1, r0
_080A654E:
	movs r2, #0
_080A6550:
	ldr r0, _080A6580 @ =0x02000064
	adds r1, r2, r0
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	adds r1, r2, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _080A6612
	lsls r0, r2, #6
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080A6584 @ =0x02022A72
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [sp]
	cmp r2, r0
	bne _080A6590
	ldr r1, _080A6588 @ =0x083FE30A
	mov ip, r1
	ldr r6, _080A658C @ =0x083FE40A
	b _080A6596
	.align 2, 0
_080A6580: .4byte 0x02000064
_080A6584: .4byte 0x02022A72
_080A6588: .4byte 0x083FE30A
_080A658C: .4byte 0x083FE40A
_080A6590:
	ldr r0, _080A662C @ =0x083FE32A
	mov ip, r0
	ldr r6, _080A6630 @ =0x083FE42A
_080A6596:
	adds r2, #1
	str r2, [sp, #4]
	movs r0, #0x10
	subs r7, r0, r5
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	movs r0, #6
	mov sb, r0
_080A65A8:
	mov r1, ip
	ldrh r4, [r1]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r6]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r6, #2
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r0, sb
	cmp r0, #0
	bge _080A65A8
_080A6612:
	ldr r2, [sp, #4]
	cmp r2, #2
	ble _080A6550
	bl EnablePalSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A662C: .4byte 0x083FE32A
_080A6630: .4byte 0x083FE42A

	thumb_func_start sub_080A6634
sub_080A6634: @ 0x080A6634
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	movs r2, #1
	cmp r2, r3
	bge _080A665A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
_080A664A:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A6654
	adds r1, #1
_080A6654:
	lsls r2, r2, #1
	cmp r2, r3
	blt _080A664A
_080A665A:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A6664
sub_080A6664: @ 0x080A6664
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A6680
	ldr r0, _080A66A4 @ =0x06016000
	movs r1, #0xd
	bl sub_08082528
	movs r0, #1
	strb r0, [r4]
_080A6680:
	ldr r0, _080A66A8 @ =0x08CE45C0
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #3
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	movs r3, #2
	ldrsh r1, [r1, r3]
	ldr r3, _080A66AC @ =0x08CE45D8
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_0808190C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A66A4: .4byte 0x06016000
_080A66A8: .4byte 0x08CE45C0
_080A66AC: .4byte 0x08CE45D8

	thumb_func_start sub_080A66B0
sub_080A66B0: @ 0x080A66B0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08081B44
	adds r4, #0x30
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A66C4
sub_080A66C4: @ 0x080A66C4
	push {lr}
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A66D4
	bl sub_0803279C
_080A66D4:
	pop {r0}
	bx r0

	thumb_func_start sub_080A66D8
sub_080A66D8: @ 0x080A66D8
	push {r4, lr}
	adds r4, r0, #0
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A66F4
	ldr r0, _080A66FC @ =0x0000078F
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080327C4
_080A66F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A66FC: .4byte 0x0000078F

	thumb_func_start sub_080A6700
sub_080A6700: @ 0x080A6700
	push {r4, lr}
	ldr r1, _080A6724 @ =0x08CE45C0
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	ldrsh r4, [r0, r1]
	movs r2, #2
	ldrsh r1, [r0, r2]
	ldrb r2, [r0, #4]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r0, r4, #0
	bl sub_080A951C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6724: .4byte 0x08CE45C0

	thumb_func_start sub_080A6728
sub_080A6728: @ 0x080A6728
	push {lr}
	ldr r1, _080A6744 @ =0x08CE45C0
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0
	movs r3, #0
	bl sub_080A89C8
	pop {r0}
	bx r0
	.align 2, 0
_080A6744: .4byte 0x08CE45C0

	thumb_func_start sub_080A6748
sub_080A6748: @ 0x080A6748
	push {r4, r5, r6, r7, lr}
	ldr r4, _080A6810 @ =0x0200006C
	ldr r1, _080A6814 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xf
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	movs r5, #2
_080A6766:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005CF8
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A6766
	ldr r0, _080A6818 @ =0x08194714
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _080A681C @ =0x02000084
	bl sub_0802E6E4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl Text_InsertDrawString
	ldr r4, _080A6820 @ =0x0202BBF8
	adds r7, r4, #0
	adds r7, #0x2b
	ldrb r1, [r7]
	lsrs r0, r1, #4
	bl sub_080A6DB0
	bl GetMsg
	adds r6, r0, #0
	movs r0, #0x40
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x40
	adds r0, r5, #0
	movs r2, #4
	adds r3, r6, #0
	bl Text_InsertDrawString
	adds r4, #0x2c
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl GetMsg
	adds r6, r0, #0
	movs r0, #0x40
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x80
	adds r0, r5, #0
	movs r2, #4
	adds r3, r6, #0
	bl Text_InsertDrawString
	ldr r0, _080A6824 @ =0x02022DBC
	ldr r2, _080A6828 @ =0x081C3AC0
	ldrb r7, [r7]
	lsrs r1, r7, #4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl sub_08004E28
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6810: .4byte 0x0200006C
_080A6814: .4byte 0x06011000
_080A6818: .4byte 0x08194714
_080A681C: .4byte 0x02000084
_080A6820: .4byte 0x0202BBF8
_080A6824: .4byte 0x02022DBC
_080A6828: .4byte 0x081C3AC0

	thumb_func_start sub_080A682C
sub_080A682C: @ 0x080A682C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080A6894 @ =0x0000F880
	movs r5, #0x80
	movs r4, #1
_080A6836:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x28
	ldr r3, _080A6898 @ =0x08B905F8
	bl sub_08006A34
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6836
	ldr r6, _080A689C @ =0x0000F888
	movs r5, #0x38
	movs r4, #1
_080A6854:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x48
	ldr r3, _080A6898 @ =0x08B905F8
	bl sub_08006A34
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6854
	ldr r6, _080A68A0 @ =0x0000F890
	movs r5, #0x90
	movs r4, #1
_080A6872:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x48
	ldr r3, _080A6898 @ =0x08B905F8
	bl sub_08006A34
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6872
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6894: .4byte 0x0000F880
_080A6898: .4byte 0x08B905F8
_080A689C: .4byte 0x0000F888
_080A68A0: .4byte 0x0000F890

	thumb_func_start sub_080A68A4
sub_080A68A4: @ 0x080A68A4
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0xf2
	lsls r0, r0, #3
	bl GetMsg
	bl sub_0802E6EC
	ldr r1, _080A68D8 @ =0x0202BBF8
	adds r2, r1, #0
	adds r2, #0x2b
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r1, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A68D8: .4byte 0x0202BBF8

	thumb_func_start sub_080A68DC
sub_080A68DC: @ 0x080A68DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r7, _080A69B8 @ =0x03002870
	adds r6, r7, #0
	adds r6, #0x3c
	movs r4, #0x3f
	adds r0, r4, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	movs r5, #0
	movs r0, #0x10
	ldr r2, _080A69BC @ =0x030028B4
	strb r0, [r2]
	movs r1, #0x45
	adds r1, r1, r7
	mov r8, r1
	strb r5, [r1]
	movs r2, #0x46
	adds r2, r2, r7
	mov sl, r2
	strb r5, [r2]
	bl ResetText
	bl LoadUiFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldrb r2, [r6]
	ands r4, r2
	strb r4, [r6]
	movs r1, #0x10
	ldr r0, _080A69BC @ =0x030028B4
	strb r1, [r0]
	mov r2, r8
	strb r5, [r2]
	mov r0, sl
	strb r5, [r0]
	ldr r0, _080A69C0 @ =0x0841629C
	ldr r1, _080A69C4 @ =0x06001000
	bl Decompress
	ldr r0, _080A69C8 @ =0x0841627C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A69CC @ =0x02023C60
	ldr r1, _080A69D0 @ =0x08418818
	ldr r2, _080A69D4 @ =0x0000F080
	bl TmApplyTsa_t
	mov r0, sb
	bl sub_080A89B4
	ldr r1, _080A69D8 @ =0x06008000
	movs r0, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0807F96C
	bl sub_080A6748
	ldr r0, _080A69DC @ =sub_080A682C
	mov r1, sb
	bl sub_080A92F8
	movs r0, #0xb4
	movs r1, #0x10
	mov r2, sb
	bl sub_08081FBC
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A69B8: .4byte 0x03002870
_080A69BC: .4byte 0x030028B4
_080A69C0: .4byte 0x0841629C
_080A69C4: .4byte 0x06001000
_080A69C8: .4byte 0x0841627C
_080A69CC: .4byte 0x02023C60
_080A69D0: .4byte 0x08418818
_080A69D4: .4byte 0x0000F080
_080A69D8: .4byte 0x06008000
_080A69DC: .4byte sub_080A682C

	thumb_func_start sub_080A69E0
sub_080A69E0: @ 0x080A69E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080A9580
	adds r0, r4, #0
	bl sub_080A947C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_080A94A0
	movs r0, #0
	bl sub_080A8A78
	adds r0, r4, #0
	bl sub_080A66D8
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl sub_080A6700
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A6A14
sub_080A6A14: @ 0x080A6A14
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl WasGameBeatenAtLeastOnce
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6A44
	bl sub_080A9580
	bl sub_080A66C4
	ldr r2, _080A6A4C @ =0x00000791
	ldr r3, _080A6A50 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x30
	movs r1, #0x5a
	bl sub_08083668
	movs r0, #0x70
	bl SetBoxTalkFlags
_080A6A44:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A4C: .4byte 0x00000791
_080A6A50: .4byte 0x06016000

	thumb_func_start sub_080A6A54
sub_080A6A54: @ 0x080A6A54
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl sub_080A9580
	bl sub_080A66C4
	ldr r2, _080A6A88 @ =0x00000792
	ldr r3, _080A6A8C @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x70
	movs r1, #0x5a
	bl sub_08083668
	movs r0, #0x70
	bl SetBoxTalkFlags
	movs r0, #1
	bl sub_08009FDC
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A88: .4byte 0x00000792
_080A6A8C: .4byte 0x06016000

	thumb_func_start sub_080A6A90
sub_080A6A90: @ 0x080A6A90
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #1
	bne _080A6AA4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A6AA4:
	bl GetTalkResult
	cmp r0, #2
	beq _080A6AB4
	bl GetTalkResult
	cmp r0, #0
	bne _080A6ABC
_080A6AB4:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A6ABC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A6AC4
sub_080A6AC4: @ 0x080A6AC4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl sub_080A9580
	bl sub_080A66C4
	ldr r2, _080A6AF8 @ =0x00000793
	ldr r3, _080A6AFC @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x60
	movs r1, #0x5a
	bl sub_08083668
	movs r0, #0xf0
	bl SetBoxTalkFlags
	movs r0, #1
	bl sub_08009FDC
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AF8: .4byte 0x00000793
_080A6AFC: .4byte 0x06016000

	thumb_func_start sub_080A6B00
sub_080A6B00: @ 0x080A6B00
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #2
	beq _080A6B14
	bl GetTalkResult
	cmp r0, #0
	bne _080A6B1C
_080A6B14:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A6B1C:
	bl GetTalkResult
	cmp r0, #1
	bne _080A6B2C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A6B2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A6B34
sub_080A6B34: @ 0x080A6B34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0807FA04
	bl sub_0808E46C
	adds r0, r4, #0
	bl sub_080A9DC0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A6B4C
sub_080A6B4C: @ 0x080A6B4C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A6C0A
	ldr r0, _080A6B90 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6BCA
	ldr r0, _080A6B94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6B7E
	ldr r0, _080A6B98 @ =0x0000038A
	bl sub_080BE594
_080A6B7E:
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	beq _080A6BAC
	cmp r0, #1
	bgt _080A6B9C
	cmp r0, #0
	beq _080A6BA2
	b _080A6CAE
	.align 2, 0
_080A6B90: .4byte 0x08B857F8
_080A6B94: .4byte 0x0202BBF8
_080A6B98: .4byte 0x0000038A
_080A6B9C:
	cmp r0, #2
	beq _080A6BB4
	b _080A6CAE
_080A6BA2:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080A6CAE
_080A6BAC:
	adds r0, r4, #0
	bl sub_080A7194
	b _080A6BBA
_080A6BB4:
	adds r0, r4, #0
	bl sub_080A73E4
_080A6BBA:
	ldr r0, [r4, #0x2c]
	bl sub_080A6728
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080A6CAE
_080A6BCA:
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080A6BF8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A6BF0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6CAE
	ldr r0, _080A6BF4 @ =0x0000038A
	bl sub_080BE594
	b _080A6CAE
	.align 2, 0
_080A6BF0: .4byte 0x0202BBF8
_080A6BF4: .4byte 0x0000038A
_080A6BF8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6C20
	adds r0, r4, #0
	bl sub_080A6664
	b _080A6CAE
_080A6C0A:
	ldr r0, _080A6CB4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A6C20
	adds r0, r4, #0
	bl sub_080A66B0
_080A6C20:
	ldr r2, _080A6CB4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C38
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080A6C38
	movs r0, #1
	str r0, [r4, #0x2c]
_080A6C38:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C4E
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080A6C4E
	movs r0, #0
	str r0, [r4, #0x2c]
_080A6C4E:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C64
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	ble _080A6C64
	subs r0, #1
	str r0, [r4, #0x2c]
_080A6C64:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C7A
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	bne _080A6C7A
	movs r0, #2
	str r0, [r4, #0x2c]
_080A6C7A:
	ldr r0, [r4, #0x2c]
	cmp r5, r0
	beq _080A6CAE
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A6C94
	adds r0, r4, #0
	bl sub_080A6664
_080A6C94:
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl sub_080A6700
	ldr r0, _080A6CB8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6CAE
	ldr r0, _080A6CBC @ =0x00000385
	bl sub_080BE594
_080A6CAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6CB4: .4byte 0x08B857F8
_080A6CB8: .4byte 0x0202BBF8
_080A6CBC: .4byte 0x00000385

	thumb_func_start sub_080A6CC0
sub_080A6CC0: @ 0x080A6CC0
	push {lr}
	bl sub_080A05F4
	bl sub_080A0810
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A6CD0
sub_080A6CD0: @ 0x080A6CD0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _080A6CE8 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080A6CEC
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080A6D52
	.align 2, 0
_080A6CE8: .4byte 0x0202BBF8
_080A6CEC:
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r0, _080A6D5C @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r3, #0x10
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #1
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r3
	mov r2, ip
	strb r0, [r2, #1]
	ldr r2, _080A6D60 @ =0x00000794
	ldr r3, _080A6D64 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x38
	movs r1, #0x20
	bl sub_08083668
	movs r0, #0xf0
	bl SetBoxTalkFlags
	movs r0, #2
	bl sub_08009FDC
_080A6D52:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D5C: .4byte 0x03002870
_080A6D60: .4byte 0x00000794
_080A6D64: .4byte 0x06016000

	thumb_func_start sub_080A6D68
sub_080A6D68: @ 0x080A6D68
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #2
	beq _080A6D7C
	bl GetTalkResult
	cmp r0, #0
	bne _080A6D92
_080A6D7C:
	ldr r1, _080A6D98 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080A6D92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D98: .4byte 0x0202BBF8

	thumb_func_start sub_080A6D9C
sub_080A6D9C: @ 0x080A6D9C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6DAC @ =0x08CE45E4
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080A6DAC: .4byte 0x08CE45E4

	thumb_func_start sub_080A6DB0
sub_080A6DB0: @ 0x080A6DB0
	ldr r1, _080A6DBC @ =0x08CE4724
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A6DBC: .4byte 0x08CE4724

	thumb_func_start sub_080A6DC0
sub_080A6DC0: @ 0x080A6DC0
	ldr r1, _080A6DCC @ =0x08CE4754
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A6DCC: .4byte 0x08CE4754

	thumb_func_start sub_080A6DD0
sub_080A6DD0: @ 0x080A6DD0
	ldr r1, _080A6DDC @ =0x08CE475C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A6DDC: .4byte 0x08CE475C

	thumb_func_start sub_080A6DE0
sub_080A6DE0: @ 0x080A6DE0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	movs r6, #0
	str r6, [sp]
	lsls r1, r1, #5
	adds r5, r5, r1
	lsls r4, r4, #3
	ldr r0, _080A6E20 @ =0x001FFFFF
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r4, r0
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	str r6, [sp, #4]
	add r0, sp, #4
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r5, r1
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E20: .4byte 0x001FFFFF

	thumb_func_start sub_080A6E24
sub_080A6E24: @ 0x080A6E24
	bx lr
	.align 2, 0

	thumb_func_start sub_080A6E28
sub_080A6E28: @ 0x080A6E28
	bx lr
	.align 2, 0

	thumb_func_start sub_080A6E2C
sub_080A6E2C: @ 0x080A6E2C
	push {r4, lr}
	ldr r0, _080A6E5C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r4, _080A6E60 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005CF8
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E5C: .4byte 0x02023460
_080A6E60: .4byte 0x0200006C

	thumb_func_start sub_080A6E64
sub_080A6E64: @ 0x080A6E64
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6E74 @ =0x08CE477C
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080A6E74: .4byte 0x08CE477C

	thumb_func_start sub_080A6E78
sub_080A6E78: @ 0x080A6E78
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A6F2C @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	lsrs r0, r0, #4
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #0x1a
	movs r3, #6
	bl sub_08049CE4
	movs r0, #2
	bl EnableBgSync
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #2
	bl sub_080A951C
	ldr r4, _080A6F30 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r5, #0
	movs r7, #0
	adds r6, r4, #0
	adds r6, #0x20
_080A6EDE:
	adds r0, r5, #0
	bl sub_080A6DB0
	bl GetMsg
	adds r3, r0, #0
	strb r7, [r3, #3]
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #6
	bl sub_080A6DB0
	bl GetMsg
	adds r3, r0, #0
	strb r7, [r3, #3]
	adds r0, r6, #0
	adds r0, #8
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #1
	cmp r5, #5
	ble _080A6EDE
	movs r0, #0
	bl GetMsg
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6F2C: .4byte 0x0202BBF8
_080A6F30: .4byte 0x0200006C

	thumb_func_start sub_080A6F34
sub_080A6F34: @ 0x080A6F34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sb, r0
	ldr r6, _080A6FFC @ =0x0000F4C0
	movs r5, #0x1e
	movs r4, #2
_080A6F4A:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A7000 @ =0x08B90600
	bl sub_08006A34
	adds r6, #8
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A6F4A
	ldr r1, _080A7004 @ =0x08B857F8
	ldr r2, [r1]
	ldrh r5, [r2, #8]
	movs r0, #1
	ands r0, r5
	mov r8, r1
	cmp r0, #0
	beq _080A7020
	ldr r5, _080A7008 @ =0x0202BBF8
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6F86
	ldr r0, _080A700C @ =0x0000038A
	bl sub_080BE594
_080A6F86:
	ldr r0, [r7, #0x2c]
	adds r5, #0x2b
	lsls r0, r0, #4
	movs r1, #0xf
	ldrb r2, [r5]
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldr r0, _080A7010 @ =0x02022DBC
	ldr r2, _080A7014 @ =0x081C3AC0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl sub_08004E28
	ldr r4, _080A7018 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A701C @ =0x06011000
	movs r1, #8
	movs r2, #8
	bl sub_080A6DE0
	ldrb r5, [r5]
	lsrs r0, r5, #4
	bl sub_080A6DB0
	bl GetMsg
	adds r5, r0, #0
	adds r4, #0x18
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x40
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A703A
	.align 2, 0
_080A6FFC: .4byte 0x0000F4C0
_080A7000: .4byte 0x08B90600
_080A7004: .4byte 0x08B857F8
_080A7008: .4byte 0x0202BBF8
_080A700C: .4byte 0x0000038A
_080A7010: .4byte 0x02022DBC
_080A7014: .4byte 0x081C3AC0
_080A7018: .4byte 0x0200006C
_080A701C: .4byte 0x06011000
_080A7020:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080A704C
	ldr r0, _080A7044 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A703A
	ldr r0, _080A7048 @ =0x0000038B
	bl sub_080BE594
_080A703A:
	adds r0, r7, #0
	bl Proc_Break
	b _080A7144
	.align 2, 0
_080A7044: .4byte 0x0202BBF8
_080A7048: .4byte 0x0000038B
_080A704C:
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r2, #6]
	ands r0, r2
	cmp r0, #0
	beq _080A7076
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	ble _080A706A
	subs r0, r4, #6
	b _080A7074
_080A706A:
	adds r0, r6, #0
	ands r0, r5
	cmp r0, #0
	beq _080A7076
	adds r0, r4, #6
_080A7074:
	str r0, [r7, #0x2c]
_080A7076:
	mov r0, r8
	ldr r5, [r0]
	movs r0, #0x80
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A70A4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	bgt _080A7096
	adds r0, r4, #6
	b _080A70A2
_080A7096:
	movs r0, #0x40
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A70A4
	subs r0, r4, #6
_080A70A2:
	str r0, [r7, #0x2c]
_080A70A4:
	mov r2, r8
	ldr r5, [r2]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A70D4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #0
	ble _080A70C6
	subs r0, r4, #1
	b _080A70D2
_080A70C6:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A70D4
	adds r0, r4, #5
_080A70D2:
	str r0, [r7, #0x2c]
_080A70D4:
	mov r2, r8
	ldr r5, [r2]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7104
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #4
	bgt _080A70F6
	adds r0, r4, #1
	b _080A7102
_080A70F6:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A7104
	subs r0, r4, #5
_080A7102:
	str r0, [r7, #0x2c]
_080A7104:
	ldr r5, [r7, #0x2c]
	cmp r5, sb
	beq _080A7144
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #2
	bl sub_080A951C
	ldr r0, _080A7154 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7144
	ldr r0, _080A7158 @ =0x00000385
	bl sub_080BE594
_080A7144:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7154: .4byte 0x0202BBF8
_080A7158: .4byte 0x00000385

	thumb_func_start sub_080A715C
sub_080A715C: @ 0x080A715C
	push {r4, lr}
	ldr r0, _080A718C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r4, _080A7190 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005CF8
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A718C: .4byte 0x02023460
_080A7190: .4byte 0x0200006C

	thumb_func_start sub_080A7194
sub_080A7194: @ 0x080A7194
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A71A4 @ =0x08CE47AC
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080A71A4: .4byte 0x08CE47AC

	thumb_func_start sub_080A71A8
sub_080A71A8: @ 0x080A71A8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A7220 @ =0x0202BBF8
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #4
	bl sub_08049CE4
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #5
	adds r0, #0x88
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #3
	bl sub_080A951C
	ldr r0, _080A7224 @ =0x0200006C
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A71F2:
	adds r0, r4, #0
	bl sub_080A6DC0
	bl GetMsg
	adds r3, r0, #0
	ldr r0, _080A7228 @ =0x0200008C
	adds r1, r5, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #0x1f
	adds r4, #1
	cmp r4, #1
	ble _080A71F2
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7220: .4byte 0x0202BBF8
_080A7224: .4byte 0x0200006C
_080A7228: .4byte 0x0200008C

	thumb_func_start sub_080A722C
sub_080A722C: @ 0x080A722C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r6, _080A72E0 @ =0x0000F4C0
	movs r5, #0x8c
	movs r4, #2
_080A7240:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A72E4 @ =0x08B905F8
	bl sub_08006A34
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A7240
	ldr r1, _080A72E8 @ =0x08B857F8
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _080A72FC
	ldr r4, _080A72EC @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A727C
	ldr r0, _080A72F0 @ =0x0000038A
	bl sub_080BE594
_080A727C:
	ldr r1, [r7, #0x2c]
	adds r4, #0x2c
	movs r0, #1
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldr r5, _080A72F4 @ =0x0200006C
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A72F8 @ =0x06011000
	movs r1, #0x10
	movs r2, #8
	bl sub_080A6DE0
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl GetMsg
	adds r4, r0, #0
	adds r5, #0x18
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x80
	adds r0, r5, #0
	movs r2, #4
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A7316
	.align 2, 0
_080A72E0: .4byte 0x0000F4C0
_080A72E4: .4byte 0x08B905F8
_080A72E8: .4byte 0x08B857F8
_080A72EC: .4byte 0x0202BBF8
_080A72F0: .4byte 0x0000038A
_080A72F4: .4byte 0x0200006C
_080A72F8: .4byte 0x06011000
_080A72FC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A7328
	ldr r0, _080A7320 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7316
	ldr r0, _080A7324 @ =0x0000038B
	bl sub_080BE594
_080A7316:
	adds r0, r7, #0
	bl Proc_Break
	b _080A7398
	.align 2, 0
_080A7320: .4byte 0x0202BBF8
_080A7324: .4byte 0x0000038B
_080A7328:
	movs r4, #0x20
	adds r0, r4, #0
	ldrh r3, [r3, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A734A
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	ble _080A7340
	subs r0, #1
	str r0, [r7, #0x2c]
	b _080A734A
_080A7340:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A734A
	str r5, [r7, #0x2c]
_080A734A:
	ldr r1, [r1]
	movs r2, #0x10
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A7370
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	bgt _080A7362
	adds r0, #1
	b _080A736E
_080A7362:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A7370
	movs r0, #0
_080A736E:
	str r0, [r7, #0x2c]
_080A7370:
	ldr r0, [r7, #0x2c]
	cmp r0, r8
	beq _080A7398
	lsls r0, r0, #5
	adds r0, #0x88
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #3
	bl sub_080A951C
	ldr r0, _080A73A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7398
	ldr r0, _080A73A8 @ =0x00000385
	bl sub_080BE594
_080A7398:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A73A4: .4byte 0x0202BBF8
_080A73A8: .4byte 0x00000385

	thumb_func_start sub_080A73AC
sub_080A73AC: @ 0x080A73AC
	push {r4, lr}
	ldr r0, _080A73DC @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r4, _080A73E0 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005CF8
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A73DC: .4byte 0x02023460
_080A73E0: .4byte 0x0200006C

	thumb_func_start sub_080A73E4
sub_080A73E4: @ 0x080A73E4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A73F4 @ =0x08CE47DC
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080A73F4: .4byte 0x08CE47DC

	thumb_func_start sub_080A73F8
sub_080A73F8: @ 0x080A73F8
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _080A7418 @ =0x02022BDA
	mov ip, r0
	ldr r0, _080A741C @ =0x084150D8
	ldrh r4, [r0]
	ldrh r7, [r0, #2]
	movs r0, #0x3f
	ands r2, r0
	cmp r2, #0x1f
	bgt _080A7420
	movs r0, #0x20
	subs r5, r0, r2
	adds r6, r2, #0
	b _080A7428
	.align 2, 0
_080A7418: .4byte 0x02022BDA
_080A741C: .4byte 0x084150D8
_080A7420:
	adds r5, r2, #0
	subs r5, #0x20
	movs r0, #0x40
	subs r6, r0, r2
_080A7428:
	movs r3, #0x1f
	movs r1, #0x1f
	adds r0, r4, #0
	ands r0, r1
	adds r2, r0, #0
	muls r2, r5, r2
	adds r0, r7, #0
	ands r0, r1
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r4, #0
	ands r0, r3
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r7, #0
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	ands r1, r3
	adds r2, r2, r1
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r4, r3
	adds r0, r4, #0
	muls r0, r5, r0
	ands r7, r3
	adds r1, r7, #0
	muls r1, r6, r1
	adds r0, r0, r1
	asrs r0, r0, #5
	ands r0, r3
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0]
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080A7480
sub_080A7480: @ 0x080A7480
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, sp
	ldr r0, _080A75AC @ =0x08418DA8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0xc]
	cmp sb, r1
	bge _080A759C
	ldr r2, _080A75B0 @ =0x0201E8D4
	mov r8, r2
	movs r5, #0
	mov sl, r5
	mov r6, r8
	adds r6, #4
	mov r3, r8
	movs r4, #0
	str r4, [sp, #0x14]
	ldr r7, _080A75B4 @ =0x0201E97C
	adds r4, r7, #0
_080A74B8:
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r3, #2]
	movs r0, #0x58
	strh r0, [r6]
	ldr r0, [sp, #0x10]
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r6, #2]
	movs r0, #6
	strh r0, [r6, #6]
	movs r0, #0
	strb r0, [r3, #1]
	movs r0, #1
	strh r0, [r6, #8]
	mov r1, sb
	lsls r0, r1, #0xd
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r0, r2
	asrs r0, r0, #5
	strh r0, [r6, #0xa]
	mov r0, sb
	adds r0, #0xd
	strh r0, [r6, #0xc]
	mov r1, r8
	adds r1, #0x1c
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, _080A75B8 @ =0x08CE480C
	mov r1, sb
	lsls r2, r1, #2
	adds r0, r2, r0
	ldr r0, [r0]
	mov r1, ip
	str r0, [r1]
	mov r1, r8
	adds r1, #0x24
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A75BC @ =0x08CE4818
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r8
	adds r1, #0x20
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A75C0 @ =0x08CE4824
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r8
	adds r1, #0x28
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A75C4 @ =0x08CE4830
	adds r2, r2, r0
	ldr r0, [r2]
	str r0, [r1]
	ldr r0, _080A75C8 @ =0x0000FFFF
	strh r0, [r6, #4]
	mov r1, sl
	adds r0, r1, r7
	str r0, [r6, #0x2c]
	strh r5, [r4]
	strh r5, [r4, #2]
	strh r5, [r4, #4]
	strh r5, [r4, #6]
	strh r5, [r4, #8]
	strh r5, [r4, #0xe]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0x12]
	adds r0, r7, #0
	adds r0, #0x14
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x18
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x1c
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	add r0, sl
	str r5, [r0]
	str r5, [r4, #0x24]
	adds r0, r3, #0
	str r3, [sp, #0x18]
	bl sub_08054EC8
	adds r4, #0x28
	movs r2, #0x28
	add sl, r2
	adds r6, #0x38
	ldr r3, [sp, #0x18]
	adds r3, #0x38
	ldr r0, [sp, #0x14]
	adds r0, #0x38
	str r0, [sp, #0x14]
	movs r1, #1
	add sb, r1
	ldr r2, [sp, #0xc]
	cmp sb, r2
	blt _080A74B8
_080A759C:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A75AC: .4byte 0x08418DA8
_080A75B0: .4byte 0x0201E8D4
_080A75B4: .4byte 0x0201E97C
_080A75B8: .4byte 0x08CE480C
_080A75BC: .4byte 0x08CE4818
_080A75C0: .4byte 0x08CE4824
_080A75C4: .4byte 0x08CE4830
_080A75C8: .4byte 0x0000FFFF

	thumb_func_start sub_080A75CC
sub_080A75CC: @ 0x080A75CC
	push {r4, r5, lr}
	cmp r0, #0
	ble _080A75E4
	ldr r5, _080A75EC @ =0x0201E8D4
	adds r4, r0, #0
_080A75D6:
	adds r0, r5, #0
	bl sub_08054EF0
	adds r5, #0x38
	subs r4, #1
	cmp r4, #0
	bne _080A75D6
_080A75E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A75EC: .4byte 0x0201E8D4

	thumb_func_start sub_080A75F0
sub_080A75F0: @ 0x080A75F0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	ldr r5, _080A765C @ =0x020000E4
	adds r0, r5, #0
	bl ClearText
	movs r0, #8
	adds r0, r0, r5
	mov sb, r0
	bl ClearText
	ldr r1, _080A7660 @ =0x08CE48C0
	mov r8, r1
	ldr r0, [r1, #0x24]
	bl GetMsg
	ldr r4, _080A7664 @ =0x020235FC
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_08005AD4
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl GetMsg
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_08005AD4
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A765C: .4byte 0x020000E4
_080A7660: .4byte 0x08CE48C0
_080A7664: .4byte 0x020235FC

	thumb_func_start sub_080A7668
sub_080A7668: @ 0x080A7668
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _080A76EC @ =0x020000CC
	mov r8, r0
	bl ClearText
	mov r0, r8
	adds r0, #8
	bl ClearText
	movs r1, #0x10
	add r1, r8
	mov sl, r1
	mov r0, sl
	bl ClearText
	ldr r5, _080A76F0 @ =0x08CE48C0
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r0, [r0]
	bl GetMsg
	ldr r6, _080A76F4 @ =0x0202367C
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0
	bl sub_08005AD4
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	bl GetMsg
	adds r6, #0x8a
	mov r1, sb
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, sl
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0
	bl sub_08005AD4
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A76EC: .4byte 0x020000CC
_080A76F0: .4byte 0x08CE48C0
_080A76F4: .4byte 0x0202367C

	thumb_func_start sub_080A76F8
sub_080A76F8: @ 0x080A76F8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x41
	adds r0, #0x43
	ldrb r1, [r6]
	adds r0, r1, r0
	ldrb r7, [r0]
	ldr r5, _080A7758 @ =0x020000BC
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #8
	bl ClearText
	ldr r0, _080A775C @ =0x000012BA
	bl GetMsg
	adds r3, r0, #0
	ldr r1, _080A7760 @ =0x0202377E
	movs r2, #1
	cmp r7, #0
	bne _080A772C
	movs r2, #3
_080A772C:
	movs r0, #0
	str r0, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_08005AD4
	movs r0, #2
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x49
	ldrb r6, [r6]
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A7772
	cmp r0, #1
	bgt _080A7764
	cmp r0, #0
	beq _080A776A
	b _080A7788
	.align 2, 0
_080A7758: .4byte 0x020000BC
_080A775C: .4byte 0x000012BA
_080A7760: .4byte 0x0202377E
_080A7764:
	cmp r0, #2
	beq _080A777A
	b _080A7788
_080A776A:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	b _080A7780
_080A7772:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	b _080A7780
_080A777A:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
_080A7780:
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A77AA
_080A7788:
	ldr r0, _080A77B4 @ =0x000012BB
	bl GetMsg
	adds r3, r0, #0
	ldr r4, _080A77B8 @ =0x020000C4
	ldr r1, _080A77BC @ =0x020237FE
	movs r2, #1
	cmp r7, #1
	bne _080A779C
	movs r2, #3
_080A779C:
	movs r0, #0
	str r0, [sp]
	str r3, [sp, #4]
	adds r0, r4, #0
	movs r3, #0
	bl sub_08005AD4
_080A77AA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A77B4: .4byte 0x000012BB
_080A77B8: .4byte 0x020000C4
_080A77BC: .4byte 0x020237FE

	thumb_func_start sub_080A77C0
sub_080A77C0: @ 0x080A77C0
	push {r4, r5, lr}
	sub sp, #0x10
	add r2, sp, #4
	ldr r1, _080A77F4 @ =0x08418DB4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r1, [r0]
	movs r0, #0x42
	str r0, [sp]
	movs r0, #0
	movs r2, #0xcc
	movs r3, #0x48
	bl sub_08007BCC
	adds r4, r0, #0
	bl sub_0800751C
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A77F4: .4byte 0x08418DB4

	thumb_func_start sub_080A77F8
sub_080A77F8: @ 0x080A77F8
	push {r4, r5, lr}
	sub sp, #0x30
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _080A784C @ =0x08418DC0
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	lsls r4, r4, #4
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r1, _080A7850 @ =0x060102C0
	bl Decompress
	add r0, sp, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A7854 @ =0x060106C0
	bl Decompress
	add r0, sp, #8
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A7858 @ =0x06010AC0
	bl Decompress
	add r0, sp, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A785C @ =0x06010EC0
	bl Decompress
	add sp, #0x30
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A784C: .4byte 0x08418DC0
_080A7850: .4byte 0x060102C0
_080A7854: .4byte 0x060106C0
_080A7858: .4byte 0x06010AC0
_080A785C: .4byte 0x06010EC0

	thumb_func_start sub_080A7860
sub_080A7860: @ 0x080A7860
	adds r1, r0, #0
	adds r1, #0xd
	lsls r1, r1, #5
	ldr r2, _080A7888 @ =0x02022A62
	adds r3, r1, r2
	ldr r2, _080A788C @ =0x0201E9F4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0xe
_080A7876:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080A7876
	bx lr
	.align 2, 0
_080A7888: .4byte 0x02022A62
_080A788C: .4byte 0x0201E9F4

	thumb_func_start sub_080A7890
sub_080A7890: @ 0x080A7890
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r0, #0xd
	lsls r0, r0, #5
	ldr r1, _080A78D8 @ =0x02022A62
	adds r5, r0, r1
	cmp r4, #0x40
	ble _080A78A4
	movs r4, #0x40
_080A78A4:
	ldr r0, _080A78DC @ =0x02000001
	ldrb r0, [r0]
	subs r0, #0xa
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r0, r2, #4
	ldr r1, _080A78E0 @ =0x0201E9F4
	subs r0, r0, r2
	movs r2, #0x1f
	mov ip, r2
	lsls r0, r0, #1
	adds r3, r0, r1
	movs r6, #0xe
_080A78BE:
	mov r0, ip
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, #0x1f
	bgt _080A78E4
	cmp r0, #0
	bge _080A78D2
	movs r0, #0
_080A78D2:
	mov r1, ip
	ands r1, r0
	b _080A78E6
	.align 2, 0
_080A78D8: .4byte 0x02022A62
_080A78DC: .4byte 0x02000001
_080A78E0: .4byte 0x0201E9F4
_080A78E4:
	movs r1, #0x1f
_080A78E6:
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A7904
	cmp r0, #0
	bge _080A78FE
	movs r0, #0
_080A78FE:
	ands r0, r2
	adds r1, r1, r0
	b _080A7906
_080A7904:
	adds r1, r1, r2
_080A7906:
	movs r2, #0xf8
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A7924
	cmp r0, #0
	bge _080A791E
	movs r0, #0
_080A791E:
	ands r0, r2
	adds r0, r1, r0
	b _080A7926
_080A7924:
	adds r0, r1, r2
_080A7926:
	strh r0, [r5]
	adds r5, #2
	adds r3, #2
	subs r6, #1
	cmp r6, #0
	bge _080A78BE
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080A793C
sub_080A793C: @ 0x080A793C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0xff
	ands r2, r0
	cmp r2, #0x80
	ble _080A7950
	adds r1, r2, #0
	subs r1, #0x80
	b _080A7954
_080A7950:
	movs r1, #0x80
	subs r1, r1, r2
_080A7954:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	asrs r0, r0, #7
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r3, #0
	bl sub_080A7890
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A796C
sub_080A796C: @ 0x080A796C
	push {r4, lr}
	mov ip, r0
	movs r1, #0
	str r1, [r0, #0x30]
	movs r2, #0
	strh r1, [r0, #0x3e]
	mov r3, ip
	adds r3, #0x3c
	strb r2, [r3]
	movs r0, #0x78
	mov r4, ip
	str r0, [r4, #0x34]
	movs r0, #0xa0
	str r0, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	strb r2, [r3]
	str r1, [r4, #0x48]
	mov r0, ip
	adds r0, #0x4c
	strb r2, [r0]
	str r1, [r4, #0x2c]
	adds r0, #2
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A79A4
sub_080A79A4: @ 0x080A79A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A7A2A
	movs r4, #0
	ldr r0, [r5, #0x40]
	cmp r4, r0
	bge _080A7A2A
	ldr r0, _080A7A90 @ =0x080C5A48
	mov r8, r0
	movs r6, #0
_080A79C4:
	ldrh r7, [r5, #0x3e]
	lsrs r3, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r3, r3, r0
	adds r3, #0x28
	ldr r1, [r5, #0x34]
	lsls r1, r1, #0xc
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #1
	add r0, r8
	movs r7, #0
	ldrsh r2, [r0, r7]
	movs r0, #0x46
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r2, [r5, #0x38]
	lsls r2, r2, #0xc
	adds r3, #0x40
	lsls r3, r3, #1
	add r3, r8
	movs r0, #0
	ldrsh r3, [r3, r0]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r2, r2, r0
	asrs r2, r2, #0xc
	subs r2, #0x10
	ldr r0, _080A7A94 @ =0x0201E8D4
	adds r0, r6, r0
	lsls r1, r1, #4
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_08054E10
	ldrh r7, [r5, #0x3e]
	lsrs r1, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_080A793C
	adds r6, #0x38
	adds r4, #1
	ldr r0, [r5, #0x40]
	cmp r4, r0
	blt _080A79C4
_080A7A2A:
	movs r0, #0x3e
	ldrsh r1, [r5, r0]
	movs r0, #0xb0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_080A9DE8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	bl sub_080A9E7C
	movs r7, #0x34
	ldrsh r1, [r5, r7]
	movs r0, #0x38
	ldrsh r2, [r5, r0]
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r3, #0x4c
	bl sub_080A9ECC
	ldr r4, _080A7A98 @ =0x02000001
	ldr r0, [r5, #0x48]
	str r0, [sp]
	movs r0, #8
	movs r1, #8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_080A86A0
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4c
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A7AA0
	ldr r0, [r5, #0x48]
	adds r0, #8
	str r0, [r5, #0x48]
	ldr r1, _080A7A9C @ =0x000003FF
	cmp r0, r1
	ble _080A7AAE
	movs r0, #1
	b _080A7AAC
	.align 2, 0
_080A7A90: .4byte 0x080C5A48
_080A7A94: .4byte 0x0201E8D4
_080A7A98: .4byte 0x02000001
_080A7A9C: .4byte 0x000003FF
_080A7AA0:
	ldr r0, [r5, #0x48]
	subs r0, #8
	str r0, [r5, #0x48]
	cmp r0, #0
	bgt _080A7AAE
	movs r0, #0
_080A7AAC:
	strb r0, [r2]
_080A7AAE:
	adds r1, r5, #0
	adds r1, #0x4e
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A7AD6
	adds r0, r5, #0
	adds r0, #0x4d
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	lsls r1, r1, #4
	adds r1, #0x68
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl sub_0804A1E8
	b _080A7AEA
_080A7AD6:
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x68
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl sub_0804A174
_080A7AEA:
	ldr r3, _080A7B68 @ =0x08CE483C
	movs r4, #0xb0
	lsls r4, r4, #8
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0
	movs r2, #8
	bl sub_08006A34
	ldr r3, _080A7B6C @ =0x08CE4856
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x14
	movs r2, #0x1c
	bl sub_08006A34
	ldr r3, _080A7B70 @ =0x08CE489C
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x28
	movs r2, #0x40
	bl sub_08006A34
	ldr r0, [r5, #0x2c]
	asrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A7B32
	ldr r3, _080A7B74 @ =0x08CE487C
	str r4, [sp]
	movs r0, #0xd
	movs r1, #8
	movs r2, #0x82
	bl sub_08006A34
_080A7B32:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _080A7B3C
	adds r0, #1
	str r0, [r5, #0x2c]
_080A7B3C:
	ldr r3, _080A7B78 @ =0x08CE48A4
	movs r0, #0xa0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xd
	movs r1, #0x6c
	movs r2, #0x18
	bl sub_08006A34
	ldr r0, [r5, #0x30]
	bl sub_080A73F8
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B68: .4byte 0x08CE483C
_080A7B6C: .4byte 0x08CE4856
_080A7B70: .4byte 0x08CE489C
_080A7B74: .4byte 0x08CE487C
_080A7B78: .4byte 0x08CE48A4

	thumb_func_start sub_080A7B7C
sub_080A7B7C: @ 0x080A7B7C
	push {lr}
	ldr r0, _080A7B94 @ =0x08CE48F0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A7B8E
	movs r0, #1
	str r0, [r1, #0x2c]
_080A7B8E:
	pop {r0}
	bx r0
	.align 2, 0
_080A7B94: .4byte 0x08CE48F0

	thumb_func_start sub_080A7B98
sub_080A7B98: @ 0x080A7B98
	push {lr}
	ldr r0, _080A7BB0 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7BAC
	adds r1, r0, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
_080A7BAC:
	pop {r0}
	bx r0
	.align 2, 0
_080A7BB0: .4byte 0x08CE48F0

	thumb_func_start sub_080A7BB4
sub_080A7BB4: @ 0x080A7BB4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080A7BD8 @ =0x08CE48F0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A7BD2
	str r5, [r4, #0x40]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, #0
	bl __divsi3
	str r0, [r4, #0x44]
_080A7BD2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BD8: .4byte 0x08CE48F0

	thumb_func_start sub_080A7BDC
sub_080A7BDC: @ 0x080A7BDC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080A7C00 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7BF0
	str r5, [r0, #0x34]
	str r4, [r0, #0x38]
_080A7BF0:
	ldr r1, _080A7C04 @ =0x02000000
	adds r0, r4, #0
	subs r0, #0x3c
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C00: .4byte 0x08CE48F0
_080A7C04: .4byte 0x02000000

	thumb_func_start sub_080A7C08
sub_080A7C08: @ 0x080A7C08
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080A7C20 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7C1A
	strh r4, [r0, #0x3e]
_080A7C1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C20: .4byte 0x08CE48F0

	thumb_func_start sub_080A7C24
sub_080A7C24: @ 0x080A7C24
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080A7C48 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7C42
	adds r1, r0, #0
	adds r1, #0x4d
	strb r4, [r1]
	adds r0, #0x4e
	strb r5, [r0]
_080A7C42:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C48: .4byte 0x08CE48F0

	thumb_func_start sub_080A7C4C
sub_080A7C4C: @ 0x080A7C4C
	push {lr}
	ldr r0, _080A7C5C @ =0x08CE48F0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	pop {r1}
	bx r1
	.align 2, 0
_080A7C5C: .4byte 0x08CE48F0

	thumb_func_start sub_080A7C60
sub_080A7C60: @ 0x080A7C60
	cmp r0, #0
	beq _080A7C68
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
_080A7C68:
	bx lr
	.align 2, 0

	thumb_func_start sub_080A7C6C
sub_080A7C6C: @ 0x080A7C6C
	push {lr}
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080A7C7E
	bl sub_080A4E58
_080A7C7E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A7C84
sub_080A7C84: @ 0x080A7C84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	bl ApplySystemObjectsGraphics
	ldr r2, _080A7DB4 @ =0x0000FFF8
	movs r0, #1
	movs r1, #8
	bl SetBgOffset
	movs r0, #0xc
	bl Proc_LockEachMarked
	movs r0, #0xd
	bl Proc_LockEachMarked
	ldr r1, _080A7DB8 @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _080A7DBC @ =0x08CE4910
	bl SetFaceConfig
	ldr r0, _080A7DC0 @ =0x08415AA0
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080A7DC4 @ =0x08415594
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A7DC8 @ =0x02022C60
	ldr r1, _080A7DCC @ =0x084150E0
	movs r2, #0
	bl TmApplyTsa_t
	ldr r0, _080A7DD0 @ =0x02023460
	ldr r1, _080A7DD4 @ =0x08415AC0
	movs r2, #0xf0
	lsls r2, r2, #8
	bl sub_080AACD8
	ldr r0, _080A7DD8 @ =0x084150C0
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A7DDC @ =0x08414940
	ldr r1, _080A7DE0 @ =0x06010000
	bl Decompress
	ldr r0, _080A7DE4 @ =0x0841625C
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08054E88
	bl sub_08063FE0
	ldr r0, _080A7DE8 @ =0x08CE48F0
	adds r1, r6, #0
	bl SpawnProc
	str r0, [r6, #0x38]
	movs r0, #0
	movs r1, #0x70
	bl sub_080A7BDC
	movs r1, #0x41
	adds r1, r1, r6
	mov sl, r1
	movs r0, #0
	strb r0, [r1]
	adds r5, r6, #0
	adds r5, #0x4c
	strb r0, [r5]
	bl sub_0809E9FC
	adds r2, r6, #0
	adds r2, #0x40
	strb r0, [r2]
	adds r3, r6, #0
	adds r3, #0x42
	movs r4, #1
	adds r0, r4, #0
	ldrb r7, [r3]
	ands r0, r7
	cmp r0, #0
	beq _080A7DF4
	ldr r0, _080A7DEC @ =0x08418DF0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #2
	strb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x49
	strb r4, [r1]
	adds r2, #0xa
	strb r0, [r2]
	movs r4, #0
	str r3, [sp, #0xc]
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r0, [r5]
	cmp r4, r0
	bge _080A7E54
	adds r2, r7, #0
_080A7D7E:
	ldr r1, _080A7DF0 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080A7DA4
	adds r1, r6, #0
	adds r1, #0x40
	lsls r0, r4, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A7DA4
	movs r0, #1
_080A7DA4:
	strb r0, [r2]
	adds r2, #1
	adds r4, #1
	ldrb r1, [r5]
	cmp r4, r1
	blt _080A7D7E
	b _080A7E54
	.align 2, 0
_080A7DB4: .4byte 0x0000FFF8
_080A7DB8: .4byte 0x02000000
_080A7DBC: .4byte 0x08CE4910
_080A7DC0: .4byte 0x08415AA0
_080A7DC4: .4byte 0x08415594
_080A7DC8: .4byte 0x02022C60
_080A7DCC: .4byte 0x084150E0
_080A7DD0: .4byte 0x02023460
_080A7DD4: .4byte 0x08415AC0
_080A7DD8: .4byte 0x084150C0
_080A7DDC: .4byte 0x08414940
_080A7DE0: .4byte 0x06010000
_080A7DE4: .4byte 0x0841625C
_080A7DE8: .4byte 0x08CE48F0
_080A7DEC: .4byte 0x08418DF0
_080A7DF0: .4byte 0x0202BBF8
_080A7DF4:
	adds r1, r6, #0
	adds r1, #0x49
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r7, #2
	mov sb, r7
	mov r0, sb
	ldrb r7, [r2]
	ands r0, r7
	mov r8, r1
	cmp r0, #0
	beq _080A7E1C
	ldrb r0, [r5]
	add r0, r8
	strb r4, [r0]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080A7E1C:
	movs r0, #8
	ldrb r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080A7E34
	ldrb r0, [r5]
	add r0, r8
	mov r1, sb
	strb r1, [r0]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080A7E34:
	movs r4, #0
	str r3, [sp, #0xc]
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r2, [r5]
	cmp r4, r2
	bge _080A7E54
	adds r2, r7, #0
	movs r3, #0
	adds r1, r5, #0
_080A7E48:
	adds r0, r2, r4
	strb r3, [r0]
	adds r4, #1
	ldrb r0, [r1]
	cmp r4, r0
	blt _080A7E48
_080A7E54:
	ldrb r0, [r5]
	bl sub_080A7BB4
	ldrb r0, [r5]
	mov r1, r8
	bl sub_080A7480
	movs r4, #0
	ldrb r1, [r5]
	cmp r4, r1
	bge _080A7E78
_080A7E6A:
	adds r0, r4, #0
	bl sub_080A7860
	adds r4, #1
	ldrb r2, [r5]
	cmp r4, r2
	blt _080A7E6A
_080A7E78:
	bl sub_080A7B98
	adds r0, r6, #0
	bl sub_080A8CD4
	movs r4, #0xd2
	lsls r4, r4, #4
	movs r0, #0
	adds r1, r4, #0
	movs r2, #9
	bl sub_080A8CE8
	movs r0, #0
	adds r1, r4, #0
	movs r2, #9
	bl sub_080A8CE8
	movs r0, #0x1e
	movs r1, #0x3d
	movs r2, #0x44
	movs r3, #0x3d
	bl sub_080A8D70
	movs r0, #3
	bl sub_080A8D54
	ldr r4, _080A8044 @ =0x020000A4
	ldr r1, _080A8048 @ =0x0600E000
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r4, #0
	mov r2, sb
	movs r3, #0xe
	bl InitTextFont
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #9
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #8
	bl InitText
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #0xa
	bl InitText
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #5
	bl InitText
	bl sub_080A7C4C
	mov r1, sl
	ldrb r1, [r1]
	muls r0, r1, r0
	lsls r0, r0, #4
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x30]
	mov r2, sl
	ldrb r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	bl sub_080A77C0
	str r0, [r6, #0x3c]
	bl sub_080A75F0
	mov r1, sl
	ldrb r0, [r1]
	add r0, r8
	ldrb r0, [r0]
	bl sub_080A7668
	adds r0, r6, #0
	bl sub_080A76F8
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r7
	ldrb r0, [r0]
	ldr r7, [sp, #0xc]
	ldrb r1, [r7]
	bl sub_080A7C24
	ldrh r0, [r6, #0x30]
	bl sub_080A7C08
	movs r0, #3
	bl EnableBgSync
	str r4, [r6, #0x2c]
	str r4, [r6, #0x50]
	ldr r3, _080A804C @ =0x03002870
	movs r0, #0x20
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #1
	ldrb r7, [r2]
	orrs r0, r7
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	movs r2, #0x50
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	mov r2, sl
	ldrb r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	bl sub_080A77F8
	ldr r4, _080A8050 @ =0x080C5A48
	movs r7, #0x80
	adds r7, r7, r4
	mov r8, r7
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r7, #0
	ldrsh r0, [r4, r7]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08003388
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8044: .4byte 0x020000A4
_080A8048: .4byte 0x0600E000
_080A804C: .4byte 0x03002870
_080A8050: .4byte 0x080C5A48

	thumb_func_start sub_080A8054
sub_080A8054: @ 0x080A8054
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	ldr r3, _080A80C0 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080A808A
	adds r0, #0xff
_080A808A:
	asrs r0, r0, #8
	movs r1, #0x48
	subs r1, r1, r0
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x50
	subs r0, r0, r1
	adds r2, #4
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	cmp r4, #0x10
	bne _080A80B8
	adds r0, r5, #0
	bl Proc_Break
_080A80B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A80C0: .4byte 0x03002870

	thumb_func_start sub_080A80C4
sub_080A80C4: @ 0x080A80C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080A80E0
	adds r0, #0xff
_080A80E0:
	asrs r0, r0, #8
	movs r2, #0x48
	subs r2, r2, r0
	ldr r3, _080A811C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #8
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x68
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	cmp r4, #0x10
	bne _080A8116
	adds r0, r5, #0
	bl Proc_Break
_080A8116:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A811C: .4byte 0x03002870

	thumb_func_start sub_080A8120
sub_080A8120: @ 0x080A8120
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A8142
	ldr r5, _080A814C @ =0x0201E8D4
	adds r6, r0, #0
_080A8132:
	adds r0, r5, #0
	bl sub_08054E5C
	adds r5, #0x38
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A8132
_080A8142:
	movs r0, #0
	str r0, [r7, #0x50]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A814C: .4byte 0x0201E8D4

	thumb_func_start sub_080A8150
sub_080A8150: @ 0x080A8150
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_080A76F8
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r4, #0x42
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_080A7C24
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A817C
sub_080A817C: @ 0x080A817C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, _080A81BC @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A81C8
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A81C8
	ldr r0, _080A81C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A81B2
	ldr r0, _080A81C4 @ =0x00000386
	bl sub_080BE594
_080A81B2:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A8150
	b _080A840E
	.align 2, 0
_080A81BC: .4byte 0x08B857F8
_080A81C0: .4byte 0x0202BBF8
_080A81C4: .4byte 0x00000386
_080A81C8:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A8274
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x43
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _080A8274
	adds r0, #8
	adds r1, r0, r3
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A8202
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A8232
_080A8202:
	ldrb r1, [r5]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A821A
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A8232
_080A821A:
	ldrb r5, [r5]
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _080A8250
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A8250
_080A8232:
	ldr r0, _080A824C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A8240
	b _080A840E
_080A8240:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl sub_080BE594
	b _080A840E
	.align 2, 0
_080A824C: .4byte 0x0202BBF8
_080A8250:
	ldr r0, _080A826C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8262
	ldr r0, _080A8270 @ =0x00000386
	bl sub_080BE594
_080A8262:
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A8150
	b _080A840E
	.align 2, 0
_080A826C: .4byte 0x0202BBF8
_080A8270: .4byte 0x00000386
_080A8274:
	ldr r1, [r2]
	ldrh r3, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A828E
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _080A82A2
_080A828E:
	movs r7, #0x88
	lsls r7, r7, #1
	ands r7, r3
	cmp r7, #0
	beq _080A82C8
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #1
_080A82A2:
	bl sub_080A8D98
	ldr r0, _080A82C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82B8
	ldr r0, _080A82C4 @ =0x00000387
	bl sub_080BE594
_080A82B8:
	adds r0, r4, #0
	bl sub_080A8120
	b _080A840E
	.align 2, 0
_080A82C0: .4byte 0x0202BBF8
_080A82C4: .4byte 0x00000387
_080A82C8:
	ldrh r1, [r1, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080A8388
	str r7, [r4, #0x2c]
	ldr r6, _080A8348 @ =0x0202BBF8
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82E8
	ldr r0, _080A834C @ =0x0000038A
	bl sub_080BE594
_080A82E8:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r1, _080A8350 @ =0x0201E8D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #0xa]
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	bl sub_08054C8C
	adds r7, r4, #0
	adds r7, #0x42
	movs r0, #1
	ldrb r1, [r7]
	ands r0, r1
	cmp r0, #0
	beq _080A835E
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A8328
	movs r0, #2
	strb r0, [r6, #0x1b]
_080A8328:
	cmp r1, #1
	bne _080A8330
	movs r0, #3
	strb r0, [r6, #0x1b]
_080A8330:
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r5, [r5]
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A8354
	movs r0, #0x40
	ldrb r2, [r6, #0x14]
	orrs r0, r2
	strb r0, [r6, #0x14]
	b _080A8382
	.align 2, 0
_080A8348: .4byte 0x0202BBF8
_080A834C: .4byte 0x0000038A
_080A8350: .4byte 0x0201E8D4
_080A8354:
	movs r0, #0xbf
	ldrb r1, [r6, #0x14]
	ands r0, r1
	strb r0, [r6, #0x14]
	b _080A8382
_080A835E:
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x49
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, #0x43
	adds r1, r4, r1
	ldrb r1, [r1]
	bl sub_080A4E34
	ldrb r5, [r5]
	adds r4, r5, r4
	ldrb r0, [r4]
	movs r1, #2
	ldrb r7, [r7]
	orrs r1, r7
	bl sub_080A7C24
_080A8382:
	bl sub_080A7B7C
	b _080A840E
_080A8388:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A83C2
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080A83C2
	str r1, [r4, #0x2c]
	ldr r0, _080A8414 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A83B2
	ldr r0, _080A8418 @ =0x0000038B
	bl sub_080BE594
_080A83B2:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	movs r0, #3
	movs r1, #0
	bl sub_080A4E34
_080A83C2:
	ldr r0, [r4, #0x50]
	adds r0, #1
	str r0, [r4, #0x50]
	ldr r5, _080A841C @ =0x000001FF
	ands r0, r5
	cmp r0, #0x20
	bne _080A83F2
	ldr r2, _080A8420 @ =0x0201E8D4
	adds r3, r4, #0
	adds r3, #0x41
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #0xa]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	bl sub_08054C8C
_080A83F2:
	ldr r0, [r4, #0x50]
	ands r0, r5
	cmp r0, #0x80
	bne _080A840E
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080A8420 @ =0x0201E8D4
	adds r0, r0, r1
	bl sub_08054E5C
_080A840E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8414: .4byte 0x0202BBF8
_080A8418: .4byte 0x0000038B
_080A841C: .4byte 0x000001FF
_080A8420: .4byte 0x0201E8D4

	thumb_func_start sub_080A8424
sub_080A8424: @ 0x080A8424
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A8448
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
_080A8448:
	subs r0, #1
	strb r0, [r1]
	bl sub_080A7C4C
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r3, [r2]
	adds r1, r3, #0
	muls r1, r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080A8150
	ldrh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	cmp r0, r1
	bhs _080A8486
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x32]
_080A8486:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A848C
sub_080A848C: @ 0x080A848C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	str r0, [r4, #0x34]
	movs r5, #0
	str r5, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A84B6
	adds r0, r2, #1
	strb r0, [r1]
	b _080A84B8
_080A84B6:
	strb r5, [r1]
_080A84B8:
	bl sub_080A7C4C
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r3, [r2]
	adds r1, r3, #0
	muls r1, r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080A8150
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x32]
	cmp r1, r0
	bls _080A84F2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x30]
_080A84F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080A84F8
sub_080A84F8: @ 0x080A84F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x30]
	subs r0, r1, r2
	mov r3, r8
	ldr r6, [r3, #0x34]
	adds r4, r0, #0
	muls r4, r6, r4
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldr r5, [r3, #0x2c]
	adds r5, #1
	str r5, [r3, #0x2c]
	asrs r4, r4, #2
	movs r0, #0x1e
	subs r0, r0, r5
	adds r1, r4, #0
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xe1
	lsls r1, r1, #2
	bl __divsi3
	subs r4, r4, r0
	lsls r4, r4, #2
	adds r0, r6, #0
	muls r0, r4, r0
	mov r1, r8
	ldrh r1, [r1, #0x30]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r5, #0xd
	bne _080A855A
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_080A77F8
_080A855A:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0xe
	bne _080A8578
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_080A77C0
	mov r3, r8
	str r0, [r3, #0x3c]
_080A8578:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	cmp r0, #0x14
	bne _080A8590
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_080A7668
_080A8590:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0x1e
	bne _080A85A8
	ldr r0, _080A861C @ =0x00000FFF
	ldrh r3, [r2, #0x32]
	ands r0, r3
	adds r7, r0, #0
	strh r7, [r2, #0x30]
	mov r0, r8
	bl Proc_Break
_080A85A8:
	ldr r4, _080A8620 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08003388
	adds r0, r7, #0
	bl sub_080A7C08
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A861C: .4byte 0x00000FFF
_080A8620: .4byte 0x080C5A48

	thumb_func_start sub_080A8624
sub_080A8624: @ 0x080A8624
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	bl sub_080A75CC
	bl sub_08054EA8
	movs r0, #0
	bl sub_08006D50
	adds r4, #0x42
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080A8656
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A865C
_080A8656:
	movs r0, #0
	bl SetOnHBlankA
_080A865C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A8664
sub_080A8664: @ 0x080A8664
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8678 @ =0x08CE4930
	bl SpawnProcLocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A8678: .4byte 0x08CE4930

	thumb_func_start sub_080A867C
sub_080A867C: @ 0x080A867C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0809E9FC
	cmp r0, #7
	ble _080A8696
	ldr r0, _080A869C @ =0x08CE4930
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
_080A8696:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A869C: .4byte 0x08CE4930

	thumb_func_start sub_080A86A0
sub_080A86A0: @ 0x080A86A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	mov sb, r2
	mov sl, r3
	ldr r3, [sp, #0x40]
	ldr r0, _080A8774 @ =0xFFFFFC00
	adds r0, r0, r3
	mov r8, r0
	mov r1, r8
	muls r1, r0, r1
	lsls r5, r3, #1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r5, r6
	muls r0, r1, r0
	asrs r1, r0, #0x1f
	adds r4, r3, #0
	muls r4, r3, r4
	movs r2, #0xc0
	lsls r2, r2, #4
	subs r2, r2, r5
	muls r4, r2, r4
	asrs r5, r4, #0x1f
	subs r6, r6, r3
	adds r2, r6, #0
	muls r2, r6, r2
	muls r2, r3, r2
	str r2, [sp, #0x18]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x1c]
	mov r2, r8
	muls r2, r3, r2
	muls r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r2, sb
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sb
	ldr r6, [sp]
	subs r3, r3, r6
	mov sb, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sb
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	ldr r6, [sp, #4]
	subs r3, r3, r6
	mov sl, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sl
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #2
	lsrs r2, r0, #0x1e
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A8774: .4byte 0xFFFFFC00

	thumb_func_start sub_080A8778
sub_080A8778: @ 0x080A8778
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	mov sb, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r2, [sp, #0x38]
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r0, r3, #1
	adds r4, r2, #0
	muls r4, r0, r4
	lsls r5, r3, #0xb
	subs r0, r4, r5
	asrs r1, r0, #0x1f
	subs r4, r5, r4
	str r4, [sp]
	asrs r4, r4, #0x1f
	str r4, [sp, #4]
	muls r3, r2, r3
	lsls r4, r2, #0xc
	subs r4, r3, r4
	movs r5, #0x80
	lsls r5, r5, #0xd
	adds r4, r4, r5
	asrs r5, r4, #0x1f
	lsls r2, r2, #0xb
	subs r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	mov r2, sb
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	subs r6, r6, r3
	asrs r0, r6, #1
	adds r2, r0, #0
	asrs r3, r6, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, r8
	mov r5, sb
	subs r3, r3, r5
	mov r8, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r7, r8
	asrs r3, r7, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080A8838
sub_080A8838: @ 0x080A8838
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x24]
	mov r8, r0
	ldr r7, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	mov sb, r1
	movs r0, #3
	ands r0, r3
	bl sub_08002BE8
	str r0, [sp]
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	add sl, r4
	mov r2, r8
	cmp r2, #0
	bge _080A887A
	add sb, r8
	lsls r0, r2, #1
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r2, #0
	mov r8, r2
_080A887A:
	cmp r7, #0
	bge _080A888E
	ldr r0, [sp, #0x30]
	adds r0, r0, r7
	str r0, [sp, #0x30]
	lsls r0, r7, #6
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r7, #0
_080A888E:
	movs r1, #0
	cmp r7, #0x1f
	bgt _080A88E8
	ldr r2, [sp, #0x30]
	cmp r1, r2
	bge _080A88E8
_080A889A:
	movs r5, #0
	adds r4, r1, #1
	mov r0, r8
	cmp r0, #0x1f
	bgt _080A88DA
	cmp r5, sb
	bge _080A88DA
	adds r0, r7, r1
	movs r2, #0x1f
	mov ip, r2
	ands r0, r2
	lsls r6, r0, #5
	mov r2, r8
	lsls r0, r1, #6
	mov r1, sl
	adds r3, r0, r1
_080A88BA:
	adds r0, r2, #0
	mov r1, ip
	ands r0, r1
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r0, r0, r1
	ldrh r1, [r3]
	strh r1, [r0]
	adds r2, #1
	adds r3, #2
	adds r5, #1
	cmp r2, #0x1f
	bgt _080A88DA
	cmp r5, sb
	blt _080A88BA
_080A88DA:
	adds r1, r4, #0
	adds r0, r7, r4
	cmp r0, #0x1f
	bgt _080A88E8
	ldr r2, [sp, #0x30]
	cmp r4, r2
	blt _080A889A
_080A88E8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080A88F8
sub_080A88F8: @ 0x080A88F8
	push {r4, r5, r6, lr}
	movs r2, #0
	adds r4, r0, #0
	adds r4, #0x3c
	movs r3, #0
	movs r6, #0xf0
	adds r1, r0, #0
	adds r1, #0x2c
	movs r5, #0xa0
_080A890A:
	adds r0, r4, r2
	strb r3, [r0]
	strb r3, [r1]
	strb r3, [r1, #1]
	strb r6, [r1, #2]
	strb r5, [r1, #3]
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080A890A
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080A8924
sub_080A8924: @ 0x080A8924
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	adds r4, r6, #0
	adds r4, #0x2c
_080A8930:
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r7
	ldrb r5, [r0]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080A899E
	lsls r0, r7, #1
	adds r1, r6, #0
	adds r1, #0x40
	adds r1, r1, r0
	movs r2, #0
	ldrsh r3, [r1, r2]
	adds r1, r6, #0
	adds r1, #0x48
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r0, [r4]
	cmp r3, r0
	blt _080A899E
	ldrb r0, [r4, #2]
	cmp r3, r0
	bge _080A899E
	ldrb r0, [r4, #1]
	cmp r2, r0
	blt _080A899E
	ldrb r0, [r4, #3]
	cmp r2, r0
	bge _080A899E
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080A8990
	adds r1, r3, #0
	subs r1, #0xc
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	ldr r3, _080A898C @ =0x08CE49F0
	bl sub_080069F4
	b _080A899E
	.align 2, 0
_080A898C: .4byte 0x08CE49F0
_080A8990:
	adds r1, r3, #0
	subs r1, #0xc
	str r0, [sp]
	movs r0, #3
	ldr r3, _080A89B0 @ =0x08CE49E8
	bl sub_080069F4
_080A899E:
	adds r4, #4
	adds r7, #1
	cmp r7, #3
	ble _080A8930
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A89B0: .4byte 0x08CE49E8

	thumb_func_start sub_080A89B4
sub_080A89B4: @ 0x080A89B4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A89C4 @ =0x08CE49F8
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080A89C4: .4byte 0x08CE49F8

	thumb_func_start sub_080A89C8
sub_080A89C8: @ 0x080A89C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _080A8A2C @ =0x08CE49F8
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A8A22
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r1, r5
	movs r3, #1
	movs r0, #1
	strb r0, [r1]
	lsls r2, r5, #1
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r2
	mov r2, r8
	strh r2, [r0]
	adds r0, r6, #0
	orrs r0, r3
	strb r0, [r1]
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _080A8A22
	ldr r0, _080A8A30 @ =0x0819435C
	ldr r1, _080A8A34 @ =0x060100C0
	bl Decompress
	ldr r0, _080A8A38 @ =0x08194398
	ldr r1, _080A8A3C @ =0x060104C0
	bl Decompress
_080A8A22:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A2C: .4byte 0x08CE49F8
_080A8A30: .4byte 0x0819435C
_080A8A34: .4byte 0x060100C0
_080A8A38: .4byte 0x08194398
_080A8A3C: .4byte 0x060104C0

	thumb_func_start sub_080A8A40
sub_080A8A40: @ 0x080A8A40
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A8A74 @ =0x08CE49F8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A8A6E
	lsls r0, r4, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r1, #0x2f
	ldr r0, [sp, #0x14]
	strb r0, [r1]
_080A8A6E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A74: .4byte 0x08CE49F8

	thumb_func_start sub_080A8A78
sub_080A8A78: @ 0x080A8A78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8A94 @ =0x08CE49F8
	bl Proc_Find
	cmp r0, #0
	beq _080A8A8E
	adds r0, #0x3c
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080A8A8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A94: .4byte 0x08CE49F8

	thumb_func_start sub_080A8A98
sub_080A8A98: @ 0x080A8A98
	push {lr}
	ldr r0, _080A8AB8 @ =0x08CE49F8
	bl Proc_Find
	cmp r0, #0
	beq _080A8AB4
	adds r1, r0, #0
	adds r1, #0x3c
	movs r2, #0
	adds r0, #0x43
_080A8AAC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A8AAC
_080A8AB4:
	pop {r0}
	bx r0
	.align 2, 0
_080A8AB8: .4byte 0x08CE49F8

	thumb_func_start sub_080A8ABC
sub_080A8ABC: @ 0x080A8ABC
	push {lr}
	ldr r0, _080A8AD4 @ =0x08CE49F8
	bl Proc_Find
	cmp r0, #0
	beq _080A8ACE
	movs r1, #1
	bl Proc_Goto
_080A8ACE:
	pop {r0}
	bx r0
	.align 2, 0
_080A8AD4: .4byte 0x08CE49F8

	thumb_func_start sub_080A8AD8
sub_080A8AD8: @ 0x080A8AD8
	push {lr}
	ldr r0, _080A8AF0 @ =0x08CE49F8
	bl Proc_Find
	cmp r0, #0
	beq _080A8AEA
	movs r1, #0
	bl Proc_Goto
_080A8AEA:
	pop {r0}
	bx r0
	.align 2, 0
_080A8AF0: .4byte 0x08CE49F8

	thumb_func_start sub_080A8AF4
sub_080A8AF4: @ 0x080A8AF4
	push {lr}
	ldr r0, _080A8B04 @ =0x08CE49F8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A8B04: .4byte 0x08CE49F8

	thumb_func_start sub_080A8B08
sub_080A8B08: @ 0x080A8B08
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x54
	strh r1, [r2]
	str r1, [r0, #0x4c]
	str r1, [r0, #0x44]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x50]
	str r1, [r0, #0x48]
	str r1, [r0, #0x40]
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start sub_080A8B28
sub_080A8B28: @ 0x080A8B28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x34]
	ldr r0, [r5, #0x3c]
	mov r8, r0
	ldr r1, [r5, #0x38]
	mov sb, r1
	ldr r2, [r5, #0x40]
	mov sl, r2
	ldr r0, [r5, #0x44]
	adds r0, #1
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	movs r6, #0
_080A8B52:
	lsls r3, r6, #2
	adds r0, r5, #0
	adds r0, #0x4c
	adds r2, r0, r3
	ldr r0, [r2]
	adds r4, r5, #0
	adds r4, #0x44
	cmp r0, #0
	beq _080A8B72
	adds r0, r4, r3
	ldr r1, [r0]
	adds r1, #3
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_080A8B72:
	adds r1, r4, r3
	ldr r0, [r1]
	asrs r0, r0, #3
	cmp r0, #5
	ble _080A8B80
	movs r0, #0
	str r0, [r1]
_080A8B80:
	adds r6, #1
	cmp r6, #1
	ble _080A8B52
	ldr r3, [r5, #0x2c]
	cmp r3, #0
	bne _080A8C14
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A8BA0
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x34]
	adds r7, r0, r1
	cmp r2, #4
	bne _080A8BA0
	str r3, [r5, #0x4c]
_080A8BA0:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A8BB8
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	mov sb, r0
	cmp r2, #4
	bne _080A8BB8
	movs r0, #0
	str r0, [r5, #0x50]
_080A8BB8:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8BE2
	ldr r1, _080A8CC8 @ =0x000001FF
	ands r1, r7
	movs r2, #0xff
	mov r0, r8
	ands r2, r0
	ldr r3, _080A8CCC @ =0x08CE4A28
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl sub_08006A34
_080A8BE2:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A8C14
	ldr r1, _080A8CC8 @ =0x000001FF
	mov r2, sb
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r2, #0xff
	mov r0, sl
	ands r2, r0
	ldr r3, _080A8CCC @ =0x08CE4A28
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl sub_08006A34
_080A8C14:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _080A8CB6
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A8C32
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	mov r8, r0
	cmp r2, #4
	bne _080A8C32
	movs r0, #0
	str r0, [r5, #0x4c]
_080A8C32:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A8C4A
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	mov sl, r0
	cmp r2, #4
	bne _080A8C4A
	movs r0, #0
	str r0, [r5, #0x50]
_080A8C4A:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8C7C
	ldr r0, _080A8CC8 @ =0x000001FF
	ands r7, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r3, _080A8CD0 @ =0x08CE4A36
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0xd
	adds r1, r7, #0
	mov r2, r8
	bl sub_08006A34
_080A8C7C:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A8CB6
	ldr r0, _080A8CC8 @ =0x000001FF
	mov r2, sb
	ands r2, r0
	mov sb, r2
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, sb
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	mov sl, r2
	ldr r3, _080A8CD0 @ =0x08CE4A36
	adds r2, r5, #0
	adds r2, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r2, r0
	str r0, [sp]
	movs r0, #0xd
	mov r2, sl
	bl sub_08006A34
_080A8CB6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8CC8: .4byte 0x000001FF
_080A8CCC: .4byte 0x08CE4A28
_080A8CD0: .4byte 0x08CE4A36

	thumb_func_start sub_080A8CD4
sub_080A8CD4: @ 0x080A8CD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8CE4 @ =0x08CE4A40
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080A8CE4: .4byte 0x08CE4A40

	thumb_func_start sub_080A8CE8
sub_080A8CE8: @ 0x080A8CE8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, _080A8D40 @ =0x08CE4A40
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080A8D38
	ldr r0, _080A8D44 @ =0x0840DCE4
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r6, #0
	bne _080A8D18
	ldr r0, _080A8D48 @ =0x0840D224
	ldr r2, _080A8D4C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A8D18:
	cmp r6, #1
	bne _080A8D26
	ldr r0, _080A8D50 @ =0x0840D150
	ldr r2, _080A8D4C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A8D26:
	asrs r0, r4, #5
	movs r1, #0xf
	ands r1, r7
	lsls r1, r1, #0xc
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	str r6, [r5, #0x2c]
_080A8D38:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A8D40: .4byte 0x08CE4A40
_080A8D44: .4byte 0x0840DCE4
_080A8D48: .4byte 0x0840D224
_080A8D4C: .4byte 0x06010000
_080A8D50: .4byte 0x0840D150

	thumb_func_start sub_080A8D54
sub_080A8D54: @ 0x080A8D54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8D6C @ =0x08CE4A40
	bl Proc_Find
	cmp r0, #0
	beq _080A8D64
	str r4, [r0, #0x30]
_080A8D64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D6C: .4byte 0x08CE4A40

	thumb_func_start sub_080A8D70
sub_080A8D70: @ 0x080A8D70
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A8D94 @ =0x08CE4A40
	bl Proc_Find
	cmp r0, #0
	beq _080A8D8C
	str r4, [r0, #0x34]
	str r5, [r0, #0x3c]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
_080A8D8C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D94: .4byte 0x08CE4A40

	thumb_func_start sub_080A8D98
sub_080A8D98: @ 0x080A8D98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8DCC @ =0x08CE4A40
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A8DC6
	cmp r4, #0
	bne _080A8DB0
	movs r0, #1
	str r0, [r1, #0x4c]
_080A8DB0:
	cmp r4, #1
	bne _080A8DB6
	str r4, [r1, #0x50]
_080A8DB6:
	cmp r4, #2
	bne _080A8DBE
	movs r0, #1
	str r0, [r1, #0x4c]
_080A8DBE:
	cmp r4, #3
	bne _080A8DC6
	movs r0, #1
	str r0, [r1, #0x50]
_080A8DC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8DCC: .4byte 0x08CE4A40

	thumb_func_start sub_080A8DD0
sub_080A8DD0: @ 0x080A8DD0
	push {lr}
	ldr r0, _080A8DE0 @ =0x08CE4A40
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A8DE0: .4byte 0x08CE4A40

	thumb_func_start sub_080A8DE4
sub_080A8DE4: @ 0x080A8DE4
	movs r1, #0
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start sub_080A8DEC
sub_080A8DEC: @ 0x080A8DEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _080A8E06
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x34]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_080A8E06:
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A8E14
sub_080A8E14: @ 0x080A8E14
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080A8E2C @ =0x08CE4A60
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8E2C: .4byte 0x08CE4A60

	thumb_func_start sub_080A8E30
sub_080A8E30: @ 0x080A8E30
	movs r2, #0
	movs r1, #3
	adds r0, #0x4d
_080A8E36:
	strb r2, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _080A8E36
	bx lr
	.align 2, 0

	thumb_func_start sub_080A8E44
sub_080A8E44: @ 0x080A8E44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #0x4e
	str r1, [sp, #0x14]
_080A8E5C:
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldr r2, [sp, #8]
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r2, #1
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080A8E70
	b _080A9188
_080A8E70:
	ldr r0, [sp, #4]
	adds r0, #0x3e
	ldr r3, [sp, #8]
	adds r3, r3, r0
	mov sb, r3
	movs r1, #0
	ldrsb r1, [r3, r1]
	str r0, [sp, #0x30]
	cmp r1, #1
	bgt _080A8E86
	b _080A9188
_080A8E86:
	ldr r0, [sp, #4]
	adds r0, #0x3a
	ldr r7, [sp, #8]
	adds r7, r0, r7
	str r7, [sp, #0x34]
	movs r1, #0
	ldrsb r1, [r7, r1]
	str r0, [sp, #0x2c]
	cmp r1, #1
	bgt _080A8E9C
	b _080A9188
_080A8E9C:
	ldr r0, [sp, #8]
	lsls r0, r0, #1
	mov r8, r0
	ldr r1, [sp, #4]
	adds r1, #0x2a
	str r1, [sp, #0xc]
	adds r6, r1, #0
	add r6, r8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldrh r3, [r6]
	orrs r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r7, [sp, #4]
	adds r7, #0x32
	str r7, [sp, #0x10]
	adds r5, r7, #0
	add r5, r8
	movs r2, #0
	ldrsh r0, [r5, r2]
	mov ip, r0
	ldr r3, [sp, #4]
	adds r3, #0x42
	str r3, [sp, #0x18]
	adds r4, r3, #0
	add r4, r8
	ldrh r2, [r4]
	ldr r7, [sp, #0x14]
	ldrh r7, [r7]
	adds r0, r2, r7
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl sub_08006A34
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov ip, r3
	ldrh r3, [r4]
	ldr r2, [sp, #0x14]
	ldrh r2, [r2]
	adds r0, r3, r2
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl sub_08006A34
	movs r3, #0xc0
	lsls r3, r3, #6
	adds r1, r3, #0
	ldrh r7, [r6]
	orrs r1, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	mov ip, r2
	ldrh r2, [r4]
	ldr r7, [sp, #0x14]
	ldrh r7, [r7]
	adds r0, r2, r7
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl sub_08006A34
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	movs r3, #0
	ldrsh r2, [r5, r3]
	ldr r7, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldrh r4, [r4]
	ldr r3, [sp, #0x14]
	ldrh r3, [r3]
	adds r0, r4, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl sub_08006A34
	mov r7, sb
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r4, r0, #2
	movs r0, #0
	ldrsh r7, [r5, r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r5, r0, #0
	adds r5, #8
	mov sl, r8
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x24]
	ldr r3, [sp, #0x10]
	str r3, [sp, #0x28]
	ldr r0, [sp, #4]
	adds r0, #0x4e
	mov r8, r0
	ldr r6, [sp, #0x18]
	cmp r4, #3
	ble _080A8FFA
_080A8FB0:
	mov r1, sl
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A8FD8 @ =0x08B90608
	bl sub_08006A34
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A8FB0
	b _080A8FFA
	.align 2, 0
_080A8FD4: .4byte 0x08B905B0
_080A8FD8: .4byte 0x08B90608
_080A8FDC:
	mov r3, sl
	adds r0, r6, r3
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9080 @ =0x08B905E8
	bl sub_08006A34
	adds r5, #0x10
	subs r4, #2
_080A8FFA:
	cmp r4, #1
	bgt _080A8FDC
	cmp r4, #0
	ble _080A9024
_080A9002:
	mov r2, sl
	adds r0, r6, r2
	ldrh r0, [r0]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9084 @ =0x08B905B0
	bl sub_08006A34
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A9002
_080A9024:
	ldr r7, [sp, #0x30]
	ldr r1, [sp, #8]
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x2c]
	ldr r7, [sp, #8]
	adds r0, r3, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #3
	adds r7, r1, r0
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r5, r0, #0
	adds r5, #8
	cmp r4, #3
	ble _080A90AA
_080A905C:
	mov r2, sl
	adds r0, r6, r2
	ldrh r0, [r0]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9088 @ =0x08B90608
	bl sub_08006A34
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A905C
	b _080A90AA
	.align 2, 0
_080A9080: .4byte 0x08B905E8
_080A9084: .4byte 0x08B905B0
_080A9088: .4byte 0x08B90608
_080A908C:
	mov r1, sl
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9134 @ =0x08B905E8
	bl sub_08006A34
	adds r5, #0x10
	subs r4, #2
_080A90AA:
	cmp r4, #1
	bgt _080A908C
	cmp r4, #0
	ble _080A90D4
_080A90B2:
	mov r3, sl
	adds r0, r6, r3
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9138 @ =0x08B905B0
	bl sub_08006A34
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A90B2
_080A90D4:
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #8]
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r7, r0, #0
	adds r7, #8
	cmp r1, #0
	ble _080A9188
	add r6, sl
_080A90F4:
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #8]
	adds r0, r2, r3
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r3, r7, #0
	adds r3, #8
	str r3, [sp, #0x20]
	subs r1, #1
	mov sb, r1
	cmp r4, #3
	ble _080A915A
_080A9114:
	ldrh r2, [r6]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r2, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A913C @ =0x08B90608
	bl sub_08006A34
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A9114
	b _080A915A
	.align 2, 0
_080A9134: .4byte 0x08B905E8
_080A9138: .4byte 0x08B905B0
_080A913C: .4byte 0x08B90608
_080A9140:
	ldrh r3, [r6]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r3, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A91A4 @ =0x08B905E8
	bl sub_08006A34
	adds r5, #0x10
	subs r4, #2
_080A915A:
	cmp r4, #1
	bgt _080A9140
	cmp r4, #0
	ble _080A9180
_080A9162:
	ldrh r1, [r6]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r1, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A91A8 @ =0x08B905B0
	bl sub_08006A34
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A9162
_080A9180:
	ldr r7, [sp, #0x20]
	mov r1, sb
	cmp r1, #0
	bgt _080A90F4
_080A9188:
	ldr r7, [sp, #0x1c]
	str r7, [sp, #8]
	adds r0, r7, #0
	cmp r0, #3
	bgt _080A9194
	b _080A8E5C
_080A9194:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A91A4: .4byte 0x08B905E8
_080A91A8: .4byte 0x08B905B0

	thumb_func_start sub_080A91AC
sub_080A91AC: @ 0x080A91AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A91CC @ =0x08CE4A80
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A91CC: .4byte 0x08CE4A80

	thumb_func_start sub_080A91D0
sub_080A91D0: @ 0x080A91D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A91F8 @ =0x08CE4A80
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A91F2
	lsls r0, r4, #0xf
	lsrs r0, r0, #0x14
	adds r1, #0x4e
	strh r0, [r1]
	ldr r0, _080A91FC @ =0x08403A48
	ldr r2, _080A9200 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A91F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A91F8: .4byte 0x08CE4A80
_080A91FC: .4byte 0x08403A48
_080A9200: .4byte 0x06010000

	thumb_func_start sub_080A9204
sub_080A9204: @ 0x080A9204
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _080A9268 @ =0x08CE4A80
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080A925C
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	lsls r2, r4, #1
	adds r0, r3, #0
	adds r0, #0x2a
	adds r0, r0, r2
	strh r5, [r0]
	adds r0, r3, #0
	adds r0, #0x32
	adds r0, r0, r2
	strh r6, [r0]
	adds r0, r3, #0
	adds r0, #0x3e
	adds r0, r0, r4
	strb r7, [r0]
	adds r0, r3, #0
	adds r0, #0x3a
	adds r0, r0, r4
	ldr r1, [sp, #0x18]
	strb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x42
	adds r0, r0, r2
	mov r1, r8
	strh r1, [r0]
_080A925C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9268: .4byte 0x08CE4A80

	thumb_func_start sub_080A926C
sub_080A926C: @ 0x080A926C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9288 @ =0x08CE4A80
	bl Proc_Find
	cmp r0, #0
	beq _080A9282
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080A9282:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9288: .4byte 0x08CE4A80

	thumb_func_start sub_080A928C
sub_080A928C: @ 0x080A928C
	push {lr}
	ldr r0, _080A92A4 @ =0x08CE4A80
	bl Proc_Find
	cmp r0, #0
	beq _080A929E
	movs r1, #1
	bl Proc_Goto
_080A929E:
	pop {r0}
	bx r0
	.align 2, 0
_080A92A4: .4byte 0x08CE4A80

	thumb_func_start sub_080A92A8
sub_080A92A8: @ 0x080A92A8
	push {r4, lr}
	ldr r0, _080A92D0 @ =0x08CE4A80
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A92C8
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	lsls r0, r0, #5
	bl sub_080A91D0
_080A92C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A92D0: .4byte 0x08CE4A80

	thumb_func_start sub_080A92D4
sub_080A92D4: @ 0x080A92D4
	push {lr}
	ldr r0, _080A92E4 @ =0x08CE4A80
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A92E4: .4byte 0x08CE4A80

	thumb_func_start sub_080A92E8
sub_080A92E8: @ 0x080A92E8
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x2c]
	adds r0, r1, #0
	bl _call_via_r2
	pop {r0}
	bx r0

	thumb_func_start sub_080A92F8
sub_080A92F8: @ 0x080A92F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080A9338
	cmp r0, #0
	bne _080A9310
	ldr r0, _080A9318 @ =0x08CE4AB0
	adds r1, r5, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
_080A9310:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A9318: .4byte 0x08CE4AB0

	thumb_func_start sub_080A931C
sub_080A931C: @ 0x080A931C
	push {lr}
	b _080A9324
_080A9320:
	bl Proc_End
_080A9324:
	ldr r0, _080A9334 @ =0x08CE4AB0
	bl Proc_Find
	cmp r0, #0
	bne _080A9320
	pop {r0}
	bx r0
	.align 2, 0
_080A9334: .4byte 0x08CE4AB0

	thumb_func_start sub_080A9338
sub_080A9338: @ 0x080A9338
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	b _080A934A
_080A9340:
	ldr r0, [r1, #0x2c]
	cmp r0, r4
	bne _080A934A
	adds r0, r1, #0
	b _080A9358
_080A934A:
	ldr r0, _080A9360 @ =0x08CE4AB0
	bl sub_08004C5C
	adds r1, r0, #0
	cmp r1, #0
	bne _080A9340
	movs r0, #0
_080A9358:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9360: .4byte 0x08CE4AB0

	thumb_func_start sub_080A9364
sub_080A9364: @ 0x080A9364
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, _080A9424 @ =0x02022860
	ldrh r3, [r5, #0x3a]
	lsls r2, r3, #5
	movs r4, #0x87
	lsls r4, r4, #2
	adds r2, r2, r4
	adds r2, r2, r1
	ldr r1, _080A9428 @ =0x0202BBF8
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	lsrs r0, r0, #2
	movs r4, #0xf
	ands r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080A942C @ =0x0840DD24
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080A9430 @ =0x08B905B0
	ldrh r0, [r5, #0x3a]
	ands r4, r0
	lsls r4, r4, #0xc
	ldrh r0, [r5, #0x3c]
	adds r4, r0, r4
	ldrh r0, [r5, #0x36]
	adds r4, r0, r4
	str r4, [sp]
	movs r0, #4
	bl sub_08006A34
	movs r4, #1
	ldrh r1, [r5, #0x38]
	cmp r4, r1
	bge _080A93F2
_080A93C4:
	lsls r0, r4, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	movs r0, #0xf
	ldrh r3, [r5, #0x3a]
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r3, [r5, #0x3c]
	adds r0, r3, r0
	ldrh r3, [r5, #0x36]
	adds r0, r3, r0
	adds r0, #1
	str r0, [sp]
	movs r0, #4
	ldr r3, _080A9430 @ =0x08B905B0
	bl sub_08006A34
	adds r4, #1
	ldrh r0, [r5, #0x38]
	cmp r4, r0
	blt _080A93C4
_080A93F2:
	ldrh r1, [r5, #0x38]
	lsls r0, r1, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080A9430 @ =0x08B905B0
	movs r0, #0xf
	ldrh r4, [r5, #0x3a]
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r4, [r5, #0x3c]
	adds r0, r4, r0
	ldrh r5, [r5, #0x36]
	adds r0, r5, r0
	adds r0, #2
	str r0, [sp]
	movs r0, #4
	bl sub_08006A34
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9424: .4byte 0x02022860
_080A9428: .4byte 0x0202BBF8
_080A942C: .4byte 0x0840DD24
_080A9430: .4byte 0x08B905B0

	thumb_func_start sub_080A9434
sub_080A9434: @ 0x080A9434
	adds r0, #0x35
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080A943C
sub_080A943C: @ 0x080A943C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_08049F58
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A945C
	adds r0, r4, #0
	bl sub_080A9364
_080A945C:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A9474
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #2
	bl sub_08015A5C
_080A9474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A947C
sub_080A947C: @ 0x080A947C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A949C @ =0x08CE4AC8
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A949C: .4byte 0x08CE4AC8

	thumb_func_start sub_080A94A0
sub_080A94A0: @ 0x080A94A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080A94D8 @ =0x08CE4AC8
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080A94D0
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	lsls r0, r5, #0xf
	lsrs r0, r0, #0x14
	strh r0, [r2, #0x36]
	movs r0, #0xf
	ands r4, r0
	strh r4, [r2, #0x3a]
	ldr r0, _080A94DC @ =0x0840E098
	ldr r2, _080A94E0 @ =0x06010000
	adds r1, r5, r2
	bl Decompress
_080A94D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A94D8: .4byte 0x08CE4AC8
_080A94DC: .4byte 0x0840E098
_080A94E0: .4byte 0x06010000

	thumb_func_start sub_080A94E4
sub_080A94E4: @ 0x080A94E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A94FC @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A94F4
	str r4, [r0, #0x2c]
_080A94F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A94FC: .4byte 0x08CE4AC8

	thumb_func_start sub_080A9500
sub_080A9500: @ 0x080A9500
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9518 @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A9510
	str r4, [r0, #0x30]
_080A9510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9518: .4byte 0x08CE4AC8

	thumb_func_start sub_080A951C
sub_080A951C: @ 0x080A951C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _080A9544 @ =0x08CE4AC8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A955C
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	cmp r4, #0
	bne _080A9548
	adds r0, #0x35
	strb r4, [r0]
	b _080A9554
	.align 2, 0
_080A9544: .4byte 0x08CE4AC8
_080A9548:
	adds r2, r1, #0
	adds r2, #0x35
	movs r0, #1
	strb r0, [r2]
	strh r4, [r1, #0x38]
	strh r7, [r1, #0x3c]
_080A9554:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A955C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A9564
sub_080A9564: @ 0x080A9564
	push {lr}
	ldr r0, _080A957C @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A9576
	movs r1, #0
	bl Proc_Goto
_080A9576:
	pop {r0}
	bx r0
	.align 2, 0
_080A957C: .4byte 0x08CE4AC8

	thumb_func_start sub_080A9580
sub_080A9580: @ 0x080A9580
	push {lr}
	ldr r0, _080A9590 @ =0x08CE4AC8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9590: .4byte 0x08CE4AC8

	thumb_func_start sub_080A9594
sub_080A9594: @ 0x080A9594
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A95B0 @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A95A8
	adds r0, #0x34
	strb r4, [r0]
_080A95A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A95B0: .4byte 0x08CE4AC8

	thumb_func_start sub_080A95B4
sub_080A95B4: @ 0x080A95B4
	ldr r2, _080A95D4 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080A95D4: .4byte 0x03002870

	thumb_func_start sub_080A95D8
sub_080A95D8: @ 0x080A95D8
	ldr r2, _080A95F4 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080A95F4: .4byte 0x03002870

	thumb_func_start sub_080A95F8
sub_080A95F8: @ 0x080A95F8
	movs r2, #0
	movs r1, #3
	adds r0, #0x50
_080A95FE:
	strb r2, [r0]
	subs r0, #0xc
	subs r1, #1
	cmp r1, #0
	bge _080A95FE
	bx lr
	.align 2, 0

	thumb_func_start sub_080A960C
sub_080A960C: @ 0x080A960C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	movs r1, #0
_080A961C:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r2, [sp, #4]
	adds r5, r2, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r1, #1
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _080A9636
	b _080A9930
_080A9636:
	ldr r1, [r2, #0x60]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x5c]
	adds r0, r0, r1
	ldrh r3, [r5, #8]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r5, #1]
	ldr r1, _080A98B4 @ =0x000001FF
	ldrh r2, [r5, #2]
	ands r1, r2
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl sub_08006A34
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080A98B4 @ =0x000001FF
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl sub_08006A34
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080A98B4 @ =0x000001FF
	ands r1, r3
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl sub_08006A34
	ldrb r0, [r5, #1]
	ldr r1, _080A98B4 @ =0x000001FF
	ldrh r2, [r5, #2]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl sub_08006A34
	movs r7, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	bge _080A974C
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98BC @ =0x08B90608
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A96FC:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl sub_08006A34
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl sub_08006A34
	adds r7, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	blt _080A96FC
_080A974C:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	bge _080A97B0
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98C0 @ =0x08B905E8
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A9760:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl sub_08006A34
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl sub_08006A34
	adds r7, #2
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	blt _080A9760
_080A97B0:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	bge _080A9814
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98B8 @ =0x08B905B0
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A97C4:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl sub_08006A34
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl sub_08006A34
	adds r7, #1
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	blt _080A97C4
_080A9814:
	movs r7, #1
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	blt _080A9820
	b _080A9930
_080A9820:
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	movs r1, #0xff
	mov sb, r1
	mov r2, r8
	adds r2, #9
	str r2, [sp, #8]
_080A982E:
	ldrb r0, [r5, #1]
	mov r1, sl
	ldrh r3, [r5, #2]
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	lsls r4, r7, #3
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl sub_08006A34
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl sub_08006A34
	movs r6, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	adds r7, #1
	cmp r6, r0
	bge _080A98EA
_080A9884:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A98BC @ =0x08B90608
	bl sub_08006A34
	adds r6, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r6, r0
	blt _080A9884
	b _080A98EA
	.align 2, 0
_080A98B4: .4byte 0x000001FF
_080A98B8: .4byte 0x08B905B0
_080A98BC: .4byte 0x08B90608
_080A98C0: .4byte 0x08B905E8
_080A98C4:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A98F4 @ =0x08B905E8
	bl sub_08006A34
	adds r6, #2
_080A98EA:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r6, r0
	blt _080A98C4
	b _080A991E
	.align 2, 0
_080A98F4: .4byte 0x08B905E8
_080A98F8:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A9948 @ =0x08B905B0
	bl sub_08006A34
	adds r6, #1
_080A991E:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r6, r0
	blt _080A98F8
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	bge _080A9930
	b _080A982E
_080A9930:
	ldr r1, [sp, #0xc]
	cmp r1, #3
	bgt _080A9938
	b _080A961C
_080A9938:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9948: .4byte 0x08B905B0

	thumb_func_start sub_080A994C
sub_080A994C: @ 0x080A994C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r0, _080A9984 @ =0x08CE4AF8
	bl SpawnProc
	adds r5, r0, #0
	ldr r0, _080A9988 @ =0x081D7E54
	ldr r2, _080A998C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080A9990 @ =0x02022880
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	str r4, [r5, #0x5c]
	str r6, [r5, #0x60]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A9984: .4byte 0x08CE4AF8
_080A9988: .4byte 0x081D7E54
_080A998C: .4byte 0x06010000
_080A9990: .4byte 0x02022880

	thumb_func_start sub_080A9994
sub_080A9994: @ 0x080A9994
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080A99E0 @ =0x08CE4AF8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A99D4
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #1
	strb r1, [r0]
	strb r6, [r0, #1]
	strh r7, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r1, [sp, #0x18]
	strb r1, [r0, #6]
	ldr r1, [sp, #0x1c]
	strb r1, [r0, #7]
	strh r5, [r0, #8]
_080A99D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A99E0: .4byte 0x08CE4AF8

	thumb_func_start sub_080A99E4
sub_080A99E4: @ 0x080A99E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9A08 @ =0x08CE4AF8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9A02
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #0
	strb r1, [r0]
_080A9A02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9A08: .4byte 0x08CE4AF8

	thumb_func_start sub_080A9A0C
sub_080A9A0C: @ 0x080A9A0C
	push {lr}
	ldr r0, _080A9A1C @ =0x08CE4AF8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9A1C: .4byte 0x08CE4AF8

	thumb_func_start sub_080A9A20
sub_080A9A20: @ 0x080A9A20
	movs r2, #0
	adds r0, #0x2c
	movs r1, #3
_080A9A26:
	strb r2, [r0]
	strb r2, [r0, #6]
	adds r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080A9A26
	bx lr

	thumb_func_start sub_080A9A34
sub_080A9A34: @ 0x080A9A34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sl, r0
	add r1, sp, #4
	ldr r0, _080A9B1C @ =0x08418DF8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #0x14
	adds r1, r2, #0
	ldr r0, _080A9B20 @ =0x08418E08
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	mov r4, sl
	adds r4, #0x2d
	str r4, [sp, #0x28]
	mov r5, sl
	adds r5, #0x2c
	movs r7, #3
	str r7, [sp, #0x24]
_080A9A6A:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080A9B50
	movs r0, #2
	ldrsh r6, [r5, r0]
	movs r0, #6
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080A9B24
	ldrb r4, [r5, #1]
	adds r0, r4, #0
	movs r1, #1
	ands r0, r1
	mov r7, sl
	adds r7, #0x50
	movs r2, #0x4e
	add r2, sl
	mov r8, r2
	movs r3, #0x4c
	add r3, sl
	mov sb, r3
	cmp r0, #0
	beq _080A9AC2
	ldrb r0, [r7]
	adds r1, r6, #0
	adds r1, #0x60
	movs r3, #4
	ldrsh r2, [r5, r3]
	mov ip, r2
	mov r2, r8
	movs r3, #0
	ldrsh r2, [r2, r3]
	add r2, ip
	lsls r3, r4, #2
	add r3, sp
	adds r3, #0x14
	ldr r3, [r3]
	mov r4, sb
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_08006A34
	adds r6, #0x20
_080A9AC2:
	ldrb r0, [r7]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r3, r8
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r2, r2, r1
	ldr r3, [sp, #0x28]
	ldrb r3, [r3]
	lsls r1, r3, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r4, sb
	ldrh r1, [r4]
	str r1, [sp]
	adds r1, r6, #0
	bl sub_08006A34
	ldr r0, [sp, #0x28]
	ldrb r3, [r0]
	adds r0, r3, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A9B50
	adds r6, #0x60
	ldrb r0, [r7]
	movs r4, #4
	ldrsh r2, [r5, r4]
	mov r7, r8
	movs r4, #0
	ldrsh r1, [r7, r4]
	adds r2, r2, r1
	lsls r1, r3, #2
	add r1, sp
	adds r1, #0x14
	ldr r3, [r1]
	mov r7, sb
	ldrh r1, [r7]
	str r1, [sp]
	adds r1, r6, #0
	bl sub_08006A34
	b _080A9B50
	.align 2, 0
_080A9B1C: .4byte 0x08418DF8
_080A9B20: .4byte 0x08418E08
_080A9B24:
	mov r0, sl
	adds r0, #0x50
	ldrb r0, [r0]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r1, sl
	adds r1, #0x4e
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r2, r2, r1
	ldrb r4, [r5, #1]
	lsls r1, r4, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r1, sl
	adds r1, #0x4c
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r6, #0
	bl sub_08006A34
_080A9B50:
	ldr r7, [sp, #0x28]
	adds r7, #8
	str r7, [sp, #0x28]
	adds r5, #8
	ldr r0, [sp, #0x24]
	subs r0, #1
	str r0, [sp, #0x24]
	cmp r0, #0
	blt _080A9B64
	b _080A9A6A
_080A9B64:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080A9B74
sub_080A9B74: @ 0x080A9B74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl sub_080A9C88
	ldr r0, _080A9BE4 @ =0x08CE4C18
	adds r1, r7, #0
	bl SpawnProc
	adds r7, r0, #0
	ldr r0, _080A9BE8 @ =0x0840F238
	ldr r2, _080A9BEC @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080A9BF0 @ =0x0840624C
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #0xc
	adds r4, r4, r0
	adds r5, r5, r4
	adds r0, r7, #0
	adds r0, #0x4c
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r2, sb
	strb r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9BE4: .4byte 0x08CE4C18
_080A9BE8: .4byte 0x0840F238
_080A9BEC: .4byte 0x06010000
_080A9BF0: .4byte 0x0840624C

	thumb_func_start sub_080A9BF4
sub_080A9BF4: @ 0x080A9BF4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080A9C34 @ =0x08CE4C18
	bl Proc_Find
	lsls r4, r4, #3
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x2c
	movs r1, #1
	strb r1, [r2]
	ldr r2, _080A9C38 @ =0x000001FF
	adds r1, r2, #0
	ands r5, r1
	strh r5, [r0, #0x2e]
	movs r1, #0xff
	ands r6, r1
	strh r6, [r0, #0x30]
	adds r0, #0x2d
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C34: .4byte 0x08CE4C18
_080A9C38: .4byte 0x000001FF

	thumb_func_start sub_080A9C3C
sub_080A9C3C: @ 0x080A9C3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9C5C @ =0x08CE4C18
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9C56
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
_080A9C56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C5C: .4byte 0x08CE4C18

	thumb_func_start sub_080A9C60
sub_080A9C60: @ 0x080A9C60
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080A9C84 @ =0x08CE4C18
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9C7C
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x32
	strb r5, [r0]
_080A9C7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C84: .4byte 0x08CE4C18

	thumb_func_start sub_080A9C88
sub_080A9C88: @ 0x080A9C88
	push {lr}
	ldr r0, _080A9C98 @ =0x08CE4C18
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9C98: .4byte 0x08CE4C18

	thumb_func_start sub_080A9C9C
sub_080A9C9C: @ 0x080A9C9C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	bl SetTextFont
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	cmp r0, #4
	bne _080A9CB4
	movs r0, #0
	strh r0, [r1]
_080A9CB4:
	ldrh r0, [r1]
	cmp r0, #0
	bne _080A9CF0
	ldr r1, [r4, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A9CD8
	cmp r0, #1
	beq _080A9CE0
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x44
	adds r0, r4, r0
	bl Text_DrawCharacter
	b _080A9CEE
_080A9CD8:
	adds r0, r4, #0
	bl Proc_Break
	b _080A9CF0
_080A9CE0:
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0x54]
	adds r0, #1
_080A9CEE:
	str r0, [r4, #0x54]
_080A9CF0:
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A9D08
sub_080A9D08: @ 0x080A9D08
	push {lr}
	ldr r0, _080A9D18 @ =0x08CE4C38
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9D18: .4byte 0x08CE4C38

	thumb_func_start sub_080A9D1C
sub_080A9D1C: @ 0x080A9D1C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	mov r8, r2
	adds r7, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r4, _080A9DB4 @ =0x08CE4C38
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl SpawnProc
	adds r6, r0, #0
	adds r0, #0x2c
	ldr r1, _080A9DB8 @ =0x06010000
	adds r5, r5, r1
	adds r1, r5, #0
	mov r2, sb
	bl InitSpriteTextFont
	mov r0, r8
	str r0, [r6, #0x54]
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strh r1, [r0]
	cmp r7, #0
	ble _080A9D86
	adds r4, r6, #0
	adds r4, #0x44
	adds r5, r7, #0
_080A9D70:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005CF8
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080A9D70
_080A9D86:
	ldr r0, _080A9DBC @ =0x08194674
	mov r1, sb
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9DB4: .4byte 0x08CE4C38
_080A9DB8: .4byte 0x06010000
_080A9DBC: .4byte 0x08194674

	thumb_func_start sub_080A9DC0
sub_080A9DC0: @ 0x080A9DC0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080A9DCE
_080A9DC8:
	adds r0, r4, #0
	bl Proc_End
_080A9DCE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08004C90
	adds r4, r0, #0
	cmp r4, #0
	bne _080A9DC8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A9DE4
sub_080A9DE4: @ 0x080A9DE4
	bx lr
	.align 2, 0

	thumb_func_start sub_080A9DE8
sub_080A9DE8: @ 0x080A9DE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r6, r5, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	bgt _080A9E16
	movs r2, #4
_080A9E16:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _080A9E20
	movs r6, #4
_080A9E20:
	lsls r0, r1, #0x10
	asrs r0, r0, #8
	str r0, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #8
	str r0, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	lsls r0, r7, #4
	strh r0, [r1, #0x10]
	ldr r1, _080A9E78 @ =0x030028C8
	mov r0, r8
	cmp r0, #2
	bne _080A9E64
	subs r1, #0x10
_080A9E64:
	mov r0, sp
	movs r2, #1
	bl sub_080BFA08
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9E78: .4byte 0x030028C8

	thumb_func_start sub_080A9E7C
sub_080A9E7C: @ 0x080A9E7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r3, #0
	cmp r0, #2
	bne _080A9E92
	ldr r3, _080A9EC8 @ =0x030028B8
_080A9E92:
	movs r4, #2
	ldrsh r0, [r3, r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9EC8: .4byte 0x030028B8

	thumb_func_start sub_080A9ECC
sub_080A9ECC: @ 0x080A9ECC
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r6, r4, #0x10
	movs r4, #0
	cmp r0, #2
	bne _080A9EEC
	ldr r4, _080A9F30 @ =0x030028B8
_080A9EEC:
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x10
	rsbs r3, r3, #0
	adds r1, r0, #0
	muls r1, r3, r1
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r2, r2, #0
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	muls r1, r3, r1
	movs r3, #6
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9F30: .4byte 0x030028B8

	thumb_func_start sub_080A9F34
sub_080A9F34: @ 0x080A9F34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r1
	adds r1, r2, #0
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080A9F52
	adds r2, r0, #0
_080A9F52:
	cmp r6, r0
	bgt _080A9F58
	adds r6, r0, #0
_080A9F58:
	str r1, [sp]
	str r3, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	movs r4, #0x80
	lsls r4, r4, #0x11
	adds r0, r4, #0
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	mov r2, r8
	asrs r0, r2, #4
	strh r0, [r1, #0x10]
	ldr r1, _080A9FA4 @ =0x030028C8
	cmp r7, #2
	bne _080A9F90
	subs r1, #0x10
_080A9F90:
	mov r0, sp
	movs r2, #1
	bl sub_080BFA08
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9FA4: .4byte 0x030028C8

	thumb_func_start sub_080A9FA8
sub_080A9FA8: @ 0x080A9FA8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	cmp r0, #2
	bne _080A9FB6
	ldr r3, _080A9FE4 @ =0x030028B8
_080A9FB6:
	movs r4, #2
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3]
	movs r4, #4
	ldrsh r0, [r3, r4]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9FE4: .4byte 0x030028B8

	thumb_func_start sub_080A9FE8
sub_080A9FE8: @ 0x080A9FE8
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #2
	bne _080A9FF8
	ldr r4, _080AA02C @ =0x030028B8
_080A9FF8:
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r3, r1, #0
	muls r0, r3, r0
	movs r6, #2
	ldrsh r1, [r4, r6]
	rsbs r2, r2, #0
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	muls r0, r3, r0
	movs r3, #6
	ldrsh r1, [r4, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA02C: .4byte 0x030028B8

	thumb_func_start sub_080AA030
sub_080AA030: @ 0x080AA030
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov ip, r2
	mov sb, r3
	ldr r2, [sp, #0x20]
	ldr r4, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	ldrh r1, [r7]
	lsrs r1, r1, #1
	mov r8, r1
	movs r1, #0x78
	mov sl, r1
	adds r6, r7, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r4, #0
	beq _080AA0C8
	cmp r3, #0
	beq _080AA0C8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080AA072
	ldrh r4, [r7]
	ldrh r3, [r7, #2]
_080AA072:
	mov r1, ip
	asrs r1, r1, #1
	mov ip, r1
	asrs r2, r2, #1
	asrs r4, r4, #1
	lsls r4, r4, #1
	ldr r0, [sp, #0x24]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #1
	adds r0, r6, r0
	lsls r1, r2, #1
	adds r6, r0, r1
	mov r2, sl
	mov r0, sb
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r2, ip
	lsls r1, r2, #1
	adds r5, r0, r1
	cmp r3, #0
	ble _080AA0C8
	asrs r7, r4, #1
	adds r4, r3, #0
	ldr r0, _080AA0D8 @ =0x001FFFFF
	mov sb, r0
_080AA0AA:
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sb
	ands r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r6, r6, r0
	mov r2, sl
	lsls r0, r2, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AA0AA
_080AA0C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA0D8: .4byte 0x001FFFFF

	thumb_func_start sub_080AA0DC
sub_080AA0DC: @ 0x080AA0DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r1, #0
	ldr r6, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r1, #0x78
	mov r8, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r3, #0
	beq _080AA146
	cmp r6, #0
	beq _080AA146
	asrs r4, r4, #1
	asrs r3, r3, #1
	lsls r3, r3, #1
	mov r0, r8
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r5, r0, r1
	cmp r6, #0
	ble _080AA146
	adds r4, r6, #0
	lsls r0, r3, #0xa
	lsrs r6, r0, #0xb
	movs r7, #0x80
	lsls r7, r7, #0x11
_080AA12A:
	mov r0, sp
	mov r1, sb
	strh r1, [r0]
	adds r1, r5, #0
	adds r2, r6, #0
	orrs r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AA12A
_080AA146:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080AA154
sub_080AA154: @ 0x080AA154
	push {r4, lr}
	movs r3, #0x1f
	ands r1, r3
	ands r2, r3
	ldr r4, _080AA174 @ =0x02022860
	lsls r2, r2, #0xa
	lsls r1, r1, #5
	adds r2, r2, r1
	ands r3, r0
	adds r2, r2, r3
	strh r2, [r4]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA174: .4byte 0x02022860

	thumb_func_start sub_080AA178
sub_080AA178: @ 0x080AA178
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080136AC
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PaletteFadeOutOfBlank_Lop
PaletteFadeOutOfBlank_Lop: @ 0x080AA18C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AA1B0
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #2
	subs r2, r0, r1
	b _080AA1B2
_080AA1B0:
	lsls r2, r1, #1
_080AA1B2:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_08013728
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AA1C8
	adds r0, r4, #0
	bl Proc_Break
_080AA1C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PaletteFadeIntoBlank_Lop
PaletteFadeIntoBlank_Lop: @ 0x080AA1D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AA1F4
	lsls r0, r1, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, r1
	b _080AA1FC
_080AA1F4:
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #1
	subs r2, r0, r1
_080AA1FC:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_08013728
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AA212
	adds r0, r4, #0
	bl Proc_Break
_080AA212:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PaletteFadeInOut_DispDisable
PaletteFadeInOut_DispDisable: @ 0x080AA218
	ldr r1, [r0, #0x34]
	ldr r0, _080AA240 @ =0x0000FFFF
	cmp r1, r0
	bne _080AA248
	ldr r2, _080AA244 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	b _080AA264
	.align 2, 0
_080AA240: .4byte 0x0000FFFF
_080AA244: .4byte 0x03002870
_080AA248:
	ldr r2, _080AA268 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
_080AA264:
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080AA268: .4byte 0x03002870

	thumb_func_start sub_080AA26C
sub_080AA26C: @ 0x080AA26C
	push {lr}
	ldr r0, _080AA280 @ =0x08CE4C50
	bl Proc_Find
	cmp r0, #0
	beq _080AA27A
	movs r0, #1
_080AA27A:
	pop {r1}
	bx r1
	.align 2, 0
_080AA280: .4byte 0x08CE4C50

	thumb_func_start sub_080AA284
sub_080AA284: @ 0x080AA284
	push {lr}
	ldr r0, _080AA298 @ =0x08CE4C80
	bl Proc_Find
	cmp r0, #0
	beq _080AA292
	movs r0, #1
_080AA292:
	pop {r1}
	bx r1
	.align 2, 0
_080AA298: .4byte 0x08CE4C80

	thumb_func_start StartPaletteFadeOutOfBlack
StartPaletteFadeOutOfBlack: @ 0x080AA29C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA2BC @ =0x08CE4C50
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA2BC: .4byte 0x08CE4C50

	thumb_func_start sub_080AA2C0
sub_080AA2C0: @ 0x080AA2C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA2E0 @ =0x08CE4C80
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA2E0: .4byte 0x08CE4C80

	thumb_func_start StartLockingPaletteFadeFromBlack
StartLockingPaletteFadeFromBlack: @ 0x080AA2E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA304 @ =0x08CE4C50
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA304: .4byte 0x08CE4C50

