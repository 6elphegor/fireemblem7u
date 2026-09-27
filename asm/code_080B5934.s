	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5934
sub_080B5934: @ 0x080B5934
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5980 @ =0x08CE76E8
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B5984 @ =0x08CE77D8
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080B5988 @ =0x08194594
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _080B598C @ =0x02022860
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080B596A:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080B596A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5980: .4byte 0x08CE76E8
_080B5984: .4byte 0x08CE77D8
_080B5988: .4byte 0x08194594
_080B598C: .4byte 0x02022860

	thumb_func_start sub_080B5990
sub_080B5990: @ 0x080B5990
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	mov sb, r1
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _080B5A78 @ =0x030028AC
	mov ip, r2
	ldr r0, _080B5A7C @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	movs r1, #0xf
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	mov r5, sb
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r6, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	add r0, ip
	mov sl, r0
	ldrb r0, [r0]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r7]
	ands r0, r3
	strb r0, [r7]
	movs r1, #1
	mov r5, sl
	ldrb r0, [r5]
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	mov r8, r3
	mov r5, r8
	orrs r0, r5
	movs r3, #8
	orrs r0, r3
	movs r3, #0x10
	orrs r0, r3
	mov r5, sl
	strb r0, [r5]
	ldrb r0, [r7]
	orrs r1, r0
	orrs r1, r4
	mov r5, r8
	orrs r1, r5
	movs r0, #8
	orrs r1, r0
	orrs r1, r3
	strb r1, [r7]
	mov r1, sl
	ldrb r1, [r1]
	orrs r6, r1
	mov r3, sl
	strb r6, [r3]
	ldrb r5, [r7]
	ands r2, r5
	strb r2, [r7]
	movs r0, #0x3f
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	strb r0, [r2]
	mov r3, sb
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strb r3, [r2, #0xa]
	bl sub_0807744C
	ldr r0, _080B5A80 @ =0x02000814
	ldrb r5, [r0]
	orrs r4, r5
	strb r4, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5A78: .4byte 0x030028AC
_080B5A7C: .4byte 0x0000FFE0
_080B5A80: .4byte 0x02000814

	thumb_func_start sub_080B5A84
sub_080B5A84: @ 0x080B5A84
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x18
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r5, #0xe1
	lsls r5, r5, #4
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	ldr r0, [r7, #0x30]
	ldr r2, _080B5AF8 @ =0x02000000
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	ldr r1, [r7, #0x34]
	subs r1, #1
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_0807764C
	ldr r3, _080B5AFC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x3c
	blt _080B5AF2
	str r1, [r7, #0x2c]
_080B5AF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5AF8: .4byte 0x02000000
_080B5AFC: .4byte 0x03002870

	thumb_func_start sub_080B5B00
sub_080B5B00: @ 0x080B5B00
	ldr r1, _080B5B3C @ =0x02000814
	movs r0, #0xfd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r2, _080B5B40 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	subs r0, #0x21
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080B5B3C: .4byte 0x02000814
_080B5B40: .4byte 0x03002870

	thumb_func_start sub_080B5B44
sub_080B5B44: @ 0x080B5B44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _080B5B64 @ =0x08CE77F0
	ldr r0, _080B5B68 @ =0x08CE76E8
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r4, #0
	bl Proc_Start
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B64: .4byte 0x08CE77F0
_080B5B68: .4byte 0x08CE76E8

	thumb_func_start sub_080B5B6C
sub_080B5B6C: @ 0x080B5B6C
	push {lr}
	ldr r0, _080B5B7C @ =0x08CE77F0
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B5B7C: .4byte 0x08CE77F0

	thumb_func_start sub_080B5B80
sub_080B5B80: @ 0x080B5B80
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	blt _080B5BE4
	cmp r5, #0
	blt _080B5BE4
	cmp r6, #0x7f
	bgt _080B5BE4
	cmp r5, #0x55
	bgt _080B5BE4
	ldr r1, _080B5BEC @ =0x08CE7848
	asrs r3, r6, #5
	lsls r3, r3, #2
	asrs r0, r5, #5
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r1, r3, r1
	ldr r4, [r1]
	movs r2, #0x1f
	adds r1, r2, #0
	ands r1, r5
	subs r0, r2, r1
	lsls r0, r0, #6
	adds r0, #2
	adds r4, r4, r0
	ands r2, r6
	lsls r0, r2, #1
	adds r4, r4, r0
	ldr r5, _080B5BF0 @ =0x02024460
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r4]
	strh r2, [r0]
	ldr r0, _080B5BF4 @ =0x08CE7818
	adds r3, r3, r0
	ldr r0, [r3]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r2, _080B5BF8 @ =0x06008000
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	bl EnableBgSync
_080B5BE4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5BEC: .4byte 0x08CE7848
_080B5BF0: .4byte 0x02024460
_080B5BF4: .4byte 0x08CE7818
_080B5BF8: .4byte 0x06008000

	thumb_func_start sub_080B5BFC
sub_080B5BFC: @ 0x080B5BFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	str r3, [sp]
	cmp r0, #0
	bge _080B5C3A
	cmp r7, #0
	bge _080B5C3A
	movs r5, #0
_080B5C1A:
	movs r4, #0
	ldr r0, [sp]
	adds r7, r0, r5
	adds r6, r5, #1
_080B5C22:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r7, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, #0x1e
	ble _080B5C22
	adds r5, r6, #0
	cmp r5, #0x14
	ble _080B5C1A
	b _080B5D2E
_080B5C3A:
	ldr r0, [sp]
	cmp r0, r7
	bge _080B5CB0
	adds r5, r0, #0
	movs r1, #0x15
	adds r1, r1, r5
	mov sl, r1
_080B5C48:
	movs r4, #0
	adds r6, r5, #1
_080B5C4C:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, #0x1e
	ble _080B5C4C
	adds r5, r6, #0
	cmp r5, r7
	blt _080B5C48
	adds r5, r7, #0
	cmp r5, sl
	bge _080B5C84
_080B5C68:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B5C7E
_080B5C70:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, sb
	blt _080B5C70
_080B5C7E:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B5C68
_080B5C84:
	adds r5, r7, #0
	cmp r5, sl
	bge _080B5D2E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B5C90:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B5CA8
_080B5C9A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, r7
	blt _080B5C9A
_080B5CA8:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B5C90
	b _080B5D2E
_080B5CB0:
	adds r5, r7, #0
	adds r5, #0x15
	ldr r0, [sp]
	adds r0, #0x15
	mov sl, r0
	str r5, [sp, #4]
	cmp r5, sl
	bge _080B5CDA
_080B5CC0:
	movs r4, #0
	adds r6, r5, #1
_080B5CC4:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, #0x1e
	ble _080B5CC4
	adds r5, r6, #0
	cmp r5, sl
	blt _080B5CC0
_080B5CDA:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B5D00
_080B5CE2:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B5CF8
_080B5CEA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, sb
	blt _080B5CEA
_080B5CF8:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B5CE2
_080B5D00:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B5D2E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B5D0E:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B5D26
_080B5D18:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B5B80
	adds r4, #1
	cmp r4, r7
	blt _080B5D18
_080B5D26:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B5D0E
_080B5D2E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B5D40
sub_080B5D40: @ 0x080B5D40
	push {r4, r5, r6, lr}
	bl sub_080B6B5C
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r4, #0
	ldr r5, _080B5D94 @ =0x06008000
_080B5D62:
	ldr r0, [r6, #4]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r5, #0
	bl Decompress
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #9
	ble _080B5D62
	ldr r0, _080B5D98 @ =0x02024460
	ldr r1, [r6, #8]
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D94: .4byte 0x06008000
_080B5D98: .4byte 0x02024460

	thumb_func_start sub_080B5D9C
sub_080B5D9C: @ 0x080B5D9C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #1
	beq _080B5DB6
	cmp r0, #1
	bgt _080B5DB0
	cmp r0, #0
	beq _080B5DF8
	b _080B5E74
_080B5DB0:
	cmp r0, #2
	beq _080B5E30
	b _080B5E74
_080B5DB6:
	ldr r0, _080B5DF4 @ =0x08574990
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	adds r2, r6, #0
	ands r2, r0
	movs r0, #3
	bl SetBgOffset
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r4, #0
	cmp r1, #0
	bge _080B5DDC
	adds r1, #7
_080B5DDC:
	asrs r4, r1, #3
	adds r2, r6, #0
	cmp r2, #0
	bge _080B5DE6
	adds r2, #7
_080B5DE6:
	asrs r3, r2, #3
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080B5BFC
	b _080B5E7A
	.align 2, 0
_080B5DF4: .4byte 0x08574990
_080B5DF8:
	ldr r0, _080B5E1C @ =0x085D0A40
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B5E20 @ =0x085D0AC0
	ldr r1, _080B5E24 @ =0x06008000
	bl Decompress
	ldr r0, _080B5E28 @ =0x02024460
	ldr r1, _080B5E2C @ =0x085D5B38
	b _080B5E50
	.align 2, 0
_080B5E1C: .4byte 0x085D0A40
_080B5E20: .4byte 0x085D0AC0
_080B5E24: .4byte 0x06008000
_080B5E28: .4byte 0x02024460
_080B5E2C: .4byte 0x085D5B38
_080B5E30:
	ldr r0, _080B5E60 @ =0x085D5FEC
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B5E64 @ =0x085D606C
	ldr r1, _080B5E68 @ =0x06008000
	bl Decompress
	ldr r0, _080B5E6C @ =0x02024460
	ldr r1, _080B5E70 @ =0x085DB38C
_080B5E50:
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	b _080B5E7A
	.align 2, 0
_080B5E60: .4byte 0x085D5FEC
_080B5E64: .4byte 0x085D606C
_080B5E68: .4byte 0x06008000
_080B5E6C: .4byte 0x02024460
_080B5E70: .4byte 0x085DB38C
_080B5E74:
	subs r0, #3
	bl sub_080B5D40
_080B5E7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080B5E80
sub_080B5E80: @ 0x080B5E80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	ldr r0, _080B5F40 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r2, #0x20
	bl CpuFastSet
	cmp r4, #1
	bne _080B5F58
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
	movs r3, #0
_080B5EAC:
	mov r0, sl
	adds r6, r0, r7
	mov r1, r8
	ands r6, r1
	movs r5, #0
	ldr r2, _080B5F44 @ =0x06001000
	adds r4, r3, r2
_080B5EBA:
	mov r1, sb
	adds r0, r1, r5
	mov r2, r8
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _080B5F48 @ =0x06008000
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #8
	str r3, [sp]
	bl CpuFastSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp]
	cmp r5, #0x1d
	ble _080B5EBA
	movs r2, #0x80
	lsls r2, r2, #3
	adds r3, r3, r2
	adds r7, #1
	cmp r7, #0x13
	ble _080B5EAC
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
_080B5EF2:
	mov r1, sl
	adds r0, r1, r7
	mov r2, r8
	ands r0, r2
	movs r5, #0
	adds r4, r7, #1
	lsls r1, r7, #5
	mov ip, r1
	lsls r6, r0, #5
	lsls r0, r7, #6
	ldr r2, _080B5F4C @ =0x02023C60
	adds r3, r0, r2
_080B5F0A:
	mov r7, sb
	adds r0, r7, r5
	mov r1, r8
	ands r0, r1
	mov r7, ip
	adds r2, r7, r5
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, _080B5F50 @ =0x02024460
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	adds r1, #0x80
	adds r2, r2, r1
	ldr r7, _080B5F54 @ =0xFFFF8000
	adds r2, r2, r7
	strh r2, [r3]
	adds r3, #2
	adds r5, #1
	cmp r5, #0x1d
	ble _080B5F0A
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B5EF2
	b _080B5F92
	.align 2, 0
_080B5F40: .4byte 0x02022860
_080B5F44: .4byte 0x06001000
_080B5F48: .4byte 0x06008000
_080B5F4C: .4byte 0x02023C60
_080B5F50: .4byte 0x02024460
_080B5F54: .4byte 0xFFFF8000
_080B5F58:
	ldr r0, _080B5FAC @ =0x06008000
	ldr r1, _080B5FB0 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	movs r7, #0
	ldr r0, _080B5FB4 @ =0x02023C60
	mov r8, r0
	ldr r6, _080B5FB8 @ =0x02024460
	ldr r1, _080B5FBC @ =0x00008080
	adds r3, r1, #0
_080B5F70:
	adds r4, r7, #1
	lsls r0, r7, #6
	adds r2, r0, r6
	mov r5, r8
	adds r1, r0, r5
	movs r5, #0x1d
_080B5F7C:
	ldrh r7, [r2]
	adds r0, r3, r7
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bge _080B5F7C
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B5F70
_080B5F92:
	bl EnablePalSync
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5FAC: .4byte 0x06008000
_080B5FB0: .4byte 0x06001000
_080B5FB4: .4byte 0x02023C60
_080B5FB8: .4byte 0x02024460
_080B5FBC: .4byte 0x00008080

	thumb_func_start sub_080B5FC0
sub_080B5FC0: @ 0x080B5FC0
	push {lr}
	ldr r0, _080B5FD0 @ =0x08CE76E8
	bl Proc_Find
	cmp r0, #0
	bne _080B5FD4
	movs r0, #0
	b _080B5FDC
	.align 2, 0
_080B5FD0: .4byte 0x08CE76E8
_080B5FD4:
	adds r0, #0x54
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080B5FDC:
	pop {r1}
	bx r1

	thumb_func_start sub_080B5FE0
sub_080B5FE0: @ 0x080B5FE0
	ldr r0, _080B6020 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B5FF0
	movs r3, #0
_080B5FF0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B601C
	ldr r1, _080B6024 @ =0x02000814
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B601C
	ldr r1, _080B6028 @ =0x0203E668
	cmp r3, #0
	bne _080B6010
	ldr r0, _080B602C @ =0x0203E660
	ldr r0, [r0]
	str r0, [r1]
_080B6010:
	ldr r2, _080B6030 @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B601C:
	bx lr
	.align 2, 0
_080B6020: .4byte 0x04000006
_080B6024: .4byte 0x02000814
_080B6028: .4byte 0x0203E668
_080B602C: .4byte 0x0203E660
_080B6030: .4byte 0x04000040

	thumb_func_start sub_080B6034
sub_080B6034: @ 0x080B6034
	push {r4, lr}
	adds r4, r0, #0
	bl ClearTalk
	ldr r0, _080B6078 @ =0x085D0A40
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B607C @ =0x085D0AC0
	ldr r1, _080B6080 @ =0x06008000
	bl Decompress
	ldr r0, _080B6084 @ =0x02024460
	ldr r1, _080B6088 @ =0x085D5B38
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0xb4
	str r0, [r4, #0x30]
	movs r0, #0x60
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6078: .4byte 0x085D0A40
_080B607C: .4byte 0x085D0AC0
_080B6080: .4byte 0x06008000
_080B6084: .4byte 0x02024460
_080B6088: .4byte 0x085D5B38

	thumb_func_start WorldFlushInit
WorldFlushInit: @ 0x080B608C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _080B6178 @ =0x030028AC
	mov ip, r2
	ldr r0, _080B617C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	mov r8, r0
	mov r0, r8
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #8
	rsbs r2, r2, #0
	add r2, ip
	mov sb, r2
	mov r1, r8
	ldrb r0, [r2]
	orrs r1, r0
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	mov sl, r2
	mov r0, sl
	ldrb r2, [r7]
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r3, #2
	orrs r1, r3
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r3
	orrs r0, r5
	orrs r0, r4
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, sl
	ands r0, r1
	strb r0, [r7]
	movs r0, #0x3f
	mov r2, ip
	ldrb r2, [r2]
	ands r0, r2
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _080B6180 @ =0x02000814
	ldrb r1, [r0]
	orrs r3, r1
	strb r3, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B6184 @ =sub_080B5FE0
	bl SetOnHBlankA
	ldr r0, _080B6188 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B6168
	ldr r0, _080B618C @ =0x00000269
	bl m4aSongNumStart
_080B6168:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6178: .4byte 0x030028AC
_080B617C: .4byte 0x0000FFE0
_080B6180: .4byte 0x02000814
_080B6184: .4byte sub_080B5FE0
_080B6188: .4byte 0x0202BBF8
_080B618C: .4byte 0x00000269

	thumb_func_start WorldFlushOut
WorldFlushOut: @ 0x080B6190
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0x96
	lsls r0, r0, #1
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #3
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x34]
	mov r2, r8
	bl sub_0807764C
	ldr r3, _080B6208 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r4, #8
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _080B61FE
	adds r0, r7, #0
	bl Proc_Break
_080B61FE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6208: .4byte 0x03002870

	thumb_func_start sub_080B620C
sub_080B620C: @ 0x080B620C
	push {lr}
	bl EndEachSpriteAnimProc
	ldr r3, _080B6260 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080B6260: .4byte 0x03002870

	thumb_func_start sub_080B6264
sub_080B6264: @ 0x080B6264
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B6274 @ =0x08CE7878
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B6274: .4byte 0x08CE7878

	thumb_func_start sub_080B6278
sub_080B6278: @ 0x080B6278
	ldr r1, _080B6284 @ =0x02000000
	movs r2, #4
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B6284: .4byte 0x02000000

	thumb_func_start sub_080B6288
sub_080B6288: @ 0x080B6288
	ldr r1, _080B6294 @ =0x02000000
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B6294: .4byte 0x02000000

	thumb_func_start sub_080B6298
sub_080B6298: @ 0x080B6298
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B62C0 @ =0x08CE7818
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #5
	ands r3, r2
	adds r1, r1, r3
	lsls r1, r1, #5
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B62C0: .4byte 0x08CE7818

	thumb_func_start sub_080B62C4
sub_080B62C4: @ 0x080B62C4
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B62F0 @ =0x08CE7848
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r4, #0x1f
	adds r2, r4, #0
	bics r2, r1
	lsls r2, r2, #6
	adds r2, #2
	adds r0, r0, r2
	ands r3, r4
	lsls r3, r3, #1
	adds r0, r0, r3
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B62F0: .4byte 0x08CE7848

	thumb_func_start GetGameTacticsRank
GetGameTacticsRank: @ 0x080B62F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl GetTotalTurnCountUpUntilNow
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080B630A:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080B630A
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080B63C2
	ldr r6, _080B63E8 @ =0x08C9A200
	movs r7, #0x98
	movs r0, #0x2d
	adds r0, r0, r6
	mov sl, r0
_080B6328:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B63BC
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x39
	adds r0, r0, r1
	ldr r1, [sp]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x35
	adds r0, r0, r1
	ldr r1, [sp, #4]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x31
	adds r0, r0, r1
	ldr r1, [sp, #8]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #8]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldr r1, [sp, #0xc]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #0xc]
_080B63BC:
	adds r5, #1
	cmp r5, r8
	blt _080B6328
_080B63C2:
	movs r5, #0
	mov r1, sp
_080B63C6:
	ldr r0, [r1]
	cmp sb, r0
	bgt _080B63D4
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080B63C6
_080B63D4:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B63E8: .4byte 0x08C9A200

	thumb_func_start GetGameSurvivalRank
GetGameSurvivalRank: @ 0x080B63EC
	push {lr}
	sub sp, #4
	ldr r1, _080B6420 @ =0x085E9AC0
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl GetGameDeathCount
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B6404:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080B6418
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080B6404
_080B6418:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B6420: .4byte 0x085E9AC0

	thumb_func_start GetGameExpRank
GetGameExpRank: @ 0x080B6424
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl sub_080A01BC
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080B643A:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080B643A
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080B64F2
	ldr r6, _080B6518 @ =0x08C9A200
	movs r7, #0x98
	movs r0, #0x3e
	adds r0, r0, r6
	mov sl, r0
_080B6458:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B64EC
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldr r1, [sp]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldr r1, [sp, #4]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #8]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldr r1, [sp, #0xc]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #0xc]
_080B64EC:
	adds r5, #1
	cmp r5, r8
	blt _080B6458
_080B64F2:
	movs r5, #0
	mov r1, sp
_080B64F6:
	ldr r0, [r1]
	cmp sb, r0
	blt _080B6504
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080B64F6
_080B6504:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B6518: .4byte 0x08C9A200

	thumb_func_start GetGameCombatRank
GetGameCombatRank: @ 0x080B651C
	push {lr}
	sub sp, #4
	ldr r1, _080B654C @ =0x085E9AC4
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl GetGameWinPerc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B6534:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080B6544
	adds r1, #1
	cmp r1, #3
	ble _080B6534
_080B6544:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B654C: .4byte 0x085E9AC4

	thumb_func_start GetGameFundsRank
GetGameFundsRank: @ 0x080B6550
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl GetPartyTotalGoldValue
	mov r8, r0
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r7, r0, #0
	movs r5, #0
	cmp r6, r7
	bge _080B65A8
	ldr r0, _080B65BC @ =0x08C9A260
	mov sb, r0
_080B6570:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B65A2
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x98
	muls r1, r2, r1
	adds r0, r0, r1
	add r0, sb
	ldr r0, [r0]
	adds r6, r6, r0
_080B65A2:
	adds r5, #1
	cmp r5, r7
	blt _080B6570
_080B65A8:
	movs r0, #0x64
	mov r1, r8
	muls r1, r0, r1
	lsls r0, r6, #2
	adds r2, r0, r6
	lsls r0, r2, #4
	cmp r1, r0
	blo _080B65C0
	movs r0, #4
	b _080B65E4
	.align 2, 0
_080B65BC: .4byte 0x08C9A260
_080B65C0:
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	cmp r1, r0
	blo _080B65CE
	movs r0, #3
	b _080B65E4
_080B65CE:
	lsls r0, r2, #3
	cmp r1, r0
	blo _080B65D8
	movs r0, #2
	b _080B65E4
_080B65D8:
	lsls r0, r2, #2
	cmp r1, r0
	bhs _080B65E2
	movs r0, #0
	b _080B65E4
_080B65E2:
	movs r0, #1
_080B65E4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetOverallRank
GetOverallRank: @ 0x080B65F0
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r4, _080B6634 @ =0x08CED678
	adds r0, r0, r4
	adds r5, r4, #5
	adds r1, r1, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r1, r0, r1
	adds r0, r4, #0
	adds r0, #0xa
	adds r2, r2, r0
	ldrb r2, [r2]
	adds r1, r2, r1
	adds r0, #5
	adds r3, r3, r0
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r4, #0x14
	adds r6, r6, r4
	ldrb r6, [r6]
	adds r1, r6, r1
	movs r0, #0
	ldr r2, _080B6638 @ =0x08CED692
_080B6620:
	ldrh r3, [r2]
	cmp r1, r3
	blo _080B662E
	adds r2, #2
	adds r0, #1
	cmp r0, #4
	ble _080B6620
_080B662E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B6634: .4byte 0x08CED678
_080B6638: .4byte 0x08CED692

	thumb_func_start sub_080B663C
sub_080B663C: @ 0x080B663C
	push {r4, lr}
	ldr r3, _080B666C @ =0x08CED69E
	adds r0, r0, r3
	adds r4, r3, #5
	adds r1, r1, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r4, r0, r1
	adds r3, #0xa
	adds r2, r2, r3
	ldrb r2, [r2]
	adds r4, r2, r4
	movs r0, #0
	ldr r1, _080B6670 @ =0x08CED6AE
_080B6658:
	ldrh r2, [r1]
	cmp r4, r2
	blo _080B6666
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B6658
_080B6666:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B666C: .4byte 0x08CED69E
_080B6670: .4byte 0x08CED6AE

	thumb_func_start sub_080B6674
sub_080B6674: @ 0x080B6674
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	bl GetGameTacticsRank
	mov r8, r0
	bl GetGameSurvivalRank
	adds r6, r0, #0
	bl GetGameFundsRank
	adds r5, r0, #0
	bl GetGameExpRank
	adds r4, r0, #0
	bl GetGameCombatRank
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetOverallRank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B66B4
sub_080B66B4: @ 0x080B66B4
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r0, _080B672C @ =0x0202BBF8
	ldrh r5, [r0, #0x10]
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	movs r0, #0x98
	muls r1, r0, r1
	ldr r0, _080B6730 @ =0x08C9A200
	adds r4, r1, r0
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x39
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x35
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #4]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x31
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #8]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x2d
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B6714:
	ldr r0, [r1]
	cmp r5, r0
	bgt _080B6722
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B6714
_080B6722:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B672C: .4byte 0x0202BBF8
_080B6730: .4byte 0x08C9A200

	thumb_func_start sub_080B6734
sub_080B6734: @ 0x080B6734
	push {lr}
	sub sp, #4
	ldr r1, _080B6768 @ =0x085E9AC8
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_080B67F0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B674C:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080B6760
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080B674C
_080B6760:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B6768: .4byte 0x085E9AC8

	thumb_func_start sub_080B676C
sub_080B676C: @ 0x080B676C
	ldr r2, _080B6790 @ =0x08CED6BA
	adds r0, r0, r2
	adds r2, #5
	adds r1, r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r2, r0, r1
	movs r0, #0
	ldr r1, _080B6794 @ =0x08CED6C4
_080B677E:
	ldrh r3, [r1]
	cmp r2, r3
	blo _080B678C
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B677E
_080B678C:
	bx lr
	.align 2, 0
_080B6790: .4byte 0x08CED6BA
_080B6794: .4byte 0x08CED6C4

	thumb_func_start GetGameDeathCount
GetGameDeathCount: @ 0x080B6798
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B679E:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080B67BC
	ldr r0, [r1]
	cmp r0, #0
	beq _080B67BC
	ldr r0, [r1, #0xc]
	ldr r1, _080B67CC @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B67BC
	adds r5, #1
_080B67BC:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B679E
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B67CC: .4byte 0x00010004

	thumb_func_start GetGameWinPerc
GetGameWinPerc: @ 0x080B67D0
	push {r4, lr}
	bl PidStatsGetTotalBattleAmt
	adds r4, r0, #0
	bl PidStatsGetTotalWinAmt
	movs r1, #0x64
	muls r0, r1, r0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080B67F0
sub_080B67F0: @ 0x080B67F0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B67F6:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080B682A
	ldr r2, [r0]
	cmp r2, #0
	beq _080B682A
	ldr r0, [r0, #0xc]
	ldr r1, _080B683C @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B682A
	ldrb r0, [r2, #4]
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r1, r0, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, _080B6840 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080B682A
	adds r5, #1
_080B682A:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B67F6
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B683C: .4byte 0x00010004
_080B6840: .4byte 0x0202BBF8

	thumb_func_start sub_080B6844
sub_080B6844: @ 0x080B6844
	bx lr
	.align 2, 0

	thumb_func_start sub_080B6848
sub_080B6848: @ 0x080B6848
	push {r4, r5, r6, lr}
	bl GetPartyTotalGoldValue
	ldr r1, _080B6890 @ =0x0202BBF8
	ldr r5, [r1, #0x30]
	subs r5, r0, r5
	str r0, [r1, #0x30]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r6, r0, #0
	ldr r4, _080B6894 @ =0x08C9A200
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x98
	muls r1, r2, r1
	adds r0, r0, r1
	adds r4, #0x60
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #0x64
	muls r5, r0, r5
	lsls r0, r1, #2
	adds r2, r0, r1
	lsls r0, r2, #4
	cmp r5, r0
	blt _080B6898
	movs r0, #4
	b _080B68BC
	.align 2, 0
_080B6890: .4byte 0x0202BBF8
_080B6894: .4byte 0x08C9A200
_080B6898:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	cmp r5, r0
	blt _080B68A6
	movs r0, #3
	b _080B68BC
_080B68A6:
	lsls r0, r2, #3
	cmp r5, r0
	blt _080B68B0
	movs r0, #2
	b _080B68BC
_080B68B0:
	lsls r0, r2, #2
	cmp r5, r0
	bge _080B68BA
	movs r0, #0
	b _080B68BC
_080B68BA:
	movs r0, #1
_080B68BC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetChapterWinPerc
GetChapterWinPerc: @ 0x080B68C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl PidStatsGetTotalBattleAmt
	adds r4, r0, #0
	bl PidStatsGetTotalWinAmt
	adds r5, r0, #0
	ldr r7, _080B68F8 @ =0x000FFFFF
	cmp r4, r7
	ble _080B68E0
	adds r4, r7, #0
_080B68E0:
	cmp r5, r7
	ble _080B68E6
	adds r5, r7, #0
_080B68E6:
	ldr r6, _080B68FC @ =0x0202BBF8
	ldr r0, [r6, #0x34]
	mov r8, r0
	lsls r0, r0, #0xc
	lsrs r2, r0, #0xc
	cmp r4, r2
	bne _080B6900
	movs r0, #0x28
	b _080B694C
	.align 2, 0
_080B68F8: .4byte 0x000FFFFF
_080B68FC: .4byte 0x0202BBF8
_080B6900:
	ldrh r1, [r6, #0x36]
	lsrs r1, r1, #4
	mov ip, r1
	movs r3, #0x38
	adds r3, r3, r6
	mov sb, r3
	ldrb r1, [r3]
	lsls r0, r1, #0xc
	mov r3, ip
	orrs r0, r3
	subs r0, r5, r0
	movs r1, #0x64
	muls r0, r1, r0
	subs r1, r4, r2
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x64
	ble _080B6928
	movs r2, #0x64
_080B6928:
	ands r4, r7
	ldr r0, _080B6958 @ =0xFFF00000
	mov r1, r8
	ands r0, r1
	orrs r0, r4
	str r0, [r6, #0x34]
	ldr r1, _080B695C @ =0x00000FFF
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0xf
	ldrh r3, [r6, #0x36]
	ands r0, r3
	orrs r0, r1
	strh r0, [r6, #0x36]
	lsrs r0, r5, #0xc
	mov r1, sb
	strb r0, [r1]
	adds r0, r2, #0
_080B694C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B6958: .4byte 0xFFF00000
_080B695C: .4byte 0x00000FFF

	thumb_func_start GetChapterCombatRank
GetChapterCombatRank: @ 0x080B6960
	push {lr}
	sub sp, #4
	ldr r1, _080B6990 @ =0x085E9AC4
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl GetChapterWinPerc
	adds r2, r0, #0
	movs r1, #0
_080B6976:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080B6986
	adds r1, #1
	cmp r1, #3
	ble _080B6976
_080B6986:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B6990: .4byte 0x085E9AC4

	thumb_func_start sub_080B6994
sub_080B6994: @ 0x080B6994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0
	add r0, sp, #0xc
_080B699C:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080B699C
	bl sub_080A01BC
	adds r1, r0, #0
	ldr r4, _080B6A64 @ =0x000FFFFF
	cmp r1, r4
	ble _080B69B2
	adds r1, r4, #0
_080B69B2:
	ldr r3, _080B6A68 @ =0x0202BBF8
	ldr r2, [r3, #0x38]
	lsls r0, r2, #4
	lsrs r0, r0, #0xc
	subs r7, r1, r0
	ands r1, r4
	lsls r1, r1, #8
	ldr r0, _080B6A6C @ =0xF00000FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x38]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r5, r0, #0
	bl sub_080315E8
	ldr r6, _080B6A70 @ =0x08C9A200
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r4, #0x98
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #4]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #8]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x3e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B6A4C:
	ldr r0, [r1]
	cmp r7, r0
	blt _080B6A5A
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B6A4C
_080B6A5A:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B6A64: .4byte 0x000FFFFF
_080B6A68: .4byte 0x0202BBF8
_080B6A6C: .4byte 0xF00000FF
_080B6A70: .4byte 0x08C9A200

	thumb_func_start ComputeChapterRankings
ComputeChapterRankings: @ 0x080B6A74
	push {r4, r5, r6, lr}
	sub sp, #4
	bl GetNextChapterStatsSlot
	cmp r0, #0
	ble _080B6B3E
	ldr r6, _080B6B48 @ =0x0202BBF8
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bgt _080B6AF6
	cmp r0, #1
	blt _080B6AF6
	bl sub_080B66B4
	adds r5, r6, #0
	adds r5, #0x3e
	movs r4, #7
	ands r0, r4
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r2, [r5]
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	bl sub_080B6734
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r0
	strb r1, [r5]
	bl sub_080B6848
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [r6, #0x3c]
	ldr r2, _080B6B4C @ =0xFFFC7FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #0x3c]
	bl GetChapterCombatRank
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _080B6B50 @ =0xFFFFFE3F
	ldrh r2, [r6, #0x3c]
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x3c]
	bl sub_080B6994
	adds r2, r6, #0
	adds r2, #0x3d
	ands r0, r4
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r3, [r2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
_080B6AF6:
	ldr r5, _080B6B48 @ =0x0202BBF8
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	lsrs r1, r1, #5
	ldr r2, [r5, #0x3c]
	lsls r2, r2, #0xe
	lsrs r2, r2, #0x1d
	adds r3, r5, #0
	adds r3, #0x3d
	ldrb r3, [r3]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1d
	ldrh r6, [r5, #0x3c]
	lsls r4, r6, #0x17
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl GetOverallRank
	ldrh r2, [r5, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	adds r1, r1, r0
	cmp r1, #0xff
	ble _080B6B2E
	movs r1, #0xff
_080B6B2E:
	ldr r3, _080B6B54 @ =0x000001FF
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080B6B58 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2c]
_080B6B3E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6B48: .4byte 0x0202BBF8
_080B6B4C: .4byte 0xFFFC7FFF
_080B6B50: .4byte 0xFFFFFE3F
_080B6B54: .4byte 0x000001FF
_080B6B58: .4byte 0xFFFFE00F

	thumb_func_start sub_080B6B5C
sub_080B6B5C: @ 0x080B6B5C
	lsls r0, r0, #4
	ldr r1, _080B6B64 @ =0x08CED888
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080B6B64: .4byte 0x08CED888

	thumb_func_start sub_080B6B68
sub_080B6B68: @ 0x080B6B68
	bx lr
	.align 2, 0

	thumb_func_start PutCgBackground
PutCgBackground: @ 0x080B6B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r7, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x24]
	bl sub_080B6B5C
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, #0
	bne _080B6BAA
	ldr r0, [r6, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r7, r2
	bl Decompress
	lsls r0, r4, #0xc
	mov sb, r0
	lsls r4, r4, #5
	mov sl, r4
	mov r2, r8
	lsls r2, r2, #5
	mov r8, r2
	b _080B6BDA
_080B6BAA:
	movs r5, #0
	lsls r0, r4, #0xc
	mov sb, r0
	lsls r4, r4, #5
	mov sl, r4
	mov r2, r8
	lsls r2, r2, #5
	mov r8, r2
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r7, r0
_080B6BC0:
	ldr r0, [r6, #4]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #4
	adds r4, r4, r2
	adds r5, #1
	cmp r5, #9
	ble _080B6BC0
_080B6BDA:
	ldr r1, [r6, #8]
	lsls r2, r7, #0x11
	lsrs r2, r2, #0x16
	add r2, sb
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, [sp]
	bl TmApplyTsa_thm
	ldr r0, [r6, #0xc]
	mov r1, sl
	mov r2, r8
	bl ApplyPaletteExt
	ldr r0, [sp, #0x24]
	cmp r0, #0x7f
	bgt _080B6C04
	movs r0, #0
	ldr r1, [sp, #0x24]
	bl ModifySaveLinkArenaStruct2B
_080B6C04:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B6C14
sub_080B6C14: @ 0x080B6C14
	push {r4, lr}
	ldr r0, _080B6C80 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B6C26
	movs r3, #0
_080B6C26:
	cmp r3, #0x1f
	bhi _080B6C42
	lsrs r2, r3, #1
	ldr r1, _080B6C84 @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, r0, r2
	strh r0, [r1]
_080B6C42:
	cmp r3, #0x80
	bls _080B6C62
	movs r1, #0xa0
	subs r1, r1, r3
	asrs r1, r1, #1
	ldr r2, _080B6C84 @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r2]
	adds r2, #2
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r0, r0, r1
	strh r0, [r2]
_080B6C62:
	cmp r3, #0x20
	bne _080B6C7A
	ldr r2, _080B6C84 @ =0x04000050
	ldr r1, _080B6C88 @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_080B6C7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6C80: .4byte 0x04000006
_080B6C84: .4byte 0x04000050
_080B6C88: .4byte 0x030028AC

	thumb_func_start sub_080B6C8C
sub_080B6C8C: @ 0x080B6C8C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _080B6CC0 @ =0x08CEDD48
	ldr r0, _080B6CC4 @ =0x08CEDE00
	ldr r4, [r0]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080B6CC8 @ =0x0100005A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _080B6CCC @ =0x02000888
	movs r0, #0
	str r0, [r1]
	ldr r0, [r5]
	cmp r0, #0
	beq _080B6D3E
	adds r7, r1, #0
_080B6CB4:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B6CD0
	str r5, [r4, #8]
	b _080B6D2E
	.align 2, 0
_080B6CC0: .4byte 0x08CEDD48
_080B6CC4: .4byte 0x08CEDE00
_080B6CC8: .4byte 0x0100005A
_080B6CCC: .4byte 0x02000888
_080B6CD0:
	bl GetUnitFromCharId
	adds r6, r0, #0
	cmp r6, #0
	beq _080B6D36
	ldrb r0, [r5]
	bl GetPidStats
	adds r2, r0, #0
	str r5, [r4, #8]
	movs r1, #3
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	ble _080B6CF8
	movs r0, #0xff
_080B6CF8:
	strb r0, [r4, #2]
	ldrb r0, [r2]
	strb r0, [r4, #3]
	adds r0, r1, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	bgt _080B6D14
	ldrh r1, [r2, #0xc]
	lsrs r0, r1, #2
	b _080B6D16
_080B6D14:
	movs r0, #0xff
_080B6D16:
	strb r0, [r4, #1]
	ldr r0, [r6, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B6D2A
	ldrb r2, [r2, #5]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	b _080B6D2C
_080B6D2A:
	movs r0, #0xff
_080B6D2C:
	strb r0, [r4]
_080B6D2E:
	adds r4, #0xc
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
_080B6D36:
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #0
	bne _080B6CB4
_080B6D3E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B6D48
sub_080B6D48: @ 0x080B6D48
	movs r2, #0
_080B6D4A:
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B6D5E
	cmp r1, #1
	bne _080B6D5A
	adds r0, #1
	adds r2, #1
	b _080B6D4A
_080B6D5A:
	adds r0, #1
	b _080B6D4A
_080B6D5E:
	adds r0, r2, #3
	bx lr
	.align 2, 0

	thumb_func_start sub_080B6D64
sub_080B6D64: @ 0x080B6D64
	push {r4, r5, lr}
	ldr r0, _080B6D8C @ =0x08CEDE00
	ldr r4, [r0]
	ldr r1, _080B6D90 @ =0x02000884
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _080B6DC2
	adds r5, r1, #0
_080B6D78:
	ldr r2, [r4, #8]
	ldr r0, [r2]
	cmp r0, #0xcd
	bne _080B6D94
	movs r0, #9
	strb r0, [r4, #4]
	ldr r0, [r5]
	adds r0, #9
	str r0, [r5]
	b _080B6DBA
	.align 2, 0
_080B6D8C: .4byte 0x08CEDE00
_080B6D90: .4byte 0x02000884
_080B6D94:
	cmp r0, #3
	beq _080B6DBA
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B6DA4
	ldr r0, [r2, #8]
	b _080B6DA6
_080B6DA4:
	ldr r0, [r2, #4]
_080B6DA6:
	bl DecodeMsg
	bl sub_080B6D48
	strb r0, [r4, #4]
	ldr r0, [r5]
	ldrb r1, [r4, #4]
	adds r0, r1, r0
	str r0, [r5]
	ldr r1, _080B6DD0 @ =0x02000884
_080B6DBA:
	adds r4, #0xc
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _080B6D78
_080B6DC2:
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6DD0: .4byte 0x02000884

	thumb_func_start sub_080B6DD4
sub_080B6DD4: @ 0x080B6DD4
	push {lr}
	bl sub_080B6C8C
	bl sub_080B6D64
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B6DE4
sub_080B6DE4: @ 0x080B6DE4
	push {r4, r5, lr}
	ldr r4, _080B6E20 @ =0x02000818
	ldr r1, _080B6E24 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xa
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x18
	movs r5, #9
_080B6DFC:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B6DFC
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E20: .4byte 0x02000818
_080B6E24: .4byte 0x06011000

	thumb_func_start sub_080B6E28
sub_080B6E28: @ 0x080B6E28
	push {r4, r5, lr}
	ldr r4, _080B6E54 @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	adds r5, r4, #0
	adds r5, #0x18
	movs r4, #9
_080B6E38:
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B6E38
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E54: .4byte 0x02000818

	thumb_func_start sub_080B6E58
sub_080B6E58: @ 0x080B6E58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080B6E80 @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	lsls r5, r5, #3
	adds r4, #0x18
	adds r5, r5, r4
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E80: .4byte 0x02000818

	thumb_func_start sub_080B6E84
sub_080B6E84: @ 0x080B6E84
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
_080B6E8E:
	ldrb r0, [r1]
	cmp r0, #0
	blt _080B6EA4
	cmp r0, #1
	ble _080B6EB4
	cmp r0, #5
	bgt _080B6EA4
	cmp r0, #4
	blt _080B6EA4
	adds r1, #1
	b _080B6E8E
_080B6EA4:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	ldr r0, [sp]
	adds r4, r4, r0
	b _080B6E8E
_080B6EB4:
	movs r1, #0xe0
	subs r1, r1, r4
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r5, #0
	bl Text_SetCursor
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080B6ECC
sub_080B6ECC: @ 0x080B6ECC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	movs r1, #0x40
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _080B6FAC @ =0x000012AB
	mov r1, sp
	bl DecodeMsgInBuffer
	adds r0, r4, #0
	mov r1, sp
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	bl CountDigits
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x40
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumber
	adds r0, r4, #0
	movs r1, #0x68
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _080B6FB0 @ =0x000012AC
	mov r1, sp
	bl DecodeMsgInBuffer
	adds r0, r4, #0
	mov r1, sp
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r6, #0
	bl CountDigits
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x68
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumber
	adds r0, r4, #0
	movs r1, #0x90
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _080B6FB4 @ =0x000012AD
	mov r1, sp
	bl DecodeMsgInBuffer
	adds r0, r4, #0
	mov r1, sp
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	mov r0, r8
	bl CountDigits
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x90
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	mov r1, r8
	bl Text_DrawNumber
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6FAC: .4byte 0x000012AB
_080B6FB0: .4byte 0x000012AC
_080B6FB4: .4byte 0x000012AD

	thumb_func_start sub_080B6FB8
sub_080B6FB8: @ 0x080B6FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x88
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sb, r0
	add r2, sp, #0x80
	str r1, [r2]
	ldr r0, _080B704C @ =0x08CEDDFC
	ldr r0, [r0]
	add r1, sp, #0x84
	str r0, [r1]
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r4, #0
_080B6FDC:
	ldr r0, [r6]
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B7058
	cmp r1, #1
	bne _080B706C
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #1
	bne _080B6FDC
	adds r0, r7, #0
	ldr r1, [r4]
	bl sub_080AAAA8
	str r0, [r5]
	adds r0, r7, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B7050 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B7022
	movs r1, #2
_080B7022:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r4]
	bl AppendString
	str r0, [r5]
	ldr r0, _080B7054 @ =0x0000118B
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r5]
	bl AppendString
	str r0, [r5]
	b _080B6FDC
	.align 2, 0
_080B704C: .4byte 0x08CEDDFC
_080B7050: .4byte 0x0202BBF8
_080B7054: .4byte 0x0000118B
_080B7058:
	ldr r0, [r4]
	strb r1, [r0]
	mov r0, r8
	str r0, [r6]
	ldr r0, _080B7068 @ =0x08CEDDFC
	ldr r0, [r0]
	str r0, [r5]
	b _080B7076
	.align 2, 0
_080B7068: .4byte 0x08CEDDFC
_080B706C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080AABD0
	b _080B6FDC
_080B7076:
	ldr r1, [r4]
	ldrb r2, [r1]
	cmp r2, #0
	beq _080B709C
	cmp r2, #1
	bne _080B7092
	ldr r0, [r6]
	strb r2, [r0]
	adds r1, #1
	str r1, [r4]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	b _080B7076
_080B7092:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080AABD0
	b _080B7076
_080B709C:
	ldr r0, [r6]
	ldr r1, [r4]
	ldrb r1, [r1]
	strb r1, [r0]
	add sp, #0x88
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B70B4
sub_080B70B4: @ 0x080B70B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r2
	adds r6, r3, #0
	ldr r3, _080B70FC @ =0x08CEDE00
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, [r3]
	adds r4, r0, r2
	ldr r5, [r4, #8]
	lsls r1, r1, #3
	ldr r0, _080B7100 @ =0x02000830
	adds r7, r1, r0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r0, r7, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r7, #0
	movs r1, #1
	bl Text_SetColor
	mov r0, r8
	cmp r0, #0
	beq _080B7104
	cmp r0, #1
	beq _080B714C
	b _080B7172
	.align 2, 0
_080B70FC: .4byte 0x08CEDE00
_080B7100: .4byte 0x02000830
_080B7104:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B7120
	ldr r0, _080B711C @ =0x0202BBF8
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080B713C
	ldr r0, [r5, #8]
	b _080B713E
	.align 2, 0
_080B711C: .4byte 0x0202BBF8
_080B7120:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B713C
	ldr r0, [r5, #8]
	bl DecodeMsg
	adds r1, r0, #0
	str r1, [r6]
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_080B6FB8
	b _080B7144
_080B713C:
	ldr r0, [r5, #4]
_080B713E:
	bl DecodeMsg
	str r0, [r6]
_080B7144:
	bl MsgExpand
	str r0, [r6]
	b _080B7172
_080B714C:
	ldr r0, [r5]
	cmp r0, #0xcd
	beq _080B7172
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _080B7172
	movs r0, #0
	bl SetTextFontGlyphs
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	adds r0, r7, #0
	bl sub_080B6ECC
	movs r0, #1
	bl SetTextFontGlyphs
_080B7172:
	ldr r1, [r6]
	adds r0, r7, #0
	bl sub_080B6E84
_080B717A:
	ldr r0, [r6]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	beq _080B7196
	cmp r2, #1
	beq _080B7192
	adds r0, r7, #0
	bl Text_DrawCharacter
	str r0, [r6]
	b _080B717A
_080B7192:
	adds r0, #1
	str r0, [r6]
_080B7196:
	movs r0, #0
	bl SetTextFont
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B71A8
sub_080B71A8: @ 0x080B71A8
	push {r4, r5, r6, r7, lr}
	ldr r3, _080B71F0 @ =0x02022860
	movs r0, #0x1f
	mov ip, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	movs r5, #0xf8
	lsls r5, r5, #7
	movs r4, #0x7f
	movs r7, #0x1f
_080B71BC:
	ldrh r2, [r3]
	adds r1, r7, #0
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, ip
	ands r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	adds r0, r5, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r5
	adds r1, r1, r0
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080B71BC
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B71F0: .4byte 0x02022860

	thumb_func_start sub_080B71F4
sub_080B71F4: @ 0x080B71F4
	push {lr}
	adds r2, r0, #0
	ldr r3, _080B7218 @ =0x02022860
	lsls r1, r1, #4
	cmp r1, #0
	ble _080B720E
_080B7200:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _080B7200
_080B720E:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080B7218: .4byte 0x02022860

	thumb_func_start sub_080B721C
sub_080B721C: @ 0x080B721C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_080B6B5C
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r4, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	movs r3, #0x20
	bl sub_080010F4
	ldr r0, _080B7260 @ =0x02024460
	ldr r1, [r4, #8]
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	strh r0, [r5, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7260: .4byte 0x02024460

	thumb_func_start sub_080B7264
sub_080B7264: @ 0x080B7264
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_080B6B5C
	movs r2, #0x3e
	ldrsh r1, [r4, r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r1, #0xb
	ldr r2, _080B72A4 @ =0x06008000
	adds r1, r1, r2
	bl Decompress
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080B729C
	adds r0, r4, #0
	bl Proc_Break
_080B729C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B72A4: .4byte 0x06008000

	thumb_func_start sub_080B72A8
sub_080B72A8: @ 0x080B72A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _080B72CC @ =0x08CEDE04
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _080B72D0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x40
	strh r6, [r1]
	b _080B72D2
	.align 2, 0
_080B72CC: .4byte 0x08CEDE04
_080B72D0:
	movs r0, #0
_080B72D2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080B72D8
sub_080B72D8: @ 0x080B72D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	lsls r4, r4, #1
	cmp r4, #0x1f
	ble _080B72F0
	ldr r5, _080B72EC @ =0x0000FE80
	b _080B72F8
	.align 2, 0
_080B72EC: .4byte 0x0000FE80
_080B72F0:
	cmp r4, #0x13
	ble _080B72F8
	movs r5, #0xa0
	lsls r5, r5, #2
_080B72F8:
	lsls r1, r4, #0xa
	ldr r0, _080B7328 @ =0x00007FFF
	ands r1, r0
	ldr r0, _080B732C @ =0x06008000
	adds r1, r1, r0
	adds r0, r3, #0
	bl Decompress
	movs r0, #0x1f
	ands r0, r4
	lsls r0, r0, #6
	ldr r1, _080B7330 @ =0x02024460
	adds r0, r0, r1
	adds r2, r5, #0
	adds r1, r6, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7328: .4byte 0x00007FFF
_080B732C: .4byte 0x06008000
_080B7330: .4byte 0x02024460

	thumb_func_start sub_080B7334
sub_080B7334: @ 0x080B7334
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0
	strh r0, [r1]
	adds r1, #6
	ldr r0, _080B737C @ =0x0000FFFF
	strh r0, [r1]
	ldr r0, [r4, #0x38]
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	movs r3, #0x20
	bl sub_080010F4
	ldr r0, [r4, #0x38]
	adds r0, #4
	str r0, [r4, #0x38]
	movs r5, #0
_080B735E:
	ldr r0, [r4, #0x38]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	adds r0, r5, #0
	bl sub_080B72D8
	ldr r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r5, #1
	cmp r5, #9
	ble _080B735E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B737C: .4byte 0x0000FFFF

	thumb_func_start sub_080B7380
sub_080B7380: @ 0x080B7380
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x44
	ldrh r1, [r6]
	lsls r0, r1, #0x10
	adds r5, r4, #0
	adds r5, #0x4a
	asrs r3, r0, #0x17
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	beq _080B73C8
	ldr r2, [r4, #0x38]
	ldr r1, [r2]
	cmp r1, #0
	bne _080B73AA
	adds r0, r4, #0
	bl Proc_Break
	b _080B73E4
_080B73AA:
	adds r0, r3, #0
	adds r0, #0xa
	ldr r2, [r2, #4]
	bl sub_080B72D8
	ldr r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x38]
	movs r0, #8
	bl EnableBgSync
	ldrh r6, [r6]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x17
	strh r0, [r5]
_080B73C8:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	ldrh r4, [r4, #0x3c]
	adds r2, r1, r4
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
_080B73E4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B73EC
sub_080B73EC: @ 0x080B73EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B7404 @ =0x08CEDE5C
	bl Proc_Start
	str r4, [r0, #0x38]
	strh r5, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7404: .4byte 0x08CEDE5C

	thumb_func_start sub_080B7408
sub_080B7408: @ 0x080B7408
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0xf0
	mov sb, r0
	movs r5, #0
_080B741C:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x46
	movs r2, #0
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	adds r4, r0, #0
	adds r4, #0xa0
	cmp r4, #0
	bge _080B744E
	rsbs r0, r4, #0
	mov r1, sb
	bl __modsi3
	adds r2, r0, #0
	cmp r2, #0x17
	bgt _080B744A
	movs r0, #0x80
	lsls r0, r0, #1
	subs r4, r0, r2
	b _080B744E
_080B744A:
	mov r3, sb
	subs r4, r3, r2
_080B744E:
	movs r0, #0xff
	ands r4, r0
	cmp r4, #0x9f
	ble _080B745E
	adds r0, r5, #1
	mov r8, r0
	cmp r4, #0xe8
	ble _080B7496
_080B745E:
	lsls r0, r5, #0xb
	adds r5, #1
	mov r8, r5
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080B74AC @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r2, #0xa4
	lsls r2, r2, #8
	adds r5, r0, r2
	movs r7, #8
	movs r6, #6
_080B747A:
	str r5, [sp]
	movs r0, #4
	adds r1, r7, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B74B0 @ =0x08B905F8
	bl PutSpriteExt
	adds r5, #4
	adds r7, #0x20
	subs r6, #1
	cmp r6, #0
	bge _080B747A
_080B7496:
	mov r5, r8
	cmp r5, #9
	ble _080B741C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B74AC: .4byte 0x0001FFFF
_080B74B0: .4byte 0x08B905F8

	thumb_func_start sub_080B74B4
sub_080B74B4: @ 0x080B74B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r1, #0
	ldr r0, _080B7528 @ =0x0001FFFF
	mov sl, r0
_080B74C6:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, #0
	adds r4, #0x18
	lsls r0, r1, #0xb
	adds r1, #1
	mov sb, r1
	movs r1, #0xff
	ands r4, r1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	movs r7, #0xa4
	lsls r7, r7, #8
	movs r6, #8
	mov r1, sl
	ands r0, r1
	lsrs r0, r0, #5
	mov r8, r0
	movs r5, #6
_080B74F0:
	mov r3, r8
	adds r0, r3, r7
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B752C @ =0x08B905F8
	bl PutSpriteExt
	adds r7, #4
	adds r6, #0x20
	subs r5, #1
	cmp r5, #0
	bge _080B74F0
	mov r1, sb
	cmp r1, #7
	ble _080B74C6
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7528: .4byte 0x0001FFFF
_080B752C: .4byte 0x08B905F8

	thumb_func_start sub_080B7530
sub_080B7530: @ 0x080B7530
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080B6E28
	ldr r0, _080B75C0 @ =0x08194714
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r1, [r0]
	adds r0, #2
	movs r5, #0
	strh r1, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl MsgExpand
	str r0, [r4, #0x2c]
	ldr r0, _080B75C4 @ =0x02000830
	str r0, [r4, #0x30]
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	bl sub_080B6E84
	ldr r2, _080B75C8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080B75CC @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B75D0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080B75D4 @ =sub_080B74B4
	adds r1, r4, #0
	bl StartParallelWorker
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B75C0: .4byte 0x08194714
_080B75C4: .4byte 0x02000830
_080B75C8: .4byte 0x03002870
_080B75CC: .4byte 0x0000FFE0
_080B75D0: .4byte 0x0000E0FF
_080B75D4: .4byte sub_080B74B4

	thumb_func_start sub_080B75D8
sub_080B75D8: @ 0x080B75D8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r0, _080B7614 @ =0x02000818
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B7660
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, [r5, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _080B762C
	cmp r1, #1
	bgt _080B7618
	cmp r1, #0
	beq _080B7644
	b _080B764E
	.align 2, 0
_080B7614: .4byte 0x02000818
_080B7618:
	cmp r1, #5
	bgt _080B764E
	cmp r1, #4
	blt _080B764E
	adds r0, #1
	str r0, [r5, #0x2c]
	ldrh r1, [r4]
	lsls r0, r1, #3
	strh r0, [r4]
	b _080B7660
_080B762C:
	ldrh r1, [r4]
	lsls r0, r1, #1
	strh r0, [r4]
	ldr r1, [r5, #0x2c]
	adds r1, #1
	str r1, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	adds r0, #8
	str r0, [r5, #0x30]
	bl sub_080B6E84
	b _080B7660
_080B7644:
	strh r1, [r4]
	adds r0, r5, #0
	bl Proc_Break
	b _080B7660
_080B764E:
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x2c]
	bl Text_DrawCharacter
	str r0, [r5, #0x2c]
_080B7660:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080B766C
sub_080B766C: @ 0x080B766C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	ldr r0, _080B76B4 @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r3, r2, #0x11
	movs r0, #0x10
	subs r0, r0, r3
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x20
	bne _080B76AC
	adds r0, r5, #0
	bl Proc_Break
_080B76AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B76B4: .4byte 0x03002870

	thumb_func_start sub_080B76B8
sub_080B76B8: @ 0x080B76B8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	ldr r0, [r4, #0x34]
	ldm r0!, {r1}
	str r0, [r4, #0x34]
	cmp r1, #0
	beq _080B76D2
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B76D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080B76D8
sub_080B76D8: @ 0x080B76D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B76F4 @ =0x08CEDEA4
	bl Proc_Start
	str r4, [r0, #0x34]
	adds r1, r0, #0
	adds r1, #0x42
	strh r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B76F4: .4byte 0x08CEDEA4

	thumb_func_start sub_080B76F8
sub_080B76F8: @ 0x080B76F8
	push {lr}
	ldr r0, _080B7708 @ =0x08CEDEA4
	bl Proc_Find
	cmp r0, #0
	bne _080B770C
	movs r0, #0
	b _080B770E
	.align 2, 0
_080B7708: .4byte 0x08CEDEA4
_080B770C:
	movs r0, #1
_080B770E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B7714
sub_080B7714: @ 0x080B7714
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	movs r4, #0
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080B77CC @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r6, _080B77D0 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r0, [r6, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080B77D4 @ =0x02022860
	ldr r2, _080B77D8 @ =0x01000100
	bl CpuFastSet
	bl sub_080B6DE4
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	adds r5, #0x4e
	strh r4, [r5]
	bl sub_080B6DD4
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B77CC: .4byte 0x01000008
_080B77D0: .4byte 0x03002870
_080B77D4: .4byte 0x02022860
_080B77D8: .4byte 0x01000100

	thumb_func_start sub_080B77DC
sub_080B77DC: @ 0x080B77DC
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080B7806
	ldr r0, _080B780C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B7806
	movs r0, #0
	strb r0, [r2]
	adds r0, r3, #0
	movs r1, #0x32
	bl Proc_Goto
_080B7806:
	pop {r0}
	bx r0
	.align 2, 0
_080B780C: .4byte 0x08B857F8

	thumb_func_start sub_080B7810
sub_080B7810: @ 0x080B7810
	push {r4, r5, r6, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r0, #0x44
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	subs r0, #6
	strh r1, [r0]
	strh r1, [r5, #0x3e]
	ldr r0, _080B78C0 @ =0x08194714
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B78C4 @ =sub_080B6C14
	bl SetOnHBlankA
	ldr r2, _080B78C8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B78CC @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B78D0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_080B6E28
	ldr r0, _080B78D4 @ =sub_080B7408
	adds r1, r5, #0
	bl StartParallelWorker
	adds r6, r5, #0
	adds r6, #0x51
	strb r4, [r6]
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B78A6
	mov r1, sp
	movs r0, #3
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _080B78A6
	movs r0, #1
	strb r0, [r6]
_080B78A6:
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080B78D8 @ =sub_080B77DC
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #0x64
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B78C0: .4byte 0x08194714
_080B78C4: .4byte sub_080B6C14
_080B78C8: .4byte 0x03002870
_080B78CC: .4byte 0x0000FFE0
_080B78D0: .4byte 0x0000E0FF
_080B78D4: .4byte sub_080B7408
_080B78D8: .4byte sub_080B77DC

	thumb_func_start sub_080B78DC
sub_080B78DC: @ 0x080B78DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	movs r0, #0
	ldrsh r6, [r4, r0]
	ldr r0, _080B790C @ =0x02000884
	ldr r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	cmp r6, r0
	blt _080B7910
	adds r0, r5, #0
	bl Proc_Break
	mov r8, r4
	adds r5, #0x46
	mov sb, r5
	b _080B79E8
	.align 2, 0
_080B790C: .4byte 0x02000884
_080B7910:
	movs r1, #0x3e
	ldrsh r4, [r5, r1]
	cmp r4, #9
	bgt _080B794E
	movs r1, #0xa
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	bl __divsi3
	adds r1, r4, #0
	cmp r0, r1
	blt _080B794E
	cmp r4, #0
	bne _080B7940
	movs r0, #0
	adds r1, r5, #0
	bl sub_080B72A8
	movs r1, #0
	bl Proc_Goto
	b _080B7948
_080B7940:
	adds r0, r1, #0
	adds r1, r5, #0
	bl sub_080B72A8
_080B7948:
	ldrh r0, [r5, #0x3e]
	adds r0, #1
	strh r0, [r5, #0x3e]
_080B794E:
	adds r4, r5, #0
	adds r4, #0x44
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x48
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	mov r8, r4
	movs r2, #0x46
	adds r2, r2, r5
	mov sb, r2
	cmp r0, #0
	bne _080B79E8
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x4c
	movs r2, #0
	ldrsh r7, [r6, r2]
	ldr r0, _080B79D4 @ =0x02000888
	ldr r0, [r0]
	subs r0, #1
	cmp r7, r0
	bge _080B79DC
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	adds r4, #0xa
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r3, r5, #0
	adds r3, #0x2c
	adds r0, r7, #0
	bl sub_080B70B4
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r2, #0
	ldrsh r1, [r6, r2]
	ldr r0, _080B79D8 @ =0x08CEDE00
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B79E8
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	mov r0, sl
	strh r0, [r4]
	b _080B79E8
	.align 2, 0
_080B79D4: .4byte 0x02000888
_080B79D8: .4byte 0x08CEDE00
_080B79DC:
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	bl sub_080B6E58
_080B79E8:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	mov r1, sb
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B7A0C
sub_080B7A0C: @ 0x080B7A0C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x44
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x46
	strh r2, [r0]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_080B7A24
sub_080B7A24: @ 0x080B7A24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0x48
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B7A68
	adds r0, r6, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080B7A90 @ =0x02000888
	ldr r4, [r1]
	subs r4, #1
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r3, r6, #0
	adds r3, #0x2c
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_080B70B4
_080B7A68:
	ldr r0, _080B7A94 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080B7A98
	movs r3, #0
	ldrsh r0, [r5, r3]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B7A98
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	adds r4, r5, #0
	b _080B7AA4
	.align 2, 0
_080B7A90: .4byte 0x02000888
_080B7A94: .4byte 0x08B857F8
_080B7A98:
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r4, r0, #0
_080B7AA4:
	movs r5, #0
	ldrsh r0, [r4, r5]
	movs r1, #3
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x46
	movs r3, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd8
	bne _080B7B06
	ldr r2, _080B7B0C @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080B7B10 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B7B14 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r5, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4]
_080B7B06:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7B0C: .4byte 0x03002870
_080B7B10: .4byte 0x0000FFE0
_080B7B14: .4byte 0x0000E0FF

	thumb_func_start sub_080B7B18
sub_080B7B18: @ 0x080B7B18
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r3, #0
	strh r2, [r0]
	ldr r0, _080B7B6C @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _080B7B64
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _080B7B70 @ =sub_080B77DC
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl Proc_Break
_080B7B64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7B6C: .4byte 0x03002870
_080B7B70: .4byte sub_080B77DC

	thumb_func_start sub_080B7B74
sub_080B7B74: @ 0x080B7B74
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B7BC0 @ =0x08CEDC98
	movs r1, #2
	adds r2, r4, #0
	bl sub_080B73EC
	movs r1, #0
	bl Proc_Goto
	bl sub_080B6E28
	adds r4, #0x44
	movs r2, #0
	movs r3, #0
	ldr r0, _080B7BC4 @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r3, [r4]
	movs r0, #0
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7BC0: .4byte 0x08CEDC98
_080B7BC4: .4byte 0x03002870

	thumb_func_start sub_080B7BC8
sub_080B7BC8: @ 0x080B7BC8
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B7BD8 @ =0x08CEDD40
	movs r1, #8
	bl sub_080B76D8
	pop {r0}
	bx r0
	.align 2, 0
_080B7BD8: .4byte 0x08CEDD40

	thumb_func_start sub_080B7BDC
sub_080B7BDC: @ 0x080B7BDC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r3, [r4]
	adds r3, #1
	strh r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B7C06
	ldr r0, _080B7C24 @ =0x08CEDC98
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x11
	adds r3, #0x20
	movs r1, #0
	bl sub_080010F4
_080B7C06:
	ldrh r4, [r4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x20
	bne _080B7C1E
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080B7C1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C24: .4byte 0x08CEDC98

	thumb_func_start sub_080B7C28
sub_080B7C28: @ 0x080B7C28
	push {lr}
	bl EndAllProcChildren
	movs r0, #0
	bl SetOnHBlankA
	bl WipeAllPalette
	pop {r0}
	bx r0

	thumb_func_start sub_080B7C3C
sub_080B7C3C: @ 0x080B7C3C
	adds r1, r0, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B7C50
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
_080B7C50:
	bx lr
	.align 2, 0

	thumb_func_start sub_080B7C54
sub_080B7C54: @ 0x080B7C54
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080B7C5C
sub_080B7C5C: @ 0x080B7C5C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _080B7CB4 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B7CB8 @ =0x081C3590
	ldr r1, _080B7CBC @ =0x06000800
	bl Decompress
	ldr r0, _080B7CC0 @ =0x081C39A4
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B7CC4 @ =0x02022C60
	ldr r1, _080B7CC8 @ =0x081C39C4
	ldr r2, _080B7CCC @ =0x00005040
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	adds r5, #0x44
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7CB4: .4byte 0x03002870
_080B7CB8: .4byte 0x081C3590
_080B7CBC: .4byte 0x06000800
_080B7CC0: .4byte 0x081C39A4
_080B7CC4: .4byte 0x02022C60
_080B7CC8: .4byte 0x081C39C4
_080B7CCC: .4byte 0x00005040

	thumb_func_start sub_080B7CD0
sub_080B7CD0: @ 0x080B7CD0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _080B7CEE
	adds r0, r2, #0
	bl Proc_Break
	b _080B7D02
_080B7CEE:
	ldr r0, _080B7D08 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B7D02
	adds r0, r2, #0
	bl Proc_Break
_080B7D02:
	pop {r0}
	bx r0
	.align 2, 0
_080B7D08: .4byte 0x08B857F8

	thumb_func_start sub_080B7D0C
sub_080B7D0C: @ 0x080B7D0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xc
	bl SetNextGameAction
	movs r0, #0
	bl InitBgs
	ldr r6, _080B7D80 @ =0x03002870
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _080B7D84 @ =0x000009F3
	movs r0, #0
	adds r3, r5, #0
	bl StartBoxDialogueSimple
	movs r0, #0xc8
	lsls r0, r0, #1
	bl SetDialogueBoxConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7D80: .4byte 0x03002870
_080B7D84: .4byte 0x000009F3

	thumb_func_start sub_080B7D88
sub_080B7D88: @ 0x080B7D88
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	bne _080B7D9E
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B7DA6
_080B7D9E:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B7DA6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080B7DAC
sub_080B7DAC: @ 0x080B7DAC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r6, _080B7E18 @ =0x03002870
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _080B7E1C @ =0x000009F5
	movs r0, #0
	adds r3, r5, #0
	bl StartBoxDialogueSimple
	movs r0, #0xc8
	lsls r0, r0, #1
	bl SetDialogueBoxConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7E18: .4byte 0x03002870
_080B7E1C: .4byte 0x000009F5

	thumb_func_start sub_080B7E20
sub_080B7E20: @ 0x080B7E20
	push {lr}
	bl GetTalkChoiceResult
	cmp r0, #2
	bne _080B7E32
	movs r0, #5
	bl SetNextGameAction
	b _080B7E38
_080B7E32:
	movs r0, #0xc
	bl SetNextGameAction
_080B7E38:
	pop {r0}
	bx r0

	thumb_func_start sub_080B7E3C
sub_080B7E3C: @ 0x080B7E3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r6, _080B7EA8 @ =0x03002870
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _080B7EAC @ =0x000009F4
	movs r0, #0
	adds r3, r5, #0
	bl StartBoxDialogueSimple
	movs r0, #0x88
	lsls r0, r0, #1
	bl SetDialogueBoxConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7EA8: .4byte 0x03002870
_080B7EAC: .4byte 0x000009F4

	thumb_func_start sub_080B7EB0
sub_080B7EB0: @ 0x080B7EB0
	adds r2, r0, #0
	ldr r1, _080B7EB8 @ =0x08CEE638
	b _080B7EC8
	.align 2, 0
_080B7EB8: .4byte 0x08CEE638
_080B7EBC:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B7EC6
	ldr r0, [r1, #4]
	b _080B7ED0
_080B7EC6:
	adds r1, #8
_080B7EC8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B7EBC
	movs r0, #0
_080B7ED0:
	bx lr
	.align 2, 0

	thumb_func_start sub_080B7ED4
sub_080B7ED4: @ 0x080B7ED4
	adds r2, r0, #0
	ldr r1, _080B7EDC @ =0x08CEE7A0
	b _080B7EEC
	.align 2, 0
_080B7EDC: .4byte 0x08CEE7A0
_080B7EE0:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B7EEA
	ldrb r0, [r1, #1]
	b _080B7EF4
_080B7EEA:
	adds r1, #4
_080B7EEC:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B7EE0
	movs r0, #0
_080B7EF4:
	bx lr
	.align 2, 0

	thumb_func_start sub_080B7EF8
sub_080B7EF8: @ 0x080B7EF8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl AppendCharacter
	adds r5, r0, #0
	ldr r6, _080B7F4C @ =0x085E9ACC
	adds r0, r6, #0
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B7F50 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B7F26
	movs r1, #2
_080B7F26:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B7F4C: .4byte 0x085E9ACC
_080B7F50: .4byte 0x0202BBF8

	thumb_func_start sub_080B7F54
sub_080B7F54: @ 0x080B7F54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _080B7F9C @ =0x08CEE15C
	ldr r4, [r0]
	adds r0, r5, #0
	bl sub_080B7ED4
	adds r6, r0, #0
	cmp r6, #4
	bne _080B7F78
	movs r0, #0x7d
	bl CheckChapterFlag
	lsls r0, r0, #0x18
	movs r5, #0xf
	cmp r0, #0
	beq _080B7F78
	movs r5, #0x15
_080B7F78:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1a
	movs r0, #0
	strb r0, [r4]
	cmp r6, #5
	bls _080B7F90
	b _080B80B8
_080B7F90:
	lsls r0, r6, #2
	ldr r1, _080B7FA0 @ =_080B7FA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B7F9C: .4byte 0x08CEE15C
_080B7FA0: .4byte _080B7FA4
_080B7FA4: @ jump table
	.4byte _080B7FBC @ case 0
	.4byte _080B7FE0 @ case 1
	.4byte _080B8004 @ case 2
	.4byte _080B8028 @ case 3
	.4byte _080B8078 @ case 4
	.4byte _080B80B4 @ case 5
_080B7FBC:
	ldr r0, _080B7FD8 @ =0x00001019
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B7FDC @ =0x085E9AD0
	b _080B80A2
	.align 2, 0
_080B7FD8: .4byte 0x00001019
_080B7FDC: .4byte 0x085E9AD0
_080B7FE0:
	ldr r0, _080B7FFC @ =0x0000101A
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8000 @ =0x0000101B
	b _080B809E
	.align 2, 0
_080B7FFC: .4byte 0x0000101A
_080B8000: .4byte 0x0000101B
_080B8004:
	ldr r0, _080B8020 @ =0x0000101A
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8024 @ =0x0000101C
	b _080B809E
	.align 2, 0
_080B8020: .4byte 0x0000101A
_080B8024: .4byte 0x0000101C
_080B8028:
	adds r0, r7, #0
	subs r0, #0x1d
	cmp r0, #1
	bhi _080B8054
	ldr r0, _080B804C @ =0x0000101A
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8050 @ =0x0000101C
	b _080B809E
	.align 2, 0
_080B804C: .4byte 0x0000101A
_080B8050: .4byte 0x0000101C
_080B8054:
	ldr r0, _080B8070 @ =0x00001019
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8074 @ =0x085E9AD0
	b _080B80A2
	.align 2, 0
_080B8070: .4byte 0x00001019
_080B8074: .4byte 0x085E9AD0
_080B8078:
	cmp r5, #0x15
	bne _080B8084
	ldr r0, _080B8080 @ =0x00001091
	b _080B8086
	.align 2, 0
_080B8080: .4byte 0x00001091
_080B8084:
	ldr r0, _080B80AC @ =0x00001092
_080B8086:
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B80B0 @ =0x00001093
_080B809E:
	bl DecodeMsg
_080B80A2:
	adds r1, r4, #0
	bl AppendString
	b _080B80B8
	.align 2, 0
_080B80AC: .4byte 0x00001092
_080B80B0: .4byte 0x00001093
_080B80B4:
	movs r0, #0
	b _080B80BC
_080B80B8:
	ldr r0, _080B80C4 @ =0x08CEE15C
	ldr r0, [r0]
_080B80BC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B80C4: .4byte 0x08CEE15C

	thumb_func_start SetupCharacterEndingGfx
SetupCharacterEndingGfx: @ 0x080B80C8
	push {lr}
	ldr r0, _080B80E0 @ =0x085DC154
	ldr r1, _080B80E4 @ =0x06005000
	bl Decompress
	ldr r0, _080B80E8 @ =0x08407440
	ldr r1, _080B80EC @ =0x06008000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080B80E0: .4byte 0x085DC154
_080B80E4: .4byte 0x06005000
_080B80E8: .4byte 0x08407440
_080B80EC: .4byte 0x06008000

	thumb_func_start sub_080B80F0
sub_080B80F0: @ 0x080B80F0
	push {r4, r5, lr}
	ldr r0, _080B8140 @ =0x085DC114
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8144 @ =0x085DC0D4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8148 @ =0x02024460
	ldr r1, _080B814C @ =0x085DBC20
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, _080B8150 @ =0x02023C60
	ldr r1, _080B8154 @ =0x085DC9A4
	ldr r5, _080B8158 @ =0x0000C280
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0x90
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _080B815C @ =0x085DCA20
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0xc
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8140: .4byte 0x085DC114
_080B8144: .4byte 0x085DC0D4
_080B8148: .4byte 0x02024460
_080B814C: .4byte 0x085DBC20
_080B8150: .4byte 0x02023C60
_080B8154: .4byte 0x085DC9A4
_080B8158: .4byte 0x0000C280
_080B815C: .4byte 0x085DCA20

	thumb_func_start sub_080B8160
sub_080B8160: @ 0x080B8160
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	ldr r0, _080B81DC @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r5, _080B81E0 @ =0x08CEE858
	ldr r0, [r5, #8]
	str r6, [sp]
	movs r1, #2
	add r1, sb
	mov r8, r1
	str r1, [sp, #4]
	movs r4, #0x1e
	str r4, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #2
	bl sub_080A8838
	ldr r0, [r5, #4]
	str r6, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x12
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r5]
	str r6, [sp]
	mov r1, sb
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x14
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A8838
	movs r0, #7
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B81DC: .4byte 0x02023460
_080B81E0: .4byte 0x08CEE858

	thumb_func_start sub_080B81E4
sub_080B81E4: @ 0x080B81E4
	push {r4, r5, r6, r7, lr}
	bl ResetText
	ldr r7, _080B822C @ =0x08CEE868
	movs r6, #0x38
	movs r5, #0x28
	movs r4, #1
_080B81F2:
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #0xf
	bl InitText
	ldr r0, [r7]
	adds r0, r0, r6
	movs r1, #0xa
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B81F2
	movs r4, #0
	ldr r5, _080B822C @ =0x08CEE868
_080B8214:
	lsls r1, r4, #3
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0x19
	bl InitText
	adds r4, #1
	cmp r4, #4
	ble _080B8214
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B822C: .4byte 0x08CEE868

	thumb_func_start sub_080B8230
sub_080B8230: @ 0x080B8230
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl SetupCharacterEndingGfx
	ldr r3, _080B8284 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r4, #0x2e]
	mov r0, sp
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r2, _080B8288 @ =0x01000010
	bl CpuSet
	ldr r0, _080B828C @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B8294
	ldr r0, _080B8290 @ =0x08CEE630
	ldr r0, [r0, #4]
	b _080B8298
	.align 2, 0
_080B8284: .4byte 0x03002870
_080B8288: .4byte 0x01000010
_080B828C: .4byte 0x0202BBF8
_080B8290: .4byte 0x08CEE630
_080B8294:
	ldr r0, _080B82A8 @ =0x08CEE630
	ldr r0, [r0]
_080B8298:
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B82A8: .4byte 0x08CEE630

	thumb_func_start CharacterEnding_80B69D4
CharacterEnding_80B69D4: @ 0x080B82AC
	push {lr}
	ldr r0, _080B82DC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080B82E0 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080B82E4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	bl ClearTalk
	bl EndEndingBattleText
	bl sub_080B80F0
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B82DC: .4byte 0x02022C60
_080B82E0: .4byte 0x02023460
_080B82E4: .4byte 0x02023C60

	thumb_func_start GetUnitForCharacterEnding
GetUnitForCharacterEnding: @ 0x080B82E8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080B82EE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B8316
	ldr r0, [r2]
	cmp r0, #0
	beq _080B8316
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080B8316
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _080B831C
	adds r0, r2, #0
	b _080B831E
_080B8316:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B82EE
_080B831C:
	movs r0, #0
_080B831E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start GetUnitASupporterPid
GetUnitASupporterPid: @ 0x080B8324
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r5, #0
	bne _080B833C
	b _080B8350
_080B832E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B8352
_080B833C:
	movs r4, #0
_080B833E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportLevel
	cmp r0, #3
	beq _080B832E
	adds r4, #1
	cmp r4, #6
	ble _080B833E
_080B8350:
	movs r0, #0
_080B8352:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080B8358
sub_080B8358: @ 0x080B8358
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	ldr r1, [r0]
	ldrb r5, [r1, #4]
	bl GetUnitASupporterPid
	adds r2, r0, #0
	cmp r2, #0
	bne _080B838C
	b _080B8392
_080B836E:
	movs r0, #1
	b _080B8394
_080B8372:
	ldrb r0, [r4, #1]
	adds r1, r0, #0
	cmp r1, r5
	bne _080B8380
	ldrb r0, [r4, #2]
	cmp r0, r2
	beq _080B836E
_080B8380:
	cmp r1, r2
	bne _080B838A
	ldrb r0, [r4, #2]
	cmp r0, r5
	beq _080B836E
_080B838A:
	adds r4, #8
_080B838C:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080B8372
_080B8392:
	movs r0, #0
_080B8394:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B839C
sub_080B839C: @ 0x080B839C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_080B83A6:
	ldr r5, [r4, #0x30]
	ldrb r0, [r5]
	cmp r0, #0
	bne _080B83B8
	adds r0, r4, #0
	movs r1, #0x64
	bl Proc_Goto
	b _080B84CA
_080B83B8:
	ldrb r0, [r5, #1]
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	mov ip, r2
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r7, #0x1f
	adds r2, r7, #0
	ands r2, r0
	ldr r3, [r1, #0x40]
	lsrs r3, r2
	movs r6, #1
	ands r3, r6
	cmp r3, #0
	bne _080B84C2
	ldrb r2, [r5, #2]
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _080B83F4
	lsrs r0, r0, #0x1d
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r7, #0
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	ands r0, r6
	cmp r0, #0
	bne _080B84C2
_080B83F4:
	mov r0, ip
	cmp r0, #0xcd
	bne _080B8410
	ldr r1, _080B840C @ =0x0202BBF8
	adds r1, #0x2b
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B84C2
	str r3, [r4, #0x38]
	b _080B8488
	.align 2, 0
_080B840C: .4byte 0x0202BBF8
_080B8410:
	ldrb r0, [r5, #1]
	bl GetUnitForCharacterEnding
	adds r1, r0, #0
	str r1, [r4, #0x38]
	cmp r1, #0
	beq _080B84C2
	ldr r2, [r4, #0x30]
	ldrb r0, [r2]
	cmp r0, #2
	beq _080B8448
	cmp r0, #2
	bgt _080B8430
	cmp r0, #1
	beq _080B843A
	b _080B8488
_080B8430:
	cmp r0, #3
	beq _080B8464
	cmp r0, #4
	beq _080B847C
	b _080B8488
_080B843A:
	ldr r0, [r4, #0x34]
	bl sub_080B8358
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B84C2
	b _080B8488
_080B8448:
	ldrb r0, [r2, #2]
	bl GetUnitForCharacterEnding
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B84C2
	ldr r0, [r4, #0x38]
	bl GetUnitASupporterPid
	ldr r1, [r4, #0x30]
	ldrb r1, [r1, #2]
	cmp r0, r1
	bne _080B84C2
	b _080B8488
_080B8464:
	movs r0, #1
	bl GetUnitFromCharId
	bl GetUnitASupporterPid
	cmp r0, #0x25
	beq _080B84C2
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #2]
	bl GetUnitForCharacterEnding
	b _080B8482
_080B847C:
	movs r0, #0xf
	bl GetUnitFromCharId
_080B8482:
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B84C2
_080B8488:
	ldr r3, [r4, #0x30]
	ldrb r1, [r3, #1]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r6, #0x1f
	adds r0, r6, #0
	ands r0, r1
	movs r5, #1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r1, [r3, #2]
	lsls r2, r1, #0x18
	cmp r2, #0
	beq _080B84CA
	lsrs r2, r2, #0x1d
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r0, r6, #0
	ands r0, r1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	b _080B84CA
_080B84C2:
	ldr r0, [r4, #0x30]
	adds r0, #8
	str r0, [r4, #0x30]
	b _080B83A6
_080B84CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B84D0
sub_080B84D0: @ 0x080B84D0
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _080B8522
	lsls r0, r0, #2
	ldr r1, _080B84E8 @ =_080B84EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B84E8: .4byte _080B84EC
_080B84EC: @ jump table
	.4byte _080B8500 @ case 0
	.4byte _080B850C @ case 1
	.4byte _080B850C @ case 2
	.4byte _080B8518 @ case 3
	.4byte _080B8500 @ case 4
_080B8500:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	adds r2, r3, #0
	bl StartSoloEndingBattleDisplay
	b _080B8522
_080B850C:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl StartPairedEndingBattleDisplay
	b _080B8522
_080B8518:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl StartPairedEndingBattleDisplay
_080B8522:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CharacterEnding_StartBattleDisplayText
CharacterEnding_StartBattleDisplayText: @ 0x080B8528
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl StartEndingBattleText
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B853C
sub_080B853C: @ 0x080B853C
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ClearTalk
	bl EndEndingBattleText
	ldr r3, _080B859C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080B85A0 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _080B85A4 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080B859C: .4byte 0x03002870
_080B85A0: .4byte 0x0000FFE0
_080B85A4: .4byte 0x0000E0FF

	thumb_func_start sub_080B85A8
sub_080B85A8: @ 0x080B85A8
	push {lr}
	movs r0, #0xb
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start CharacterEnding_Unused_80B6C74
CharacterEnding_Unused_80B6C74: @ 0x080B85B4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r2, #0x30]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080B85CE
	adds r0, r2, #0
	movs r1, #0x64
	bl Proc_Goto
_080B85CE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B85D4
sub_080B85D4: @ 0x080B85D4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B85E4 @ =0x08CEE86C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B85E4: .4byte 0x08CEE86C

	thumb_func_start sub_080B85E8
sub_080B85E8: @ 0x080B85E8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
_080B85EE:
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B8642
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetPidStats
	adds r1, r0, #0
	lsls r2, r6, #1
	adds r0, r5, #0
	adds r0, #0x3c
	adds r4, r0, r2
	ldrh r3, [r1, #0xc]
	lsls r0, r3, #0x12
	lsrs r0, r0, #0x14
	ldr r3, _080B8650 @ =0x000003E7
	cmp r0, r3
	ble _080B861C
	adds r0, r3, #0
_080B861C:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x40
	adds r4, r0, r2
	movs r0, #3
	ldrb r7, [r1, #0xc]
	ands r0, r7
	lsls r0, r0, #8
	ldrb r7, [r1, #0xb]
	orrs r0, r7
	cmp r0, r3
	ble _080B8636
	adds r0, r3, #0
_080B8636:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x44
	adds r0, r0, r2
	ldrb r1, [r1]
	strh r1, [r0]
_080B8642:
	adds r6, #1
	cmp r6, #1
	ble _080B85EE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8650: .4byte 0x000003E7

	thumb_func_start sub_080B8654
sub_080B8654: @ 0x080B8654
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	bl sub_080B81E4
	mov r0, r8
	bl sub_080B85E8
	ldr r7, _080B86B4 @ =0x08CEE858
	ldr r0, [r7]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	ldr r1, _080B86B8 @ =0x085DCF50
	ldr r4, _080B86BC @ =0x0000C280
	adds r2, r4, #0
	bl TmApplyTsa_thm
	ldr r0, [r7, #4]
	ldr r1, _080B86C0 @ =0x085DCA9C
	adds r2, r4, #0
	bl TmApplyTsa_thm
	mov r1, r8
	ldr r0, [r1, #0x38]
	ldrb r4, [r0, #1]
	cmp r4, #0xcd
	bne _080B8714
	bl sub_080B6674
	cmp r0, #3
	ble _080B86C8
	ldr r0, _080B86C4 @ =0x00001074
	bl DecodeMsg
	b _080B86DE
	.align 2, 0
_080B86B4: .4byte 0x08CEE858
_080B86B8: .4byte 0x085DCF50
_080B86BC: .4byte 0x0000C280
_080B86C0: .4byte 0x085DCA9C
_080B86C4: .4byte 0x00001074
_080B86C8:
	cmp r0, #1
	ble _080B86D8
	ldr r0, _080B86D4 @ =0x00001076
	bl DecodeMsg
	b _080B86DE
	.align 2, 0
_080B86D4: .4byte 0x00001076
_080B86D8:
	ldr r0, _080B8708 @ =0x00001078
	bl DecodeMsg
_080B86DE:
	bl MsgExpand
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, _080B870C @ =0x08CEE868
	ldr r0, [r0]
	adds r0, #0x28
	ldr r1, _080B8710 @ =0x08CEE858
	ldr r1, [r1]
	adds r1, #0xc2
	movs r2, #0
	str r2, [sp]
	str r6, [sp, #4]
	bl PutDrawText
	b _080B8828
	.align 2, 0
_080B8708: .4byte 0x00001078
_080B870C: .4byte 0x08CEE868
_080B8710: .4byte 0x08CEE858
_080B8714:
	ldrb r0, [r0, #1]
	bl sub_080B7EB0
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r5, _080B8858 @ =0x08CEE868
	ldr r0, [r5]
	adds r0, #0x28
	ldr r1, [r7]
	adds r1, #0xc2
	movs r4, #0
	str r4, [sp]
	str r6, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, _080B885C @ =0x000012AB
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x62
	str r4, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _080B8860 @ =0x000012AC
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x62
	str r4, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl PutDrawText
	ldr r0, _080B8864 @ =0x000012AD
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x62
	str r4, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl PutDrawText
	mov r1, r8
	ldrh r0, [r1, #0x3c]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x62
	ldr r1, [r7]
	adds r1, r1, r0
	mov r4, r8
	ldrh r2, [r4, #0x3c]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x40
	ldrh r0, [r4]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x6a
	ldr r1, [r7]
	adds r1, r1, r0
	ldrh r2, [r4]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r4, #4
	ldrh r0, [r4]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x72
	ldr r1, [r7]
	adds r1, r1, r0
	ldrh r2, [r4]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	ldr r2, _080B8868 @ =0x08BDCE4C
	mov r1, r8
	ldr r0, [r1, #0x38]
	ldrb r1, [r0, #1]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B886C @ =0x00000502
	str r0, [sp]
	movs r0, #0
	movs r3, #0x38
	bl StartBmFace
	mov r4, r8
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B8828
	movs r0, #0x16
	bl ArchivePalette
	movs r3, #0x80
	lsls r3, r3, #0xf
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
_080B8828:
	movs r2, #0
	mov r0, r8
	str r2, [r0, #0x34]
	ldr r3, _080B8870 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8858: .4byte 0x08CEE868
_080B885C: .4byte 0x000012AB
_080B8860: .4byte 0x000012AC
_080B8864: .4byte 0x000012AD
_080B8868: .4byte 0x08BDCE4C
_080B886C: .4byte 0x00000502
_080B8870: .4byte 0x03002870

	thumb_func_start sub_080B8874
sub_080B8874: @ 0x080B8874
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0x1e
	ldr r0, _080B88B8 @ =0x08CEE91C
	ldr r1, [r5, #0x34]
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r1, #1
	str r1, [r5, #0x34]
	ldr r0, [r5, #0x38]
	ldrb r0, [r0, #1]
	cmp r0, #0xcd
	beq _080B88A0
	subs r1, r6, r4
	lsls r1, r1, #3
	adds r1, #0xb0
	ldr r0, _080B88BC @ =0x000001FF
	ands r1, r0
	movs r0, #0
	movs r2, #0x38
	bl SetFacePosition
_080B88A0:
	subs r0, r6, r4
	movs r1, #0
	bl sub_080B8160
	cmp r4, #0x1e
	bne _080B88B2
	adds r0, r5, #0
	bl Proc_Break
_080B88B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B88B8: .4byte 0x08CEE91C
_080B88BC: .4byte 0x000001FF

	thumb_func_start StartSoloEndingBattleDisplay
StartSoloEndingBattleDisplay: @ 0x080B88C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080B88DC @ =0x08CEE930
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x38]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B88DC: .4byte 0x08CEE930

	thumb_func_start sub_080B88E0
sub_080B88E0: @ 0x080B88E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	bl sub_080B81E4
	adds r0, r7, #0
	bl sub_080B85E8
	ldr r4, _080B8B50 @ =0x08CEE858
	ldr r0, [r4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	ldr r1, _080B8B54 @ =0x085DD840
	ldr r5, _080B8B58 @ =0x0000C280
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r0, [r4, #4]
	ldr r1, _080B8B5C @ =0x085DD38C
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #1]
	bl sub_080B7EB0
	bl DecodeMsg
	adds r5, r0, #0
	movs r0, #0x78
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r6, _080B8B60 @ =0x08CEE868
	ldr r0, [r6]
	adds r0, #0x28
	ldr r1, [r4]
	adds r1, #0xc2
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	ldr r0, _080B8B64 @ =0x000012AB
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	ldr r5, _080B8B68 @ =0x00000442
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, _080B8B6C @ =0x000012AC
	mov sl, r0
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl PutDrawText
	ldr r0, _080B8B70 @ =0x000012AD
	mov sb, r0
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	adds r1, r1, r5
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl PutDrawText
	ldrh r0, [r7, #0x3c]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r7, #0x3c]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, r7, #0
	adds r5, #0x40
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	ldr r1, _080B8B74 @ =0x0000044A
	adds r0, r0, r1
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, #4
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	ldr r2, _080B8B78 @ =0x00000452
	adds r0, r0, r2
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #2]
	bl sub_080B7EB0
	bl DecodeMsg
	adds r5, r0, #0
	movs r0, #0x78
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, [r6]
	adds r0, #0x30
	ldr r1, [r4]
	ldr r2, _080B8B7C @ =0x0000045C
	adds r1, r1, r2
	mov r2, r8
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, _080B8B64 @ =0x000012AB
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x62
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, sl
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x62
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x20
	bl PutDrawText
	mov r0, sb
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x62
	mov r3, r8
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x40
	bl PutDrawText
	ldrh r0, [r7, #0x3e]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x62
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r7, #0x3e]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, r7, #0
	adds r5, #0x42
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x6a
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	adds r5, #4
	ldrh r0, [r5]
	bl CountDigits
	lsls r0, r0, #1
	adds r0, #0x72
	ldr r1, [r4]
	adds r1, r1, r0
	ldrh r2, [r5]
	adds r0, r1, #0
	movs r1, #2
	bl PutNumber
	mov r0, r8
	str r0, [r7, #0x34]
	ldr r2, _080B8B80 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r5, _080B8B84 @ =0x08BDCE4C
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #1]
	subs r0, #1
	movs r4, #0x34
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	ldr r0, _080B8B88 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r3, #0x30
	bl StartBmFace
	ldr r0, [r7, #0x38]
	ldrb r0, [r0, #2]
	subs r0, #1
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B8B8C @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r3, #0x30
	bl StartBmFace
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B50: .4byte 0x08CEE858
_080B8B54: .4byte 0x085DD840
_080B8B58: .4byte 0x0000C280
_080B8B5C: .4byte 0x085DD38C
_080B8B60: .4byte 0x08CEE868
_080B8B64: .4byte 0x000012AB
_080B8B68: .4byte 0x00000442
_080B8B6C: .4byte 0x000012AC
_080B8B70: .4byte 0x000012AD
_080B8B74: .4byte 0x0000044A
_080B8B78: .4byte 0x00000452
_080B8B7C: .4byte 0x0000045C
_080B8B80: .4byte 0x03002870
_080B8B84: .4byte 0x08BDCE4C
_080B8B88: .4byte 0x00000503
_080B8B8C: .4byte 0x00000502

	thumb_func_start PairedEndingBattleDisp_Loop_SlideIn
PairedEndingBattleDisp_Loop_SlideIn: @ 0x080B8B90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x1e
	ldr r0, _080B8BE8 @ =0x08CEE91C
	ldr r1, [r7, #0x34]
	adds r0, r1, r0
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #1
	str r1, [r7, #0x34]
	subs r5, r5, r0
	lsls r4, r5, #3
	adds r1, r4, #0
	adds r1, #0x40
	ldr r6, _080B8BEC @ =0x000001FF
	ands r1, r6
	movs r0, #0
	movs r2, #0x30
	bl SetFacePosition
	adds r4, #0xb0
	ands r4, r6
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x30
	bl SetFacePosition
	adds r0, r5, #0
	movs r1, #0
	bl sub_080B8160
	mov r0, r8
	cmp r0, #0x1e
	bne _080B8BDE
	adds r0, r7, #0
	bl Proc_Break
_080B8BDE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8BE8: .4byte 0x08CEE91C
_080B8BEC: .4byte 0x000001FF

	thumb_func_start sub_080B8BF0
sub_080B8BF0: @ 0x080B8BF0
	movs r3, #0
	str r3, [r0, #0x34]
	ldr r0, _080B8C34 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080B8C38 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	ldr r1, _080B8C3C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_080B8C34: .4byte 0x03002870
_080B8C38: .4byte 0x0000FFE0
_080B8C3C: .4byte 0x0000E0FF

	thumb_func_start sub_080B8C40
sub_080B8C40: @ 0x080B8C40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	asrs r3, r0, #2
	adds r0, #1
	str r0, [r4, #0x34]
	ldr r0, _080B8C88 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	cmp r3, #8
	bne _080B8C80
	adds r0, r4, #0
	bl Proc_Break
_080B8C80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8C88: .4byte 0x03002870

	thumb_func_start StartPairedEndingBattleDisplay
StartPairedEndingBattleDisplay: @ 0x080B8C8C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B8CA8 @ =0x08CEE950
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8CA8: .4byte 0x08CEE950

	thumb_func_start sub_080B8CAC
sub_080B8CAC: @ 0x080B8CAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _080B8D10 @ =0x08CEE868
	ldr r0, [r4]
	str r0, [r6, #0x48]
	movs r1, #4
	str r1, [r6, #0x40]
	str r1, [r6, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r6, #0x48]
	movs r1, #0
	bl Text_SetColor
	movs r5, #0
	mov r8, r4
	movs r7, #0xc0
	lsls r7, r7, #1
_080B8CD6:
	lsls r4, r5, #3
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldr r1, _080B8D14 @ =0x02022C64
	adds r1, r7, r1
	bl PutText
	adds r7, #0x80
	adds r5, #1
	cmp r5, #4
	ble _080B8CD6
	movs r0, #1
	bl EnableBgSync
	ldr r2, [r6, #0x2c]
	ldrb r1, [r2]
	cmp r1, #4
	beq _080B8D48
	cmp r1, #4
	bgt _080B8D18
	cmp r1, #3
	beq _080B8D44
	b _080B8D6A
	.align 2, 0
_080B8D10: .4byte 0x08CEE868
_080B8D14: .4byte 0x02022C64
_080B8D18:
	cmp r1, #5
	bne _080B8D6A
	bl sub_080B6674
	adds r5, r0, #0
	cmp r5, #3
	ble _080B8D30
	ldr r0, _080B8D2C @ =0x00001075
	b _080B8D88
	.align 2, 0
_080B8D2C: .4byte 0x00001075
_080B8D30:
	cmp r5, #1
	ble _080B8D3C
	ldr r0, _080B8D38 @ =0x00001077
	b _080B8D88
	.align 2, 0
_080B8D38: .4byte 0x00001077
_080B8D3C:
	ldr r0, _080B8D40 @ =0x00001079
	b _080B8D88
	.align 2, 0
_080B8D40: .4byte 0x00001079
_080B8D44:
	ldr r0, [r2, #4]
	b _080B8D88
_080B8D48:
	ldr r3, [r6, #0x30]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080B8D5C
	ldr r0, [r6, #0x34]
	ldr r0, [r0, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080B8D66
_080B8D5C:
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	bl sub_080B7F54
	b _080B8D8C
_080B8D66:
	ldr r0, [r2, #4]
	b _080B8D88
_080B8D6A:
	ldr r2, [r6, #0x30]
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B8D84
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_080B7F54
	str r0, [r6, #0x44]
	cmp r0, #0
	bne _080B8D8E
_080B8D84:
	ldr r0, [r6, #0x2c]
	ldr r0, [r0, #4]
_080B8D88:
	bl DecodeMsg
_080B8D8C:
	str r0, [r6, #0x44]
_080B8D8E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B8D98
sub_080B8D98: @ 0x080B8D98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B8DC4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B8DC8
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8DC8
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #0x64
	bl Proc_Goto
	b _080B8E70
	.align 2, 0
_080B8DC4: .4byte 0x08B857F8
_080B8DC8:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B8DD2
	subs r0, #1
	b _080B8E6E
_080B8DD2:
	movs r0, #0
	bl SetTextFont
	ldr r0, [r4, #0x44]
	ldrb r0, [r0]
	cmp r0, #7
	bhi _080B8E62
	lsls r0, r0, #2
	ldr r1, _080B8DEC @ =_080B8DF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8DEC: .4byte _080B8DF0
_080B8DF0: @ jump table
	.4byte _080B8E10 @ case 0
	.4byte _080B8E18 @ case 1
	.4byte _080B8E62 @ case 2
	.4byte _080B8E62 @ case 3
	.4byte _080B8E3A @ case 4
	.4byte _080B8E44 @ case 5
	.4byte _080B8E4E @ case 6
	.4byte _080B8E58 @ case 7
_080B8E10:
	adds r0, r4, #0
	bl Proc_Break
	b _080B8E6C
_080B8E18:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #8
	str r0, [r4, #0x48]
	ldr r1, [r4, #0x3c]
	adds r1, #0x10
	str r1, [r4, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl Text_SetColor
	b _080B8E6C
_080B8E3A:
	movs r0, #8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E44:
	movs r0, #0x10
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E4E:
	movs r0, #0x20
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E58:
	movs r0, #0x40
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B8E6A
_080B8E62:
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x44]
	bl Text_DrawCharacter
_080B8E6A:
	str r0, [r4, #0x44]
_080B8E6C:
	ldr r0, [r4, #0x40]
_080B8E6E:
	str r0, [r4, #0x3c]
_080B8E70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartEndingBattleText
StartEndingBattleText: @ 0x080B8E78
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B8E94 @ =0x08CEE988
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8E94: .4byte 0x08CEE988

	thumb_func_start EndEndingBattleText
EndEndingBattleText: @ 0x080B8E98
	push {lr}
	ldr r0, _080B8EA4 @ =0x08CEE988
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B8EA4: .4byte 0x08CEE988

	thumb_func_start DrawFinImage
DrawFinImage: @ 0x080B8EA8
	push {lr}
	ldr r0, _080B8ED4 @ =0x085DDC7C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B8ED8 @ =0x085DDC9C
	ldr r1, _080B8EDC @ =0x06001000
	bl Decompress
	ldr r0, _080B8EE0 @ =0x02023C60
	ldr r1, _080B8EE4 @ =0x085DE098
	ldr r2, _080B8EE8 @ =0x0000E080
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B8ED4: .4byte 0x085DDC7C
_080B8ED8: .4byte 0x085DDC9C
_080B8EDC: .4byte 0x06001000
_080B8EE0: .4byte 0x02023C60
_080B8EE4: .4byte 0x085DE098
_080B8EE8: .4byte 0x0000E080

	thumb_func_start sub_080B8EEC
sub_080B8EEC: @ 0x080B8EEC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x58]
	bl InitBgs
	movs r0, #0x86
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8F34
	ldr r0, _080B8F30 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x3f
	str r2, [sp]
	movs r2, #1
	movs r3, #7
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B8F38
	.align 2, 0
_080B8F30: .4byte 0x02024460
_080B8F34:
	bl DrawFinImage
_080B8F38:
	ldr r3, _080B8F60 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F60: .4byte 0x03002870

	thumb_func_start sub_080B8F64
sub_080B8F64: @ 0x080B8F64
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	adds r0, #1
	str r0, [r2, #0x58]
	ldr r0, _080B8F84 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r3, [r1, #8]
	ands r0, r3
	cmp r0, #0
	beq _080B8F88
	adds r0, r2, #0
	bl Proc_Break
	b _080B8FB8
	.align 2, 0
_080B8F84: .4byte 0x08B857F8
_080B8F88:
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080B8FB2
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _080B8FB8
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _080B8FB8
_080B8FB2:
	adds r0, r2, #0
	adds r0, #0x4c
	strh r1, [r0]
_080B8FB8:
	pop {r0}
	bx r0

	thumb_func_start sub_080B8FBC
sub_080B8FBC: @ 0x080B8FBC
	push {r4, lr}
	ldr r1, _080B9014 @ =0x03002870
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r3, [r1]
	mov r2, ip
	adds r2, #0x45
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x46
	strb r3, [r1]
	ldr r1, _080B9018 @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #4
	orrs r1, r2
	ldr r2, _080B901C @ =0x0000E0FF
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r0, #0x4c
	strh r3, [r0]
	bl DrawFinImage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9014: .4byte 0x03002870
_080B9018: .4byte 0x0000FFE0
_080B901C: .4byte 0x0000E0FF

	thumb_func_start sub_080B9020
sub_080B9020: @ 0x080B9020
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _080B9070 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r5, [r0]
	cmp r2, #0x10
	bne _080B9068
	adds r0, r6, #0
	bl Proc_Break
	strh r5, [r4]
_080B9068:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9070: .4byte 0x03002870

	thumb_func_start sub_080B9074
sub_080B9074: @ 0x080B9074
	ldr r2, _080B90A4 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080B90A8 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	bx lr
	.align 2, 0
_080B90A4: .4byte 0x03002870
_080B90A8: .4byte 0x0000FFE0

	thumb_func_start sub_080B90AC
sub_080B90AC: @ 0x080B90AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B90BC @ =0x08CEE9A8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B90BC: .4byte 0x08CEE9A8

	thumb_func_start sub_080B90C0
sub_080B90C0: @ 0x080B90C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080B9110 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080B9114 @ =0x08401404
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9118 @ =0x083FF780
	ldr r1, _080B911C @ =0x06004000
	bl Decompress
	ldr r0, _080B9120 @ =0x02023C60
	ldr r1, _080B9124 @ =0x081B98E8
	movs r2, #0xa4
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9110: .4byte 0x03002870
_080B9114: .4byte 0x08401404
_080B9118: .4byte 0x083FF780
_080B911C: .4byte 0x06004000
_080B9120: .4byte 0x02023C60
_080B9124: .4byte 0x081B98E8

	thumb_func_start sub_080B9128
sub_080B9128: @ 0x080B9128
	push {lr}
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	cmp r0, #0
	bge _080B9140
	adds r0, #7
_080B9140:
	lsls r0, r0, #0xd
	lsrs r1, r0, #0x10
	adds r0, r2, #0
	cmp r0, #0
	bge _080B914C
	adds r0, #3
_080B914C:
	lsls r2, r0, #0xe
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B915C
sub_080B915C: @ 0x080B915C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x30]
	movs r0, #0x20
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
	str r5, [r4, #0x2c]
	bl GetNextChapterStatsSlot
	adds r4, #0x38
	strb r0, [r4]
	ldr r7, _080B9234 @ =0x03002870
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r2, #3
	rsbs r2, r2, #0
	mov sl, r2
	ands r0, r2
	movs r1, #5
	rsbs r1, r1, #0
	mov sb, r1
	ands r0, r1
	subs r2, #6
	mov r8, r2
	ands r0, r2
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r7, #1]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	ldrb r0, [r7, #1]
	ands r4, r0
	mov r1, sl
	ands r4, r1
	mov r2, sb
	ands r4, r2
	mov r0, r8
	ands r4, r0
	ands r4, r6
	strb r4, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	bl ResetText
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	ldr r0, _080B9238 @ =0x085DFB30
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B923C @ =0x0866AF8C
	ldr r1, _080B9240 @ =0x06008000
	bl Decompress
	ldr r0, _080B9244 @ =0x02024460
	ldr r1, _080B9248 @ =0x085DFB70
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9234: .4byte 0x03002870
_080B9238: .4byte 0x085DFB30
_080B923C: .4byte 0x0866AF8C
_080B9240: .4byte 0x06008000
_080B9244: .4byte 0x02024460
_080B9248: .4byte 0x085DFB70

	thumb_func_start sub_080B924C
sub_080B924C: @ 0x080B924C
	push {r4, r5, r6, lr}
	ldr r2, _080B932C @ =0x0000FF78
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080B9330 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	movs r4, #0
	ldr r6, _080B9334 @ =0x08CEEBA4
	movs r5, #0x48
_080B92C4:
	lsls r1, r4, #3
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	ldr r0, [r6]
	adds r0, r0, r5
	movs r1, #0xe
	bl InitText
	adds r5, #8
	adds r4, #1
	cmp r4, #8
	ble _080B92C4
	ldr r5, _080B9334 @ =0x08CEEBA4
	ldr r0, [r5]
	adds r0, #0x90
	movs r1, #3
	bl InitText
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #2
	bl InitText
	ldr r4, [r5]
	adds r4, #0x90
	ldr r0, _080B9338 @ =0x0000118A
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #3
	bl Text_SetColor
	ldr r4, [r5]
	adds r4, #0x98
	ldr r0, _080B933C @ =0x00001185
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B932C: .4byte 0x0000FF78
_080B9330: .4byte 0x03002870
_080B9334: .4byte 0x08CEEBA4
_080B9338: .4byte 0x0000118A
_080B933C: .4byte 0x00001185

	thumb_func_start sub_080B9340
sub_080B9340: @ 0x080B9340
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #9
	bl __modsi3
	mov sl, r0
	lsls r4, r4, #1
	movs r0, #0x1f
	ands r4, r0
	lsls r5, r4, #5
	lsls r0, r4, #6
	ldr r1, _080B93FC @ =0x02023460
	adds r0, r0, r1
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080B9400 @ =0x08CEEBA4
	mov sb, r2
	mov r3, sl
	lsls r7, r3, #3
	ldr r0, [r2]
	adds r0, r0, r7
	bl ClearText
	adds r6, r7, #0
	adds r6, #0x48
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r6
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #8]
	cmp r2, r0
	bne _080B9408
	bl GetGameTotalTurnCount
	adds r4, r0, #0
	ldr r0, _080B9404 @ =0x000012D1
	bl DecodeMsg
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3]
	adds r0, r0, r6
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #1
	ldr r3, _080B93FC @ =0x02023460
	adds r1, r1, r3
	ldr r3, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #0
	adds r0, #0x17
	lsls r0, r0, #1
	ldr r1, _080B93FC @ =0x02023460
	adds r0, r0, r1
	movs r1, #2
	adds r2, r4, #0
	bl PutNumber
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x90
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #1
	ldr r3, _080B93FC @ =0x02023460
	adds r1, r1, r3
	bl PutText
	movs r0, #0
	b _080B9638
	.align 2, 0
_080B93FC: .4byte 0x02023460
_080B9400: .4byte 0x08CEEBA4
_080B9404: .4byte 0x000012D1
_080B9408:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _080B9410
	b _080B9636
_080B9410:
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r6, r0, #0x19
	adds r0, r6, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080B9440 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B942A
	movs r2, #1
_080B942A:
	adds r0, r1, #0
	adds r0, #0x84
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r0, r0, #1
	mov r8, r0
	cmp r6, #0
	bne _080B9448
	ldr r0, _080B9444 @ =0x00001187
	b _080B9456
	.align 2, 0
_080B9440: .4byte 0x0202BBF8
_080B9444: .4byte 0x00001187
_080B9448:
	cmp r6, #0
	blt _080B9484
	cmp r6, #0x2f
	bgt _080B9484
	cmp r6, #0x2e
	blt _080B9484
	ldr r0, _080B947C @ =0x00001186
_080B9456:
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #3
	lsls r1, r1, #1
	ldr r3, _080B9480 @ =0x02023460
	adds r1, r1, r3
	ldr r3, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r4, r7, #0
	b _080B9542
	.align 2, 0
_080B947C: .4byte 0x00001186
_080B9480: .4byte 0x02023460
_080B9484:
	ldr r1, _080B94E8 @ =0x08CEEBA4
	ldr r0, [r1]
	adds r0, #0x98
	lsls r4, r4, #5
	adds r1, r4, #3
	lsls r1, r1, #1
	ldr r2, _080B94EC @ =0x02023460
	mov sb, r2
	add r1, sb
	bl PutText
	movs r7, #0
	adds r5, r4, #0
	mov r3, r8
	cmp r3, #9
	ble _080B94A6
	movs r7, #1
_080B94A6:
	adds r0, r7, #2
	adds r0, #3
	adds r0, r5, r0
	lsls r0, r0, #1
	add r0, sb
	movs r1, #2
	mov r2, r8
	bl PutNumber
	cmp r6, #0x19
	bne _080B94F4
	ldr r0, _080B94F0 @ =0x00001189
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sl
	lsls r4, r0, #3
	ldr r1, _080B94E8 @ =0x08CEEBA4
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r7, #3
	adds r1, #3
	adds r1, r5, r1
	lsls r1, r1, #1
	add r1, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	b _080B9542
	.align 2, 0
_080B94E8: .4byte 0x08CEEBA4
_080B94EC: .4byte 0x02023460
_080B94F0: .4byte 0x00001189
_080B94F4:
	adds r0, r6, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080B9560 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B9508
	movs r2, #1
_080B9508:
	adds r0, r1, #0
	adds r0, #0x84
	adds r0, r0, r2
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	mov r2, sl
	lsls r4, r2, #3
	cmp r1, #0
	beq _080B9542
	ldr r0, _080B9564 @ =0x00001188
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, _080B9568 @ =0x08CEEBA4
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r7, #3
	adds r1, #3
	adds r1, r5, r1
	lsls r1, r1, #1
	add r1, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #2
	movs r3, #0
	bl PutDrawText
_080B9542:
	cmp r6, #0x2f
	bgt _080B956C
	cmp r6, #0x2e
	blt _080B956C
	ldr r2, [sp, #8]
	ldm r2!, {r0}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
	ldr r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
	movs r3, #1
	str r3, [sp, #0xc]
	b _080B9574
	.align 2, 0
_080B9560: .4byte 0x0202BBF8
_080B9564: .4byte 0x00001188
_080B9568: .4byte 0x08CEEBA4
_080B956C:
	ldr r1, [sp, #8]
	ldr r0, [r1]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
_080B9574:
	cmp r6, #0x19
	bne _080B95CC
	movs r0, #0x19
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B95C0 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B958C
	movs r1, #2
_080B958C:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080B95C4 @ =0x08CEEBA4
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, [r0]
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #8
	adds r1, #3
	lsls r1, r1, #1
	ldr r2, _080B95C8 @ =0x02023460
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	b _080B960E
	.align 2, 0
_080B95C0: .4byte 0x0202BBF8
_080B95C4: .4byte 0x08CEEBA4
_080B95C8: .4byte 0x02023460
_080B95CC:
	adds r0, r6, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B9648 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B95E0
	movs r1, #2
_080B95E0:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080B964C @ =0x08CEEBA4
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, [r0]
	adds r0, r0, r1
	adds r1, r5, #5
	adds r1, #3
	lsls r1, r1, #1
	ldr r2, _080B9650 @ =0x02023460
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
_080B960E:
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, #3
	lsls r0, r0, #1
	ldr r4, _080B9650 @ =0x02023460
	adds r0, r0, r4
	movs r1, #2
	adds r2, r7, #0
	bl PutNumber
	ldr r0, _080B964C @ =0x08CEEBA4
	ldr r0, [r0]
	adds r0, #0x90
	adds r1, r5, #0
	adds r1, #0x15
	adds r1, #3
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
_080B9636:
	ldr r0, [sp, #0xc]
_080B9638:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B9648: .4byte 0x0202BBF8
_080B964C: .4byte 0x08CEEBA4
_080B9650: .4byte 0x02023460

	thumb_func_start sub_080B9654
sub_080B9654: @ 0x080B9654
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	asrs r5, r0, #6
	adds r2, r5, #0
	subs r2, #0x88
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ands r0, r5
	cmp r0, #0
	bne _080B96D6
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	adds r2, r5, #0
	adds r5, r0, #0
	cmp r2, #0
	bge _080B9684
	adds r2, #0xf
_080B9684:
	asrs r0, r2, #4
	cmp r1, r0
	bne _080B96D6
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r2, [r0]
	ldr r0, [r4, #0x2c]
	cmp r0, r2
	blt _080B96BA
	subs r0, r0, r2
	cmp r0, #1
	bne _080B96A6
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080B9340
	b _080B96CA
_080B96A6:
	cmp r0, #2
	ble _080B96B2
	adds r0, r4, #0
	bl Proc_Break
	b _080B96CA
_080B96B2:
	movs r0, #0
	bl sub_080B9340
	b _080B96CA
_080B96BA:
	bl GetChapterStats
	ldrb r1, [r5]
	bl sub_080B9340
	ldr r1, [r4, #0x2c]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
_080B96CA:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080B96D6:
	ldr r0, _080B96F8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	ldr r1, [r4, #0x34]
	cmp r0, #0
	beq _080B96EC
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_080B96EC:
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B96F8: .4byte 0x08B857F8

	thumb_func_start sub_080B96FC
sub_080B96FC: @ 0x080B96FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	ldr r3, _080B98EC @ =0x08CEEA70
	ldr r0, _080B98F0 @ =0x00009480
	str r0, [sp]
	movs r0, #2
	movs r1, #0x18
	movs r2, #0x14
	bl PutSpriteExt
	ldr r3, _080B98F4 @ =0x08CEEAE4
	movs r0, #0xc9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x80
	bl PutSpriteExt
	ldr r1, _080B98F8 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080B973A
	b _080B9924
_080B973A:
	ldr r3, _080B98FC @ =0x08CEEA90
	ldr r4, _080B9900 @ =0x00008480
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x38
	bl PutSpriteExt
	ldr r3, _080B9904 @ =0x08CEEA9E
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x38
	bl PutSpriteExt
	ldr r3, _080B9908 @ =0x08CEEABA
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x58
	bl PutSpriteExt
	ldr r3, _080B990C @ =0x08CEEAD6
	movs r0, #0xe9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x58
	bl PutSpriteExt
	movs r7, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	mov sl, r0
	ldr r1, _080B9910 @ =0x080C5A48
	mov sb, r1
	mov r8, sl
_080B9786:
	mov r2, r8
	ldrh r2, [r2]
	cmp r2, #0x10
	bls _080B9834
	ldr r4, _080B9914 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r4, r8
	ldrh r1, [r4]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080B9914 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r2, r7, #1
	lsls r2, r2, #5
	movs r4, #0x98
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080B9918 @ =0x08CEEB54
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x90
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080B9834:
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #2
	ble _080B9786
	lsls r0, r7, #1
	add sl, r0
	mov r1, sl
	ldrh r1, [r1]
	cmp r1, #0x10
	bhi _080B984C
	b _080B9AF6
_080B984C:
	ldr r4, _080B9910 @ =0x080C5A48
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r2, r7, #1
	lsls r2, r2, #5
	movs r4, #0x98
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080B991C @ =0x08CEEB6C
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080B9920 @ =0x0000F480
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	b _080B9AF6
	.align 2, 0
_080B98EC: .4byte 0x08CEEA70
_080B98F0: .4byte 0x00009480
_080B98F4: .4byte 0x08CEEAE4
_080B98F8: .4byte 0x0202BBF8
_080B98FC: .4byte 0x08CEEA90
_080B9900: .4byte 0x00008480
_080B9904: .4byte 0x08CEEA9E
_080B9908: .4byte 0x08CEEABA
_080B990C: .4byte 0x08CEEAD6
_080B9910: .4byte 0x080C5A48
_080B9914: .4byte 0x080C5AC8
_080B9918: .4byte 0x08CEEB54
_080B991C: .4byte 0x08CEEB6C
_080B9920: .4byte 0x0000F480
_080B9924:
	ldr r3, _080B9B08 @ =0x08CEEA90
	ldr r4, _080B9B0C @ =0x00008480
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x30
	bl PutSpriteExt
	ldr r3, _080B9B10 @ =0x08CEEA9E
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x30
	bl PutSpriteExt
	ldr r3, _080B9B14 @ =0x08CEEAC8
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _080B9B18 @ =0x08CEEAAC
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _080B9B1C @ =0x08CEEABA
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x60
	bl PutSpriteExt
	ldr r3, _080B9B20 @ =0x08CEEAD6
	movs r0, #0xe9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x60
	bl PutSpriteExt
	movs r7, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	mov sl, r0
	ldr r1, _080B9B24 @ =0x080C5A48
	mov sb, r1
	mov r8, sl
_080B998C:
	mov r2, r8
	ldrh r2, [r2]
	cmp r2, #0x10
	bls _080B9A3E
	ldr r4, _080B9B28 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r4, r8
	ldrh r1, [r4]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080B9B28 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r0, r7, #1
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	movs r4, #0x94
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080B9B2C @ =0x08CEEB54
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x90
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080B9A3E:
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #4
	ble _080B998C
	lsls r0, r7, #1
	add sl, r0
	mov r1, sl
	ldrh r1, [r1]
	cmp r1, #0x10
	bls _080B9AF6
	ldr r4, _080B9B24 @ =0x080C5A48
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r0, r7, #1
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	movs r4, #0x94
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080B9B30 @ =0x08CEEB6C
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080B9B34 @ =0x0000F480
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080B9AF6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B08: .4byte 0x08CEEA90
_080B9B0C: .4byte 0x00008480
_080B9B10: .4byte 0x08CEEA9E
_080B9B14: .4byte 0x08CEEAC8
_080B9B18: .4byte 0x08CEEAAC
_080B9B1C: .4byte 0x08CEEABA
_080B9B20: .4byte 0x08CEEAD6
_080B9B24: .4byte 0x080C5A48
_080B9B28: .4byte 0x080C5AC8
_080B9B2C: .4byte 0x08CEEB54
_080B9B30: .4byte 0x08CEEB6C
_080B9B34: .4byte 0x0000F480

	thumb_func_start sub_080B9B38
sub_080B9B38: @ 0x080B9B38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x30]
	str r0, [r5, #0x2c]
	bl UnpackUiWindowFrameGraphics
	ldr r0, _080B9C14 @ =0x02023460
	ldr r1, _080B9C18 @ =0x085E0024
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _080B9C1C @ =0x085DE54C
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B9C20 @ =0x085DE58C
	ldr r1, _080B9C24 @ =0x06011000
	bl Decompress
	movs r4, #0
	movs r0, #0xa
	add r0, sp
	mov sb, r0
	add r1, sp, #0xc
	mov sl, r1
_080B9B7C:
	adds r1, r4, #0
	adds r1, #0x1a
	lsls r1, r1, #5
	ldr r0, _080B9C28 @ =0x085DFA70
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080B9B7C
	ldr r0, _080B9C2C @ =0x085DFAF0
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9C30 @ =0x085DFA90
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9C34 @ =0x085DFAB0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0xf
	bl EnableBgSync
	ldr r4, _080B9C38 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r6, [r4, #0x14]
	ands r0, r6
	cmp r0, #0
	beq _080B9C3C
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_080B66B4
	adds r6, r5, #0
	adds r6, #0x3a
	strb r0, [r6]
	bl sub_080B6734
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	bl GetChapterCombatRank
	adds r2, r5, #0
	adds r2, #0x3c
	strb r0, [r2]
	ldrb r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r2]
	bl sub_080B663C
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl StartBgm
	b _080B9CA2
	.align 2, 0
_080B9C14: .4byte 0x02023460
_080B9C18: .4byte 0x085E0024
_080B9C1C: .4byte 0x085DE54C
_080B9C20: .4byte 0x085DE58C
_080B9C24: .4byte 0x06011000
_080B9C28: .4byte 0x085DFA70
_080B9C2C: .4byte 0x085DFAF0
_080B9C30: .4byte 0x085DFA90
_080B9C34: .4byte 0x085DFAB0
_080B9C38: .4byte 0x0202BBF8
_080B9C3C:
	bl GetGameTotalTime_unused
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl GetGameTacticsRank
	movs r7, #0x3a
	adds r7, r7, r5
	mov r8, r7
	strb r0, [r7]
	bl GetGameSurvivalRank
	adds r7, r5, #0
	adds r7, #0x3b
	strb r0, [r7]
	bl GetGameFundsRank
	adds r4, r5, #0
	adds r4, #0x3c
	strb r0, [r4]
	bl GetGameExpRank
	adds r6, r5, #0
	adds r6, #0x3d
	strb r0, [r6]
	bl GetGameCombatRank
	movs r1, #0x3e
	adds r1, r1, r5
	mov ip, r1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r7]
	ldrb r2, [r4]
	ldrb r3, [r6]
	mov r6, ip
	ldrb r4, [r6]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl StartBgm
_080B9CA2:
	ldr r4, _080B9D48 @ =0x020230A0
	adds r0, r4, #0
	adds r0, #0xa
	add r1, sp, #8
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x10
	mov r7, sb
	ldrh r2, [r7]
	movs r1, #2
	bl sub_080063CC
	adds r0, r4, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x16
	mov r1, sl
	ldrh r2, [r1]
	movs r1, #2
	bl sub_080063CC
	movs r4, #0
	adds r3, r5, #0
	adds r3, #0x4c
	movs r6, #0
	mov r8, r6
	movs r7, #0
	mov sb, r7
	adds r2, r5, #0
	adds r2, #0x46
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_080B9CFE:
	lsls r0, r4, #1
	adds r0, r3, r0
	mov r7, sb
	strh r7, [r0]
	adds r0, r2, r4
	strb r6, [r0]
	adds r0, r1, r4
	mov r7, r8
	strb r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _080B9CFE
	ldr r0, _080B9D4C @ =sub_080B96FC
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _080B9D50 @ =0x085DFAB0
	adds r1, r0, #0
	adds r1, #0x20
	movs r2, #1
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #0x17
	bl StartMixPalette
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9D48: .4byte 0x020230A0
_080B9D4C: .4byte sub_080B96FC
_080B9D50: .4byte 0x085DFAB0

	thumb_func_start sub_080B9D54
sub_080B9D54: @ 0x080B9D54
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, _080B9DC4 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r2, [r3]
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r3]
	mov r2, ip
	adds r2, #0x44
	movs r3, #0
	movs r5, #8
	movs r0, #8
	strb r0, [r2]
	adds r2, #1
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080B9DC8 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r2, #4
	orrs r0, r2
	ldr r2, _080B9DCC @ =0x0000E0FF
	ands r0, r2
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r2, r3, #0
	orrs r0, r2
	mov r2, ip
	strh r0, [r2, #0x3c]
	movs r0, #1
	ldrb r3, [r2, #1]
	orrs r0, r3
	movs r2, #2
	orrs r0, r2
	movs r2, #4
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	mov r2, ip
	strb r0, [r2, #1]
	ldr r0, _080B9DD0 @ =0x08CEEB84
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9DC4: .4byte 0x03002870
_080B9DC8: .4byte 0x0000FFE0
_080B9DCC: .4byte 0x0000E0FF
_080B9DD0: .4byte 0x08CEEB84

	thumb_func_start sub_080B9DD4
sub_080B9DD4: @ 0x080B9DD4
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #0x10
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, [r4, #0x58]
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B9E10
sub_080B9E10: @ 0x080B9E10
	push {r4, lr}
	sub sp, #0x14
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r4, [r0, #0x58]
	adds r4, #0x10
	movs r1, #1
	lsls r1, r4
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080B9E40
sub_080B9E40: @ 0x080B9E40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9E54 @ =0x08CEEBA8
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E54: .4byte 0x08CEEBA8

	thumb_func_start sub_080B9E58
sub_080B9E58: @ 0x080B9E58
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r2, r3, #0
	adds r2, #0x20
	str r2, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x4c
	adds r5, r1, r0
	adds r0, r2, #0
	cmp r2, #0
	bge _080B9E78
	ldr r1, _080B9E9C @ =0x0000021F
	adds r0, r3, r1
_080B9E78:
	asrs r0, r0, #9
	lsls r0, r0, #9
	subs r0, r2, r0
	cmp r0, #0xff
	ble _080B9EA4
	adds r0, r2, #0
	cmp r2, #0
	bge _080B9E8C
	ldr r1, _080B9EA0 @ =0x0000011F
	adds r0, r3, r1
_080B9E8C:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	b _080B9EB4
	.align 2, 0
_080B9E9C: .4byte 0x0000021F
_080B9EA0: .4byte 0x0000011F
_080B9EA4:
	adds r0, r2, #0
	cmp r2, #0
	bge _080B9EAE
	ldr r1, _080B9F10 @ =0x0000011F
	adds r0, r3, r1
_080B9EAE:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r1, r2, r0
_080B9EB4:
	strh r1, [r5]
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	adds r2, r4, #0
	adds r2, #0x40
	cmp r0, #0
	bne _080B9ED2
	adds r1, r2, r1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080B9ED2:
	ldr r3, [r4, #0x2c]
	adds r1, r2, r3
	adds r0, r4, #0
	adds r0, #0x3a
	adds r0, r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080B9F40
	lsls r0, r3, #1
	adds r0, r5, r0
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0]
	cmp r0, r1
	bne _080B9F40
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r1, _080B9F14 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080B9F18
	cmp r3, #3
	bne _080B9F18
	movs r0, #0xf
	adds r1, r4, #0
	bl sub_080B9E40
	b _080B9F22
	.align 2, 0
_080B9F10: .4byte 0x0000011F
_080B9F14: .4byte 0x0202BBF8
_080B9F18:
	ldr r0, [r4, #0x2c]
	adds r0, #0xa
	adds r1, r4, #0
	bl sub_080B9E40
_080B9F22:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldr r0, _080B9F48 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B9F3A
	movs r0, #0x85
	bl m4aSongNumStart
_080B9F3A:
	adds r0, r4, #0
	bl Proc_Break
_080B9F40:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F48: .4byte 0x0202BBF8

	thumb_func_start sub_080B9F4C
sub_080B9F4C: @ 0x080B9F4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9F74 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B9F6C
	movs r0, #1
	rsbs r0, r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
_080B9F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F74: .4byte 0x08B857F8

	thumb_func_start sub_080B9F78
sub_080B9F78: @ 0x080B9F78
	push {lr}
	movs r0, #3
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_080B9F84
sub_080B9F84: @ 0x080B9F84
	push {lr}
	adds r2, r0, #0
	ldr r1, _080B9FA0 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080B9FA4
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _080B9FAC
	.align 2, 0
_080B9FA0: .4byte 0x0202BBF8
_080B9FA4:
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080B9FAC:
	pop {r0}
	bx r0

	thumb_func_start sub_080B9FB0
sub_080B9FB0: @ 0x080B9FB0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9FC0 @ =0x08CEEBD8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9FC0: .4byte 0x08CEEBD8

	thumb_func_start sub_080B9FC4
sub_080B9FC4: @ 0x080B9FC4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9FD4 @ =0x08CEED00
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9FD4: .4byte 0x08CEED00

	thumb_func_start sub_080B9FD8
sub_080B9FD8: @ 0x080B9FD8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	str r1, [r5, #0x2c]
	movs r0, #0x18
	str r0, [r5, #0x3c]
	movs r4, #0
	strh r1, [r5, #0x38]
	ldr r0, _080BA0F0 @ =0x08CEED60
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x34
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	bl ResetText
	ldr r2, _080BA0F4 @ =0x03002870
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
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BA0F8 @ =0x085E0280
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	ldr r6, _080BA0FC @ =0x06008000
_080BA054:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA072
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #0xb
	adds r1, r1, r6
	bl Decompress
_080BA072:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #6
	ble _080BA054
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #8
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0x60
	bl SetBgOffset
	movs r0, #0x2a
	movs r1, #0
	bl StartBgm
	ldr r3, _080BA0F4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BA100 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BA104 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_080BA364
	ldr r0, _080BA108 @ =sub_080BA3A0
	bl SetOnHBlankA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0F0: .4byte 0x08CEED60
_080BA0F4: .4byte 0x03002870
_080BA0F8: .4byte 0x085E0280
_080BA0FC: .4byte 0x06008000
_080BA100: .4byte 0x0000FFE0
_080BA104: .4byte 0x0000E0FF
_080BA108: .4byte sub_080BA3A0

	thumb_func_start sub_080BA10C
sub_080BA10C: @ 0x080BA10C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	lsrs r7, r0, #3
	movs r0, #0x1f
	ands r7, r0
	ldr r0, [r4, #0x2c]
	asrs r2, r0, #6
	strh r2, [r4, #0x38]
	lsls r1, r2, #0x10
	ldr r0, _080BA140 @ =0x071F0000
	cmp r1, r0
	bls _080BA144
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
	b _080BA24C
	.align 2, 0
_080BA140: .4byte 0x071F0000
_080BA144:
	subs r2, #0xa0
	movs r0, #0xff
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x34
	mov r8, r0
	ldrb r1, [r0]
	cmp r1, #6
	bhi _080BA1A2
	ldr r0, [r4, #0x30]
	mov r5, r8
	ldrb r2, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r5, [r1]
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #0xb
	lsls r2, r2, #0xb
	ldr r1, _080BA18C @ =0x06008000
	adds r2, r2, r1
	adds r1, r0, r2
	cmp r3, #0
	beq _080BA190
	adds r0, r3, #0
	bl Decompress
	b _080BA19A
	.align 2, 0
_080BA18C: .4byte 0x06008000
_080BA190:
	str r3, [sp]
	ldr r2, _080BA238 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
_080BA19A:
	mov r5, r8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080BA1A2:
	movs r0, #7
	mov sb, r0
	mov r1, sb
	ands r1, r7
	mov sb, r1
	cmp r1, #0
	bne _080BA216
	ldr r0, [r4, #0x30]
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r2, [r6]
	lsls r1, r2, #2
	adds r0, #0x1c
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r7, #0
	asrs r0, r0, #3
	cmp r2, r0
	bne _080BA216
	cmp r3, #0
	beq _080BA24C
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #0x16
	movs r1, #0xa0
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x10
	lsls r0, r7, #6
	ldr r1, _080BA23C @ =0x02024460
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080BA216
	mov r0, sb
	strb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	movs r0, #1
	ldrb r1, [r5]
	subs r0, r0, r1
	strb r0, [r5]
	ldr r0, [r4, #0x30]
	adds r0, #0x2c
	str r0, [r4, #0x30]
_080BA216:
	ldr r0, _080BA240 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BA244
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BA24C
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080BA24C
	.align 2, 0
_080BA238: .4byte 0x01000200
_080BA23C: .4byte 0x02024460
_080BA240: .4byte 0x08B857F8
_080BA244:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #0x2c]
_080BA24C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BA25C
sub_080BA25C: @ 0x080BA25C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080BA2FC @ =0x08CEEE68
	str r0, [r5, #0x30]
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080BA300 @ =0x085E0280
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	ldr r0, _080BA304 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r4, #0
	ldr r6, _080BA308 @ =0x06008000
_080BA28E:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA2AC
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #0xb
	adds r1, r1, r6
	bl Decompress
_080BA2AC:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _080BA28E
	movs r4, #1
_080BA2BA:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, #0x1c
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r3, #0
	beq _080BA2E8
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r2, r1, #3
	subs r2, r2, r1
	lsls r2, r2, #0x16
	movs r0, #0xa0
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	lsls r0, r4, #9
	ldr r1, _080BA304 @ =0x02024460
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
_080BA2E8:
	adds r4, #1
	cmp r4, #3
	ble _080BA2BA
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA2FC: .4byte 0x08CEEE68
_080BA300: .4byte 0x085E0280
_080BA304: .4byte 0x02024460
_080BA308: .4byte 0x06008000

	thumb_func_start sub_080BA30C
sub_080BA30C: @ 0x080BA30C
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r2, _080BA348 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080BA34C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
_080BA348: .4byte 0x03002870
_080BA34C: .4byte 0x0000FFE0

	thumb_func_start sub_080BA350
sub_080BA350: @ 0x080BA350
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BA360 @ =0x08CEEEC0
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BA360: .4byte 0x08CEEEC0

	thumb_func_start sub_080BA364
sub_080BA364: @ 0x080BA364
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r3, _080BA39C @ =0x08CEEF68
	adds r6, r3, #0
	movs r5, #0x10
	movs r0, #0x60
	rsbs r0, r0, #0
	adds r4, r0, #0
_080BA374:
	ldr r0, [r3]
	adds r0, r0, r2
	strb r5, [r0]
	cmp r2, #0xf
	bgt _080BA384
	ldr r0, [r6]
	adds r0, r0, r2
	strb r2, [r0]
_080BA384:
	cmp r2, #0x90
	ble _080BA390
	ldr r0, [r3]
	adds r0, r0, r2
	subs r1, r4, r2
	strb r1, [r0]
_080BA390:
	adds r2, #1
	cmp r2, #0xa0
	ble _080BA374
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA39C: .4byte 0x08CEEF68

	thumb_func_start sub_080BA3A0
sub_080BA3A0: @ 0x080BA3A0
	ldr r0, _080BA3C0 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080BA3B0
	movs r2, #0
_080BA3B0:
	ldr r1, _080BA3C4 @ =0x04000052
	ldr r0, _080BA3C8 @ =0x08CEEF68
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BA3C0: .4byte 0x04000006
_080BA3C4: .4byte 0x04000052
_080BA3C8: .4byte 0x08CEEF68

	thumb_func_start HBlank_TitleScreen
HBlank_TitleScreen: @ 0x080BA3CC
	ldr r0, _080BA3EC @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bls _080BA3DC
	movs r2, #0
_080BA3DC:
	ldr r0, _080BA3F0 @ =0x04000012
	movs r1, #1
	ands r1, r2
	lsrs r2, r2, #1
	adds r1, r1, r2
	rsbs r1, r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080BA3EC: .4byte 0x04000006
_080BA3F0: .4byte 0x04000012

	thumb_func_start ResetTitleBgAffin
ResetTitleBgAffin: @ 0x080BA3F4
	push {lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, sp
	strh r3, [r1, #8]
	strh r3, [r1, #0xa]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r1, #0xc]
	strh r2, [r1, #0xe]
	strh r3, [r1, #0x10]
	ldr r1, _080BA428 @ =0x030028C8
	cmp r0, #2
	bne _080BA41A
	subs r1, #0x10
_080BA41A:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080BA428: .4byte 0x030028C8

	thumb_func_start Title_InitSpriteAnim
Title_InitSpriteAnim: @ 0x080BA42C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	movs r6, #0
	cmp r1, #0
	bne _080BA442
	movs r6, #0x80
	lsls r6, r6, #1
_080BA442:
	ldr r0, _080BA4AC @ =0x0866FCE0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0xa0
	bl ApplyPaletteExt
	ldr r0, _080BA4B0 @ =0x0866FD80
	ldr r1, _080BA4B4 @ =0x06010000
	bl Decompress
	ldr r5, _080BA4B8 @ =0x08672570
	adds r6, #0x78
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x48
	bl StartSpriteAnimProc
	str r0, [r7, #0x30]
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x4c
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r7, #0x34]
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x90
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r7, #0x44]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA4AC: .4byte 0x0866FCE0
_080BA4B0: .4byte 0x0866FD80
_080BA4B4: .4byte 0x06010000
_080BA4B8: .4byte 0x08672570

	thumb_func_start Title_InitBg
Title_InitBg: @ 0x080BA4BC
	push {lr}
	ldr r0, _080BA520 @ =0x0866AF6C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA524 @ =0x0866AF8C
	ldr r1, _080BA528 @ =0x06008000
	bl Decompress
	ldr r0, _080BA52C @ =0x02024460
	ldr r1, _080BA530 @ =0x0866EDC0
	movs r2, #0xf0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080BA534 @ =0x0866F274
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA538 @ =0x0866F294
	ldr r1, _080BA53C @ =0x0600CC00
	bl Decompress
	ldr r0, _080BA540 @ =0x02023CA0
	ldr r1, _080BA544 @ =0x0866FB1C
	ldr r2, _080BA548 @ =0x0000E260
	bl sub_080AACD8
	ldr r0, _080BA54C @ =0x0866AB28
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA550 @ =0x0866AB48
	ldr r1, _080BA554 @ =0x0600DE00
	bl Decompress
	ldr r0, _080BA558 @ =0x02023460
	ldr r1, _080BA55C @ =0x0866ADEC
	ldr r2, _080BA560 @ =0x0000D2F0
	bl sub_080AACD8
	pop {r0}
	bx r0
	.align 2, 0
_080BA520: .4byte 0x0866AF6C
_080BA524: .4byte 0x0866AF8C
_080BA528: .4byte 0x06008000
_080BA52C: .4byte 0x02024460
_080BA530: .4byte 0x0866EDC0
_080BA534: .4byte 0x0866F274
_080BA538: .4byte 0x0866F294
_080BA53C: .4byte 0x0600CC00
_080BA540: .4byte 0x02023CA0
_080BA544: .4byte 0x0866FB1C
_080BA548: .4byte 0x0000E260
_080BA54C: .4byte 0x0866AB28
_080BA550: .4byte 0x0866AB48
_080BA554: .4byte 0x0600DE00
_080BA558: .4byte 0x02023460
_080BA55C: .4byte 0x0866ADEC
_080BA560: .4byte 0x0000D2F0

	thumb_func_start sub_080BA564
sub_080BA564: @ 0x080BA564
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, _080BA698 @ =0x086772EC
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x50
	movs r7, #0
	strb r7, [r0]
	ldr r5, _080BA69C @ =0x03002870
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	mov r0, sp
	bl InitBgs
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r2, [r5]
	ands r0, r2
	strb r0, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r5, #1]
	ands r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r5, #1]
	movs r3, #3
	ldrb r0, [r5, #0xc]
	orrs r0, r3
	strb r0, [r5, #0xc]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r2, [r5, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r3, r1
	strb r3, [r5, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _080BA6A0 @ =0x0000FFCC
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080BA6A4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080BA6A8 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080BA6AC @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080BA6B0 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl ResetTitleBgAffin
	adds r2, r5, #0
	adds r2, #0x3c
	adds r1, r4, #0
	ldrb r3, [r2]
	ands r1, r3
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r3, [r0]
	ands r4, r3
	strb r4, [r0]
	movs r0, #0x3f
	ands r1, r0
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r6, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BA67C
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_080BA67C:
	str r7, [r6, #0x54]
	adds r1, r6, #0
	adds r1, #0x30
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x44
_080BA688:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _080BA688
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA698: .4byte 0x086772EC
_080BA69C: .4byte 0x03002870
_080BA6A0: .4byte 0x0000FFCC
_080BA6A4: .4byte 0x02022C60
_080BA6A8: .4byte 0x02023460
_080BA6AC: .4byte 0x02023C60
_080BA6B0: .4byte 0x02024460

	thumb_func_start Title_InitDisp
Title_InitDisp: @ 0x080BA6B4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl Title_InitSpriteAnim
	adds r0, r4, #0
	bl Title_InitBg
	movs r0, #0xe
	bl EnableBgSync
	adds r0, r4, #0
	bl Title_StartTextFlame
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Title_StartBmBgfxAnim
Title_StartBmBgfxAnim: @ 0x080BA6D8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _080BA754 @ =HBlank_TitleScreen
	bl SetOnHBlankA
	adds r0, r4, #0
	movs r1, #0
	bl Title_InitSpriteAnim
	adds r0, r4, #0
	bl Title_InitBg
	ldr r0, _080BA758 @ =0x08CEFA40
	movs r5, #0
	str r5, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r2, _080BA75C @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0xe
	bl EnableBgSync
	ldr r0, _080BA760 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BA744
	movs r0, #0x63
	bl m4aSongNumStart
_080BA744:
	adds r0, r4, #0
	adds r0, #0x50
	strb r5, [r0]
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA754: .4byte HBlank_TitleScreen
_080BA758: .4byte 0x08CEFA40
_080BA75C: .4byte 0x03002870
_080BA760: .4byte 0x0202BBF8

	thumb_func_start sub_080BA764
sub_080BA764: @ 0x080BA764
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x50
	ldrb r0, [r6]
	cmp r0, #8
	bne _080BA78A
	ldr r0, [r5, #0x34]
	movs r1, #0x4c
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0x78
	movs r2, #0x3c
	movs r3, #0x78
	bl TitleSpriteBlendIN
_080BA78A:
	ldrb r0, [r6]
	subs r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _080BA84A
	ldrb r0, [r6]
	adds r1, r0, #0
	subs r1, #0x30
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r7, r1, #1
	cmp r0, #0x30
	bne _080BA810
	ldr r3, _080BA888 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r4, r3, #0
	adds r4, #0x45
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r4]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BA88C @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	movs r1, #4
	orrs r0, r1
	ldr r1, _080BA890 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0xf8
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r1, _080BA894 @ =0x0866F274
	str r5, [sp]
	movs r0, #0
	movs r2, #0xe
	movs r3, #0x20
	bl sub_080BD0D4
_080BA810:
	ldr r3, _080BA888 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r7, [r0]
	movs r0, #0x10
	subs r0, r0, r7
	adds r2, #9
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrb r2, [r6]
	subs r2, #0x30
	asrs r2, r2, #1
	subs r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
_080BA84A:
	adds r4, r5, #0
	adds r4, #0x50
	ldrb r0, [r4]
	cmp r0, #0x28
	bne _080BA86C
	ldr r0, [r5, #0x30]
	movs r1, #0x48
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0
	movs r3, #0x78
	bl TitleSpriteBlendOUT
_080BA86C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _080BA880
	adds r0, r5, #0
	bl Proc_Break
_080BA880:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA888: .4byte 0x03002870
_080BA88C: .4byte 0x0000FFE0
_080BA890: .4byte 0x0000E0FF
_080BA894: .4byte 0x0866F274

	thumb_func_start Title_ResetBmBgfxConf
Title_ResetBmBgfxConf: @ 0x080BA898
	adds r0, #0x50
	movs r3, #0
	strb r3, [r0]
	ldr r0, _080BA90C @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080BA910 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BA914 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #1
	ldrb r3, [r1, #1]
	orrs r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080BA90C: .4byte 0x03002870
_080BA910: .4byte 0x0000FFE0
_080BA914: .4byte 0x0000E0FF

	thumb_func_start sub_080BA918
sub_080BA918: @ 0x080BA918
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _080BA97A
	cmp r0, #0x20
	bne _080BA94C
	ldr r0, [r4, #0x44]
	movs r1, #0x90
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x78
	movs r2, #0x90
	movs r3, #0x78
	bl TitleSpriteBlendIN
	b _080BA97A
_080BA94C:
	ldrb r1, [r1]
	lsrs r3, r1, #1
	ldr r0, _080BA994 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
_080BA97A:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _080BA98A
	adds r0, r4, #0
	bl Proc_Break
_080BA98A:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA994: .4byte 0x03002870

	thumb_func_start sub_080BA998
sub_080BA998: @ 0x080BA998
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Title_StartTextFlame
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Title_IDLE
Title_IDLE: @ 0x080BA9B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	adds r0, #1
	str r0, [r4, #0x54]
	adds r2, r4, #0
	adds r2, #0x50
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r2]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	ldr r1, _080BAA0C @ =0x085E9B2C
	adds r0, r0, r1
	movs r1, #0x8c
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	ldr r0, _080BAA10 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BAA1C
	ldr r0, _080BAA14 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BA9FE
	ldr r0, _080BAA18 @ =0x0000038D
	bl m4aSongNumStart
_080BA9FE:
	movs r0, #0
	bl SetNextGameAction
	adds r0, r4, #0
	bl Proc_Break
	b _080BAA32
	.align 2, 0
_080BAA0C: .4byte 0x085E9B2C
_080BAA10: .4byte 0x08B857F8
_080BAA14: .4byte 0x0202BBF8
_080BAA18: .4byte 0x0000038D
_080BAA1C:
	ldr r1, [r4, #0x54]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	bne _080BAA32
	movs r0, #1
	bl SetNextGameAction
	adds r0, r4, #0
	bl Proc_Break
_080BAA32:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080BAA38
sub_080BAA38: @ 0x080BAA38
	push {r4, r5, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	adds r4, #0x30
	movs r5, #5
_080BAA44:
	ldr r0, [r4]
	cmp r0, #0
	beq _080BAA4E
	bl EndSpriteAnimProc
_080BAA4E:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080BAA44
	bl EndEachSpriteAnimProc
	movs r0, #0
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BAA68
sub_080BAA68: @ 0x080BAA68
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08002CCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BAA80
	adds r0, r4, #0
	movs r1, #0x14
	bl StartTemporaryLock
	b _080BAA88
_080BAA80:
	adds r0, r4, #0
	movs r1, #0x3c
	bl StartTemporaryLock
_080BAA88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BAA90
sub_080BAA90: @ 0x080BAA90
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_08002C8C
	ldr r0, _080BAAD0 @ =0x08672570
	movs r1, #0xbc
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #4
	str r2, [sp]
	movs r2, #0xa
	str r2, [sp, #4]
	movs r2, #0x80
	bl StartSpriteAnimProc
	str r0, [r4, #0x3c]
	movs r1, #0x80
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x78
	movs r2, #0x80
	movs r3, #0x78
	bl TitleSpriteBlendIN
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAAD0: .4byte 0x08672570

	thumb_func_start StartTitleScreen_WithMusic
StartTitleScreen_WithMusic: @ 0x080BAAD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAAF0 @ =0x08CEEF6C
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x5a
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0
	.align 2, 0
_080BAAF0: .4byte 0x08CEEF6C

	thumb_func_start StartTitleScreen_FlagFalse
StartTitleScreen_FlagFalse: @ 0x080BAAF4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAB08 @ =0x08CEEF6C
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080BAB08: .4byte 0x08CEEF6C

	thumb_func_start StartTitleScreen_FlagTrue
StartTitleScreen_FlagTrue: @ 0x080BAB0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAB20 @ =0x08CEEF6C
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080BAB20: .4byte 0x08CEEF6C

	thumb_func_start sub_080BAB24
sub_080BAB24: @ 0x080BAB24
	ldr r0, _080BAB3C @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _080BAB48
	ldr r0, _080BAB40 @ =0x0203E668
	ldr r1, _080BAB44 @ =0x0203E660
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080BAB4E
	.align 2, 0
_080BAB3C: .4byte 0x04000006
_080BAB40: .4byte 0x0203E668
_080BAB44: .4byte 0x0203E660
_080BAB48:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080BAB4E:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080BAB78
	ldr r2, _080BAB70 @ =0x04000010
	ldr r0, _080BAB74 @ =0x0203E668
	ldr r0, [r0]
	lsls r1, r3, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	b _080BABA2
	.align 2, 0
_080BAB70: .4byte 0x04000010
_080BAB74: .4byte 0x0203E668
_080BAB78:
	cmp r3, #0x28
	bne _080BAB8C
	ldr r1, _080BABA8 @ =0x04000050
	ldr r0, _080BABAC @ =0x02000000
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080BABB0 @ =0x02000002
	ldrh r0, [r0]
	strh r0, [r1]
_080BAB8C:
	cmp r3, #0x64
	bne _080BABA4
	ldr r2, _080BABA8 @ =0x04000050
	ldr r1, _080BABB4 @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
_080BABA2:
	strh r0, [r2]
_080BABA4:
	bx lr
	.align 2, 0
_080BABA8: .4byte 0x04000050
_080BABAC: .4byte 0x02000000
_080BABB0: .4byte 0x02000002
_080BABB4: .4byte 0x030028AC

	thumb_func_start Title_StartTextFlame
Title_StartTextFlame: @ 0x080BABB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r7, _080BAD38 @ =0x03002870
	movs r0, #1
	ldrb r1, [r7, #1]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r1, #4
	mov sb, r1
	mov r2, sb
	orrs r0, r2
	movs r1, #8
	mov sl, r1
	mov r2, sl
	orrs r0, r2
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #1]
	ldr r0, _080BAD3C @ =0x08672570
	ldr r2, _080BAD40 @ =0x0000084C
	movs r1, #7
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x78
	movs r3, #0
	bl StartSpriteAnimProc
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r7, #1]
	adds r6, r7, #0
	adds r6, #0x34
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6]
	ands r0, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	movs r4, #5
	rsbs r4, r4, #0
	ands r0, r4
	movs r3, #9
	rsbs r3, r3, #0
	ands r0, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r6]
	adds r6, #3
	movs r0, #1
	ldrb r2, [r6]
	orrs r0, r2
	ands r0, r5
	ands r0, r4
	ands r0, r3
	mov r2, r8
	orrs r0, r2
	adds r3, r7, #0
	adds r3, #0x36
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	mov r2, sb
	orrs r1, r2
	mov r2, sl
	orrs r1, r2
	mov r2, r8
	orrs r1, r2
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r6]
	orrs r1, r2
	strb r1, [r3]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BAD44 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #3
	orrs r0, r1
	ldr r1, _080BAD48 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r1, _080BAD4C @ =0x02000000
	ldr r2, _080BAD50 @ =0x00003F43
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080BAD54 @ =0x02000002
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r2, #2
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldr r2, _080BAD58 @ =0x0000FFCC
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080BAD5C @ =0x08676E04
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BAD60 @ =0x08676E24
	ldr r1, _080BAD64 @ =0x06005000
	bl Decompress
	ldr r0, _080BAD68 @ =0x02022C60
	ldr r1, _080BAD6C @ =0x086771DC
	ldr r2, _080BAD70 @ =0x0000C280
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	bl InitScanlineEffect
	ldr r0, _080BAD74 @ =sub_080BAB24
	bl SetOnHBlankA
	ldr r0, _080BAD78 @ =0x08CEF034
	ldr r1, [sp, #8]
	bl Proc_Start
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAD38: .4byte 0x03002870
_080BAD3C: .4byte 0x08672570
_080BAD40: .4byte 0x0000084C
_080BAD44: .4byte 0x0000FFE0
_080BAD48: .4byte 0x0000E0FF
_080BAD4C: .4byte 0x02000000
_080BAD50: .4byte 0x00003F43
_080BAD54: .4byte 0x02000002
_080BAD58: .4byte 0x0000FFCC
_080BAD5C: .4byte 0x08676E04
_080BAD60: .4byte 0x08676E24
_080BAD64: .4byte 0x06005000
_080BAD68: .4byte 0x02022C60
_080BAD6C: .4byte 0x086771DC
_080BAD70: .4byte 0x0000C280
_080BAD74: .4byte sub_080BAB24
_080BAD78: .4byte 0x08CEF034

	thumb_func_start TitleFlame_Init
TitleFlame_Init: @ 0x080BAD7C
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r1, _080BAD9C @ =0x02000004
	movs r0, #3
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	movs r0, #4
	str r0, [r1, #0xc]
	str r2, [r1, #0x10]
	bx lr
	.align 2, 0
_080BAD9C: .4byte 0x02000004

	thumb_func_start sub_080BADA0
sub_080BADA0: @ 0x080BADA0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x66
	ldrh r1, [r4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x10
	bgt _080BADF0
	adds r0, r1, #1
	strh r0, [r4]
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0x10
	bgt _080BADDC
	asrs r1, r2, #0x13
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r0, r2, #0x12
	movs r3, #0x34
	rsbs r3, r3, #0
	adds r2, r3, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl SetBgOffset
_080BADDC:
	ldr r3, _080BAE48 @ =0x02000002
	ldrh r4, [r4]
	lsls r1, r4, #0x10
	asrs r2, r1, #0x11
	asrs r1, r1, #0x12
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r2, r2, r0
	strh r2, [r3]
_080BADF0:
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	adds r5, #0x64
	movs r6, #0
	ldrsh r1, [r5, r6]
	ldr r4, _080BAE4C @ =0x02000004
	movs r7, #4
	ldrsh r2, [r4, r7]
	movs r6, #0
	ldrsh r3, [r4, r6]
	movs r6, #0
	str r6, [sp]
	bl sub_08076FC4
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	movs r7, #0
	ldrsh r1, [r5, r7]
	movs r3, #0xc
	ldrsh r2, [r4, r3]
	movs r7, #8
	ldrsh r3, [r4, r7]
	str r6, [sp]
	bl sub_08076FC4
	bl SwapScanlineBufs
	ldrh r2, [r4, #0x10]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE48: .4byte 0x02000002
_080BAE4C: .4byte 0x02000004

	thumb_func_start TitleSprite_Init
TitleSprite_Init: @ 0x080BAE50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BAEAC
	ldr r3, _080BAEB8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	movs r5, #0x45
	movs r0, #0x10
	strb r0, [r5, r3]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BAEBC @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	ldr r1, _080BAEC0 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080BAEAC:
	movs r0, #0
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BAEB8: .4byte 0x03002870
_080BAEBC: .4byte 0x0000FFE0
_080BAEC0: .4byte 0x0000E0FF

	thumb_func_start TitleSprite_Loop
TitleSprite_Loop: @ 0x080BAEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	ldr r1, [r5, #0x48]
	cmp r1, #0
	beq _080BAEE0
	adds r0, r5, #0
	bl _call_via_r1
_080BAEE0:
	ldr r6, [r5, #0x30]
	ldr r7, [r5, #0x34]
	cmp r6, r7
	blt _080BAEFE
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x44]
	movs r3, #1
	rsbs r3, r3, #0
	bl SetSpriteAnimProcParameters
	b _080BAFDA
_080BAEFE:
	subs r4, r7, r6
	ldr r0, [r5, #0x38]
	muls r0, r4, r0
	ldr r1, [r5, #0x40]
	muls r1, r6, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	mov sb, r0
	ldr r0, _080BAF54 @ =0x000001FF
	mov r1, sb
	ands r1, r0
	mov sb, r1
	ldr r0, [r5, #0x3c]
	muls r0, r4, r0
	ldr r1, [r5, #0x44]
	muls r1, r6, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	mov r8, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	lsls r0, r6, #4
	adds r1, r7, #0
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #1
	beq _080BAF5E
	cmp r0, #1
	bgt _080BAF58
	cmp r0, #0
	beq _080BAFCC
	b _080BAFDA
	.align 2, 0
_080BAF54: .4byte 0x000001FF
_080BAF58:
	cmp r0, #2
	beq _080BAF8C
	b _080BAFDA
_080BAF5E:
	ldr r3, _080BAF88 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r2, #9
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	b _080BAFB4
	.align 2, 0
_080BAF88: .4byte 0x03002870
_080BAF8C:
	ldr r3, _080BAFC8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r2, [r0]
_080BAFB4:
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #3
	add r2, r8
	movs r3, #1
	rsbs r3, r3, #0
	mov r1, sb
	bl SetSpriteAnimProcParameters
	b _080BAFDA
	.align 2, 0
_080BAFC8: .4byte 0x03002870
_080BAFCC:
	ldr r0, [r5, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	mov r1, sb
	mov r2, r8
	bl SetSpriteAnimProcParameters
_080BAFDA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TitleSpriteBlendIN
TitleSpriteBlendIN: @ 0x080BAFE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r0, _080BB024 @ =0x08CEF054
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x38]
	str r6, [r0, #0x3c]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x44]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x48]
	adds r0, #0x4c
	movs r1, #1
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB024: .4byte 0x08CEF054

	thumb_func_start TitleSpriteBlendOUT
TitleSpriteBlendOUT: @ 0x080BB028
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r0, _080BB06C @ =0x08CEF054
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x38]
	mov r1, r8
	str r1, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x40]
	str r7, [r0, #0x44]
	str r4, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x34]
	adds r0, #0x4c
	movs r1, #0
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB06C: .4byte 0x08CEF054
