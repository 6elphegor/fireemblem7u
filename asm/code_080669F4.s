	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080669F4
sub_080669F4: @ 0x080669F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x18]
	mov ip, r3
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066A50
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	mov r8, r0
_08066A16:
	adds r3, r7, #0
	subs r5, r2, #1
	cmp r3, #0
	beq _08066A44
	movs r2, #1
	rsbs r2, r2, #0
	lsls r4, r6, #0xc
_08066A24:
	ldrh r0, [r1]
	cmp r6, r2
	beq _08066A30
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066A30:
	cmp ip, r2
	beq _08066A3A
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066A3A:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08066A24
_08066A44:
	mov r2, r8
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08066A16
_08066A50:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxTmModifyPal
EfxTmModifyPal: @ 0x08066A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066AB8
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	mov r8, r0
	ldr r0, _08066AC4 @ =0x08BDAF3C
	mov sb, r0
_08066A80:
	mov r4, ip
	subs r2, #1
	cmp r4, #0
	beq _08066AAE
	ldr r7, _08066AC8 @ =0x00000FFF
	mov r6, sb
	movs r5, #0xf
_08066A8E:
	ldrh r0, [r3]
	adds r1, r0, #0
	lsrs r0, r0, #0xc
	ands r0, r5
	subs r0, #6
	lsls r0, r0, #0x10
	ands r1, r7
	lsrs r0, r0, #0xf
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r1, r0, r1
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _08066A8E
_08066AAE:
	mov r1, r8
	lsrs r0, r1, #0xf
	adds r3, r3, r0
	cmp r2, #0
	bne _08066A80
_08066AB8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066AC4: .4byte 0x08BDAF3C
_08066AC8: .4byte 0x00000FFF

	thumb_func_start EfxTmCpyBG
EfxTmCpyBG: @ 0x08066ACC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	adds r2, r6, #0
	movs r3, #0x20
	bl EfxTmCpyExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxTmCpyBgHFlip
EfxTmCpyBgHFlip: @ 0x08066AFC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	adds r2, r6, #0
	movs r3, #0x20
	bl EfxTmCpyExtHFlip
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxTmCpyExt
EfxTmCpyExt: @ 0x08066B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	mov r8, r6
	ldr r6, [sp, #0x34]
	mov ip, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066BC8
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	subs r0, r6, r7
	lsls r0, r0, #0x10
	mov sl, r0
	subs r0, r3, r7
	lsls r0, r0, #0x10
	mov sb, r0
_08066B74:
	adds r1, r7, #0
	subs r6, r2, #1
	cmp r1, #0
	beq _08066BA6
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, r8
	lsls r3, r0, #0xc
_08066B84:
	ldrh r0, [r5]
	cmp r8, r2
	beq _08066B90
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066B90:
	cmp ip, r2
	beq _08066B9A
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066B9A:
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08066B84
_08066BA6:
	ldr r2, _08066BD8 @ =0xFFFF0000
	asrs r1, r2, #0x10
	ldr r0, [sp]
	cmp r0, r1
	beq _08066BB6
	mov r2, sl
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08066BB6:
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _08066BC2
	mov r1, sb
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_08066BC2:
	adds r2, r6, #0
	cmp r2, #0
	bne _08066B74
_08066BC8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066BD8: .4byte 0xFFFF0000

	thumb_func_start EfxTmCpyExtHFlip
EfxTmCpyExtHFlip: @ 0x08066BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r6, [sp, #0x34]
	mov sb, r6
	ldr r6, [sp, #0x38]
	mov r8, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r2, r2, #0x10
	lsls r0, r0, #1
	subs r0, #2
	adds r4, r4, r0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066C8A
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #8]
	mov r1, ip
	subs r0, r6, r1
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	mov sl, r0
_08066C2E:
	mov r1, ip
	subs r7, r2, #1
	cmp r1, #0
	beq _08066C68
	movs r2, #1
	rsbs r2, r2, #0
	mov r6, sb
	lsls r3, r6, #0xc
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r0, #0
_08066C44:
	ldrh r0, [r5]
	cmp sb, r2
	beq _08066C50
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066C50:
	cmp r8, r2
	beq _08066C5A
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066C5A:
	eors r0, r6
	strh r0, [r4]
	adds r5, #2
	subs r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08066C44
_08066C68:
	ldr r2, _08066C9C @ =0xFFFF0000
	asrs r1, r2, #0x10
	ldr r6, [sp]
	cmp r6, r1
	beq _08066C78
	ldr r2, [sp, #4]
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08066C78:
	ldr r6, [sp, #8]
	cmp r6, r1
	beq _08066C84
	mov r1, sl
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_08066C84:
	adds r2, r7, #0
	cmp r2, #0
	bne _08066C2E
_08066C8A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066C9C: .4byte 0xFFFF0000

	thumb_func_start sub_08066CA0
sub_08066CA0: @ 0x08066CA0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r0, #0
	mov ip, r0
	cmp r7, #0
	beq _08066D70
	movs r2, #0
_08066CB2:
	cmp r7, r2
	bgt _08066CC8
	mov r1, ip
	cmp r1, #0
	bne _08066CC4
	movs r0, #1
	mov ip, r0
	movs r0, #0xe
	b _08066D28
_08066CC4:
	movs r0, #0xff
	b _08066D28
_08066CC8:
	adds r0, r2, #1
	cmp r7, r0
	bne _08066CE4
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _08066CDA
	movs r0, #0xd
	b _08066D28
_08066CDA:
	adds r1, r2, #4
	cmp r6, r0
	bne _08066D6A
	movs r0, #0xc
	b _08066D66
_08066CE4:
	adds r4, r2, #2
	cmp r7, r4
	bne _08066D08
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _08066CF6
	movs r0, #0xb
	b _08066D28
_08066CF6:
	cmp r6, r0
	bne _08066CFE
	movs r0, #0xa
	b _08066D28
_08066CFE:
	adds r1, r2, #4
	cmp r6, r4
	bne _08066D6A
	movs r0, #9
	b _08066D66
_08066D08:
	adds r5, r2, #3
	cmp r7, r5
	bne _08066D3A
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _08066D1A
	movs r0, #8
	b _08066D28
_08066D1A:
	cmp r6, r0
	bne _08066D22
	movs r0, #7
	b _08066D28
_08066D22:
	cmp r6, r4
	bne _08066D30
	movs r0, #6
_08066D28:
	strh r0, [r3]
	adds r3, #2
	adds r1, r2, #4
	b _08066D6A
_08066D30:
	adds r1, r2, #4
	cmp r6, r5
	bne _08066D6A
	movs r0, #5
	b _08066D66
_08066D3A:
	adds r1, r2, #4
	cmp r7, r1
	blt _08066D6A
	cmp r6, r2
	bgt _08066D48
	movs r0, #4
	b _08066D66
_08066D48:
	cmp r6, r0
	bne _08066D50
	movs r0, #3
	b _08066D66
_08066D50:
	cmp r6, r4
	bne _08066D58
	movs r0, #2
	b _08066D66
_08066D58:
	cmp r6, r5
	bne _08066D60
	movs r0, #1
	b _08066D66
_08066D60:
	cmp r6, r1
	blt _08066D6A
	movs r0, #0
_08066D66:
	strh r0, [r3]
	adds r3, #2
_08066D6A:
	adds r2, r1, #0
	cmp r2, #0x28
	ble _08066CB2
_08066D70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrModifyBarfx
EkrModifyBarfx: @ 0x08066D78
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r3, #5
	ble _08066D86
	movs r0, #6
	b _08066D8E
_08066D86:
	ldr r0, _08066DA8 @ =0x082E5ACC
	lsls r1, r3, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_08066D8E:
	strh r0, [r2]
	adds r2, #2
	movs r1, #0
	movs r7, #0x10
	ldr r6, _08066DAC @ =0x082E5ADA
	subs r4, r3, #6
	movs r5, #7
_08066D9C:
	adds r0, r1, #0
	adds r0, #0xe
	cmp r3, r0
	blt _08066DB0
	strh r7, [r2]
	b _08066DC4
	.align 2, 0
_08066DA8: .4byte 0x082E5ACC
_08066DAC: .4byte 0x082E5ADA
_08066DB0:
	adds r0, r1, #6
	cmp r3, r0
	blt _08066DC2
	subs r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	b _08066DC4
_08066DC2:
	strh r5, [r2]
_08066DC4:
	adds r2, #2
	adds r1, #8
	cmp r1, #0x57
	ble _08066D9C
	cmp r3, #0x62
	ble _08066DD4
	movs r0, #0x17
	b _08066DEE
_08066DD4:
	cmp r3, #0x5d
	ble _08066DEC
	ldr r0, _08066DE8 @ =0x082E5AEC
	adds r1, r3, #0
	subs r1, #0x5e
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _08066DEE
	.align 2, 0
_08066DE8: .4byte 0x082E5AEC
_08066DEC:
	movs r0, #0x11
_08066DEE:
	strh r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrPalModifyUnused
EkrPalModifyUnused: @ 0x08066DF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	cmp r3, #0
	beq _08066EC8
	str r3, [sp, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_08066E2E:
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	mov r3, sb
	ands r3, r0
	mov sb, r3
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	str r7, [sp]
	movs r0, #0
	mov r3, sl
	bl Interpolate
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r7, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	mov r3, sl
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r7, [sp]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	mov r3, sl
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r2, [sp, #4]
	adds r2, #2
	str r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r3, #2
	str r3, [sp, #8]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x18]
	subs r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0
	bne _08066E2E
_08066EC8:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	cmp r1, r2
	beq _08066ED4
	movs r0, #0
	b _08066ED6
_08066ED4:
	movs r0, #1
_08066ED6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EfxPalBlackInOut
EfxPalBlackInOut: @ 0x08066EE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r3, #5
	movs r1, #0x10
	bl Div
	adds r6, r0, #0
	adds r0, r4, r5
	cmp r4, r0
	bge _08066F58
	mov r8, r0
	movs r0, #0x1f
	mov ip, r0
_08066F0C:
	lsls r0, r4, #5
	adds r7, r4, #1
	mov r1, sb
	adds r5, r1, r0
	movs r4, #0xf
_08066F16:
	ldrh r1, [r5]
	movs r2, #0x1f
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r0, ip
	ands r3, r0
	lsrs r1, r1, #0x1a
	ands r1, r0
	adds r0, r2, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r3, r3, r0
	adds r0, r1, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r5]
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _08066F16
	adds r4, r7, #0
	cmp r4, r8
	blt _08066F0C
_08066F58:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxPalWhiteInOut
EfxPalWhiteInOut: @ 0x08066F64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r3, #5
	movs r1, #0x10
	bl Div
	adds r6, r0, #0
	adds r0, r4, r5
	cmp r4, r0
	bge _08066FDA
	mov sb, r0
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0x1f
_08066F8C:
	lsls r0, r4, #5
	adds r4, #1
	mov ip, r4
	mov r1, sl
	adds r5, r1, r0
	movs r4, #0xf
_08066F98:
	ldrh r1, [r5]
	adds r2, r7, #0
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r0, r8
	ands r3, r0
	lsrs r1, r1, #0x1a
	ands r1, r0
	subs r0, r7, r2
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r2, r2, r0
	subs r0, r7, r3
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r3, r3, r0
	subs r0, r7, r1
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r5]
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _08066F98
	mov r4, ip
	cmp r4, sb
	blt _08066F8C
_08066FDA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxPalFlashingInOut
EfxPalFlashingInOut: @ 0x08066FE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	adds r6, r1, #0
	mov r8, r2
	adds r0, r3, #0
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #5
	movs r1, #0x10
	bl Div
	mov sl, r0
	lsls r4, r4, #5
	adds r0, r4, #0
	movs r1, #0x10
	bl Div
	mov sb, r0
	lsls r5, r5, #5
	adds r0, r5, #0
	movs r1, #0x10
	bl Div
	mov ip, r0
	mov r1, r8
	adds r0, r6, r1
	cmp r6, r0
	bge _0806708E
	str r0, [sp, #4]
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0x1f
_08067032:
	lsls r0, r6, #5
	adds r6, #1
	str r6, [sp, #8]
	ldr r1, [sp]
	adds r4, r1, r0
	movs r5, #0xf
_0806703E:
	ldrh r1, [r4]
	adds r2, r7, #0
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r6, r8
	ands r3, r6
	lsrs r1, r1, #0x1a
	ands r1, r6
	subs r0, r7, r2
	mov r6, sl
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r2, r2, r0
	subs r0, r7, r3
	mov r6, sb
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r3, r3, r0
	subs r0, r7, r1
	mov r6, ip
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _0806703E
	ldr r6, [sp, #8]
	ldr r0, [sp, #4]
	cmp r6, r0
	blt _08067032
_0806708E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxPalModifyPetrifyEffect
EfxPalModifyPetrifyEffect: @ 0x080670A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, r1, r2
	cmp r1, r0
	bge _08067106
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
_080670B8:
	movs r5, #0
	lsls r6, r1, #5
	adds r7, r1, #1
_080670BE:
	mov r1, sb
	adds r4, r1, r6
	lsls r0, r5, #1
	adds r4, r4, r0
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x15
	mov r1, r8
	ands r3, r1
	lsrs r2, r2, #0x1a
	ands r2, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r0, r1, #0
	movs r1, #0xa
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #5
	orrs r0, r1
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r4]
	adds r5, #1
	cmp r5, #0xf
	ble _080670BE
	adds r1, r7, #0
	cmp r1, sl
	blt _080670B8
_08067106:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxSplitColor
EfxSplitColor: @ 0x08067114
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	cmp r5, r6
	bhs _0806714C
	movs r7, #0x1f
	movs r0, #0x1f
	mov ip, r0
_08067128:
	ldrh r0, [r4]
	adds r4, #2
	adds r1, r0, #0
	mov r2, ip
	ands r1, r2
	lsrs r2, r0, #5
	ands r2, r7
	lsrs r0, r0, #0xa
	ands r0, r7
	strb r1, [r3]
	adds r3, #1
	strb r2, [r3]
	adds r3, #1
	strb r0, [r3]
	adds r3, #1
	adds r5, #1
	cmp r5, r6
	blo _08067128
_0806714C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxSplitColorPetrify
EfxSplitColorPetrify: @ 0x08067154
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	movs r6, #0
	cmp r6, r7
	bhs _080671A2
	movs r0, #0x1f
	mov r8, r0
_0806716A:
	ldrh r2, [r5]
	adds r5, #2
	movs r1, #0x1f
	ands r1, r2
	lsrs r3, r2, #5
	mov r0, r8
	ands r3, r0
	lsrs r2, r2, #0xa
	ands r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0xa
	bl Div
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	adds r6, #1
	cmp r6, r7
	blo _0806716A
_080671A2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080671AC
sub_080671AC: @ 0x080671AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	mov sb, r0
	movs r7, #0
	cmp r7, r8
	bhs _08067220
_080671C6:
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	adds r7, #1
	cmp r7, r8
	blo _080671C6
_08067220:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxDecodeSplitedPalette
EfxDecodeSplitedPalette: @ 0x0806722C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x1c]
	mov sb, r0
	ldr r7, [sp, #0x20]
	movs r0, #0
	mov r8, r0
	cmp r8, sb
	bhs _080672B8
_0806724A:
	ldr r0, [sp, #0x24]
	cmp r7, r0
	beq _0806728E
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r4, #2
	movs r0, #0
	ldrsh r3, [r4, r0]
	adds r4, #2
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r4, #2
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r1, r0, #8
	adds r0, r3, #0
	muls r0, r7, r0
	asrs r3, r0, #8
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r2, r0, #8
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r1, r1, r0
	adds r6, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r3, r3, r0
	adds r6, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r2, r2, r0
	adds r6, #1
	b _080672A0
_0806728E:
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r5, #1
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r5, #1
	movs r2, #0
	ldrsb r2, [r5, r2]
	adds r5, #1
_080672A0:
	lsls r0, r3, #5
	orrs r1, r0
	lsls r0, r2, #0xa
	orrs r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	movs r0, #1
	add r8, r0
	cmp r8, sb
	blo _0806724A
_080672B8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxChapterMapFadeOUT
EfxChapterMapFadeOUT: @ 0x080672C4
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackChapterMapPalette
	ldr r0, _080672E4 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080672E4: .4byte 0x02022860

	thumb_func_start sub_080672E8
sub_080672E8: @ 0x080672E8
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	adds r4, #1
	adds r1, r4, #0
	bl DivRem
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewEkrsubAnimeEmulator
NewEkrsubAnimeEmulator: @ 0x08067300
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r0, _08067348 @ =0x08BDAF50
	bl SpawnProc
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r3, r0, #0
	adds r3, #0x29
	strb r4, [r3]
	adds r3, #1
	strb r2, [r3]
	strh r5, [r0, #0x32]
	strh r6, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	mov r2, r8
	str r2, [r0, #0x44]
	str r1, [r0, #0x48]
	str r7, [r0, #0x4c]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067348: .4byte 0x08BDAF50

	thumb_func_start EkrsubAnimeEmulatorMain
EkrsubAnimeEmulatorMain: @ 0x0806734C
	push {r4, r5, lr}
	sub sp, #0x48
	adds r2, r0, #0
	ldr r1, [r2, #0x44]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _080673C4
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r1, #0x3f
	ldrb r0, [r0, #3]
	ands r1, r0
	cmp r1, #0
	bne _080673A2
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08067392
	cmp r0, #1
	bgt _08067384
	cmp r0, #0
	beq _0806738A
	b _080673C4
_08067384:
	cmp r0, #2
	beq _08067398
	b _080673C4
_0806738A:
	adds r0, r2, #0
	bl Proc_Break
	b _080673FE
_08067392:
	strh r0, [r2, #0x2c]
	strh r1, [r2, #0x2e]
	b _080673C4
_08067398:
	movs r0, #1
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	b _080673C2
_080673A2:
	cmp r1, #4
	bne _080673AA
	strh r3, [r2, #0x2c]
	b _080673BE
_080673AA:
	ldr r0, _08067408 @ =0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x48]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
	strh r0, [r2, #0x2c]
_080673BE:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
_080673C2:
	strh r0, [r2, #0x2e]
_080673C4:
	ldrh r0, [r2, #0x2c]
	subs r0, #1
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r3, [r0]
	cmp r3, #0
	bne _080673FE
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _080673FE
	str r0, [sp, #0x3c]
	mov r1, sp
	ldr r0, [r2, #0x4c]
	strh r0, [r1, #8]
	ldr r0, [r2, #0x50]
	str r0, [sp, #0x1c]
	ldrh r5, [r2, #0x32]
	ldrh r4, [r2, #0x34]
	adds r0, r5, r4
	strh r0, [r1, #2]
	ldrh r5, [r2, #0x3a]
	ldrh r4, [r2, #0x3c]
	adds r0, r5, r4
	strh r0, [r1, #4]
	mov r0, sp
	strh r3, [r0, #0xc]
	bl AnimDisplay
_080673FE:
	add sp, #0x48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067408: .4byte 0x0FFFFFFC

	thumb_func_start GetAnimSpriteRotScaleX
GetAnimSpriteRotScaleX: @ 0x0806740C
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08067424 @ =0x082E5AF8
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_08067424: .4byte 0x082E5AF8

	thumb_func_start GetAnimSpriteRotScaleY
GetAnimSpriteRotScaleY: @ 0x08067428
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08067440 @ =0x082E5B18
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_08067440: .4byte 0x082E5B18

	thumb_func_start BanimUpdateSpriteRotScale
BanimUpdateSpriteRotScale: @ 0x08067444
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r7, r0, #0
	ldr r1, _080675BC @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	str r0, [sp, #4]
	lsls r3, r3, #0x10
	mov sb, r3
	mov r0, r8
	orrs r0, r3
	str r0, [sp]
	ldr r4, _080675C0 @ =0xFFFF0004
	adds r1, r6, #0
	stm r1!, {r4}
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	adds r5, r6, #0
	adds r5, #0xc
	str r4, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x10
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r1, [r5, #4]
	rsbs r0, r1, #0
	strh r0, [r5, #4]
	ldrh r2, [r5, #6]
	rsbs r0, r2, #0
	strh r0, [r5, #6]
	adds r5, #0xc
	str r4, [r6, #0x18]
	adds r1, r6, #0
	adds r1, #0x1c
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r3, [r5, #8]
	rsbs r0, r3, #0
	strh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	rsbs r0, r1, #0
	strh r0, [r5, #0xa]
	adds r5, #0xc
	str r4, [r6, #0x24]
	adds r1, r6, #0
	adds r1, #0x28
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r2, [r5, #4]
	rsbs r0, r2, #0
	strh r0, [r5, #4]
	ldrh r3, [r5, #6]
	rsbs r0, r3, #0
	strh r0, [r5, #6]
	ldrh r1, [r5, #8]
	rsbs r0, r1, #0
	strh r0, [r5, #8]
	ldrh r2, [r5, #0xa]
	rsbs r0, r2, #0
	strh r0, [r5, #0xa]
	adds r6, #0x30
	ldr r0, [r7]
	cmp r0, #1
	beq _0806759C
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r0, sb
	asrs r5, r0, #0x10
_080674F6:
	ldr r2, [r7]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r2
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r2
	cmp r0, #0
	beq _08067518
	movs r3, #0x80
	lsls r3, r3, #0x13
	adds r1, r1, r3
_08067518:
	ldr r0, _080675C4 @ =0xC1FFFFFF
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r0, r0, r1
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	adds r0, r2, #0
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	subs r1, r4, r0
	movs r2, #6
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	adds r1, r0, #0
	movs r3, #6
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #6]
	ldr r0, [r7]
	bl GetAnimSpriteRotScaleY
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	subs r1, r4, r0
	movs r2, #8
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	adds r1, r0, #0
	movs r3, #8
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #8]
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [r7]
	cmp r0, #1
	bne _080674F6
_0806759C:
	ldr r0, [r7]
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #6]
	strh r0, [r6, #6]
	ldrh r0, [r7, #8]
	strh r0, [r6, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080675BC: .4byte 0xFFFF0000
_080675C0: .4byte 0xFFFF0004
_080675C4: .4byte 0xC1FFFFFF

	thumb_func_start EfxPlaySE
EfxPlaySE: @ 0x080675C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _08067608 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0806761E
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08067610
	bl RegisterEfxSoundSeExist
	adds r0, r5, #0
	bl Sound_SetBGMVolume
	ldr r0, _0806760C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0806761E
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _0806761E
	.align 2, 0
_08067608: .4byte 0x0202BBB8
_0806760C: .4byte 0x0202BBF8
_08067610:
	ldr r0, _08067624 @ =0x08BDAF68
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	strh r4, [r0, #0x2c]
_0806761E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067624: .4byte 0x08BDAF68

	thumb_func_start Loop6C_efxSoundSE
Loop6C_efxSoundSE: @ 0x08067628
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08067642
	adds r0, r4, #0
	bl Proc_Break
	b _08067670
_08067642:
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08067670
	bl RegisterEfxSoundSeExist
	ldr r0, [r4, #0x44]
	bl Sound_SetBGMVolume
	ldr r0, _08067678 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0806766A
	ldr r0, [r4, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_0806766A:
	adds r0, r4, #0
	bl Proc_Break
_08067670:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067678: .4byte 0x0202BBF8

	thumb_func_start DoM4aSongNumStop
DoM4aSongNumStop: @ 0x0806767C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxOverrideBgm
EfxOverrideBgm: @ 0x0806768C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r1, _080676B0 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080676AA
	adds r0, r2, #0
	bl SetBgmVolume
	adds r0, r4, #0
	bl OverrideBgm
_080676AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080676B0: .4byte 0x0202BBB8

	thumb_func_start StopBGM1
StopBGM1: @ 0x080676B4
	push {lr}
	ldr r0, _080676C0 @ =0x03005B10
	bl MPlayStop_rev01
	pop {r0}
	bx r0
	.align 2, 0
_080676C0: .4byte 0x03005B10

	thumb_func_start UnregisterEfxSoundSeExist
UnregisterEfxSoundSeExist: @ 0x080676C4
	ldr r1, _080676CC @ =0x020200A4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080676CC: .4byte 0x020200A4

	thumb_func_start RegisterEfxSoundSeExist
RegisterEfxSoundSeExist: @ 0x080676D0
	ldr r1, _080676D8 @ =0x020200A4
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080676D8: .4byte 0x020200A4

	thumb_func_start CheckEfxSoundSeExist
CheckEfxSoundSeExist: @ 0x080676DC
	ldr r0, _080676E4 @ =0x020200A4
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080676E4: .4byte 0x020200A4

	thumb_func_start M4aPlayWithPostionCtrl
M4aPlayWithPostionCtrl: @ 0x080676E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _08067714 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08067790
	cmp r2, #0
	beq _08067760
	cmp r6, #0x77
	bgt _08067718
	adds r0, r6, #0
	muls r0, r6, r0
	movs r1, #0x78
	bl Div
	adds r5, r0, #0
	subs r5, #0x78
	b _0806772C
	.align 2, 0
_08067714: .4byte 0x0202BBB8
_08067718:
	movs r0, #0xf0
	subs r0, r0, r6
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x78
	bl Div
	movs r1, #0x78
	subs r5, r1, r0
_0806772C:
	ldr r2, _08067754 @ =0x0869D668
	ldr r0, _08067758 @ =0x0869D6E0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r1, _0806775C @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl MPlayPanpotControl
	b _08067790
	.align 2, 0
_08067754: .4byte 0x0869D668
_08067758: .4byte 0x0869D6E0
_0806775C: .4byte 0x0000FFFF
_08067760:
	ldr r2, _08067798 @ =0x0869D668
	ldr r0, _0806779C @ =0x0869D6E0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _080677A0 @ =0x0000FFFF
	adds r0, r6, #0
	bl Screen2Pan
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayPanpotControl
_08067790:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067798: .4byte 0x0869D668
_0806779C: .4byte 0x0869D6E0
_080677A0: .4byte 0x0000FFFF

	thumb_func_start EfxPlaySEwithCmdCtrl
EfxPlaySEwithCmdCtrl: @ 0x080677A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	bl GetAnimAnotherSide
	adds r6, r0, #0
	mov r0, r8
	bl GetAISLayerId
	cmp r0, #1
	bne _080677C4
	b _08067B10
_080677C4:
	mov r0, r8
	bl GetAnimPosition
	adds r5, r0, #0
	cmp r5, #0
	bne _080677DC
	ldr r0, _080677D8 @ =0x0203E0D8
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _080677E2
	.align 2, 0
_080677D8: .4byte 0x0203E0D8
_080677DC:
	ldr r0, _0806780C @ =0x0203E0D8
	movs r3, #2
	ldrsh r4, [r0, r3]
_080677E2:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType1FromTerrain
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0x14
	bne _080677FE
	mov r0, r8
	bl IsAnimSoundInPositionMaybe
	cmp r0, #0
	bne _080677FE
	movs r7, #2
_080677FE:
	cmp r5, #0
	bne _08067814
	ldr r0, _08067810 @ =0x0203E0DC
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0806781A
	.align 2, 0
_0806780C: .4byte 0x0203E0D8
_08067810: .4byte 0x0203E0DC
_08067814:
	ldr r0, _08067858 @ =0x0203E0DC
	movs r3, #2
	ldrsh r0, [r0, r3]
_0806781A:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType2FromBaseCon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0806785C @ =0x0000FFFF
	mov r0, r8
	str r2, [sp]
	bl GetProperAnimSoundLocation
	mov r1, r8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	subs r0, #0x19
	ldr r2, [sp]
	cmp r0, #0x37
	bls _0806784C
	b _08067AEA
_0806784C:
	lsls r0, r0, #2
	ldr r1, _08067860 @ =_08067864
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08067858: .4byte 0x0203E0DC
_0806785C: .4byte 0x0000FFFF
_08067860: .4byte _08067864
_08067864: @ jump table
	.4byte _08067944 @ case 0
	.4byte _08067AEA @ case 1
	.4byte _08067A1E @ case 2
	.4byte _08067948 @ case 3
	.4byte _08067950 @ case 4
	.4byte _08067958 @ case 5
	.4byte _08067960 @ case 6
	.4byte _08067980 @ case 7
	.4byte _080679A0 @ case 8
	.4byte _080679E4 @ case 9
	.4byte _080679E8 @ case 10
	.4byte _080679EC @ case 11
	.4byte _080679F0 @ case 12
	.4byte _08067AEA @ case 13
	.4byte _08067AEA @ case 14
	.4byte _080679F8 @ case 15
	.4byte _080679FC @ case 16
	.4byte _08067A04 @ case 17
	.4byte _08067A0A @ case 18
	.4byte _08067AEA @ case 19
	.4byte _08067AEA @ case 20
	.4byte _08067AEA @ case 21
	.4byte _08067A14 @ case 22
	.4byte _08067AEA @ case 23
	.4byte _08067AEA @ case 24
	.4byte _08067AEA @ case 25
	.4byte _08067A1A @ case 26
	.4byte _08067A1E @ case 27
	.4byte _08067A38 @ case 28
	.4byte _08067A48 @ case 29
	.4byte _08067A4C @ case 30
	.4byte _08067A50 @ case 31
	.4byte _08067AEA @ case 32
	.4byte _08067A54 @ case 33
	.4byte _08067A5C @ case 34
	.4byte _08067A62 @ case 35
	.4byte _08067AEA @ case 36
	.4byte _08067A74 @ case 37
	.4byte _08067A78 @ case 38
	.4byte _08067A7E @ case 39
	.4byte _08067A88 @ case 40
	.4byte _08067A8C @ case 41
	.4byte _08067A90 @ case 42
	.4byte _08067A98 @ case 43
	.4byte _08067A9E @ case 44
	.4byte _08067AA8 @ case 45
	.4byte _08067AEA @ case 46
	.4byte _08067AB0 @ case 47
	.4byte _08067AB4 @ case 48
	.4byte _08067ABC @ case 49
	.4byte _08067AC2 @ case 50
	.4byte _08067ACC @ case 51
	.4byte _08067AD4 @ case 52
	.4byte _08067AEA @ case 53
	.4byte _08067ADC @ case 54
	.4byte _08067AE4 @ case 55
_08067944:
	movs r4, #0xd1
	b _08067AEC
_08067948:
	ldr r1, _0806794C @ =0x08BDB344
	b _08067A20
	.align 2, 0
_0806794C: .4byte 0x08BDB344
_08067950:
	ldr r1, _08067954 @ =0x08BDB360
	b _08067A20
	.align 2, 0
_08067954: .4byte 0x08BDB360
_08067958:
	ldr r1, _0806795C @ =0x08BDB37C
	b _08067A20
	.align 2, 0
_0806795C: .4byte 0x08BDB37C
_08067960:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080679C8
	cmp r0, #1
	bgt _080679BE
	cmp r0, #0
	bne _080679CE
	movs r4, #0xd2
	b _080679CE
_08067980:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080679C8
	cmp r0, #1
	bgt _080679BE
	cmp r0, #0
	bne _080679CE
	movs r4, #0xd3
	b _080679CE
_080679A0:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080679C8
	cmp r0, #1
	bgt _080679BE
	cmp r0, #0
	beq _080679C4
	b _080679CE
_080679BE:
	cmp r0, #2
	beq _080679CC
	b _080679CE
_080679C4:
	movs r4, #0xd4
	b _080679CE
_080679C8:
	movs r4, #0xd5
	b _080679CE
_080679CC:
	ldr r4, _080679E0 @ =0x000002CE
_080679CE:
	adds r0, r6, #0
	bl GetProperAnimSoundLocation
	ldrh r6, [r6, #2]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _08067AEC
	.align 2, 0
_080679E0: .4byte 0x000002CE
_080679E4:
	movs r4, #0xc9
	b _08067AEC
_080679E8:
	movs r4, #0xc8
	b _08067AEC
_080679EC:
	movs r4, #0xca
	b _08067AEC
_080679F0:
	ldr r4, _080679F4 @ =0x00000263
	b _08067A3A
	.align 2, 0
_080679F4: .4byte 0x00000263
_080679F8:
	movs r4, #0xf6
	b _08067AEC
_080679FC:
	ldr r4, _08067A00 @ =0x00000141
	b _08067AEC
	.align 2, 0
_08067A00: .4byte 0x00000141
_08067A04:
	movs r4, #0xa1
	lsls r4, r4, #1
	b _08067AEC
_08067A0A:
	ldr r4, _08067A10 @ =0x00000267
	b _08067A3A
	.align 2, 0
_08067A10: .4byte 0x00000267
_08067A14:
	movs r4, #0xbe
	lsls r4, r4, #2
	b _08067AEC
_08067A1A:
	movs r4, #0xe7
	b _08067AEC
_08067A1E:
	ldr r1, _08067A34 @ =0x08BDB328
_08067A20:
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	b _08067AEC
	.align 2, 0
_08067A34: .4byte 0x08BDB328
_08067A38:
	ldr r4, _08067A44 @ =0x00000265
_08067A3A:
	cmp r5, #0
	bne _08067AEC
	subs r4, #1
	b _08067AEC
	.align 2, 0
_08067A44: .4byte 0x00000265
_08067A48:
	movs r4, #0xce
	b _08067AEC
_08067A4C:
	movs r4, #0xcf
	b _08067AEC
_08067A50:
	movs r4, #0xcb
	b _08067AEC
_08067A54:
	ldr r4, _08067A58 @ =0x000002D3
	b _08067AEC
	.align 2, 0
_08067A58: .4byte 0x000002D3
_08067A5C:
	movs r4, #0xb5
	lsls r4, r4, #2
	b _08067AEC
_08067A62:
	ldr r4, _08067A70 @ =0x00000263
	cmp r5, #0
	bne _08067A6A
	subs r4, #1
_08067A6A:
	movs r1, #0x80
	mov r8, r1
	b _08067AEC
	.align 2, 0
_08067A70: .4byte 0x00000263
_08067A74:
	movs r4, #0xf1
	b _08067AEC
_08067A78:
	movs r4, #0x9b
	lsls r4, r4, #1
	b _08067AEC
_08067A7E:
	ldr r4, _08067A84 @ =0x00000117
	b _08067AEC
	.align 2, 0
_08067A84: .4byte 0x00000117
_08067A88:
	movs r4, #0xeb
	b _08067AEC
_08067A8C:
	movs r4, #0xea
	b _08067AEC
_08067A90:
	ldr r4, _08067A94 @ =0x000002CF
	b _08067AEC
	.align 2, 0
_08067A94: .4byte 0x000002CF
_08067A98:
	movs r4, #0xb4
	lsls r4, r4, #2
	b _08067AEC
_08067A9E:
	ldr r4, _08067AA4 @ =0x000002D1
	b _08067AEC
	.align 2, 0
_08067AA4: .4byte 0x000002D1
_08067AA8:
	ldr r4, _08067AAC @ =0x000002D2
	b _08067AEC
	.align 2, 0
_08067AAC: .4byte 0x000002D2
_08067AB0:
	movs r4, #0xed
	b _08067AEC
_08067AB4:
	ldr r4, _08067AB8 @ =0x00000135
	b _08067AEC
	.align 2, 0
_08067AB8: .4byte 0x00000135
_08067ABC:
	movs r4, #0x9a
	lsls r4, r4, #1
	b _08067AEC
_08067AC2:
	ldr r4, _08067AC8 @ =0x000002DD
	b _08067AEC
	.align 2, 0
_08067AC8: .4byte 0x000002DD
_08067ACC:
	ldr r4, _08067AD0 @ =0x000002DE
	b _08067AEC
	.align 2, 0
_08067AD0: .4byte 0x000002DE
_08067AD4:
	ldr r4, _08067AD8 @ =0x000002DF
	b _08067AEC
	.align 2, 0
_08067AD8: .4byte 0x000002DF
_08067ADC:
	ldr r4, _08067AE0 @ =0x000002F7
	b _08067AEC
	.align 2, 0
_08067AE0: .4byte 0x000002F7
_08067AE4:
	movs r4, #0xba
	lsls r4, r4, #2
	b _08067AEC
_08067AEA:
	movs r4, #0
_08067AEC:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08067B10
	mov r1, r8
	adds r0, r4, #0
	str r3, [sp, #4]
	bl EfxPlaySE
	ldr r3, [sp, #4]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	adds r0, r4, #0
	bl M4aPlayWithPostionCtrl
_08067B10:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetEfxSoundType1FromTerrain
GetEfxSoundType1FromTerrain: @ 0x08067B20
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08067B32
_08067B2E:
	movs r0, #0
	b _08067C66
_08067B32:
	cmp r4, #0x40
	bls _08067B38
	b _08067C64
_08067B38:
	lsls r0, r4, #2
	ldr r1, _08067B44 @ =_08067B48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08067B44: .4byte _08067B48
_08067B48: @ jump table
	.4byte _08067C64 @ case 0
	.4byte _08067B2E @ case 1
	.4byte _08067B2E @ case 2
	.4byte _08067B2E @ case 3
	.4byte _08067B2E @ case 4
	.4byte _08067B2E @ case 5
	.4byte _08067C60 @ case 6
	.4byte _08067C60 @ case 7
	.4byte _08067C60 @ case 8
	.4byte _08067C60 @ case 9
	.4byte _08067B2E @ case 10
	.4byte _08067C60 @ case 11
	.4byte _08067C4C @ case 12
	.4byte _08067C4C @ case 13
	.4byte _08067C58 @ case 14
	.4byte _08067C58 @ case 15
	.4byte _08067C50 @ case 16
	.4byte _08067B2E @ case 17
	.4byte _08067C54 @ case 18
	.4byte _08067C5C @ case 19
	.4byte _08067C5C @ case 20
	.4byte _08067C50 @ case 21
	.4byte _08067C50 @ case 22
	.4byte _08067C60 @ case 23
	.4byte _08067C60 @ case 24
	.4byte _08067B2E @ case 25
	.4byte _08067B2E @ case 26
	.4byte _08067B2E @ case 27
	.4byte _08067B2E @ case 28
	.4byte _08067C60 @ case 29
	.4byte _08067C60 @ case 30
	.4byte _08067C60 @ case 31
	.4byte _08067C60 @ case 32
	.4byte _08067C60 @ case 33
	.4byte _08067B2E @ case 34
	.4byte _08067B2E @ case 35
	.4byte _08067C60 @ case 36
	.4byte _08067B2E @ case 37
	.4byte _08067C54 @ case 38
	.4byte _08067B2E @ case 39
	.4byte _08067B2E @ case 40
	.4byte _08067B2E @ case 41
	.4byte _08067C54 @ case 42
	.4byte _08067B2E @ case 43
	.4byte _08067C64 @ case 44
	.4byte _08067C60 @ case 45
	.4byte _08067C64 @ case 46
	.4byte _08067B2E @ case 47
	.4byte _08067C60 @ case 48
	.4byte _08067C60 @ case 49
	.4byte _08067C60 @ case 50
	.4byte _08067B2E @ case 51
	.4byte _08067C64 @ case 52
	.4byte _08067C64 @ case 53
	.4byte _08067C50 @ case 54
	.4byte _08067C60 @ case 55
	.4byte _08067B2E @ case 56
	.4byte _08067B2E @ case 57
	.4byte _08067C54 @ case 58
	.4byte _08067C54 @ case 59
	.4byte _08067C50 @ case 60
	.4byte _08067C54 @ case 61
	.4byte _08067C60 @ case 62
	.4byte _08067B2E @ case 63
	.4byte _08067B2E @ case 64
_08067C4C:
	movs r0, #1
	b _08067C66
_08067C50:
	movs r0, #2
	b _08067C66
_08067C54:
	movs r0, #3
	b _08067C66
_08067C58:
	movs r0, #4
	b _08067C66
_08067C5C:
	movs r0, #5
	b _08067C66
_08067C60:
	movs r0, #6
	b _08067C66
_08067C64:
	movs r0, #0
_08067C66:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start IsAnimSoundInPositionMaybe
IsAnimSoundInPositionMaybe: @ 0x08067C6C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetProperAnimSoundLocation
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r5, r0, r1
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08067C8A
	cmp r5, #0x58
	bgt _08067C92
	b _08067C8E
_08067C8A:
	cmp r5, #0x97
	ble _08067C92
_08067C8E:
	movs r0, #1
	b _08067C94
_08067C92:
	movs r0, #0
_08067C94:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetEfxSoundType2FromBaseCon
GetEfxSoundType2FromBaseCon: @ 0x08067C9C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #4
	bls _08067CBE
	cmp r0, #8
	bhi _08067CB0
	movs r1, #1
	b _08067CBE
_08067CB0:
	cmp r0, #0xb
	bhi _08067CB8
	movs r1, #2
	b _08067CBE
_08067CB8:
	cmp r2, #0xf
	bhi _08067CBE
	movs r1, #3
_08067CBE:
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_08067CC4
sub_08067CC4: @ 0x08067CC4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08067D04 @ =0x0203E05E
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r1, r6, #1
	adds r6, r1, r0
	adds r0, r6, #0
	bl GetEfxHp
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #2
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, r0
	beq _08067D0C
	cmp r0, #0
	beq _08067D08
	movs r0, #0
	b _08067D0E
	.align 2, 0
_08067D04: .4byte 0x0203E05E
_08067D08:
	movs r0, #1
	b _08067D0E
_08067D0C:
	movs r0, #2
_08067D0E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start EfxPlayHittedSFX
EfxPlayHittedSFX: @ 0x08067D14
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08067D38 @ =0x0000FFFF
	bl EfxPlayCriticalHittedSFX
	adds r0, r5, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08067D46
	cmp r0, #1
	bgt _08067D3C
	cmp r0, #0
	beq _08067D42
	b _08067D4C
	.align 2, 0
_08067D38: .4byte 0x0000FFFF
_08067D3C:
	cmp r0, #2
	beq _08067D4A
	b _08067D4C
_08067D42:
	movs r4, #0xd4
	b _08067D4C
_08067D46:
	movs r4, #0xd5
	b _08067D4C
_08067D4A:
	ldr r4, _08067D74 @ =0x000002CE
_08067D4C:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08067D6E
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08067D6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067D74: .4byte 0x000002CE

	thumb_func_start EfxPlayCriticalHittedSFX
EfxPlayCriticalHittedSFX: @ 0x08067D78
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08067DB4
	cmp r0, #0
	blt _08067DB4
	adds r0, r5, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08067DB4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd8
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xd8
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08067DB4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxCheckRetaliation
EfxCheckRetaliation: @ 0x08067DBC
	ldr r2, _08067DD4 @ =0x0203A4F0
	movs r1, #8
	ldrb r2, [r2, #2]
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	rsbs r1, r1, #0
	lsrs r1, r1, #0x1f
	cmp r0, r1
	beq _08067DD8
	movs r0, #0
	b _08067DDA
	.align 2, 0
_08067DD4: .4byte 0x0203A4F0
_08067DD8:
	movs r0, #1
_08067DDA:
	bx lr

	thumb_func_start sub_08067DDC
sub_08067DDC: @ 0x08067DDC
	push {lr}
	cmp r0, #0
	beq _08067E40
	bl GetItemIid
	subs r0, #0x4a
	cmp r0, #0xe
	bhi _08067E40
	lsls r0, r0, #2
	ldr r1, _08067DF8 @ =_08067DFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08067DF8: .4byte _08067DFC
_08067DFC: @ jump table
	.4byte _08067E38 @ case 0
	.4byte _08067E38 @ case 1
	.4byte _08067E38 @ case 2
	.4byte _08067E38 @ case 3
	.4byte _08067E38 @ case 4
	.4byte _08067E38 @ case 5
	.4byte _08067E3C @ case 6
	.4byte _08067E3C @ case 7
	.4byte _08067E3C @ case 8
	.4byte _08067E40 @ case 9
	.4byte _08067E40 @ case 10
	.4byte _08067E40 @ case 11
	.4byte _08067E38 @ case 12
	.4byte _08067E40 @ case 13
	.4byte _08067E38 @ case 14
_08067E38:
	movs r0, #2
	b _08067E42
_08067E3C:
	movs r0, #1
	b _08067E42
_08067E40:
	movs r0, #0
_08067E42:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EkrPlayMainBGM
EkrPlayMainBGM: @ 0x08067E48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08067E94 @ =0x0203E094
	ldr r1, _08067E98 @ =0x0203E098
	ldr r5, [r0]
	ldr r6, [r1]
	ldr r1, _08067E9C @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08067E64
	b _080680C8
_08067E64:
	ldr r1, _08067EA0 @ =0x020200A0
	movs r0, #1
	str r0, [r1]
	ldr r1, _08067EA4 @ =0x0203E020
	ldr r0, _08067EA8 @ =0x0203E00C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0x20
	mov r8, r1
	ldrh r0, [r0]
	cmp r0, #1
	beq _08067E84
	movs r2, #0x1f
	mov r8, r2
_08067E84:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08067EAC
	bl sub_08003F6C
	b _08067EB4
	.align 2, 0
_08067E94: .4byte 0x0203E094
_08067E98: .4byte 0x0203E098
_08067E9C: .4byte 0x0202BBB8
_08067EA0: .4byte 0x020200A0
_08067EA4: .4byte 0x0203E020
_08067EA8: .4byte 0x0203E00C
_08067EAC:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _08067EC0
_08067EB4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x48
	bl EfxOverrideBgm
	b _080680CE
_08067EC0:
	ldr r0, _08067ED4 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _08067ED8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1b
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067ED4: .4byte 0x0203E02C
_08067ED8:
	ldr r7, _08067F54 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r7, r1]
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldr r0, _08067F58 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x3e
	beq _08067EEE
	movs r4, #0
_08067EEE:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	beq _08067EF8
	movs r4, #0
_08067EF8:
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	cmp r0, #0x27
	beq _08067F02
	movs r4, #0
_08067F02:
	cmp r4, #1
	beq _08067F48
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsWeaponLegency
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08067F1C
	movs r4, #1
_08067F1C:
	movs r0, #1
	bl EkrCheckAttackRound
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08067F2A
	movs r4, #0
_08067F2A:
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bne _08067F34
	movs r4, #0
_08067F34:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	bne _08067F3E
	movs r4, #0
_08067F3E:
	cmp r0, #0x86
	bne _08067F44
	movs r4, #0
_08067F44:
	cmp r4, #1
	bne _08067F5C
_08067F48:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1c
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067F54: .4byte 0x0203E010
_08067F58: .4byte 0x0202BBF8
_08067F5C:
	cmp r0, #0x86
	bne _08067F7C
	bl sub_08079A9C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08067F78
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x6f
	bl EfxOverrideBgm
	b _080680CE
_08067F78:
	bl sub_08079A90
_08067F7C:
	adds r0, r5, #0
	bl GetBanimBossBGM
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl GetUnitByPid
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08067F9A
	movs r4, #1
	rsbs r4, r4, #0
_08067F9A:
	ldr r0, _08067FBC @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08067FA8
	movs r4, #1
	rsbs r4, r4, #0
_08067FA8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08067FC0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067FBC: .4byte 0x0203E010
_08067FC0:
	movs r4, #0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08067FEA
	ldr r0, _08067FFC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x2e
	bne _08067FE4
	movs r4, #1
_08067FE4:
	cmp r0, #0x2f
	bne _08067FEA
	movs r4, #1
_08067FEA:
	cmp r4, #1
	bne _08068000
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x14
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067FFC: .4byte 0x0202BBF8
_08068000:
	movs r4, #0
	ldr r0, [r6, #4]
	ldrb r1, [r0, #4]
	adds r3, r0, #0
	cmp r1, #0x40
	bne _08068024
	ldr r0, _08068034 @ =0x0203A3D8
	ldrh r2, [r0]
	ands r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08068024
	movs r4, #1
_08068024:
	cmp r4, #1
	bne _08068038
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1d
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08068034: .4byte 0x0203A3D8
_08068038:
	movs r4, #0
	ldrb r3, [r3, #4]
	cmp r3, #0x41
	bne _0806805C
	ldr r0, _0806806C @ =0x0203A3D8
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806805C
	movs r4, #1
_0806805C:
	cmp r4, #1
	bne _08068070
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1e
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_0806806C: .4byte 0x0203A3D8
_08068070:
	movs r0, #0
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _08068084
	ldr r0, _08068080 @ =0x0203A3F0
	b _08068090
	.align 2, 0
_08068080: .4byte 0x0203A3F0
_08068084:
	movs r0, #1
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _080680A0
	ldr r0, _0806809C @ =0x0203A470
_08068090:
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08067DDC
	b _080680A2
	.align 2, 0
_0806809C: .4byte 0x0203A470
_080680A0:
	movs r0, #0
_080680A2:
	cmp r0, #1
	beq _080680B0
	cmp r0, #2
	bne _080680B4
	movs r2, #0x1a
	mov r8, r2
	b _080680B4
_080680B0:
	movs r0, #0x19
	mov r8, r0
_080680B4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _080680C8
	movs r1, #0x80
	lsls r1, r1, #1
	mov r0, r8
	bl EfxOverrideBgm
	b _080680CE
_080680C8:
	ldr r1, _080680D8 @ =0x020200A0
	movs r0, #0
	str r0, [r1]
_080680CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080680D8: .4byte 0x020200A0

	thumb_func_start EkrRestoreBGM
EkrRestoreBGM: @ 0x080680DC
	push {lr}
	bl CheckBanimHensei
	cmp r0, #1
	beq _080680FA
	ldr r1, _08068100 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080680FA
	ldr r0, _08068104 @ =0x020200A0
	ldr r0, [r0]
	cmp r0, #0
	bne _08068108
_080680FA:
	bl MakeBgmOverridePersist
	b _0806810C
	.align 2, 0
_08068100: .4byte 0x0202BBB8
_08068104: .4byte 0x020200A0
_08068108:
	bl sub_08003AF8
_0806810C:
	pop {r0}
	bx r0

	thumb_func_start GetBanimBossBGM
GetBanimBossBGM: @ 0x08068110
	push {r4, r5, lr}
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	movs r3, #0
	ldr r0, _08068148 @ =0x08BDAF80
	ldr r1, [r0]
	movs r4, #1
	rsbs r4, r4, #0
	adds r5, r0, #0
	cmp r1, r4
	beq _0806813A
	cmp r2, r1
	beq _0806813A
	adds r1, r5, #0
_0806812C:
	adds r1, #8
	adds r3, #2
	ldr r0, [r1]
	cmp r0, r4
	beq _0806813A
	cmp r2, r0
	bne _0806812C
_0806813A:
	adds r0, r3, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08068148: .4byte 0x08BDAF80

	thumb_func_start GetProperAnimSoundLocation
GetProperAnimSoundLocation: @ 0x0806814C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, [r0, #0x3c]
	ldr r3, [r2]
	ldr r1, _0806817C @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08068170
	ldr r7, _08068180 @ =0x0000FFFF
	ands r7, r3
	cmp r7, #0
	beq _08068170
_08068168:
	subs r7, #1
	adds r2, #0xc
	cmp r7, #0
	bne _08068168
_08068170:
	adds r6, r2, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	b _080681B8
	.align 2, 0
_0806817C: .4byte 0xFFFF0000
_08068180: .4byte 0x0000FFFF
_08068184:
	movs r0, #6
	ldrsh r5, [r6, r0]
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r5, r5, r0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleY
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	muls r0, r5, r0
	add r8, r0
	adds r7, r7, r1
	adds r6, #0xc
_080681B8:
	ldr r0, [r6]
	cmp r0, #1
	bne _08068184
	cmp r7, #0
	bne _080681CC
	ldr r0, _080681C8 @ =0x7FFFFFFF
	b _080681D4
	.align 2, 0
_080681C8: .4byte 0x7FFFFFFF
_080681CC:
	mov r0, r8
	adds r1, r7, #0
	bl Div
_080681D4:
	mov r8, r0
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PlaySFX
PlaySFX: @ 0x080681E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl EfxPlaySE
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl M4aPlayWithPostionCtrl
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start PlaySfxAutomatically
PlaySfxAutomatically: @ 0x08068200
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl EfxPlaySE
	adds r0, r4, #0
	bl GetProperAnimSoundLocation
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EkrClasschgFinished
EkrClasschgFinished: @ 0x08068220
	ldr r0, _08068230 @ =0x020200A8
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08068234
	movs r0, #0
	b _08068236
	.align 2, 0
_08068230: .4byte 0x020200A8
_08068234:
	movs r0, #1
_08068236:
	bx lr

	thumb_func_start EndEkrClasschg
EndEkrClasschg: @ 0x08068238
	push {lr}
	ldr r0, _08068248 @ =0x020200A8
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08068248: .4byte 0x020200A8

	thumb_func_start NewEkrClassChg
NewEkrClassChg: @ 0x0806824C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NewEfxSpellCast
	ldr r4, _08068274 @ =0x020200A8
	ldr r0, _08068278 @ =0x08BDB398
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068274: .4byte 0x020200A8
_08068278: .4byte 0x08BDB398

	thumb_func_start sub_0806827C
sub_0806827C: @ 0x0806827C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _080682D8
	ldr r0, [r4, #0x5c]
	bl DisableEfxStatusUnits
	adds r0, r5, #0
	bl DisableEfxStatusUnits
	adds r0, r5, #0
	bl sub_08068540
	adds r0, r5, #0
	bl sub_08068638
	ldr r2, _080682D4 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r3, [r2, #1]
	ands r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	b _0806852A
	.align 2, 0
_080682D4: .4byte 0x03002870
_080682D8:
	cmp r1, #0x5f
	bne _08068308
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	ldr r0, _08068304 @ =0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	b _0806852A
	.align 2, 0
_08068304: .4byte 0x0000013B
_08068308:
	cmp r1, #0x6a
	bne _0806832C
	ldr r1, [r4, #0x5c]
	ldr r0, _08068328 @ =0x0000F3FF
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	ldr r1, [r4, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r2, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	b _0806852A
	.align 2, 0
_08068328: .4byte 0x0000F3FF
_0806832C:
	cmp r1, #0x74
	bne _0806833C
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #0
	bl sub_08068994
	b _0806852A
_0806833C:
	cmp r1, #0x78
	bne _08068348
	ldr r0, [r4, #0x5c]
	bl sub_0806873C
	b _0806852A
_08068348:
	cmp r1, #0x80
	bne _08068354
	movs r0, #1
	bl SetAnimStateHidden
	b _0806852A
_08068354:
	cmp r1, #0x7e
	bne _08068398
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x38
	movs r2, #7
	movs r3, #0
	bl NewefxRestRST
	adds r2, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #0x40
	str r1, [sp]
	adds r1, r2, #0
	movs r2, #0x38
	movs r3, #0
	bl NewEfxClasschgRST
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	movs r2, #0
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0x10
	bl NewEfxALPHA
	b _0806852A
_08068398:
	cmp r1, #0xf2
	bne _08068430
	ldr r0, [r4, #0x5c]
	bl sub_08068584
	ldr r0, [r4, #0x5c]
	bl sub_080686BC
	ldr r6, _0806842C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x38
	movs r2, #7
	movs r3, #0x40
	bl NewefxRestRST
	adds r2, r0, #0
	ldr r0, [r4, #0x5c]
	mov r3, r8
	str r3, [sp]
	adds r1, r2, #0
	movs r2, #0x38
	movs r3, #0x40
	bl NewEfxClasschgRST
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	movs r2, #0
	bl NewEfxRestWINH_
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	ldr r0, [r4, #0x5c]
	str r1, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #0x9e
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	b _0806850E
	.align 2, 0
_0806842C: .4byte 0x03002870
_08068430:
	movs r0, #0x9c
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068460
	movs r0, #0
	bl SetAnimStateUnHidden
	ldr r0, _0806845C @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #1
	bl sub_08068994
	b _0806852A
	.align 2, 0
_0806845C: .4byte 0x0000F3FF
_08068460:
	movs r0, #0x9f
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068482
	adds r0, r5, #0
	bl sub_0806873C
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _0806852A
_08068482:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	movs r0, #0xa5
	lsls r0, r0, #1
	cmp r1, r0
	bne _080684A4
	ldr r0, _080684A0 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	b _0806852A
	.align 2, 0
_080684A0: .4byte 0x0000F3FF
_080684A4:
	movs r0, #0xad
	lsls r0, r0, #1
	cmp r1, r0
	bne _080684BC
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x46
	bl NewEfxWhiteOUT
	b _0806852A
_080684BC:
	movs r0, #0xb2
	lsls r0, r0, #1
	cmp r1, r0
	bne _0806851C
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_080687A0
	adds r0, r5, #0
	movs r1, #0x82
	bl NewEfxClasschgCLONE
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x5a
	movs r2, #0x28
	movs r3, #0xe
	bl NewEfxALPHA
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0xa
	adds r3, r4, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0
	bl NewEfxRestWINH_
	ldr r0, _08068518 @ =0x0000013D
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r4, #0
_0806850E:
	movs r3, #1
	bl PlaySFX
	b _0806852A
	.align 2, 0
_08068518: .4byte 0x0000013D
_0806851C:
	movs r0, #0x94
	lsls r0, r0, #2
	cmp r1, r0
	bne _0806852A
	adds r0, r4, #0
	bl Proc_Break
_0806852A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrClasschgRegisterDone
EkrClasschgRegisterDone: @ 0x08068538
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_08068540
sub_08068540: @ 0x08068540
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08068570 @ =0x08BDB3B8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08068574 @ =0x082E5B38
	str r1, [r0, #0x48]
	ldr r1, _08068578 @ =0x08BDB3D0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806857C @ =0x08BDB42C
	str r1, [r0, #0x54]
	ldr r1, _08068580 @ =0x08BDB488
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068570: .4byte 0x08BDB3B8
_08068574: .4byte 0x082E5B38
_08068578: .4byte 0x08BDB3D0
_0806857C: .4byte 0x08BDB42C
_08068580: .4byte 0x08BDB488

	thumb_func_start sub_08068584
sub_08068584: @ 0x08068584
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080685B4 @ =0x08BDB3B8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080685B8 @ =0x082E5BAA
	str r1, [r0, #0x48]
	ldr r1, _080685BC @ =0x08BDB3D0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080685C0 @ =0x08BDB42C
	str r1, [r0, #0x54]
	ldr r1, _080685C4 @ =0x08BDB488
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080685B4: .4byte 0x08BDB3B8
_080685B8: .4byte 0x082E5BAA
_080685BC: .4byte 0x08BDB3D0
_080685C0: .4byte 0x08BDB42C
_080685C4: .4byte 0x08BDB488

	thumb_func_start sub_080685C8
sub_080685C8: @ 0x080685C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08068616
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	b _0806862C
_08068616:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0806862C
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
_0806862C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08068638
sub_08068638: @ 0x08068638
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08068650 @ =0x08BDB4E4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068650: .4byte 0x08BDB4E4

	thumb_func_start sub_08068654
sub_08068654: @ 0x08068654
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08068696
	cmp r0, #0x11
	beq _08068696
	cmp r0, #0x22
	beq _08068696
	cmp r0, #0x28
	beq _08068696
	cmp r0, #0x2e
	beq _08068696
	cmp r0, #0x34
	beq _08068696
	cmp r0, #0x3a
	beq _08068696
	cmp r0, #0x3e
	beq _08068696
	cmp r0, #0x42
	beq _08068696
	cmp r0, #0x44
	beq _08068696
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	beq _08068696
	cmp r0, #0x48
	bne _080686AC
_08068696:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r2, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _080686B6
_080686AC:
	cmp r0, #0x50
	bne _080686B6
	adds r0, r2, #0
	bl Proc_Break
_080686B6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080686BC
sub_080686BC: @ 0x080686BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080686D4 @ =0x08BDB4FC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080686D4: .4byte 0x08BDB4FC

	thumb_func_start sub_080686D8
sub_080686D8: @ 0x080686D8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x56
	beq _08068716
	cmp r0, #0x58
	beq _08068716
	cmp r0, #0x5a
	beq _08068716
	cmp r0, #0x5c
	beq _08068716
	cmp r0, #0x5e
	beq _08068716
	cmp r0, #0x60
	beq _08068716
	cmp r0, #0x62
	beq _08068716
	cmp r0, #0x64
	beq _08068716
	cmp r0, #0x66
	beq _08068716
	cmp r0, #0x68
	beq _08068716
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x6a
	bne _0806872C
_08068716:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r2, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08068736
_0806872C:
	cmp r0, #0x6e
	bne _08068736
	adds r0, r2, #0
	bl Proc_Break
_08068736:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806873C
sub_0806873C: @ 0x0806873C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08068778 @ =0x08BDB514
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0806877C @ =0x08BB7280
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldr r0, _08068780 @ =0x081FC634
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08068784 @ =0x081FC19C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068778: .4byte 0x08BDB514
_0806877C: .4byte 0x08BB7280
_08068780: .4byte 0x081FC634
_08068784: .4byte 0x081FC19C

	thumb_func_start sub_08068788
sub_08068788: @ 0x08068788
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080687A0
sub_080687A0: @ 0x080687A0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08068890 @ =0x08BDB534
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _08068894 @ =0x081F65A0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08068898 @ =0x082739E4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806889C @ =0x08273AE4
	ldr r1, _080688A0 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _080688A4 @ =0x03002870
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r4, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
	mov r6, ip
	adds r6, #0x37
	movs r3, #0x20
	ldrb r1, [r6]
	orrs r1, r3
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r7, ip
	strb r0, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6]
	ldr r0, _080688A8 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080688AC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, ip
	adds r0, #0x3d
	ldrb r7, [r0]
	orrs r3, r7
	strb r3, [r0]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _080688B0 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068890: .4byte 0x08BDB534
_08068894: .4byte 0x081F65A0
_08068898: .4byte 0x082739E4
_0806889C: .4byte 0x08273AE4
_080688A0: .4byte 0x02023460
_080688A4: .4byte 0x03002870
_080688A8: .4byte 0x0000FFE0
_080688AC: .4byte 0x0000E0FF
_080688B0: .4byte 0x0000F3FF

	thumb_func_start sub_080688B4
sub_080688B4: @ 0x080688B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _08068900 @ =0x03002870
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _080688F8
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r0, [r5, #0x1c]
	ldr r1, _08068904 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _08068908 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl Proc_Break
_080688F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068900: .4byte 0x03002870
_08068904: .4byte 0xFFFFF7FF
_08068908: .4byte 0x0000F3FF

	thumb_func_start NewEfxClasschgCLONE
NewEfxClasschgCLONE: @ 0x0806890C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08068928 @ =0x08BDB54C
	movs r1, #4
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068928: .4byte 0x08BDB54C

	thumb_func_start sub_0806892C
sub_0806892C: @ 0x0806892C
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _08068988 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _0806898C @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0806897E
	adds r0, r4, #0
	bl Proc_Break
_0806897E:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068988: .4byte 0xFFFFF7FF
_0806898C: .4byte 0x0000F3FF

	thumb_func_start sub_08068990
sub_08068990: @ 0x08068990
	bx lr
	.align 2, 0

	thumb_func_start sub_08068994
sub_08068994: @ 0x08068994
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080689BC @ =0x08BDB56C
	movs r1, #4
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r2, #0
	strh r2, [r1, #0x2c]
	strh r5, [r1, #0x2e]
	cmp r6, #0
	bne _080689C0
	strh r2, [r1, #0x32]
	movs r0, #0x10
	strh r0, [r1, #0x34]
	b _080689C6
	.align 2, 0
_080689BC: .4byte 0x08BDB56C
_080689C0:
	movs r0, #0x10
	strh r0, [r1, #0x32]
	strh r2, [r1, #0x34]
_080689C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080689CC
sub_080689CC: @ 0x080689CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r4, #0x34
	ldrsh r2, [r5, r4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08068A24
	ldr r0, _08068A18 @ =0x02000054
	ldr r0, [r0]
	ldr r4, _08068A1C @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08068A20 @ =0xFFFFFD20
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r6, #0
	bl EfxPalBlackInOut
	b _08068A42
	.align 2, 0
_08068A18: .4byte 0x02000054
_08068A1C: .4byte 0x02022B40
_08068A20: .4byte 0xFFFFFD20
_08068A24:
	ldr r0, _08068A64 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r4, _08068A68 @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r2, _08068A6C @ =0xFFFFFCE0
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r6, #0
	bl EfxPalBlackInOut
_08068A42:
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r4, [r5, #0x2e]
	lsls r1, r4, #0x10
	cmp r0, r1
	ble _08068A5C
	adds r0, r5, #0
	bl Proc_Break
_08068A5C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08068A64: .4byte 0x02000054
_08068A68: .4byte 0x02022B80
_08068A6C: .4byte 0xFFFFFCE0

	thumb_func_start NewEfxClasschgRST
NewEfxClasschgRST: @ 0x08068A70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, _08068AAC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068AB0 @ =0x08BDB584
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x44]
	str r7, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068AAC: .4byte 0x0201774C
_08068AB0: .4byte 0x08BDB584

	thumb_func_start sub_08068AB4
sub_08068AB4: @ 0x08068AB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08068AF0
	ldr r1, _08068AF8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08068AF0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08068AF8: .4byte 0x0201774C

	thumb_func_start CheckEkrLvupDone
CheckEkrLvupDone: @ 0x08068AFC
	ldr r0, _08068B0C @ =0x020200AC
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08068B10
	movs r0, #0
	b _08068B12
	.align 2, 0
_08068B0C: .4byte 0x020200AC
_08068B10:
	movs r0, #1
_08068B12:
	bx lr

	thumb_func_start EndEkrLevelUp
EndEkrLevelUp: @ 0x08068B14
	push {lr}
	ldr r0, _08068B24 @ =0x020200AC
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08068B24: .4byte 0x020200AC

	thumb_func_start sub_08068B28
sub_08068B28: @ 0x08068B28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, [r2, #0x5c]
	cmp r0, #0
	bne _08068B50
	ldr r0, _08068B44 @ =0x0203E094
	ldr r4, [r0]
	ldr r0, _08068B48 @ =0x02020100
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08068B4C @ =0x0203E098
	b _08068B5C
	.align 2, 0
_08068B44: .4byte 0x0203E094
_08068B48: .4byte 0x02020100
_08068B4C: .4byte 0x0203E098
_08068B50:
	ldr r0, _08068C6C @ =0x0203E098
	ldr r4, [r0]
	ldr r0, _08068C70 @ =0x02020100
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08068C74 @ =0x0203E094
_08068B5C:
	ldr r1, _08068C78 @ =0x02020104
	ldr r3, [r0]
	str r3, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08068B6E
	b _08068C8C
_08068B6E:
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08068C7C @ =0x02020108
	adds r3, r4, #0
	adds r3, #0x70
	movs r0, #0
	ldrsb r0, [r3, r0]
	strh r0, [r1]
	ldr r2, _08068C80 @ =0x0202010C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08068C84 @ =0x0202010A
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08068C88 @ =0x0202011C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x73
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x74
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x75
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x79
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x76
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x77
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x78
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r0, [r6]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08068D16
	.align 2, 0
_08068C6C: .4byte 0x0203E098
_08068C70: .4byte 0x02020100
_08068C74: .4byte 0x0203E094
_08068C78: .4byte 0x02020104
_08068C7C: .4byte 0x02020108
_08068C80: .4byte 0x0202010C
_08068C84: .4byte 0x0202010A
_08068C88: .4byte 0x0202011C
_08068C8C:
	ldr r1, _08068D3C @ =0x02020108
	movs r0, #8
	ldrsb r0, [r6, r0]
	strh r0, [r1]
	ldr r2, _08068D40 @ =0x0202010C
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08068D44 @ =0x0202010A
	movs r0, #1
	strh r0, [r1]
	ldr r2, _08068D48 @ =0x0202011C
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r3, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r3, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r3, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r3]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
_08068D16:
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _08068D4C @ =0x02017648
	ldr r1, _08068D50 @ =0x06002400
	movs r2, #0x90
	lsls r2, r2, #1
	movs r3, #0
	bl InitTextFont
	movs r7, #0
_08068D2A:
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08068D58
	ldr r1, _08068D54 @ =0x08BDB5BC
	b _08068D5A
	.align 2, 0
_08068D3C: .4byte 0x02020108
_08068D40: .4byte 0x0202010C
_08068D44: .4byte 0x0202010A
_08068D48: .4byte 0x0202011C
_08068D4C: .4byte 0x02017648
_08068D50: .4byte 0x06002400
_08068D54: .4byte 0x08BDB5BC
_08068D58:
	ldr r1, _08068E98 @ =0x08BDB5DC
_08068D5A:
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetMsg
	adds r5, r0, #0
	lsls r1, r7, #3
	ldr r0, _08068E9C @ =0x02017660
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x10
	subs r0, r0, r1
	asrs r1, r0, #1
	cmp r1, #0
	bge _08068D8A
	movs r1, #0
_08068D8A:
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r1, _08068EA0 @ =0x082E5BF0
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	ldr r0, _08068EA4 @ =0x02023C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	adds r7, #1
	cmp r7, #7
	ble _08068D2A
	movs r7, #0
_08068DBC:
	lsls r5, r7, #3
	ldr r0, _08068EA8 @ =0x020176A0
	mov r8, r0
	add r5, r8
	adds r0, r5, #0
	movs r1, #2
	bl InitText
	adds r0, r5, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068EAC @ =0x0202010C
	lsls r4, r7, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl Text_DrawNumber
	ldr r0, _08068EA0 @ =0x082E5BF0
	adds r4, r4, r0
	ldrh r4, [r4]
	lsls r1, r4, #1
	ldr r6, _08068EB0 @ =0x02023C66
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r7, #1
	cmp r7, #7
	ble _08068DBC
	mov r4, r8
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	ldr r0, _08068EB4 @ =0x02020100
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r0, #0xdf
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _08068EB8 @ =0x08CC26D4
	ldr r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r0, #0xe7
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068EBC @ =0x02020108
	ldrh r1, [r0]
	adds r0, r4, #0
	bl Text_DrawNumber
	movs r0, #0xea
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068E98: .4byte 0x08BDB5DC
_08068E9C: .4byte 0x02017660
_08068EA0: .4byte 0x082E5BF0
_08068EA4: .4byte 0x02023C60
_08068EA8: .4byte 0x020176A0
_08068EAC: .4byte 0x0202010C
_08068EB0: .4byte 0x02023C66
_08068EB4: .4byte 0x02020100
_08068EB8: .4byte 0x08CC26D4
_08068EBC: .4byte 0x02020108

	thumb_func_start sub_08068EC0
sub_08068EC0: @ 0x08068EC0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r5, r4, #3
	ldr r0, _08068F08 @ =0x020176A0
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068F0C @ =0x0202010C
	lsls r4, r4, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl Text_DrawNumber
	ldr r0, _08068F10 @ =0x082E5BF0
	adds r4, r4, r0
	ldrh r4, [r4]
	lsls r1, r4, #1
	ldr r0, _08068F14 @ =0x02023C66
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068F08: .4byte 0x020176A0
_08068F0C: .4byte 0x0202010C
_08068F10: .4byte 0x082E5BF0
_08068F14: .4byte 0x02023C66

	thumb_func_start EkrLvup_DrawUnitName
EkrLvup_DrawUnitName: @ 0x08068F18
	push {r4, lr}
	ldr r4, _08068F44 @ =0x020176E0
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08068F48 @ =0x02020100
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08068F4C @ =0x02023E24
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068F44: .4byte 0x020176E0
_08068F48: .4byte 0x02020100
_08068F4C: .4byte 0x02023E24

	thumb_func_start EkrLvup_DrawPreLevelValue
EkrLvup_DrawPreLevelValue: @ 0x08068F50
	push {r4, lr}
	ldr r4, _08068F84 @ =0x020176F0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	ldr r0, _08068F88 @ =0x02020108
	ldrh r1, [r0]
	adds r0, r4, #0
	bl Text_DrawNumber
	ldr r1, _08068F8C @ =0x02023E3A
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068F84: .4byte 0x020176F0
_08068F88: .4byte 0x02020108
_08068F8C: .4byte 0x02023E3A

	thumb_func_start NewEkrLevelup
NewEkrLevelup: @ 0x08068F90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08068FBC @ =0x020200AC
	ldr r0, _08068FC0 @ =0x08BDB5FC
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r6, [r5]
	str r4, [r6, #0x5c]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x60]
	ldr r0, _08068FC4 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	beq _08068FC8
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #0
	b _08068FCE
	.align 2, 0
_08068FBC: .4byte 0x020200AC
_08068FC0: .4byte 0x08BDB5FC
_08068FC4: .4byte 0x0203E02C
_08068FC8:
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #1
_08068FCE:
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	strh r1, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x29
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrLvup_OnPrepare
EkrLvup_OnPrepare: @ 0x08068FE4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	cmp r1, #0
	beq _08068FF8
	adds r0, r4, #0
	bl Proc_Break
	b _0806904A
_08068FF8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08069016
	bl NewEfxSpellCast
	ldr r0, [r4, #0x5c]
	movs r1, #0x78
	movs r2, #0x58
	bl NewEfxLvupOBJ2
	b _0806904A
_08069016:
	cmp r0, #0x19
	bne _08069028
	ldr r0, [r4, #0x5c]
	bl NewEfxLvupBG2
	ldr r0, [r4, #0x5c]
	bl NewEfxLvupBGCOL
	b _0806904A
_08069028:
	cmp r0, #0x3b
	bne _08069034
	ldr r0, [r4, #0x5c]
	bl NewEfxlvupbg
	b _0806904A
_08069034:
	cmp r0, #0x49
	bne _0806903E
	bl RegisterEfxSpellCastEnd
	b _0806904A
_0806903E:
	cmp r0, #0x53
	bne _0806904A
	strh r1, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0806904A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08069050
sub_08069050: @ 0x08069050
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _08069100 @ =0x020200D8
	movs r4, #0
	str r4, [sp]
	ldr r5, _08069104 @ =0x02023460
	ldr r0, _08069108 @ =0x01000200
	mov r8, r0
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r6, _0806910C @ =0x02023C60
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, _08069110 @ =0x06006800
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08069114 @ =0x06007000
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08069118 @ =0x06005000
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _0806911C @ =0x06005800
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08069120 @ =0x0203E028
	ldrh r4, [r1]
	strh r4, [r7]
	movs r0, #3
	strh r0, [r7, #2]
	adds r0, #0xfd
	strh r0, [r7, #4]
	ldrh r3, [r1, #2]
	strh r3, [r7, #6]
	movs r0, #4
	strh r0, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r0, _08069124 @ =0x0203E02C
	ldrh r1, [r0]
	strh r1, [r7, #0xc]
	ldr r0, _08069128 @ =0x0000FFFF
	adds r2, r0, #0
	ldrh r0, [r7, #0xe]
	orrs r0, r2
	strh r0, [r7, #0xe]
	ldr r0, _0806912C @ =0x06010000
	str r0, [r7, #0x1c]
	ldr r0, _08069130 @ =0x020145C8
	str r0, [r7, #0x20]
	ldr r0, _08069134 @ =0x0203E00E
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	bne _08069142
	ldr r0, _08069138 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _0806913C
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r7, #6]
	b _08069142
	.align 2, 0
_08069100: .4byte 0x020200D8
_08069104: .4byte 0x02023460
_08069108: .4byte 0x01000200
_0806910C: .4byte 0x02023C60
_08069110: .4byte 0x06006800
_08069114: .4byte 0x06007000
_08069118: .4byte 0x06005000
_0806911C: .4byte 0x06005800
_08069120: .4byte 0x0203E028
_08069124: .4byte 0x0203E02C
_08069128: .4byte 0x0000FFFF
_0806912C: .4byte 0x06010000
_08069130: .4byte 0x020145C8
_08069134: .4byte 0x0203E00E
_08069138: .4byte 0x02017744
_0806913C:
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r7]
_08069142:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0806916A
	adds r0, r7, #0
	bl sub_08054F30
	ldr r3, [r7, #0x14]
	ldr r0, [r3, #0x4c]
	ldr r2, _0806928C @ =0x0000F3FF
	ands r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r3, #0x4c]
	ldr r3, [r7, #0x18]
	ldr r0, [r3, #0x4c]
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x4c]
_0806916A:
	mov r1, sb
	ldr r2, [r1, #0x5c]
	ldr r1, _0806928C @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	mov r0, sb
	ldr r2, [r0, #0x5c]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r3, r0, #0
	ldrh r0, [r2, #8]
	orrs r0, r3
	strh r0, [r2, #8]
	mov r2, sb
	ldr r0, [r2, #0x60]
	ldrh r2, [r0, #8]
	ands r1, r2
	strh r1, [r0, #8]
	mov r0, sb
	ldr r1, [r0, #0x60]
	movs r4, #0
	ldrh r0, [r1, #8]
	orrs r0, r3
	strh r0, [r1, #8]
	ldr r5, _08069290 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r5, #0x14]
	ands r0, r2
	strb r0, [r5, #0x14]
	adds r0, r1, #0
	ldrb r3, [r5, #0x10]
	ands r0, r3
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0xc]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	ldr r0, _08069294 @ =0x0202012C
	movs r1, #0x90
	strh r1, [r0]
	ldr r0, _08069298 @ =0x0202012E
	strh r1, [r0]
	movs r0, #2
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xa0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #1
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #1
	bl SetBgScreenSize
	bl NewEfxPartsofScroll
	ldr r1, _0806929C @ =0x020200D0
	str r0, [r1]
	bl sub_08069C34
	ldr r1, _080692A0 @ =0x020200D4
	str r0, [r1]
	bl EfxUpdatePartsofScroll
	movs r0, #2
	bl EkrGauge_0804CC68
	mov r2, sb
	ldr r0, [r2, #0x5c]
	bl DisableEfxStatusUnits
	mov r3, sb
	ldr r0, [r3, #0x60]
	bl DisableEfxStatusUnits
	bl DisableEfxWeaponIcon
	bl sub_0804F480
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r0, sb
	bl Proc_Break
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806928C: .4byte 0x0000F3FF
_08069290: .4byte 0x03002870
_08069294: .4byte 0x0202012C
_08069298: .4byte 0x0202012E
_0806929C: .4byte 0x020200D0
_080692A0: .4byte 0x020200D4

	thumb_func_start sub_080692A4
sub_080692A4: @ 0x080692A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _0806933C @ =0x0203E094
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _08069340 @ =0x0203E098
	ldr r0, [r0]
	mov r8, r0
	ldr r6, [r7, #0x5c]
	ldr r0, _08069344 @ =0x081DAFEC
	ldr r5, _08069348 @ =0x02017784
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, _0806934C @ =0x081DB238
	ldr r4, _08069350 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08069354 @ =0x020235E0
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	ldr r1, _08069358 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _0806935C @ =0x081DB334
	ldr r4, _08069360 @ =0x02022880
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08069364 @ =0x081DB354
	ldr r5, _08069368 @ =0x0201A784
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, _0806936C @ =0x06011400
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _08069370 @ =0x081DB568
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0x50
	strh r0, [r7, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08069374
	mov r1, sb
	b _08069376
	.align 2, 0
_0806933C: .4byte 0x0203E094
_08069340: .4byte 0x0203E098
_08069344: .4byte 0x081DAFEC
_08069348: .4byte 0x02017784
_0806934C: .4byte 0x081DB238
_08069350: .4byte 0x02019784
_08069354: .4byte 0x020235E0
_08069358: .4byte 0x06002000
_0806935C: .4byte 0x081DB334
_08069360: .4byte 0x02022880
_08069364: .4byte 0x081DB354
_08069368: .4byte 0x0201A784
_0806936C: .4byte 0x06011400
_08069370: .4byte 0x081DB568
_08069374:
	mov r1, r8
_08069376:
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	ldr r0, _080693C0 @ =0x08BDB59C
	bl SetFaceConfig
	ldr r0, _080693C4 @ =0x00001042
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xbc
	movs r3, #0x50
	bl StartFace
	ldr r0, _080693C8 @ =0x030041C0
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1, #0x36]
	str r2, [sp, #8]
	ldr r1, _080693CC @ =0x02023C60
	ldr r2, _080693D0 @ =0x01000200
	add r0, sp, #8
	bl CpuFastSet
	adds r0, r7, #0
	bl sub_08068B28
	adds r0, r7, #0
	bl Proc_Break
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080693C0: .4byte 0x08BDB59C
_080693C4: .4byte 0x00001042
_080693C8: .4byte 0x030041C0
_080693CC: .4byte 0x02023C60
_080693D0: .4byte 0x01000200

	thumb_func_start EkrLvup_SetBgs
EkrLvup_SetBgs: @ 0x080693D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069400 @ =EkrLvupHBlank
	bl SetOnHBlankA
	movs r0, #1
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069400: .4byte EkrLvupHBlank

	thumb_func_start EkrLvup_InitPalette
EkrLvup_InitPalette: @ 0x08069404
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _0806943A
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r4, #0x4c]
	subs r0, #2
	str r0, [r4, #0x50]
	ldr r0, _08069440 @ =0x02022860
	ldr r1, _08069444 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
_0806943A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069440: .4byte 0x02022860
_08069444: .4byte 0x020165C8

	thumb_func_start EkrLvup_PutWindowOnScreen
EkrLvup_PutWindowOnScreen: @ 0x08069448
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r3, [r7, #0x44]
	ldr r5, [r7, #0x48]
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov sb, r0
	cmp r3, #0
	bge _08069468
	movs r3, #0
	b _0806946E
_08069468:
	cmp r3, #8
	ble _0806946E
	movs r3, #8
_0806946E:
	cmp r5, #0
	bge _08069476
	movs r5, #0
	b _0806947C
_08069476:
	cmp r5, #8
	ble _0806947C
	movs r5, #8
_0806947C:
	cmp r6, #0
	bge _08069484
	movs r6, #0
	b _0806948A
_08069484:
	cmp r6, #8
	ble _0806948A
	movs r6, #8
_0806948A:
	mov r2, sb
	cmp r2, #0
	bge _08069494
	movs r0, #0
	b _0806949C
_08069494:
	mov r2, sb
	cmp r2, #8
	ble _0806949E
	movs r0, #8
_0806949C:
	mov sb, r0
_0806949E:
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	ldr r0, [r7, #0x48]
	adds r0, #1
	str r0, [r7, #0x48]
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	adds r0, #1
	str r0, [r7, #0x50]
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	mov r8, r0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	adds r3, r5, #0
	bl Interpolate
	mov sl, r0
	ldr r5, _0806955C @ =0x0202012C
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	adds r3, r6, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08069560 @ =0x0202012E
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	mov r3, sb
	bl Interpolate
	strh r0, [r5]
	ldr r0, _08069564 @ =0x030041C0
	ldr r1, [r0]
	movs r0, #0x50
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r1, #0x36]
	ldr r0, _08069568 @ =0x020165C8
	ldr r4, _0806956C @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	mov r3, sl
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	mov r3, sl
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0806954A
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_0806954A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806955C: .4byte 0x0202012C
_08069560: .4byte 0x0202012E
_08069564: .4byte 0x030041C0
_08069568: .4byte 0x020165C8
_0806956C: .4byte 0x02022860

	thumb_func_start EkrLvup_PrepareApGfx
EkrLvup_PrepareApGfx: @ 0x08069570
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa0
	movs r1, #1
	bl NewEkrLvupApfx
	ldr r1, _08069598 @ =0x020200B0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08069584:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08069584
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069598: .4byte 0x020200B0

	thumb_func_start EkrLvup_Promo_WindowScroll0
EkrLvup_Promo_WindowScroll0: @ 0x0806959C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080695B0
	adds r0, r5, #0
	bl Proc_Break
	b _080695E8
_080695B0:
	ldr r0, _080695F0 @ =EfxPartsofScroll2HBlank
	bl SetOnHBlankA
	ldr r4, _080695F4 @ =0x020200D0
	ldr r0, [r4]
	bl Proc_End
	bl NewEfxPartsofScroll2
	str r0, [r4]
	ldr r4, _080695F8 @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_080695E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080695F0: .4byte EfxPartsofScroll2HBlank
_080695F4: .4byte 0x020200D0
_080695F8: .4byte 0x000002CD

	thumb_func_start sub_080695FC
sub_080695FC: @ 0x080695FC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069612
	adds r0, r5, #0
	bl Proc_Break
	b _08069666
_08069612:
	ldr r4, _08069670 @ =0x0202012C
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08069666
	ldr r1, _08069674 @ =0x02020100
	ldr r0, _08069678 @ =0x02020104
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawUnitName
	ldr r1, _0806967C @ =0x02020108
	ldr r0, _08069680 @ =0x0202010A
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawPreLevelValue
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_08069666:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069670: .4byte 0x0202012C
_08069674: .4byte 0x02020100
_08069678: .4byte 0x02020104
_0806967C: .4byte 0x02020108
_08069680: .4byte 0x0202010A

	thumb_func_start sub_08069684
sub_08069684: @ 0x08069684
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806969A
	adds r0, r5, #0
	bl Proc_Break
	b _080696CA
_0806969A:
	ldr r4, _080696D4 @ =0x0202012C
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080696CA
	adds r0, r5, #0
	bl Proc_Break
_080696CA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696D4: .4byte 0x0202012C

	thumb_func_start EkrLvup_DrawNewLevel
EkrLvup_DrawNewLevel: @ 0x080696D8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069730
	strh r0, [r5, #0x2c]
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	movs r2, #0x84
	movs r3, #0x3c
	bl BanimDrawStatupAp
	ldr r1, _08069724 @ =0x02020108
	ldr r0, _08069728 @ =0x0202010A
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawPreLevelValue
	ldr r4, _0806972C @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	adds r0, r5, #0
	bl Proc_Break
	b _0806974A
	.align 2, 0
_08069724: .4byte 0x02020108
_08069728: .4byte 0x0202010A
_0806972C: .4byte 0x000002CD
_08069730:
	ldr r4, _08069754 @ =0x020200D0
	ldr r0, [r4]
	bl Proc_End
	bl NewEfxPartsofScroll
	str r0, [r4]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_0806974A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069754: .4byte 0x020200D0

	thumb_func_start EkrLvup_InitCounterForMainAnim
EkrLvup_InitCounterForMainAnim: @ 0x08069758
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _0806976C
	adds r0, r1, #0
	bl Proc_Break
	b _08069784
_0806976C:
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _08069784
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	adds r0, r1, #0
	bl Proc_Break
_08069784:
	pop {r0}
	bx r0

	thumb_func_start sub_08069788
sub_08069788: @ 0x08069788
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806985E
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x2e]
	cmp r0, #8
	beq _08069864
	ldr r7, _08069834 @ =0x0202010C
_080697AC:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r2, r0, r7
	ldr r1, _08069838 @ =0x0202011C
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r6, r0, r1
	cmp r6, #0
	beq _08069850
	movs r1, #0
	mov r8, r1
	strh r0, [r2]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r0, r5, #0
	bl sub_08068EC0
	ldr r4, _0806983C @ =0x00000396
	adds r0, r4, #0
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	ldr r1, _08069840 @ =0x082E5BF0
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r2, #0x1f
	ands r2, r3
	lsls r2, r2, #3
	adds r2, #0x35
	movs r1, #0xfc
	lsls r1, r1, #3
	adds r0, r1, #0
	ands r3, r0
	lsrs r3, r3, #2
	adds r3, #6
	adds r4, #1
	str r4, [sp]
	str r6, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	bl BanimDrawStatupAp
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0806982E
	ldr r1, _08069844 @ =0x0203E0BC
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r1, _08069848 @ =0x0203E0C0
	ldr r0, _0806984C @ =0x0000FFFF
	strh r0, [r1, #2]
_0806982E:
	mov r0, r8
	strh r0, [r5, #0x2c]
	b _0806985E
	.align 2, 0
_08069834: .4byte 0x0202010C
_08069838: .4byte 0x0202011C
_0806983C: .4byte 0x00000396
_08069840: .4byte 0x082E5BF0
_08069844: .4byte 0x0203E0BC
_08069848: .4byte 0x0203E0C0
_0806984C: .4byte 0x0000FFFF
_08069850:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _080697AC
_0806985E:
	ldrh r1, [r5, #0x2e]
	cmp r1, #8
	bne _0806986E
_08069864:
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806986E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrLvup_SetHBlank
EkrLvup_SetHBlank: @ 0x0806987C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6d
	ble _080698A2
	movs r0, #0
	strh r0, [r4, #0x2c]
	bl EkrLvupApfxEndEach
	ldr r0, _080698A8 @ =EkrLvupHBlank
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_080698A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080698A8: .4byte EkrLvupHBlank

	thumb_func_start sub_080698AC
sub_080698AC: @ 0x080698AC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrLvup_PutWindowOffScreen
EkrLvup_PutWindowOffScreen: @ 0x080698B8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _0806996C @ =0x0202012C
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08069970 @ =0x0202012E
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08069974 @ =0x030041C0
	ldr r1, [r0]
	movs r0, #0x50
	subs r0, r0, r5
	strh r0, [r1, #0x36]
	ldr r0, _08069978 @ =0x020165C8
	ldr r4, _0806997C @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	adds r3, r6, #0
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	adds r3, r6, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	movs r0, #7
_08069944:
	subs r0, #1
	cmp r0, #0
	bge _08069944
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _08069962
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08069962:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806996C: .4byte 0x0202012C
_08069970: .4byte 0x0202012E
_08069974: .4byte 0x030041C0
_08069978: .4byte 0x020165C8
_0806997C: .4byte 0x02022860

	thumb_func_start sub_08069980
sub_08069980: @ 0x08069980
	push {r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r4, _08069A94 @ =0x020200D8
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _08069996
	adds r0, r4, #0
	bl sub_080552DC
_08069996:
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #0
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBgScreenSize
	mov r4, sp
	ldr r2, _08069A98 @ =0x0203E028
	ldrh r0, [r2]
	movs r6, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r0, _08069A9C @ =0x0203E02C
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r6, [sp, #0x1c]
	ldr r0, _08069AA0 @ =0x020145C8
	str r0, [sp, #0x20]
	ldr r0, _08069AA4 @ =0x0203E00E
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _08069A10
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sp
	bl sub_08054F30
_08069A10:
	ldr r2, [r5, #0x5c]
	ldr r1, _08069AA8 @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	ldr r3, [r5, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	orrs r0, r2
	strh r0, [r3, #8]
	ldr r0, [r5, #0x60]
	ldrh r3, [r0, #8]
	ands r1, r3
	strh r1, [r0, #8]
	ldr r0, [r5, #0x60]
	ldrh r1, [r0, #8]
	orrs r2, r1
	strh r2, [r0, #8]
	str r6, [sp, #0x28]
	add r0, sp, #0x28
	ldr r1, _08069AAC @ =0x02023460
	ldr r2, _08069AB0 @ =0x01000200
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	bl EkrGauge_0804CC68
	ldr r3, _08069AB4 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl EndFaceById
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x2c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069A94: .4byte 0x020200D8
_08069A98: .4byte 0x0203E028
_08069A9C: .4byte 0x0203E02C
_08069AA0: .4byte 0x020145C8
_08069AA4: .4byte 0x0203E00E
_08069AA8: .4byte 0x0000F3FF
_08069AAC: .4byte 0x02023460
_08069AB0: .4byte 0x01000200
_08069AB4: .4byte 0x03002870

	thumb_func_start EkrLvup_OnEnd
EkrLvup_OnEnd: @ 0x08069AB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069AEC @ =0x020200D0
	ldr r0, [r0]
	bl Proc_End
	ldr r0, _08069AF0 @ =0x020200D4
	ldr r0, [r0]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl EnableEfxStatusUnits
	ldr r0, [r4, #0x60]
	bl EnableEfxStatusUnits
	bl EnableEfxWeaponIcon
	bl EfxHpBarColorChange_804FC6C
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069AEC: .4byte 0x020200D0
_08069AF0: .4byte 0x020200D4

	thumb_func_start NewEfxPartsofScroll
NewEfxPartsofScroll: @ 0x08069AF4
	push {lr}
	ldr r0, _08069B08 @ =0x08BDB6AC
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08069B08: .4byte 0x08BDB6AC

	thumb_func_start EfxUpdatePartsofScroll
EfxUpdatePartsofScroll: @ 0x08069B0C
	push {r4, r5, r6, lr}
	ldr r0, _08069B38 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r2, _08069B3C @ =0x0201FB2C
	cmp r0, #0
	bne _08069B1A
	ldr r2, _08069B40 @ =0x0201FC6C
_08069B1A:
	ldr r1, _08069B44 @ =0x0201FDB8
	cmp r0, #0
	bne _08069B22
	ldr r1, _08069B48 @ =0x0201FEF8
_08069B22:
	movs r3, #0
	movs r6, #0
	ldr r5, _08069B4C @ =0x0202012C
	ldr r4, _08069B50 @ =0x0202012E
_08069B2A:
	cmp r3, #0x27
	bhi _08069B54
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b _08069B70
	.align 2, 0
_08069B38: .4byte 0x0201FDAC
_08069B3C: .4byte 0x0201FB2C
_08069B40: .4byte 0x0201FC6C
_08069B44: .4byte 0x0201FDB8
_08069B48: .4byte 0x0201FEF8
_08069B4C: .4byte 0x0202012C
_08069B50: .4byte 0x0202012E
_08069B54:
	cmp r3, #0x47
	bhi _08069B62
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b _08069B6E
_08069B62:
	cmp r3, #0x9f
	bhi _08069B72
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
_08069B6E:
	strh r0, [r1]
_08069B70:
	adds r1, #2
_08069B72:
	adds r3, #1
	cmp r3, #0x9f
	bls _08069B2A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08069B80
sub_08069B80: @ 0x08069B80
	bx lr
	.align 2, 0

	thumb_func_start sub_08069B84
sub_08069B84: @ 0x08069B84
	push {lr}
	bl EfxUpdatePartsofScroll
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxPartsofScroll2
NewEfxPartsofScroll2: @ 0x08069B90
	push {lr}
	ldr r0, _08069BA4 @ =0x08BDB6CC
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08069BA4: .4byte 0x08BDB6CC

	thumb_func_start sub_08069BA8
sub_08069BA8: @ 0x08069BA8
	bx lr
	.align 2, 0

	thumb_func_start EfxPartsofScroll2Main
EfxPartsofScroll2Main: @ 0x08069BAC
	push {r4, r5, r6, lr}
	ldr r0, _08069BF8 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r3, _08069BFC @ =0x0201FB2C
	cmp r0, #0
	bne _08069BBA
	ldr r3, _08069C00 @ =0x0201FC6C
_08069BBA:
	ldr r2, _08069C04 @ =0x0201FDB8
	cmp r0, #0
	bne _08069BC2
	ldr r2, _08069C08 @ =0x0201FEF8
_08069BC2:
	movs r4, #0
	movs r5, #0
	ldr r0, _08069C0C @ =0x08BDB6EC
	adds r6, r0, #0
	subs r6, #0x50
_08069BCC:
	cmp r4, #0x27
	bls _08069C1C
	cmp r4, #0x47
	bhi _08069C18
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, _08069C10 @ =0x0202012C
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	cmp r0, #0x2e
	bls _08069BEE
	cmp r0, #0x51
	bls _08069BF0
_08069BEE:
	ldr r1, _08069C14 @ =0x0000FFE0
_08069BF0:
	strh r1, [r3]
	adds r3, #2
	strh r1, [r2]
	b _08069C22
	.align 2, 0
_08069BF8: .4byte 0x0201FDAC
_08069BFC: .4byte 0x0201FB2C
_08069C00: .4byte 0x0201FC6C
_08069C04: .4byte 0x0201FDB8
_08069C08: .4byte 0x0201FEF8
_08069C0C: .4byte 0x08BDB6EC
_08069C10: .4byte 0x0202012C
_08069C14: .4byte 0x0000FFE0
_08069C18:
	cmp r4, #0x9f
	bhi _08069C24
_08069C1C:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
_08069C22:
	adds r2, #2
_08069C24:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _08069BCC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08069C34
sub_08069C34: @ 0x08069C34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08069CD0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, _08069CD4 @ =0x0201FB2C
	movs r1, #0
	adds r6, r2, #0
	ldr r4, _08069CD8 @ =0x0201FC6C
	ldr r0, _08069CDC @ =0x0201FDB8
	ldr r5, _08069CE0 @ =0x0201FEF8
	ldr r7, _08069CE4 @ =0x0201FB20
	ldr r3, _08069CE8 @ =0x0201FDAC
	mov ip, r3
	ldr r3, _08069CEC @ =0x0201FB24
	mov r8, r3
	ldr r3, _08069CF0 @ =0x0201FDB0
	mov sb, r3
	ldr r3, _08069CF4 @ =0x0201FB28
	mov sl, r3
	movs r3, #0
_08069C66:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C66
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_08069C76:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C76
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_08069C86:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C86
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
_08069C96:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C96
	movs r4, #0
	str r4, [r7]
	mov r1, ip
	str r4, [r1]
	mov r3, r8
	str r6, [r3]
	mov r1, sb
	str r0, [r1]
	mov r3, sl
	str r6, [r3]
	ldr r1, _08069CF8 @ =0x0201FDB4
	str r0, [r1]
	ldr r0, _08069CFC @ =0x08BDB72C
	movs r1, #0
	bl SpawnProc
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08069CD0: .4byte 0x0201774C
_08069CD4: .4byte 0x0201FB2C
_08069CD8: .4byte 0x0201FC6C
_08069CDC: .4byte 0x0201FDB8
_08069CE0: .4byte 0x0201FEF8
_08069CE4: .4byte 0x0201FB20
_08069CE8: .4byte 0x0201FDAC
_08069CEC: .4byte 0x0201FB24
_08069CF0: .4byte 0x0201FDB0
_08069CF4: .4byte 0x0201FB28
_08069CF8: .4byte 0x0201FDB4
_08069CFC: .4byte 0x08BDB72C

	thumb_func_start sub_08069D00
sub_08069D00: @ 0x08069D00
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_08069D0C
sub_08069D0C: @ 0x08069D0C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08069D18
sub_08069D18: @ 0x08069D18
	ldr r0, _08069D38 @ =0x0202BBB8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _08069D3C @ =0x0201FB24
	ldr r2, _08069D40 @ =0x0201FDB0
	cmp r0, #0
	beq _08069D84
	ldr r1, _08069D44 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _08069D4C
	movs r0, #0
	str r0, [r1]
	ldr r0, _08069D48 @ =0x0201FB2C
	b _08069D52
	.align 2, 0
_08069D38: .4byte 0x0202BBB8
_08069D3C: .4byte 0x0201FB24
_08069D40: .4byte 0x0201FDB0
_08069D44: .4byte 0x0201FB20
_08069D48: .4byte 0x0201FB2C
_08069D4C:
	movs r0, #1
	str r0, [r1]
	ldr r0, _08069D68 @ =0x0201FC6C
_08069D52:
	str r0, [r3]
	ldr r1, _08069D6C @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08069D78
	movs r0, #0
	str r0, [r1]
	ldr r1, _08069D70 @ =0x0201FDB0
	ldr r0, _08069D74 @ =0x0201FDB8
	b _08069D80
	.align 2, 0
_08069D68: .4byte 0x0201FC6C
_08069D6C: .4byte 0x0201FDAC
_08069D70: .4byte 0x0201FDB0
_08069D74: .4byte 0x0201FDB8
_08069D78:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08069D94 @ =0x0201FDB0
	ldr r0, _08069D98 @ =0x0201FEF8
_08069D80:
	str r0, [r1]
	adds r2, r1, #0
_08069D84:
	ldr r1, _08069D9C @ =0x0201FB28
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _08069DA0 @ =0x0201FDB4
	ldr r0, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
_08069D94: .4byte 0x0201FDB0
_08069D98: .4byte 0x0201FEF8
_08069D9C: .4byte 0x0201FB28
_08069DA0: .4byte 0x0201FDB4

	thumb_func_start EkrLvupHBlank
EkrLvupHBlank: @ 0x08069DA4
	ldr r0, _08069DD0 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08069DCC
	ldr r3, _08069DD4 @ =0x04000018
	ldr r2, _08069DD8 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _08069DDC @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08069DCC:
	bx lr
	.align 2, 0
_08069DD0: .4byte 0x04000004
_08069DD4: .4byte 0x04000018
_08069DD8: .4byte 0x0201FB28
_08069DDC: .4byte 0x0201FDB4

	thumb_func_start EfxPartsofScroll2HBlank
EfxPartsofScroll2HBlank: @ 0x08069DE0
	push {r4, r5, r6, lr}
	ldr r0, _08069E1C @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08069E14
	ldr r3, _08069E20 @ =0x0400001A
	ldr r4, _08069E24 @ =0x03002870
	ldr r2, _08069E28 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r5, [r4, #0x26]
	ldrh r6, [r0]
	adds r1, r5, r6
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _08069E2C @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r4, [r4, #0x22]
	ldrh r5, [r0]
	adds r1, r4, r5
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08069E14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069E1C: .4byte 0x04000004
_08069E20: .4byte 0x0400001A
_08069E24: .4byte 0x03002870
_08069E28: .4byte 0x0201FB28
_08069E2C: .4byte 0x0201FDB4

	thumb_func_start NewEfxlvupbg
NewEfxlvupbg: @ 0x08069E30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069E64 @ =0x08BDB754
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08069E68 @ =0x082E5C00
	str r1, [r0, #0x48]
	ldr r1, _08069E6C @ =0x08BDB76C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08069E70 @ =0x08BDB798
	str r1, [r0, #0x54]
	ldr r0, _08069E74 @ =0x081E3EB4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069E64: .4byte 0x08BDB754
_08069E68: .4byte 0x082E5C00
_08069E6C: .4byte 0x08BDB76C
_08069E70: .4byte 0x08BDB798
_08069E74: .4byte 0x081E3EB4

	thumb_func_start EfxlvupbgMain
EfxlvupbgMain: @ 0x08069E78
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08069EB4
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _08069ECA
_08069EB4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08069ECA
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08069ECA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewEfxLvupBG2
NewEfxLvupBG2: @ 0x08069ED0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069F08 @ =0x08BDB7C4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08069F0C @ =0x082E5C2E
	str r1, [r0, #0x48]
	ldr r1, _08069F10 @ =0x08BDB7DC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08069F14 @ =0x081E4F9C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08069F18 @ =0x081E565C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069F08: .4byte 0x08BDB7C4
_08069F0C: .4byte 0x082E5C2E
_08069F10: .4byte 0x08BDB7DC
_08069F14: .4byte 0x081E4F9C
_08069F18: .4byte 0x081E565C

	thumb_func_start EfxLvupBg2Main
EfxLvupBg2Main: @ 0x08069F1C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08069F4A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08069F58
_08069F4A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08069F58
	adds r0, r4, #0
	bl Proc_Break
_08069F58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxLvupOBJ2
NewEfxLvupOBJ2: @ 0x08069F60
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, _08069FB0 @ =0x08BDB7F4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08069FB4 @ =0x08B9CA30
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x64]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _08069FB8 @ =0x081E5D38
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08069FBC @ =0x081E565C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069FB0: .4byte 0x08BDB7F4
_08069FB4: .4byte 0x08B9CA30
_08069FB8: .4byte 0x081E5D38
_08069FBC: .4byte 0x081E565C

	thumb_func_start EfxLvupOBJ2CallBack
EfxLvupOBJ2CallBack: @ 0x08069FC0
	push {lr}
	ldr r0, [r0, #0x64]
	bl AnimDelete
	pop {r0}
	bx r0

	thumb_func_start NewEfxLvupBGCOL
NewEfxLvupBGCOL: @ 0x08069FCC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069FF4 @ =0x08BDB814
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #0x19
	strh r1, [r0, #0x30]
	str r2, [r0, #0x44]
	ldr r1, _08069FF8 @ =0x082E5C48
	str r1, [r0, #0x48]
	ldr r1, _08069FFC @ =0x081E56DC
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069FF4: .4byte 0x08BDB814
_08069FF8: .4byte 0x082E5C48
_08069FFC: .4byte 0x081E56DC

	thumb_func_start sub_0806A000
sub_0806A000: @ 0x0806A000
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0806A02A
	ldr r0, [r4, #0x4c]
	ldr r1, _0806A058 @ =0x02022862
	movs r2, #8
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_0805067C
_0806A02A:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r3, [r4, #0x30]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0806A050
	strh r2, [r4, #0x2c]
	strh r2, [r4, #0x2e]
	str r2, [r4, #0x44]
	ldr r0, _0806A05C @ =0x082E5C8A
	str r0, [r4, #0x48]
	ldr r0, _0806A060 @ =0x081E565C
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	bl Proc_Break
_0806A050:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A058: .4byte 0x02022862
_0806A05C: .4byte 0x082E5C8A
_0806A060: .4byte 0x081E565C

	thumb_func_start sub_0806A064
sub_0806A064: @ 0x0806A064
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806A08A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0806A098
_0806A08A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806A098
	adds r0, r4, #0
	bl Proc_Break
_0806A098:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A0A0
sub_0806A0A0: @ 0x0806A0A0
	movs r1, #0
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

	thumb_func_start sub_0806A0A8
sub_0806A0A8: @ 0x0806A0A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0806A0F4 @ =0x083F3074
	ldrh r4, [r5, #0x2e]
	adds r4, #1
	strh r4, [r5, #0x2e]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0806A0EE
	lsls r4, r4, #0x10
	asrs r4, r4, #0x12
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl ApplyPaletteExt
	adds r4, #0x40
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl ApplyPaletteExt
_0806A0EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A0F4: .4byte 0x083F3074

	thumb_func_start NewEkrLvupApfx
NewEkrLvupApfx: @ 0x0806A0F8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _0806A144 @ =0x083F34B0
	ldr r1, _0806A148 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _0806A14C @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl Decompress
	ldr r4, _0806A150 @ =0x083F3450
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r5, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806A154 @ =0x08BDB834
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r5, [r0, #0x2c]
	ldr r0, _0806A158 @ =0x02020130
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A144: .4byte 0x083F34B0
_0806A148: .4byte 0x000003FF
_0806A14C: .4byte 0x06010000
_0806A150: .4byte 0x083F3450
_0806A154: .4byte 0x08BDB834
_0806A158: .4byte 0x02020130

	thumb_func_start EkrLvupApfxEndEach
EkrLvupApfxEndEach: @ 0x0806A15C
	push {lr}
	ldr r0, _0806A170 @ =0x08BDB834
	bl Proc_EndEach
	ldr r1, _0806A174 @ =0x02020130
	movs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806A170: .4byte 0x08BDB834
_0806A174: .4byte 0x02020130

	thumb_func_start PutEkrLvupStatGainLabelGfx1
PutEkrLvupStatGainLabelGfx1: @ 0x0806A178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r1, _0806A1D4 @ =0x081E5FD0
	mov r8, r1
	subs r0, #1
	lsls r4, r0, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _0806A190
	rsbs r0, r4, #0
_0806A190:
	ldr r5, _0806A1D8 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ands r1, r5
	lsls r1, r1, #5
	ldr r7, _0806A1DC @ =0x06010000
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	adds r0, r4, #0
	cmp r0, #0
	bge _0806A1B2
	rsbs r0, r0, #0
_0806A1B2:
	adds r0, #0x20
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1D4: .4byte 0x081E5FD0
_0806A1D8: .4byte 0x000003FF
_0806A1DC: .4byte 0x06010000

	thumb_func_start PutEkrLvupStatGainLabelGfx2
PutEkrLvupStatGainLabelGfx2: @ 0x0806A1E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0806A228 @ =0x083F373C
	mov sb, r0
	ldr r0, _0806A22C @ =0x081E5FD0
	mov r8, r0
	cmp r7, #0
	blt _0806A238
	movs r0, #0xc0
	lsls r0, r0, #2
	add r0, r8
	adds r1, #0x2c
	ldr r5, _0806A230 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _0806A234 @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe0
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	b _0806A268
	.align 2, 0
_0806A228: .4byte 0x083F373C
_0806A22C: .4byte 0x081E5FD0
_0806A230: .4byte 0x000003FF
_0806A234: .4byte 0x06010000
_0806A238:
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r5, _0806A2B8 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _0806A2BC @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe8
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
_0806A268:
	adds r0, r7, #0
	cmp r7, #0
	bge _0806A270
	rsbs r0, r7, #0
_0806A270:
	ldr r4, _0806A2B8 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0806A2BC @ =0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	adds r0, r7, #0
	cmp r0, #0
	bge _0806A292
	rsbs r0, r0, #0
_0806A292:
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A2B8: .4byte 0x000003FF
_0806A2BC: .4byte 0x06010000

	thumb_func_start BanimDrawStatupAp
BanimDrawStatupAp: @ 0x0806A2C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r8, r2
	mov sb, r3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	subs r0, #1
	lsls r0, r0, #1
	ldr r1, [sp, #0xc]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	lsls r6, r3, #0xc
	adds r7, r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r7, r0
	adds r5, r6, #0
	orrs r5, r7
	mov r0, r8
	subs r0, #0x12
	mov r1, sb
	subs r1, #4
	ldr r2, _0806A340 @ =0x08B9E2BC
	str r5, [sp]
	movs r3, #0
	mov sl, r3
	str r3, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	movs r3, #0
	bl NewEkrsubAnimeEmulator
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0806A3BA
	ldr r0, _0806A344 @ =0x08BDB84C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	ldr r1, [sp, #0x40]
	cmp r1, #0
	blt _0806A34C
	ldr r2, _0806A348 @ =0x08B9E2EC
	str r5, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	mov r0, r8
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	b _0806A392
	.align 2, 0
_0806A340: .4byte 0x08B9E2BC
_0806A344: .4byte 0x08BDB84C
_0806A348: .4byte 0x08B9E2EC
_0806A34C:
	ldr r1, [sp, #0x18]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r1, r3
	orrs r1, r6
	mov r0, r8
	subs r0, #3
	ldr r2, _0806A3CC @ =0x08B9E338
	str r1, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	orrs r6, r7
	ldr r2, _0806A3D0 @ =0x08B9E31C
	str r6, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	bl PutEkrLvupStatGainLabelGfx2
_0806A392:
	movs r0, #0
	mov r3, r8
	strh r3, [r4, #0x32]
	mov r1, sb
	strh r1, [r4, #0x3a]
	strh r0, [r4, #0x2c]
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r4, #0x2e]
	mov r0, sp
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x44]
	ldr r3, [sp, #0x10]
	str r3, [r4, #0x48]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #0x4c]
	ldr r1, [sp, #0x40]
	str r1, [r4, #0x50]
_0806A3BA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3CC: .4byte 0x08B9E338
_0806A3D0: .4byte 0x08B9E31C

	thumb_func_start sub_0806A3D4
sub_0806A3D4: @ 0x0806A3D4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _0806A3E8
	adds r0, r4, #0
	bl Proc_Break
	b _0806A436
_0806A3E8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0806A436
	strh r5, [r4, #0x2c]
	ldr r3, [r4, #0x48]
	lsls r3, r3, #0xc
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	orrs r3, r0
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r0, #3
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	ldr r2, _0806A440 @ =0x08B9E374
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x50]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl PutEkrLvupStatGainLabelGfx1
	adds r0, r4, #0
	bl Proc_Break
_0806A436:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A440: .4byte 0x08B9E374

	thumb_func_start sub_0806A444
sub_0806A444: @ 0x0806A444
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	bge _0806A454
	bl Proc_Break
	b _0806A476
_0806A454:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0806A476
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl PutEkrLvupStatGainLabelGfx2
	adds r0, r4, #0
	bl Proc_Break
_0806A476:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806A47C
sub_0806A47C: @ 0x0806A47C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A4A0 @ =0x02020130
	ldr r0, [r0]
	cmp r0, #1
	bne _0806A49A
	ldr r0, [r4, #0x60]
	bl Proc_End
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806A49A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A4A0: .4byte 0x02020130

	thumb_func_start CheckEkrTriangleInvalid
CheckEkrTriangleInvalid: @ 0x0806A4A4
	ldr r0, _0806A4B0 @ =0x02020134
	ldr r0, [r0]
	cmp r0, #1
	beq _0806A4B4
	movs r0, #0
	b _0806A4B6
	.align 2, 0
_0806A4B0: .4byte 0x02020134
_0806A4B4:
	movs r0, #1
_0806A4B6:
	bx lr

	thumb_func_start sub_0806A4B8
sub_0806A4B8: @ 0x0806A4B8
	bx lr
	.align 2, 0

	thumb_func_start NewEkrTriangle
NewEkrTriangle: @ 0x0806A4BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A4D8 @ =0x08BDB874
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	ldr r1, _0806A4DC @ =0x02020134
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A4D8: .4byte 0x08BDB874
_0806A4DC: .4byte 0x02020134

	thumb_func_start sub_0806A4E0
sub_0806A4E0: @ 0x0806A4E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	mov sl, r0
	mov r8, r0
	movs r7, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806A50C
	ldr r0, _0806A508 @ =0x0203E094
	b _0806A50E
	.align 2, 0
_0806A508: .4byte 0x0203E094
_0806A50C:
	ldr r0, _0806A55C @ =0x0203E098
_0806A50E:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r5, [r0, #4]
	cmp r5, #0x14
	bge _0806A51A
	b _0806A61C
_0806A51A:
	cmp r5, #0x17
	ble _0806A520
	b _0806A61C
_0806A520:
	ldr r0, _0806A560 @ =0x0203E0A0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x14
	bne _0806A530
	movs r2, #0
	mov sb, r2
_0806A530:
	cmp r0, #0x15
	bne _0806A538
	movs r2, #0
	mov sb, r2
_0806A538:
	cmp r0, #0x16
	bne _0806A540
	movs r2, #1
	mov sb, r2
_0806A540:
	cmp r0, #0x17
	bne _0806A548
	movs r0, #1
	mov sb, r0
_0806A548:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A564
	movs r0, #1
	b _0806A56A
	.align 2, 0
_0806A55C: .4byte 0x0203E098
_0806A560: .4byte 0x0203E0A0
_0806A564:
	adds r0, r4, #0
	bl GetItemKind
_0806A56A:
	cmp r0, #1
	beq _0806A574
	cmp r0, #2
	beq _0806A57A
	b _0806A58C
_0806A574:
	movs r1, #0
	mov r8, r1
	b _0806A58C
_0806A57A:
	adds r0, r4, #0
	bl GetItemIid
	movs r2, #1
	mov r8, r2
	cmp r0, #0x28
	bne _0806A58C
	movs r0, #2
	mov r8, r0
_0806A58C:
	ldr r0, _0806A5C8 @ =0x0203E0A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x14
	bne _0806A59C
	movs r2, #0
	mov sl, r2
_0806A59C:
	cmp r0, #0x15
	bne _0806A5A4
	movs r2, #0
	mov sl, r2
_0806A5A4:
	cmp r0, #0x16
	bne _0806A5AC
	movs r2, #1
	mov sl, r2
_0806A5AC:
	cmp r0, #0x17
	bne _0806A5B4
	movs r0, #1
	mov sl, r0
_0806A5B4:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A5CC
	movs r0, #1
	b _0806A5D2
	.align 2, 0
_0806A5C8: .4byte 0x0203E0A0
_0806A5CC:
	adds r0, r4, #0
	bl GetItemKind
_0806A5D2:
	cmp r0, #1
	beq _0806A5DC
	cmp r0, #2
	beq _0806A5E0
	b _0806A5EE
_0806A5DC:
	movs r7, #0
	b _0806A5EE
_0806A5E0:
	adds r0, r4, #0
	bl GetItemIid
	movs r7, #1
	cmp r0, #0x28
	bne _0806A5EE
	movs r7, #2
_0806A5EE:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_0806A97C
	ldr r0, _0806A614 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x28
	bne _0806A6C4
	ldr r1, _0806A618 @ =0x02020134
	movs r0, #0
	b _0806A6C8
	.align 2, 0
_0806A614: .4byte 0x0203E098
_0806A618: .4byte 0x02020134
_0806A61C:
	ldr r0, _0806A648 @ =0x0203E0A0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x32
	bne _0806A62C
	movs r2, #0
	mov sb, r2
_0806A62C:
	cmp r0, #0x33
	bne _0806A634
	movs r0, #1
	mov sb, r0
_0806A634:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A64C
	movs r0, #1
	b _0806A656
	.align 2, 0
_0806A648: .4byte 0x0203E0A0
_0806A64C:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0
	beq _0806A660
_0806A656:
	cmp r0, #1
	bne _0806A664
	movs r1, #0
	mov r8, r1
	b _0806A664
_0806A660:
	movs r2, #1
	mov r8, r2
_0806A664:
	ldr r0, _0806A690 @ =0x0203E0A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x32
	bne _0806A674
	movs r2, #0
	mov sl, r2
_0806A674:
	cmp r0, #0x33
	bne _0806A67C
	movs r0, #1
	mov sl, r0
_0806A67C:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A694
	movs r0, #1
	b _0806A69E
	.align 2, 0
_0806A690: .4byte 0x0203E0A0
_0806A694:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0
	beq _0806A6A6
_0806A69E:
	cmp r0, #1
	bne _0806A6A8
	movs r7, #0
	b _0806A6A8
_0806A6A6:
	movs r7, #1
_0806A6A8:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_0806A6E4
	cmp r5, #0x32
	bne _0806A6C4
	ldr r1, _0806A6C0 @ =0x02020134
	movs r0, #0
	b _0806A6C8
	.align 2, 0
_0806A6C0: .4byte 0x02020134
_0806A6C4:
	ldr r1, _0806A6E0 @ =0x02020134
	movs r0, #1
_0806A6C8:
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A6E0: .4byte 0x02020134

	thumb_func_start sub_0806A6E4
sub_0806A6E4: @ 0x0806A6E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0806A718 @ =0x08BDB88C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806A718: .4byte 0x08BDB88C

	thumb_func_start sub_0806A71C
sub_0806A71C: @ 0x0806A71C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0806A742
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	movs r1, #0
	bl NewEkrTriPegasusKnightOBJ
_0806A742:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x1c
	bne _0806A750
	adds r0, r5, #0
	movs r1, #6
	bl NewEfxFlashBgWhite
_0806A750:
	ldrh r3, [r4, #0x2c]
	cmp r3, #0x22
	bne _0806A782
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #0
	bl NewEkrTriPegasusKnightBG
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	movs r1, #1
	bl NewEkrTriPegasusKnightOBJ
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0806A782:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x33
	bne _0806A790
	adds r0, r5, #0
	movs r1, #6
	bl NewEfxFlashBgWhite
_0806A790:
	ldrh r3, [r4, #0x2c]
	cmp r3, #0x39
	bne _0806A7B6
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	adds r0, r5, #0
	movs r1, #1
	bl NewEkrTriPegasusKnightBG
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0806A7B6:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x43
	bne _0806A7C8
	ldr r1, _0806A7D0 @ =0x02020134
	movs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806A7C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A7D0: .4byte 0x02020134

	thumb_func_start NewEkrTriPegasusKnightBG
NewEkrTriPegasusKnightBG: @ 0x0806A7D4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0806A7FC @ =0x08BDB8A4
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0806A808
	ldr r0, _0806A800 @ =0x0203E0A8
	ldr r2, [r0]
	ldr r0, _0806A804 @ =0x082E5C9C
	b _0806A80E
	.align 2, 0
_0806A7FC: .4byte 0x08BDB8A4
_0806A800: .4byte 0x0203E0A8
_0806A804: .4byte 0x082E5C9C
_0806A808:
	ldr r0, _0806A844 @ =0x0203E0A8
	ldr r2, [r0, #4]
	ldr r0, _0806A848 @ =0x082E5CAA
_0806A80E:
	str r0, [r1, #0x48]
	ldr r0, _0806A84C @ =0x08BDB8BC
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r4, _0806A850 @ =0x02017784
	adds r0, r2, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0806A854 @ =0x082E5CB8
	cmp r6, #0
	beq _0806A836
	ldr r0, _0806A858 @ =0x082E704C
	cmp r7, #0
	bne _0806A836
	ldr r0, _0806A85C @ =0x082E665C
_0806A836:
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A844: .4byte 0x0203E0A8
_0806A848: .4byte 0x082E5CAA
_0806A84C: .4byte 0x08BDB8BC
_0806A850: .4byte 0x02017784
_0806A854: .4byte 0x082E5CB8
_0806A858: .4byte 0x082E704C
_0806A85C: .4byte 0x082E665C

	thumb_func_start EkrTriPegasusKnightBgMain
EkrTriPegasusKnightBgMain: @ 0x0806A860
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806A88E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806A8A0
_0806A88E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806A8A0
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806A8A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrTriPegasusKnightOBJ
NewEkrTriPegasusKnightOBJ: @ 0x0806A8A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _0806A8DC @ =0x08BDB8D4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _0806A8E8
	movs r0, #0x12
	strh r0, [r5, #0x2e]
	ldr r0, _0806A8E0 @ =0x0203E0A8
	ldr r6, [r0]
	ldr r3, _0806A8E4 @ =0x08BDBE04
	b _0806A8F2
	.align 2, 0
_0806A8DC: .4byte 0x08BDB8D4
_0806A8E0: .4byte 0x0203E0A8
_0806A8E4: .4byte 0x08BDBE04
_0806A8E8:
	movs r0, #0x11
	strh r0, [r5, #0x2e]
	ldr r0, _0806A93C @ =0x0203E0A8
	ldr r6, [r0, #4]
	ldr r3, _0806A940 @ =0x08BDC138
_0806A8F2:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldr r4, _0806A944 @ =0x0201A784
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806A948 @ =0x082E8070
	mov r1, r8
	cmp r1, #0
	beq _0806A924
	ldr r0, _0806A94C @ =0x082E93F4
	mov r1, sb
	cmp r1, #0
	bne _0806A924
	ldr r0, _0806A950 @ =0x082E8A28
_0806A924:
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A93C: .4byte 0x0203E0A8
_0806A940: .4byte 0x08BDC138
_0806A944: .4byte 0x0201A784
_0806A948: .4byte 0x082E8070
_0806A94C: .4byte 0x082E93F4
_0806A950: .4byte 0x082E8A28

	thumb_func_start sub_0806A954
sub_0806A954: @ 0x0806A954
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806A974
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806A974:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806A97C
sub_0806A97C: @ 0x0806A97C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0806A9B0 @ =0x08BDB8EC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806A9B0: .4byte 0x08BDB8EC

	thumb_func_start sub_0806A9B4
sub_0806A9B4: @ 0x0806A9B4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806A9EA
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, [r5, #0x50]
	str r4, [sp]
	bl NewEkrTriArmorKnightOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806A9EA:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x30
	bne _0806AA0E
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x44]
	ldr r3, [r5, #0x4c]
	movs r1, #0
	bl NewEkrTriArmorKnightOBJ2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806AA0E:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x3c
	bne _0806AA24
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxTriangleQUAKE
_0806AA24:
	ldrh r3, [r5, #0x2c]
	cmp r3, #0x4f
	bne _0806AA48
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x50]
	movs r1, #1
	bl NewEkrTriArmorKnightOBJ2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806AA48:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x5b
	bne _0806AA54
	ldr r1, _0806AA80 @ =0x02020134
	movs r0, #1
	str r0, [r1]
_0806AA54:
	ldrh r3, [r5, #0x2c]
	cmp r3, #0x60
	bne _0806AA6A
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxTriangleQUAKE
_0806AA6A:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x78
	bne _0806AA76
	adds r0, r5, #0
	bl Proc_Break
_0806AA76:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AA80: .4byte 0x02020134

	thumb_func_start NewEkrTriArmorKnightOBJ
NewEkrTriArmorKnightOBJ: @ 0x0806AA84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	mov sb, r2
	adds r6, r3, #0
	ldr r0, _0806AABC @ =0x08BDB904
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r0, _0806AAC0 @ =0x0203E0A8
	ldr r7, [r0]
	cmp r4, #0
	bne _0806AACC
	ldr r3, _0806AAC4 @ =0x08BDC1D0
	ldr r6, _0806AAC8 @ =0x082E9D9C
	b _0806AAF8
	.align 2, 0
_0806AABC: .4byte 0x08BDB904
_0806AAC0: .4byte 0x0203E0A8
_0806AAC4: .4byte 0x08BDC1D0
_0806AAC8: .4byte 0x082E9D9C
_0806AACC:
	cmp r6, #1
	beq _0806AAE4
	cmp r6, #1
	bhs _0806AAF4
	ldr r3, _0806AADC @ =0x08BDC260
	ldr r6, _0806AAE0 @ =0x082EA0BC
	b _0806AAF8
	.align 2, 0
_0806AADC: .4byte 0x08BDC260
_0806AAE0: .4byte 0x082EA0BC
_0806AAE4:
	ldr r3, _0806AAEC @ =0x08BDC2F0
	ldr r6, _0806AAF0 @ =0x082EA490
	b _0806AAF8
	.align 2, 0
_0806AAEC: .4byte 0x08BDC2F0
_0806AAF0: .4byte 0x082EA490
_0806AAF4:
	ldr r3, _0806AB38 @ =0x08BDC37C
	ldr r6, _0806AB3C @ =0x082EA8C4
_0806AAF8:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r1, r0, #0
	str r1, [r5, #0x60]
	ldr r0, _0806AB40 @ =0x00008840
	strh r0, [r1, #8]
	ldr r4, _0806AB44 @ =0x0201A784
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806AB48 @ =0x02022B60
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0806AB4C @ =0x0203E0A8
	ldr r7, [r0, #4]
	mov r0, sb
	cmp r0, #0
	bne _0806AB58
	ldr r3, _0806AB50 @ =0x08BDC1D0
	ldr r6, _0806AB54 @ =0x082E9D9C
	b _0806AB84
	.align 2, 0
_0806AB38: .4byte 0x08BDC37C
_0806AB3C: .4byte 0x082EA8C4
_0806AB40: .4byte 0x00008840
_0806AB44: .4byte 0x0201A784
_0806AB48: .4byte 0x02022B60
_0806AB4C: .4byte 0x0203E0A8
_0806AB50: .4byte 0x08BDC1D0
_0806AB54: .4byte 0x082E9D9C
_0806AB58:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	beq _0806AB70
	cmp r0, #1
	bhs _0806AB80
	ldr r3, _0806AB68 @ =0x08BDC260
	ldr r6, _0806AB6C @ =0x082EA0BC
	b _0806AB84
	.align 2, 0
_0806AB68: .4byte 0x08BDC260
_0806AB6C: .4byte 0x082EA0BC
_0806AB70:
	ldr r3, _0806AB78 @ =0x08BDC2F0
	ldr r6, _0806AB7C @ =0x082EA490
	b _0806AB84
	.align 2, 0
_0806AB78: .4byte 0x08BDC2F0
_0806AB7C: .4byte 0x082EA490
_0806AB80:
	ldr r3, _0806ABEC @ =0x08BDC37C
	ldr r6, _0806ABF0 @ =0x082EA8C4
_0806AB84:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r1, r0, #0
	str r1, [r5, #0x64]
	ldr r0, _0806ABF4 @ =0x0000A880
	strh r0, [r1, #8]
	ldr r4, _0806ABF8 @ =0x0201AF84
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806ABFC @ =0x02022BA0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806AC00 @ =0x06010800
	ldr r0, _0806AC04 @ =0xFFFFF800
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl RegisterDataMove
	bl EnablePalSync
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x20
	strh r0, [r1, #2]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ABEC: .4byte 0x08BDC37C
_0806ABF0: .4byte 0x082EA8C4
_0806ABF4: .4byte 0x0000A880
_0806ABF8: .4byte 0x0201AF84
_0806ABFC: .4byte 0x02022BA0
_0806AC00: .4byte 0x06010800
_0806AC04: .4byte 0xFFFFF800

	thumb_func_start sub_0806AC08
sub_0806AC08: @ 0x0806AC08
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	movs r2, #0
	bl Interpolate
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, r1, r0
	strh r1, [r2, #2]
	ldr r2, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r0, r1, r0
	strh r0, [r2, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806AC58
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x64]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806AC58:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEkrTriArmorKnightOBJ2
NewEkrTriArmorKnightOBJ2: @ 0x0806AC60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0806AC9C @ =0x08BDB91C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	cmp r5, #0
	bne _0806ACA4
	ldr r0, _0806ACA0 @ =0x0203E0A8
	ldr r0, [r0]
	b _0806ACA8
	.align 2, 0
_0806AC9C: .4byte 0x08BDB91C
_0806ACA0: .4byte 0x0203E0A8
_0806ACA4:
	ldr r0, _0806ACB4 @ =0x0203E0A8
	ldr r0, [r0, #4]
_0806ACA8:
	mov sb, r0
	cmp r6, #0
	bne _0806ACC0
	ldr r3, _0806ACB8 @ =0x08BDC46C
	ldr r6, _0806ACBC @ =0x082EAC84
	b _0806ACEC
	.align 2, 0
_0806ACB4: .4byte 0x0203E0A8
_0806ACB8: .4byte 0x08BDC46C
_0806ACBC: .4byte 0x082EAC84
_0806ACC0:
	cmp r7, #1
	beq _0806ACD8
	cmp r7, #1
	bhs _0806ACE8
	ldr r3, _0806ACD0 @ =0x08BDC5E4
	ldr r6, _0806ACD4 @ =0x082EB1BC
	b _0806ACEC
	.align 2, 0
_0806ACD0: .4byte 0x08BDC5E4
_0806ACD4: .4byte 0x082EB1BC
_0806ACD8:
	ldr r3, _0806ACE0 @ =0x08BDC738
	ldr r6, _0806ACE4 @ =0x082EB8F8
	b _0806ACEC
	.align 2, 0
_0806ACE0: .4byte 0x08BDC738
_0806ACE4: .4byte 0x082EB8F8
_0806ACE8:
	ldr r3, _0806AD18 @ =0x08BDCA00
	ldr r6, _0806AD1C @ =0x082EC084
_0806ACEC:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r5, #0
	bne _0806AD20
	ldrh r0, [r1, #4]
	adds r0, #0xa
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	adds r1, #0x10
	b _0806AD36
	.align 2, 0
_0806AD18: .4byte 0x08BDCA00
_0806AD1C: .4byte 0x082EC084
_0806AD20:
	ldrh r0, [r1, #4]
	adds r0, #2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	subs r1, #0xc
_0806AD36:
	strh r1, [r4, #0x32]
	ldrh r0, [r0, #2]
	subs r0, #0x10
	strh r0, [r4, #0x34]
	ldr r0, [r4, #0x60]
	strh r1, [r0, #2]
	ldr r4, _0806AD6C @ =0x0201A784
	mov r0, sb
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r6, #0
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AD6C: .4byte 0x0201A784

	thumb_func_start sub_0806AD70
sub_0806AD70: @ 0x0806AD70
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	ldr r1, [r4, #0x60]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806ADB0
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0806ADB0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0806ADB8
sub_0806ADB8: @ 0x0806ADB8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806ADD8
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806ADD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxTriangleQUAKE
NewEfxTriangleQUAKE: @ 0x0806ADE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0806AE10 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806AE14 @ =0x08BDB93C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AE10: .4byte 0x0201774C
_0806AE14: .4byte 0x08BDB93C

	thumb_func_start sub_0806AE18
sub_0806AE18: @ 0x0806AE18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r4, _0806AF80 @ =0x02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _0806AF84 @ =0x02000038
	ldrh r0, [r4]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r4]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r6, #2]
	adds r1, r2, r3
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldr r0, _0806AF88 @ =0x02000028
	mov sb, r0
	ldrh r5, [r4]
	ldrh r2, [r0]
	adds r1, r5, r2
	ldr r3, _0806AF8C @ =0x0201FB00
	mov sl, r3
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r2, _0806AF90 @ =0x0200002C
	mov r8, r2
	ldrh r4, [r4, #2]
	ldrh r3, [r2]
	subs r3, r3, r4
	mov ip, r3
	mov r2, sb
	ldrh r2, [r2, #2]
	adds r5, r5, r2
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r3, r8
	ldrh r3, [r3, #2]
	subs r4, r3, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, ip
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806AF72
	ldr r1, _0806AF94 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	mov r0, sl
	ldr r4, [r0]
	mov r2, sb
	ldrh r2, [r2]
	subs r1, r2, r4
	mov r3, sb
	ldrh r3, [r3, #2]
	subs r4, r3, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	ldrh r5, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	ldr r0, [r7, #0x60]
	bl Proc_End
	adds r0, r7, #0
	bl Proc_Break
_0806AF72:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF80: .4byte 0x02017760
_0806AF84: .4byte 0x02000038
_0806AF88: .4byte 0x02000028
_0806AF8C: .4byte 0x0201FB00
_0806AF90: .4byte 0x0200002C
_0806AF94: .4byte 0x0201774C

	thumb_func_start PutBanimBgIMG
PutBanimBgIMG: @ 0x0806AF98
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _0806AFB0 @ =0x08BDCA64
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _0806AFB4 @ =0x06008000
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	.align 2, 0
_0806AFB0: .4byte 0x08BDCA64
_0806AFB4: .4byte 0x06008000

	thumb_func_start PutBanimBgTSA
PutBanimBgTSA: @ 0x0806AFB8
	push {r4, lr}
	sub sp, #8
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	ldr r0, _0806AFF0 @ =0x08BDCA64
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _0806AFF4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806AFF8 @ =0x02024460
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AFF0: .4byte 0x08BDCA64
_0806AFF4: .4byte 0x02019784
_0806AFF8: .4byte 0x02024460

	thumb_func_start PutBanimBgPAL
PutBanimBgPAL: @ 0x0806AFFC
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	ldr r0, _0806B018 @ =0x08BDCA64
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _0806B01C @ =0x02022920
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	.align 2, 0
_0806B018: .4byte 0x08BDCA64
_0806B01C: .4byte 0x02022920

	thumb_func_start PutBanimBG
PutBanimBG: @ 0x0806B020
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl PutBanimBgIMG
	movs r5, #0
	str r5, [sp]
	ldr r1, _0806B05C @ =0x0600FFE0
	ldr r2, _0806B060 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	adds r0, r4, #0
	bl PutBanimBgTSA
	adds r0, r4, #0
	bl PutBanimBgPAL
	ldr r0, _0806B064 @ =0x02022860
	strh r5, [r0]
	movs r0, #8
	bl EnableBgSync
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B05C: .4byte 0x0600FFE0
_0806B060: .4byte 0x01000008
_0806B064: .4byte 0x02022860

	thumb_func_start CheckEkrPopupDone
CheckEkrPopupDone: @ 0x0806B068
	ldr r0, _0806B074 @ =0x0202013C
	ldr r0, [r0]
	cmp r0, #1
	beq _0806B078
	movs r0, #0
	b _0806B07A
	.align 2, 0
_0806B074: .4byte 0x0202013C
_0806B078:
	movs r0, #1
_0806B07A:
	bx lr

	thumb_func_start EndEkrPopup
EndEkrPopup: @ 0x0806B07C
	push {r4, lr}
	ldr r4, _0806B094 @ =0x02020138
	ldr r0, [r4]
	cmp r0, #0
	beq _0806B08E
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0806B08E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B094: .4byte 0x02020138

	thumb_func_start EfxPlaySound5AVol100
EfxPlaySound5AVol100: @ 0x0806B098
	push {lr}
	ldr r0, _0806B0A8 @ =0x0000037A
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0806B0A8: .4byte 0x0000037A

	thumb_func_start EfxPlaySound5CVol100
EfxPlaySound5CVol100: @ 0x0806B0AC
	push {lr}
	movs r0, #0xdf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MakeBattlePopupTileMapFromTSA
MakeBattlePopupTileMapFromTSA: @ 0x0806B0C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r6, _0806B1A0 @ =0x02019784
	ldrh r1, [r6]
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r1, r2
	mov r3, ip
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x40
	ldrh r7, [r6, #0x30]
	adds r0, r7, r2
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r6, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r6, #0
	adds r0, #0x90
	ldrh r0, [r0]
	adds r0, r0, r2
	strh r0, [r1]
	movs r0, #0
	mov r8, r0
	cmp r8, sb
	bhs _0806B154
	adds r3, #0xc2
	str r3, [sp]
	mov r5, ip
	adds r5, #0x82
	adds r4, r6, #0
	adds r4, #0x62
	subs r3, #0x80
	mov r2, ip
	adds r2, #2
	adds r1, r6, #2
_0806B120:
	ldrh r7, [r1]
	movs r0, #0x88
	lsls r0, r0, #5
	adds r7, r7, r0
	strh r7, [r2]
	ldrh r7, [r1, #0x30]
	adds r7, r7, r0
	strh r7, [r3]
	ldrh r7, [r4]
	adds r7, r7, r0
	strh r7, [r5]
	ldrh r7, [r4, #0x30]
	adds r7, r7, r0
	ldr r0, [sp]
	strh r7, [r0]
	adds r0, #2
	str r0, [sp]
	adds r5, #2
	adds r4, #2
	adds r3, #2
	adds r2, #2
	adds r1, #2
	movs r7, #1
	add r8, r7
	cmp r8, sb
	blo _0806B120
_0806B154:
	mov r1, r8
	lsls r0, r1, #1
	mov r2, ip
	adds r1, r0, r2
	ldrh r3, [r6, #0x2e]
	movs r7, #0x88
	lsls r7, r7, #5
	adds r0, r3, r7
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x42
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r0, [r0]
	adds r3, r7, #0
	adds r0, r0, r3
	strh r0, [r2]
	adds r2, #0x40
	adds r0, r6, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r2]
	adds r1, #0xc2
	adds r0, r6, #0
	adds r0, #0xbe
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B1A0: .4byte 0x02019784

	thumb_func_start DrawBattlePopup
DrawBattlePopup: @ 0x0806B1A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov r8, r1
	mov sb, r2
	ldr r0, _0806B200 @ =0x081DB588
	ldr r1, _0806B204 @ =0x06002000
	bl LZ77UnCompVram
	ldr r0, _0806B208 @ =0x081DB704
	ldr r1, _0806B20C @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _0806B210 @ =0x02017648
	ldr r1, _0806B214 @ =0x060020C0
	movs r2, #0x83
	lsls r2, r2, #1
	movs r3, #1
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, _0806B218 @ =0x081DB6E4
	ldr r1, _0806B21C @ =0x02022880
	movs r2, #8
	bl CpuFastSet
	mov r0, r8
	cmp r0, #0
	bne _0806B220
	movs r1, #0
	str r1, [sp, #4]
	movs r0, #0xea
	lsls r0, r0, #3
	bl GetMsg
	adds r5, r0, #0
	bl GetStringTextLen
	adds r4, r0, #0
	adds r4, #0x10
	b _0806B268
	.align 2, 0
_0806B200: .4byte 0x081DB588
_0806B204: .4byte 0x06002000
_0806B208: .4byte 0x081DB704
_0806B20C: .4byte 0x02019784
_0806B210: .4byte 0x02017648
_0806B214: .4byte 0x060020C0
_0806B218: .4byte 0x081DB6E4
_0806B21C: .4byte 0x02022880
_0806B220:
	mov r2, r8
	cmp r2, #1
	bne _0806B254
	movs r3, #0
	str r3, [sp, #4]
	mov r0, sb
	movs r1, #1
	bl GetItemNameWithArticle
	adds r5, r0, #0
	bl GetStringTextLen
	adds r4, r0, #0
	adds r4, #0x10
	ldr r0, _0806B250 @ =0x00000751
	bl GetMsg
	adds r5, r0, #0
	bl GetStringTextLen
	adds r0, r0, r4
	adds r4, r0, #4
	b _0806B268
	.align 2, 0
_0806B250: .4byte 0x00000751
_0806B254:
	ldr r0, _0806B2AC @ =0x0000075A
	bl GetMsg
	adds r5, r0, #0
	bl GetStringTextLen
	adds r1, r0, #2
	str r1, [sp, #4]
	adds r4, r0, #0
	adds r4, #0x12
_0806B268:
	adds r0, r4, #7
	asrs r7, r0, #3
	ldr r0, _0806B2B0 @ =0x02023460
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	bl MakeBattlePopupTileMapFromTSA
	ldr r6, _0806B2B4 @ =0x02017660
	adds r0, r6, #0
	adds r1, r7, #0
	bl InitText
	lsls r0, r7, #3
	subs r0, r0, r4
	asrs r0, r0, #1
	mov sl, r0
	adds r0, r6, #0
	mov r1, sl
	bl Text_SetCursor
	ldr r0, _0806B2B8 @ =0x081DB5E4
	ldr r1, _0806B2BC @ =0x060020C0
	bl LZ77UnCompVram
	mov r2, r8
	cmp r2, #0
	bne _0806B2C0
	adds r0, r6, #0
	movs r1, #0x10
	bl Text_Skip
	movs r0, #0xea
	lsls r0, r0, #3
	b _0806B2F2
	.align 2, 0
_0806B2AC: .4byte 0x0000075A
_0806B2B0: .4byte 0x02023460
_0806B2B4: .4byte 0x02017660
_0806B2B8: .4byte 0x081DB5E4
_0806B2BC: .4byte 0x060020C0
_0806B2C0:
	mov r3, r8
	cmp r3, #1
	bne _0806B310
	adds r0, r6, #0
	movs r1, #0x10
	bl Text_Skip
	mov r0, sb
	movs r1, #1
	bl GetItemNameWithArticle
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl Text_SetColor
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r6, #0
	movs r1, #4
	bl Text_Skip
	ldr r0, _0806B30C @ =0x00000751
_0806B2F2:
	bl GetMsg
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawString
	b _0806B328
	.align 2, 0
_0806B30C: .4byte 0x00000751
_0806B310:
	ldr r0, _0806B364 @ =0x0000075A
	bl GetMsg
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawString
_0806B328:
	adds r1, r7, #2
	lsls r1, r1, #3
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	rsbs r1, r5, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0806B368 @ =0x0000FFD0
	movs r0, #1
	bl SetBgOffset
	movs r0, #2
	bl EnableBgSync
	bl InitIcons
	mov r0, r8
	cmp r0, #0
	bne _0806B36C
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, sb
	bl GetItemKind
	adds r0, #0x70
	b _0806B380
	.align 2, 0
_0806B364: .4byte 0x0000075A
_0806B368: .4byte 0x0000FFD0
_0806B36C:
	mov r1, r8
	cmp r1, #1
	bne _0806B388
	movs r0, #0
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, sb
	bl GetItemIcon
_0806B380:
	movs r1, #0x40
	bl PutIconObjImg
	b _0806B39A
_0806B388:
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	mov r0, sb
	adds r0, #0x70
	movs r1, #0x40
	bl PutIconObjImg
_0806B39A:
	ldr r0, _0806B404 @ =0x08BDCD4C
	movs r1, #0x96
	bl AnimCreate
	ldr r2, [sp]
	str r0, [r2, #0x60]
	movs r4, #0
	movs r1, #0x91
	lsls r1, r1, #6
	strh r1, [r0, #8]
	mov r1, sl
	adds r1, #8
	adds r1, r5, r1
	ldr r3, [sp, #4]
	adds r1, r1, r3
	strh r1, [r0, #2]
	movs r1, #0x38
	strh r1, [r0, #4]
	bl EnablePalSync
	ldr r2, _0806B408 @ =0x03002870
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
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B404: .4byte 0x08BDCD4C
_0806B408: .4byte 0x03002870

	thumb_func_start NewEkrPopup
NewEkrPopup: @ 0x0806B40C
	push {r4, r5, lr}
	ldr r0, _0806B468 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0806B480
	ldr r4, _0806B46C @ =0x02020138
	ldr r0, _0806B470 @ =0x08BDCDBC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _0806B474 @ =0x0202013C
	movs r0, #0
	str r0, [r1]
	subs r0, #1
	str r0, [r5, #0x44]
	movs r1, #0
	ldr r3, _0806B478 @ =0x0203E098
	ldr r2, _0806B47C @ =0x0203E094
_0806B434:
	ldr r0, [r3]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806B44E
	ldr r0, [r2]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806B44E
	str r1, [r5, #0x44]
_0806B44E:
	adds r1, #1
	cmp r1, #7
	ble _0806B434
	ldr r1, [r5, #0x44]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806B51E
	movs r0, #0x80
	bl SetBgmVolume
	b _0806B54A
	.align 2, 0
_0806B468: .4byte 0x0203E02C
_0806B46C: .4byte 0x02020138
_0806B470: .4byte 0x08BDCDBC
_0806B474: .4byte 0x0202013C
_0806B478: .4byte 0x0203E098
_0806B47C: .4byte 0x0203E094
_0806B480:
	ldr r4, _0806B52C @ =0x02020138
	ldr r0, _0806B530 @ =0x08BDCD54
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _0806B534 @ =0x0202013C
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	ldr r0, _0806B538 @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806B4D6
	ldr r4, _0806B53C @ =0x0203E094
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B4C0
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x44]
_0806B4C0:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B4D6
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x48]
_0806B4D6:
	ldr r0, _0806B538 @ =0x0203E020
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806B50E
	ldr r4, _0806B540 @ =0x0203E098
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B4F8
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x4c]
_0806B4F8:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B50E
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x50]
_0806B50E:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	ldr r1, [r5, #0x50]
	cmn r0, r1
	bne _0806B544
_0806B51E:
	ldr r1, _0806B534 @ =0x0202013C
	movs r0, #1
	str r0, [r1]
	bl EndEkrPopup
	b _0806B54A
	.align 2, 0
_0806B52C: .4byte 0x02020138
_0806B530: .4byte 0x08BDCD54
_0806B534: .4byte 0x0202013C
_0806B538: .4byte 0x0203E020
_0806B53C: .4byte 0x0203E094
_0806B540: .4byte 0x0203E098
_0806B544:
	movs r0, #0x80
	bl SetBgmVolume
_0806B54A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EkrPopup_Delay
EkrPopup_Delay: @ 0x0806B550
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0806B568
	adds r0, r1, #0
	bl Proc_Break
_0806B568:
	pop {r0}
	bx r0

	thumb_func_start EkrPopup_DrawWRankUp
EkrPopup_DrawWRankUp: @ 0x0806B56C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	cmp r2, #0
	beq _0806B588
	movs r1, #0
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806B588:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrPopup_WaitWRankUp
ekrPopup_WaitWRankUp: @ 0x0806B594
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0806B5A6
	adds r0, r4, #0
	bl Proc_Break
	b _0806B5C6
_0806B5A6:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B5C6
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806B5C6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrPopup_DrawWRankUp2
ekrPopup_DrawWRankUp2: @ 0x0806B5CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x4c]
	cmp r2, #0
	beq _0806B5E8
	movs r1, #0
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806B5E8:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806B5F4
sub_0806B5F4: @ 0x0806B5F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _0806B606
	adds r0, r4, #0
	bl Proc_Break
	b _0806B626
_0806B606:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B626
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806B626:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrPopup_DrawWpnBroke
ekrPopup_DrawWpnBroke: @ 0x0806B62C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0806B648
	movs r1, #1
	bl DrawBattlePopup
	bl EfxPlaySound5CVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0806B648:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806B654
sub_0806B654: @ 0x0806B654
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0806B666
	adds r0, r4, #0
	bl Proc_Break
	b _0806B686
_0806B666:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B686
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806B686:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrPopup_DrawWpnBroke2
ekrPopup_DrawWpnBroke2: @ 0x0806B68C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	beq _0806B6A8
	movs r1, #1
	bl DrawBattlePopup
	bl EfxPlaySound5CVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0806B6A8:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806B6B4
sub_0806B6B4: @ 0x0806B6B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0806B6C6
	adds r0, r4, #0
	bl Proc_Break
	b _0806B6EA
_0806B6C6:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B6EA
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806B6EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrPopup_MarkEnd
ekrPopup_MarkEnd: @ 0x0806B6F0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _0806B716
	ldr r0, _0806B71C @ =0x0202013C
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
_0806B716:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B71C: .4byte 0x0202013C

	thumb_func_start sub_0806B720
sub_0806B720: @ 0x0806B720
	bx lr
	.align 2, 0

	thumb_func_start sub_0806B724
sub_0806B724: @ 0x0806B724
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0806B744
	ldr r2, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl EfxPlaySound5AVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_0806B744:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806B750
sub_0806B750: @ 0x0806B750
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0806B762
	adds r0, r4, #0
	bl Proc_Break
	b _0806B786
_0806B762:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B786
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806B786:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CheckBanimHensei
CheckBanimHensei: @ 0x0806B78C
	ldr r1, _0806B7A0 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0806B7A4
	movs r0, #0
	b _0806B7A6
	.align 2, 0
_0806B7A0: .4byte 0x0203A3D8
_0806B7A4:
	movs r0, #1
_0806B7A6:
	bx lr

	thumb_func_start BeginAnimsOnBattle_Hensei
BeginAnimsOnBattle_Hensei: @ 0x0806B7A8
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetBanimInitPosReal
	ldr r1, _0806B7C8 @ =0x02017744
	str r0, [r1]
	bl NewEkrHenseiInitPROC
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0806B7C8: .4byte 0x02017744

	thumb_func_start ExecEkrHenseiEnd
ExecEkrHenseiEnd: @ 0x0806B7CC
	push {lr}
	bl AnimClearAll
	bl NewEkrHenseiEnd
	ldr r0, _0806B7E0 @ =MainUpdate_8055C68
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_0806B7E0: .4byte MainUpdate_8055C68

	thumb_func_start NewEkrHenseiInitPROC
NewEkrHenseiInitPROC: @ 0x0806B7E4
	push {lr}
	ldr r0, _0806B7F4 @ =0x08BDCDF4
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0806B7F4: .4byte 0x08BDCDF4

	thumb_func_start sub_0806B7F8
sub_0806B7F8: @ 0x0806B7F8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitOam
	bl EfxClearScreenFx
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _0806B84C @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl PutBanimBG
	ldr r4, _0806B850 @ =0x02022860
	ldr r1, _0806B854 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B84C: .4byte 0x0203E00A
_0806B850: .4byte 0x02022860
_0806B854: .4byte 0x020165C8

	thumb_func_start sub_0806B858
sub_0806B858: @ 0x0806B858
	push {r4, lr}
	adds r4, r0, #0
	bl EkrGauge_0804CC48
	bl EkrDispUP_0804D5A4
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0806B878
sub_0806B878: @ 0x0806B878
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0806B8D4 @ =0x020165C8
	ldr r4, _0806B8D8 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _0806B8CC
	adds r0, r6, #0
	bl Proc_Break
_0806B8CC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B8D4: .4byte 0x020165C8
_0806B8D8: .4byte 0x02022860

	thumb_func_start sub_0806B8DC
sub_0806B8DC: @ 0x0806B8DC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrHenseiEnd
NewEkrHenseiEnd: @ 0x0806B8E8
	push {lr}
	ldr r0, _0806B8F8 @ =0x08BDCE24
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0806B8F8: .4byte 0x08BDCE24

	thumb_func_start sub_0806B8FC
sub_0806B8FC: @ 0x0806B8FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806B920 @ =0x02022860
	ldr r1, _0806B924 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B920: .4byte 0x02022860
_0806B924: .4byte 0x020165C8

	thumb_func_start sub_0806B928
sub_0806B928: @ 0x0806B928
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0806B984 @ =0x020165C8
	ldr r4, _0806B988 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _0806B97C
	adds r0, r6, #0
	bl Proc_Break
_0806B97C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B984: .4byte 0x020165C8
_0806B988: .4byte 0x02022860

	thumb_func_start sub_0806B98C
sub_0806B98C: @ 0x0806B98C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B1D8
	bl EndEkrGauge
	ldr r0, _0806B9B0 @ =OnMain
	bl SetMainFunc
	ldr r0, _0806B9B4 @ =OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B9B0: .4byte OnMain
_0806B9B4: .4byte OnVBlank

	thumb_func_start GetSpellAssocStructPtr
GetSpellAssocStructPtr: @ 0x0806B9B8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0806B9E4 @ =0x08C999C0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	ldr r2, _0806B9E8 @ =0x0000FFFF
	cmp r1, r2
	beq _0806B9DC
_0806B9D0:
	cmp r1, r0
	beq _0806B9DC
	adds r4, #0x10
	ldrh r1, [r4]
	cmp r1, r2
	bne _0806B9D0
_0806B9DC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B9E4: .4byte 0x08C999C0
_0806B9E8: .4byte 0x0000FFFF

	thumb_func_start GetWeaponAnimActorCount
GetWeaponAnimActorCount: @ 0x0806B9EC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #2]
	pop {r1}
	bx r1

	thumb_func_start GetSpellAssocEfxIndex
GetSpellAssocEfxIndex: @ 0x0806B9FC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrh r0, [r0, #4]
	pop {r1}
	bx r1

	thumb_func_start GetWeaponAnimManimSpecialScr
GetWeaponAnimManimSpecialScr: @ 0x0806BA0C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldr r0, [r0, #8]
	pop {r1}
	bx r1

	thumb_func_start GetSpellAssocReturnBool
GetSpellAssocReturnBool: @ 0x0806BA1C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xc]
	pop {r1}
	bx r1

	thumb_func_start GetSpellAssocFacing
GetSpellAssocFacing: @ 0x0806BA2C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xd]
	pop {r1}
	bx r1

	thumb_func_start GetSpellAssocFlashColor
GetSpellAssocFlashColor: @ 0x0806BA3C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xe]
	pop {r1}
	bx r1

	thumb_func_start MU_Init
MU_Init: @ 0x0806BA4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806BA56:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806BA5E
	b _0806BA80
_0806BA5E:
	ldr r0, _0806BA7C @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806BA56
	.align 2, 0
_0806BA7C: .4byte 0x030014E8
_0806BA80:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806BA88
sub_0806BA88: @ 0x0806BA88
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl StartMuInternal
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806BAE6
_0806BAE6:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartMu
StartMu: @ 0x0806BAF0
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldrb r0, [r1, #4]
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806BB44
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetTrap
	adds r1, r0, #0
	ldrb r0, [r1, #3]
	cmp r0, #0x35
	beq _0806BB38
	cmp r0, #0x35
	bgt _0806BB2C
	cmp r0, #0x34
	beq _0806BB32
	b _0806BB44
_0806BB2C:
	cmp r0, #0x36
	beq _0806BB3E
	b _0806BB44
_0806BB32:
	movs r0, #0x5b
	str r0, [r7, #8]
	b _0806BB44
_0806BB38:
	movs r0, #0x5c
	str r0, [r7, #8]
	b _0806BB44
_0806BB3E:
	movs r0, #0x5d
	str r0, [r7, #8]
	b _0806BB44
_0806BB44:
	ldr r0, [r7]
	bl GetUnitSpritePalette
	ldr r1, [r7]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r2, [r7]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	ldr r4, [r7, #8]
	adds r3, r4, #0
	lsls r4, r3, #0x10
	lsrs r3, r4, #0x10
	movs r4, #1
	rsbs r4, r4, #0
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r4, #0
	bl StartMuInternal
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _0806BBA2
_0806BBA2:
	add sp, #0x10
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0806BBAC
sub_0806BBAC: @ 0x0806BBAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_0806CC0C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EnableMuCamera
EnableMuCamera: @ 0x0806BBC4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start DisableMuCamera
DisableMuCamera: @ 0x0806BBEC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start StartUiMu
StartUiMu: @ 0x0806BC0C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	bl StartMu
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806BC2A
	movs r0, #0
	b _0806BC80
_0806BC2A:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806BC80
_0806BC80:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0806BC88
sub_0806BC88: @ 0x0806BC88
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassSMSId
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3c
	ldrb r1, [r2]
	bl StartUiSMS
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartMuInternal
StartMuInternal: @ 0x0806BCB4
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x1a
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	movs r1, #1
	cmn r0, r1
	bne _0806BCFA
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl sub_0806CEB4
	str r0, [r7, #0x14]
	b _0806BD06
_0806BCFA:
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl sub_0806CF58
	str r0, [r7, #0x14]
_0806BD06:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bne _0806BD10
	movs r0, #0
	b _0806BF44
_0806BD10:
	ldr r1, _0806BD3C @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _0806BD24
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0xfe
	strh r1, [r0]
_0806BD24:
	ldr r1, _0806BD3C @ =0x08C9D00C
	adds r0, r1, #0
	movs r1, #5
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806BD40
	movs r0, #0
	b _0806BF44
	.align 2, 0
_0806BD3C: .4byte 0x08C9D00C
_0806BD40:
	ldr r0, [r7, #0xc]
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #2
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x18
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x43
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0xc]
	adds r0, r7, #4
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	lsls r1, r2, #5
	ldr r3, _0806BF40 @ =0x06010000
	adds r2, r1, r3
	str r2, [r0, #0x38]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x1a
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x46
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x28]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMuAnimForJid
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xa
	bl StartSpriteAnim
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	bl sub_0806D554
	adds r4, r0, #0
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_0806D524
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_0806D524
	ldr r1, [r7, #0x10]
	str r0, [r1, #0x24]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #0x14]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	str r0, [r1, #0x48]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806BF44
	.align 2, 0
_0806BF40: .4byte 0x06010000
_0806BF44:
	add sp, #0x1c
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start SetMuFacing
SetMuFacing: @ 0x0806BF4C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x42
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #4]
	cmp r0, #0xf
	bne _0806BF88
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl SetStandingMuFacing
	b _0806BF9A
_0806BF88:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl SetSpriteAnimId
_0806BF9A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806BFA4
sub_0806BFA4: @ 0x0806BFA4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetJobInfo
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806BFD0
	ldr r0, [r7]
	movs r1, #1
	bl SetMuFacing
	b _0806BFD8
_0806BFD0:
	ldr r0, [r7]
	movs r1, #2
	bl SetMuFacing
_0806BFD8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetAutoMuDefaultFacing
SetAutoMuDefaultFacing: @ 0x0806BFE0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _0806BFF8 @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _0806BFFC
	b _0806C002
	.align 2, 0
_0806BFF8: .4byte 0x08C9D00C
_0806BFFC:
	ldr r0, [r7]
	bl sub_0806BFA4
_0806C002:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetAutoMuMoveScript
SetAutoMuMoveScript: @ 0x0806C00C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806C028 @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806C02C
	b _0806C036
	.align 2, 0
_0806C028: .4byte 0x08C9D00C
_0806C02C:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	ldr r1, [r7]
	bl SetMuMoveScript
_0806C036:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806C040
sub_0806C040: @ 0x0806C040
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806C058 @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806C056
	movs r0, #1
_0806C056:
	b _0806C05C
	.align 2, 0
_0806C058: .4byte 0x08C9D00C
_0806C05C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MuExistsActive
MuExistsActive: @ 0x0806C064
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	movs r0, #0
	str r0, [r7, #4]
_0806C06E:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C076
	b _0806C0B6
_0806C076:
	ldr r0, _0806C0A4 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806C0AE
	ldr r0, _0806C0A4 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C0A8
	b _0806C0AA
	.align 2, 0
_0806C0A4: .4byte 0x030014E8
_0806C0A8:
	b _0806C0AE
_0806C0AA:
	movs r0, #1
	b _0806C0C4
_0806C0AE:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806C06E
_0806C0B6:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C0C0
	movs r0, #0
	b _0806C0C4
_0806C0C0:
	movs r0, #1
	b _0806C0C4
_0806C0C4:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start IsMuActive
IsMuActive: @ 0x0806C0CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806C0E2
	movs r0, #0
	b _0806C0FC
_0806C0E2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C0F0
	b _0806C0F4
_0806C0F0:
	movs r0, #0
	b _0806C0FC
_0806C0F4:
	movs r0, #1
	b _0806C0FC
_0806C0F8:
	.byte 0x00, 0x20, 0xFF, 0xE7
_0806C0FC:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start SetMuMoveScript
SetMuMoveScript: @ 0x0806C104
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806C112:
	ldr r0, [r7, #8]
	cmp r0, #0x3f
	ble _0806C11A
	b _0806C144
_0806C11A:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	adds r0, r1, #5
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806C112
_0806C144:
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl PlayMuStepSe
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start StartMuScripted
StartMuScripted: @ 0x0806C178
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	adds r2, r7, #2
	ldrh r1, [r2]
	adds r3, r7, #4
	ldrh r2, [r3]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl StartMuInternal
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C1B6
	movs r0, #0
	b _0806C1C6
_0806C1B6:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl SetMuMoveScript
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C1C6
_0806C1C6:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MuStepSe_Init
MuStepSe_Init: @ 0x0806C1D0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x58]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start MuStepSe_PlaySeA
MuStepSe_PlaySeA: @ 0x0806C20C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x58]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl PlaySeSpacial
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MuStepSe_PlaySeB
MuStepSe_PlaySeB: @ 0x0806C230
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	beq _0806C252
	ldr r1, [r7]
	ldr r0, [r1, #0x5c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl PlaySeSpacial
_0806C252:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPlayMuStepSe
StartPlayMuStepSe: @ 0x0806C25C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0806C2AC @ =0x08C9CE70
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C284
	ldr r1, _0806C2AC @ =0x08C9CE70
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
_0806C284:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x58]
	cmp r1, #0
	bne _0806C2B0
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x58]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	b _0806C2DA
	.align 2, 0
_0806C2AC: .4byte 0x08C9CE70
_0806C2B0:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x60]
	cmp r1, #0
	bne _0806C2DA
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r1, r1, r2
	str r1, [r0, #0x5c]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806C2DA:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayMuStepSe
PlayMuStepSe: @ 0x0806C2E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl UpdateMuStepSounds
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndMuMovement
EndMuMovement: @ 0x0806C2FC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start RunMuMoveScript
RunMuMoveScript: @ 0x0806C30C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
_0806C314:
	b _0806C318
_0806C316:
	.byte 0x0E, 0xE1
_0806C318:
	adds r0, r7, #4
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	bls _0806C34C
	b _0806C532
_0806C34C:
	lsls r1, r0, #2
	ldr r2, _0806C358 @ =_0806C35C
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806C358: .4byte _0806C35C
_0806C35C: @ jump table
	.4byte _0806C44C @ case 0
	.4byte _0806C45A @ case 1
	.4byte _0806C45A @ case 2
	.4byte _0806C45A @ case 3
	.4byte _0806C45A @ case 4
	.4byte _0806C444 @ case 5
	.4byte _0806C4AA @ case 6
	.4byte _0806C4AA @ case 7
	.4byte _0806C4AA @ case 8
	.4byte _0806C4AA @ case 9
	.4byte _0806C39C @ case 10
	.4byte _0806C3E8 @ case 11
	.4byte _0806C532 @ case 12
	.4byte _0806C4EE @ case 13
	.4byte _0806C522 @ case 14
	.4byte _0806C52A @ case 15
_0806C39C:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0806C536
_0806C3E8:
	ldr r0, [r7]
	bl EndMuMovement
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	ldr r1, _0806C440 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r4, #0
	ldrsh r1, [r2, r4]
	asrs r2, r1, #4
	adds r1, r2, #0
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	ldr r2, _0806C440 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl StartMuFogBump
	b _0806C536
	.align 2, 0
_0806C440: .4byte 0x0202BBB8
_0806C444:
	ldr r0, [r7]
	bl HaltMu
	b _0806C536
_0806C44C:
	ldr r0, [r7]
	bl EndMuMovement
	ldr r0, [r7]
	bl EndMu
	b _0806C536
_0806C45A:
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806C4A8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetMuAnimForJid
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r7]
	bl SetMuFacing
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806C4A8:
	b _0806C536
_0806C4AA:
	adds r0, r7, #4
	adds r1, r7, #4
	ldrh r2, [r1]
	subs r1, r2, #5
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806C4EC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetMuAnimForJid
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	bl SetMuFacing
_0806C4EC:
	b _0806C314
_0806C4EE:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0806C314
_0806C522:
	ldr r0, [r7]
	bl EnableMuCamera
	b _0806C314
_0806C52A:
	ldr r0, [r7]
	bl DisableMuCamera
	b _0806C314
_0806C532:
	b _0806C534
_0806C534:
	b _0806C314
_0806C536:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartMuFogBump
StartMuFogBump: @ 0x0806C540
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806C5AC @ =0x083F4730
	ldr r1, _0806C5B0 @ =0x06013000
	bl Decompress
	ldr r1, _0806C5B4 @ =0x083EF9A0
	adds r0, r1, #0
	movs r1, #2
	bl StartSpriteAnim
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0x22]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x8c
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x22]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	bl SetSpriteAnimId
	ldr r1, _0806C5B8 @ =0x08C9CEA0
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x50]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #8
	str r2, [r0, #0x2c]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	subs r2, r1, #4
	str r2, [r0, #0x30]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C5AC: .4byte 0x083F4730
_0806C5B0: .4byte 0x06013000
_0806C5B4: .4byte 0x083EF9A0
_0806C5B8: .4byte 0x08C9CEA0

	thumb_func_start sub_0806C5BC
sub_0806C5BC: @ 0x0806C5BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, _0806C670 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806C5DC
	ldr r1, _0806C674 @ =0x00000397
	adds r0, r1, #0
	bl m4aSongNumStart
_0806C5DC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _0806C678 @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806C678 @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806C678 @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	movs r1, #0x80
	lsls r1, r1, #2
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806C678 @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C670: .4byte 0x0202BBF8
_0806C674: .4byte 0x00000397
_0806C678: .4byte 0x080C5A48

	thumb_func_start sub_0806C67C
sub_0806C67C: @ 0x0806C67C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #7
	ble _0806C6A0
	ldr r0, [r7]
	bl Proc_Break
_0806C6A0:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7]
	adds r0, r3, #0
	adds r4, r3, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, _0806C75C @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806C75C @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806C75C @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806C75C @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	adds r2, r3, #0
	subs r2, #8
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl DisplaySpriteAnim
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C75C: .4byte 0x080C5A48

	thumb_func_start sub_0806C760
sub_0806C760: @ 0x0806C760
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x27
	ble _0806C784
	ldr r0, [r7]
	bl Proc_Break
_0806C784:
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r2, [r7]
	ldr r1, [r2, #0x2c]
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r3, #0
	orrs r2, r4
	bl DisplaySpriteAnim
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806C7A4
sub_0806C7A4: @ 0x0806C7A4
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806C7BC @ =0x08C9CEA0
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806C7BA
	movs r0, #1
_0806C7BA:
	b _0806C7C0
	.align 2, 0
_0806C7BC: .4byte 0x08C9CEA0
_0806C7C0:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0806C7C8
sub_0806C7C8: @ 0x0806C7C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_0806C7A4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806C7F4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806C7F4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806C7FC
sub_0806C7FC: @ 0x0806C7FC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806C824
sub_0806C824: @ 0x0806C824
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806C852
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0806C878
_0806C852:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806C878:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806C880
sub_0806C880: @ 0x0806C880
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806C890
sub_0806C890: @ 0x0806C890
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806C8A0
sub_0806C8A0: @ 0x0806C8A0
	push {r4, r5, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl GetMuQ4MovementSpeed
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x48
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r2, _0806CAEC @ =0x08C9CEC0
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #2
	adds r2, r2, r3
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r2, _0806CAEC @ =0x08C9CEC0
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r4, r3, #1
	adds r3, r4, #0
	lsls r4, r3, #1
	adds r2, r2, r4
	movs r5, #0
	ldrsh r3, [r2, r5]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	lsrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xf
	bhi _0806C96C
	b _0806CA68
_0806C96C:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	ldr r2, _0806CAF0 @ =0xFFFFFF00
	adds r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806CAEC @ =0x08C9CEC0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806CAEC @ =0x08C9CEC0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #1
	adds r5, r4, #1
	adds r4, r5, #0
	lsls r5, r4, #1
	adds r3, r3, r5
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806CA68:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806CAC8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl GetCameraAdjustedX
	adds r1, r0, #0
	ldr r0, _0806CAF4 @ =0x0202BBB8
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl GetCameraAdjustedY
	adds r1, r0, #0
	ldr r0, _0806CAF4 @ =0x0202BBB8
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
_0806CAC8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bne _0806CAE4
	ldr r0, [r7]
	bl UpdateMuStepSounds
_0806CAE4:
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CAEC: .4byte 0x08C9CEC0
_0806CAF0: .4byte 0xFFFFFF00
_0806CAF4: .4byte 0x0202BBB8

	thumb_func_start UpdateMuStepSounds
UpdateMuStepSounds: @ 0x0806CAF8
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetJobInfo
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806CB5A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x32
	blt _0806CB4C
	cmp r0, #0x33
	ble _0806CB34
	cmp r0, #0x37
	bgt _0806CB4C
	b _0806CB40
_0806CB34:
	ldr r0, _0806CB3C @ =0x08C9CF92
	str r0, [r7, #8]
	b _0806CB58
	.align 2, 0
_0806CB3C: .4byte 0x08C9CF92
_0806CB40:
	ldr r0, _0806CB48 @ =0x08C9CF66
	str r0, [r7, #8]
	b _0806CB58
	.align 2, 0
_0806CB48: .4byte 0x08C9CF66
_0806CB4C:
	ldr r0, _0806CB54 @ =0x08C9CF38
	str r0, [r7, #8]
	b _0806CB58
	.align 2, 0
_0806CB54: .4byte 0x08C9CF38
_0806CB58:
	b _0806CBA8
_0806CB5A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x46
	beq _0806CB90
	cmp r0, #0x46
	bgt _0806CB74
	cmp r0, #0x17
	bgt _0806CB9C
	cmp r0, #0x14
	blt _0806CB9C
	b _0806CB86
_0806CB74:
	cmp r0, #0x55
	beq _0806CB86
	cmp r0, #0x55
	blt _0806CB9C
	cmp r0, #0x5d
	bgt _0806CB9C
	cmp r0, #0x5b
	blt _0806CB9C
	b _0806CB86
_0806CB86:
	ldr r0, _0806CB8C @ =0x08C9CEF4
	str r0, [r7, #8]
	b _0806CBA8
	.align 2, 0
_0806CB8C: .4byte 0x08C9CEF4
_0806CB90:
	ldr r0, _0806CB98 @ =0x08C9CFBE
	str r0, [r7, #8]
	b _0806CBA8
	.align 2, 0
_0806CB98: .4byte 0x08C9CFBE
_0806CB9C:
	ldr r0, _0806CBA4 @ =0x08C9CED0
	str r0, [r7, #8]
	b _0806CBA8
	.align 2, 0
_0806CBA4: .4byte 0x08C9CED0
_0806CBA8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x43
	ldrb r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strb r3, [r0]
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	adds r1, r2, #0
	bl DivRem
	str r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, [r7]
	bl sub_0806CFFC
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806CC02
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	ldr r1, [r7, #8]
	adds r2, r1, #2
	ldrh r1, [r2]
	adds r3, r7, #0
	adds r3, #0x10
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl StartPlayMuStepSe
_0806CC02:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806CC0C
sub_0806CC0C: @ 0x0806CC0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806CC64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806CC4C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #3
	beq _0806CC46
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806CC46
	b _0806CC4C
_0806CC46:
	ldr r0, [r7]
	bl RunMuMoveScript
_0806CC4C:
	ldr r0, _0806CC7C @ =0x08C9CFEC
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3f
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7]
	bl _call_via_r1
_0806CC64:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xf
	bne _0806CC80
	ldr r0, [r7]
	bl sub_0806D148
	b _0806CC86
	.align 2, 0
_0806CC7C: .4byte 0x08C9CFEC
_0806CC80:
	ldr r0, [r7]
	bl sub_0806D250
_0806CC86:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806CC90
sub_0806CC90: @ 0x0806CC90
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	bl EndSpriteAnim
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start EndAllMus
EndAllMus: @ 0x0806CCB8
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806CCCC @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCCC: .4byte 0x08C9D00C

	thumb_func_start EndMu
EndMu: @ 0x0806CCD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_0806CCE8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806CCE8
sub_0806CCE8: @ 0x0806CCE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl Proc_End
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HaltMu
HaltMu: @ 0x0806CD00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl EndMuMovement
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LockMus
LockMus: @ 0x0806CD30
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl Proc_LockEachMarked
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start ReleaseMus
ReleaseMus: @ 0x0806CD40
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl Proc_UnblockEachMarked
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start ApplyMoveScriptToCoordinates
ApplyMoveScriptToCoordinates: @ 0x0806CD50
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_0806CD5C:
	b _0806CD60
_0806CD5E:
	.byte 0x4A, 0xE0
_0806CD60:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r0]
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, #1
	str r2, [r0]
	cmp r1, #0xa
	bhi _0806CDF2
	adds r0, r1, #0
	lsls r1, r0, #2
	ldr r2, _0806CD80 @ =_0806CD84
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806CD80: .4byte _0806CD84
_0806CD84: @ jump table
	.4byte _0806CDB0 @ case 0
	.4byte _0806CDB2 @ case 1
	.4byte _0806CDC0 @ case 2
	.4byte _0806CDDC @ case 3
	.4byte _0806CDCE @ case 4
	.4byte _0806CDB0 @ case 5
	.4byte _0806CDF2 @ case 6
	.4byte _0806CDF2 @ case 7
	.4byte _0806CDF2 @ case 8
	.4byte _0806CDF2 @ case 9
	.4byte _0806CDEA @ case 10
_0806CDB0:
	b _0806CDF6
_0806CDB2:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDC0:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDCE:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDDC:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806CDF4
_0806CDEA:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806CDF4
_0806CDF2:
	b _0806CDF4
_0806CDF4:
	b _0806CD5C
_0806CDF6:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CanStartMu
CanStartMu: @ 0x0806CE00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806CE0A:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806CE12
	b _0806CE34
_0806CE12:
	ldr r0, _0806CE28 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806CE2C
	movs r0, #1
	b _0806CE38
	.align 2, 0
_0806CE28: .4byte 0x030014E8
_0806CE2C:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806CE0A
_0806CE34:
	movs r0, #0
	b _0806CE38
_0806CE38:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start ResetMuAnims
ResetMuAnims: @ 0x0806CE40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806CE4A:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806CE52
	b _0806CEAC
_0806CE52:
	ldr r0, _0806CEA8 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806CEA0
	ldr r0, _0806CEA8 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806CEA8 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
_0806CEA0:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806CE4A
	.align 2, 0
_0806CEA8: .4byte 0x030014E8
_0806CEAC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806CEB4
sub_0806CEB4: @ 0x0806CEB4
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806CEC2:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806CECA
	b _0806CF4C
_0806CECA:
	ldr r0, _0806CF3C @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806CF44
	ldr r0, _0806CF3C @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, [r7, #8]
	adds r2, r1, #0
	adds r1, r2, #1
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806CF3C @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r2, _0806CF40 @ =0x08C9D02C
	ldr r3, [r7, #8]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	adds r1, r1, r3
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x4c
	muls r0, r1, r0
	ldr r2, _0806CF3C @ =0x030014E8
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806CF50
	.align 2, 0
_0806CF3C: .4byte 0x030014E8
_0806CF40: .4byte 0x08C9D02C
_0806CF44:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806CEC2
_0806CF4C:
	movs r0, #0
	b _0806CF50
_0806CF50:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0806CF58
sub_0806CF58: @ 0x0806CF58
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806CF66:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806CF6E
	b _0806CFF0
_0806CF6E:
	ldr r0, _0806CFE0 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806CFE8
	ldr r0, _0806CFE0 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, [r7, #8]
	adds r2, r1, #0
	adds r1, r2, #1
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806CFE0 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r2, _0806CFE4 @ =0x08C9D034
	ldr r3, [r7, #8]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	adds r1, r1, r3
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x4c
	muls r0, r1, r0
	ldr r2, _0806CFE0 @ =0x030014E8
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806CFF4
	.align 2, 0
_0806CFE0: .4byte 0x030014E8
_0806CFE4: .4byte 0x08C9D034
_0806CFE8:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806CF66
_0806CFF0:
	movs r0, #0
	b _0806CFF4
_0806CFF4:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0806CFFC
sub_0806CFFC: @ 0x0806CFFC
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806D014
	b _0806D06C
_0806D014:
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	movs r0, #1
	b _0806D140
_0806D06C:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D134 @ =0x0202BBB8
	ldrh r1, [r1, #0xc]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D134 @ =0x0202BBB8
	ldrh r1, [r1, #0xe]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D138
	adds r0, r7, #0
	adds r0, #8
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0806D138
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D138
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0xb0
	bgt _0806D138
	b _0806D13C
	.align 2, 0
_0806D134: .4byte 0x0202BBB8
_0806D138:
	movs r0, #0
	b _0806D140
_0806D13C:
	movs r0, #1
	b _0806D140
_0806D140:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0806D148
sub_0806D148: @ 0x0806D148
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D15E
	b _0806D244
_0806D15E:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_0806CFFC
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806D170
	b _0806D244
_0806D170:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806D1CC
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D1CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl sub_080255E0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	ldrh r0, [r1, #0x1e]
	adds r1, r7, #4
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	subs r1, #8
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, [r7]
	ldr r4, [r3, #0x38]
	ldr r5, _0806D24C @ =0xF9FF0000
	adds r3, r4, r5
	lsls r5, r3, #0xf
	lsrs r4, r5, #0xf
	lsrs r3, r4, #5
	ldr r4, [r7]
	ldr r5, [r4, #0x34]
	ldrb r4, [r5, #1]
	movs r5, #0xf
	ands r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x18
	lsrs r4, r5, #0x18
	adds r5, r4, #0
	lsls r4, r5, #0xc
	adds r3, r3, r4
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x46
	ldrh r4, [r5]
	adds r3, r3, r4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x41
	ldrb r4, [r5]
	str r4, [sp]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x3c
	ldrb r4, [r5]
	str r4, [sp, #4]
	bl sub_08026308
_0806D244:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D24C: .4byte 0xF9FF0000

	thumb_func_start sub_0806D250
sub_0806D250: @ 0x0806D250
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D266
	b _0806D378
_0806D266:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_0806CFFC
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806D278
	b _0806D378
_0806D278:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806D2BA
	b _0806D2BC
_0806D2BA:
	b _0806D33C
_0806D2BC:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _0806D2C6
	b _0806D33C
_0806D2C6:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0806D2D8
	b _0806D33C
_0806D2D8:
	ldr r0, _0806D334 @ =0x0202BBF8
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _0806D33C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x52
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r1, r0, #4
	adds r0, r1, #0
	adds r0, #8
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #2
	ldr r2, _0806D338 @ =0x0202E3EC
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	adds r1, r2, #0
	adds r1, #8
	asrs r2, r1, #4
	ldr r1, [r0]
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D33C
	b _0806D378
	.align 2, 0
_0806D334: .4byte 0x0202BBF8
_0806D338: .4byte 0x0202E3EC
_0806D33C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806D364
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D364:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	adds r2, r7, #4
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r3, r7, #6
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl DisplaySpriteAnim
_0806D378:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start GetMuQ4MovementSpeed
GetMuQ4MovementSpeed: @ 0x0806D380
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806D3A6
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x80
	str r1, [r7, #4]
_0806D3A6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x44
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D3B8
	movs r0, #0x80
	lsls r0, r0, #1
	b _0806D4C2
_0806D3B8:
	ldr r0, [r7, #4]
	cmp r0, #0x40
	bne _0806D3E8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetJobInfo
	ldr r1, _0806D3E4 @ =0x08C9D03C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806D4C2
	.align 2, 0
_0806D3E4: .4byte 0x08C9D03C
_0806D3E8:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806D458
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806D406
	ldr r0, [r7, #8]
	movs r1, #0x40
	eors r0, r1
	str r0, [r7, #8]
	b _0806D442
_0806D406:
	ldr r1, _0806D434 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806D43C
	ldr r1, _0806D438 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806D432
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806D432:
	b _0806D442
	.align 2, 0
_0806D434: .4byte 0x0202BBF8
_0806D438: .4byte 0x08B857F8
_0806D43C:
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806D442:
	ldr r0, [r7, #8]
	cmp r0, #0x80
	ble _0806D44C
	movs r0, #0x80
	str r0, [r7, #8]
_0806D44C:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _0806D4C2
_0806D458:
	bl IsFirstPlaythrough
	cmp r0, #0
	bne _0806D480
	ldr r1, _0806D47C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806D480
	movs r0, #0x80
	b _0806D4C2
	.align 2, 0
_0806D47C: .4byte 0x08B857F8
_0806D480:
	ldr r1, _0806D4B4 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806D4BE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetJobInfo
	ldr r1, _0806D4B8 @ =0x08C9D03C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806D4C2
	.align 2, 0
_0806D4B4: .4byte 0x0202BBF8
_0806D4B8: .4byte 0x08C9D03C
_0806D4BC:
	.byte 0x01, 0xE0
_0806D4BE:
	movs r0, #0x40
	b _0806D4C2
_0806D4C2:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0806D4CC
sub_0806D4CC: @ 0x0806D4CC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r1, #0
	adds r1, r7, #4
	strh r0, [r1]
	adds r0, r7, #4
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0806D502
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0806D51C
_0806D502:
	ldr r0, [r7]
	adds r1, r7, #4
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D51C:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806D524
sub_0806D524: @ 0x0806D524
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806D544 @ =0x08C9D03E
	ldr r1, [r7]
	adds r2, r0, r1
	ldrb r0, [r2]
	adds r2, r0, #0
	lsls r1, r2, #4
	adds r1, r1, r0
	lsls r0, r1, #9
	ldr r2, _0806D548 @ =0x020040F0
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806D54C
	.align 2, 0
_0806D544: .4byte 0x08C9D03E
_0806D548: .4byte 0x020040F0
_0806D54C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0806D554
sub_0806D554: @ 0x0806D554
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806D574 @ =0x08C9D174
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x41
	ldrb r1, [r2]
	subs r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r1, #0
	b _0806D578
	.align 2, 0
_0806D574: .4byte 0x08C9D174
_0806D578:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start GetMuAnimForJid
GetMuAnimForJid: @ 0x0806D580
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r0, _0806D5A0 @ =0x08C9D174
	adds r1, r7, #0
	ldrh r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806D5A4
	.align 2, 0
_0806D5A0: .4byte 0x08C9D174
_0806D5A4:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start StartMuDeathFade
StartMuDeathFade: @ 0x0806D5AC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806D6CC @ =0x08C9D044
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, [r7]
	movs r1, #0
	bl sub_0806E054
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1e]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r1, _0806D6D4 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806D6A0
	movs r0, #0xd6
	bl m4aSongNumStart
_0806D6A0:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0806D6C4
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl TryRemoveUnitFromBallista
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl HideUnitSprite
_0806D6C4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D6CC: .4byte 0x08C9D044
_0806D6D0: .4byte 0x03002870
_0806D6D4: .4byte 0x0202BBF8

	thumb_func_start sub_0806D6D8
sub_0806D6D8: @ 0x0806D6D8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806D768 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D768 @ =0x03002870
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D768 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D768 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806D760
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl EndMu
	ldr r0, [r7]
	bl Proc_Break
_0806D760:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D768: .4byte 0x03002870

	thumb_func_start sub_0806D76C
sub_0806D76C: @ 0x0806D76C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	ldrh r2, [r3]
	movs r3, #7
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	cmp r2, #3
	bgt _0806D796
	movs r0, #1
_0806D796:
	adds r2, r1, #0
	adds r1, #0x40
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0806D7FA
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806D7FA:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806D804
sub_0806D804: @ 0x0806D804
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806D888 @ =0x08C9D05C
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, _0806D88C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806D880
	movs r0, #0xd6
	bl m4aSongNumStart
_0806D880:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D888: .4byte 0x08C9D05C
_0806D88C: .4byte 0x0202BBF8

	thumb_func_start sub_0806D890
sub_0806D890: @ 0x0806D890
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806D8F8 @ =0x08C9D06C
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x10]
	ldr r0, _0806D8F8 @ =0x08C9D06C
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, #3
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x14]
	ldr r0, _0806D8FC @ =0x030014E0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
	ldr r0, _0806D900 @ =0x030014E4
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #2
	movs r2, #0xf
	adds r3, r2, #0
	lsls r3, r1
	adds r1, r3, #0
	str r1, [r0]
	ldr r0, _0806D8FC @ =0x030014E0
	ldr r1, _0806D8FC @ =0x030014E0
	ldr r2, _0806D900 @ =0x030014E4
	ldr r3, [r2]
	mvns r2, r3
	ldr r1, [r1]
	ands r2, r1
	str r2, [r0]
	movs r0, #0
	str r0, [r7, #8]
_0806D8F0:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806D904
	b _0806D95E
	.align 2, 0
_0806D8F8: .4byte 0x08C9D06C
_0806D8FC: .4byte 0x030014E0
_0806D900: .4byte 0x030014E4
_0806D904:
	movs r0, #0
	str r0, [r7, #0xc]
_0806D908:
	ldr r0, [r7, #0xc]
	cmp r0, #3
	ble _0806D910
	b _0806D94C
_0806D910:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0x18]
	ldr r0, _0806D948 @ =0x030014E0
	ldr r1, [r7, #0x18]
	ldr r0, [r0]
	ands r1, r0
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r7, #0x18]
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806D908
	.align 2, 0
_0806D948: .4byte 0x030014E0
_0806D94C:
	ldr r0, [r7]
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D8F0
_0806D95E:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806D968
sub_0806D968: @ 0x0806D968
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_0806D524
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_0806D890
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806DA10 @ =0x020040F0
	ldr r1, _0806DA14 @ =0x06017000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterDataMove
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806DA08
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl EndMu
	ldr r0, [r7]
	bl Proc_Break
_0806DA08:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA10: .4byte 0x020040F0
_0806DA14: .4byte 0x06017000

	thumb_func_start sub_0806DA18
sub_0806DA18: @ 0x0806DA18
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806DAAC @ =0x08C9D0AC
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, _0806DAB0 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806DAA4
	movs r0, #0xd6
	bl m4aSongNumStart
_0806DAA4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DAAC: .4byte 0x08C9D0AC
_0806DAB0: .4byte 0x0202BBF8

	thumb_func_start sub_0806DAB4
sub_0806DAB4: @ 0x0806DAB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start ShowMu
ShowMu: @ 0x0806DADC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetMuScreenPosition
SetMuScreenPosition: @ 0x0806DAFC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806DB48
sub_0806DB48: @ 0x0806DB48
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x50
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806DB94
sub_0806DB94: @ 0x0806DB94
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806DC0C @ =0x02022860
	adds r0, r0, r1
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806DC10 @ =0x08C9CE58
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC0C: .4byte 0x02022860
_0806DC10: .4byte 0x08C9CE58

	thumb_func_start sub_0806DC14
sub_0806DC14: @ 0x0806DC14
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _0806DC5C @ =0x02022860
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	ldr r1, _0806DC60 @ =0x08C9D0BC
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC5C: .4byte 0x02022860
_0806DC60: .4byte 0x08C9D0BC

	thumb_func_start sub_0806DC64
sub_0806DC64: @ 0x0806DC64
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r1, #0x30]
	ldr r2, [r7, #4]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	ldr r3, [r2, #0x34]
	ldrb r2, [r3, #1]
	movs r3, #0xf
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806DCB4
sub_0806DCB4: @ 0x0806DCB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806DD04 @ =sub_0806DD08
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x1e
	bl CallDelayedArg
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD04: .4byte sub_0806DD08

	thumb_func_start sub_0806DD08
sub_0806DD08: @ 0x0806DD08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806DD30
sub_0806DD30: @ 0x0806DD30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806DD74 @ =sub_0806DD78
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x1e
	bl CallDelayedArg
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD74: .4byte sub_0806DD78

	thumb_func_start sub_0806DD78
sub_0806DD78: @ 0x0806DD78
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806DDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r4, [r1]
	ldr r1, _0806DDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	movs r1, #1
	subs r5, r1, r0
	ldr r0, _0806DDD0 @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFacing
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0806EC18
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DDD0: .4byte 0x0203E0FC

	thumb_func_start sub_0806DDD4
sub_0806DDD4: @ 0x0806DDD4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806DE18 @ =sub_0806DE1C
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x14
	bl CallDelayedArg
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DE18: .4byte sub_0806DE1C

	thumb_func_start sub_0806DE1C
sub_0806DE1C: @ 0x0806DE1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806DE44
sub_0806DE44: @ 0x0806DE44
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806DE84 @ =0x08C9CE58
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _0806DE88 @ =0x08C9D0D4
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProc
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DE84: .4byte 0x08C9CE58
_0806DE88: .4byte 0x08C9D0D4

	thumb_func_start sub_0806DE8C
sub_0806DE8C: @ 0x0806DE8C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806DEAC
sub_0806DEAC: @ 0x0806DEAC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806DEF0
sub_0806DEF0: @ 0x0806DEF0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806DF44
sub_0806DF44: @ 0x0806DF44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #1]
	adds r0, r1, #0
	adds r0, #0x10
	adds r1, r0, #0
	lsls r0, r1, #5
	asrs r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r0, _0806DF7C @ =0x02022860
	adds r1, r1, r0
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #0x14
	ldr r3, [r7]
	bl StartPalFade
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF7C: .4byte 0x02022860

	thumb_func_start sub_0806DF80
sub_0806DF80: @ 0x0806DF80
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r2, #1
	ands r1, r2
	adds r3, r1, #0
	lsls r2, r3, #0x18
	lsrs r1, r2, #0x18
	cmp r1, #0
	beq _0806DFCC
	movs r1, #2
	b _0806DFD0
_0806DFCC:
	movs r1, #2
	rsbs r1, r1, #0
_0806DFD0:
	movs r2, #0
	bl sub_0806DB48
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0xb
	bls _0806DFF6
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_0806DB48
	ldr r0, [r7]
	bl Proc_Break
_0806DFF6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806E000
sub_0806E000: @ 0x0806E000
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806E054
sub_0806E054: @ 0x0806E054
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806E0E4 @ =0x08C9CE58
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _0806E0E8 @ =0x02022860
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #0x14
	ldr r3, [r7]
	bl StartPalFade
	ldr r1, _0806E0EC @ =0x08C9D15C
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProc
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E0E4: .4byte 0x08C9CE58
_0806E0E8: .4byte 0x02022860
_0806E0EC: .4byte 0x08C9D15C

	thumb_func_start sub_0806E0F0
sub_0806E0F0: @ 0x0806E0F0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806E144
sub_0806E144: @ 0x0806E144
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806E158 @ =0x08C9D00C
	ldr r1, _0806E15C @ =sub_0806E160
	bl Proc_ForEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E158: .4byte 0x08C9D00C
_0806E15C: .4byte sub_0806E160

	thumb_func_start sub_0806E160
sub_0806E160: @ 0x0806E160
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806E188
sub_0806E188: @ 0x0806E188
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	ldr r4, [r0, #0x30]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetMuAnimForJid
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetSpriteAnimInfo
	ldr r0, [r7]
	bl sub_0806D554
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_0806D524
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #8]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldrb r1, [r2, #1]
	adds r2, r1, #0
	adds r2, #0x10
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806E220
sub_0806E220: @ 0x0806E220
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	movs r3, #0xf
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806E278
sub_0806E278: @ 0x0806E278
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E294 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806E298
	movs r0, #0
	b _0806E2B0
	.align 2, 0
_0806E294: .4byte 0x030014E8
_0806E298:
	ldr r0, _0806E2AC @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806E2B0
	.align 2, 0
_0806E2AC: .4byte 0x030014E8
_0806E2B0:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start GetUnitMu
GetUnitMu: @ 0x0806E2B8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_0806E2C4:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806E2CC
	b _0806E2EE
_0806E2CC:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_0806E278
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r0, #0x2c]
	ldr r0, [r7]
	cmp r1, r0
	bne _0806E2E6
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _0806E2F2
_0806E2E6:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806E2C4
_0806E2EE:
	movs r0, #0
	b _0806E2F2
_0806E2F2:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Manim_StoleItemPopup
Manim_StoleItemPopup: @ 0x0806E2FC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E314 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E318
	b _0806E31A
	.align 2, 0
_0806E314: .4byte 0x0203E0FC
_0806E318:
	b _0806E31C
_0806E31A:
	b _0806E32E
_0806E31C:
	ldr r0, _0806E338 @ =0x0203E0FC
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl StartStoleItemPopup
_0806E32E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E338: .4byte 0x0203E0FC

	thumb_func_start Manim_WeaponBrokePopup
Manim_WeaponBrokePopup: @ 0x0806E33C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E390 @ =0x0203A3F0
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponBroke
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E35C
	ldr r0, _0806E390 @ =0x0203A3F0
	str r0, [r7, #4]
_0806E35C:
	ldr r1, _0806E394 @ =0x0203A470
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponBroke
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E370
	ldr r0, _0806E394 @ =0x0203A470
	str r0, [r7, #4]
_0806E370:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806E386
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_0800EDE0
_0806E386:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E390: .4byte 0x0203A3F0
_0806E394: .4byte 0x0203A470

	thumb_func_start ManimShouldBuDisplayWeaponBroke
ManimShouldBuDisplayWeaponBroke: @ 0x0806E398
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806E3BE
	ldr r0, [r7]
	bl DidBattleUnitBreakWeapon
	lsls r2, r0, #0x18
	asrs r1, r2, #0x18
	adds r0, r1, #0
	b _0806E3C2
_0806E3BE:
	movs r0, #0
	b _0806E3C2
_0806E3C2:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Manim_WeaponLevelGainedPopup
Manim_WeaponLevelGainedPopup: @ 0x0806E3CC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E420 @ =0x0203A3F0
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponLevelGained
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E3EC
	ldr r0, _0806E420 @ =0x0203A3F0
	str r0, [r7, #4]
_0806E3EC:
	ldr r1, _0806E424 @ =0x0203A470
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponLevelGained
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E400
	ldr r0, _0806E424 @ =0x0203A470
	str r0, [r7, #4]
_0806E400:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806E416
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_0800EE28
_0806E416:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E420: .4byte 0x0203A3F0
_0806E424: .4byte 0x0203A470

	thumb_func_start ManimShouldBuDisplayWeaponLevelGained
ManimShouldBuDisplayWeaponLevelGained: @ 0x0806E428
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806E452
	ldr r0, [r7]
	bl HasBattleUnitGainedWeaponLevel
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E452
	movs r0, #1
	b _0806E456
_0806E452:
	movs r0, #0
	b _0806E456
_0806E456:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0806E460
sub_0806E460: @ 0x0806E460
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetText
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start Manim_Finish
Manim_Finish: @ 0x0806E474
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetMuAnims
	bl ResetTextFont
	bl EndManimInfoWindow
	bl InitBmBgLayers
	bl LoadUiFrameGraphics
	bl ApplySystemObjectsGraphics
	bl IsEventRunning
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E4A4
	bl EndAllMus
_0806E4A4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806E4AC
sub_0806E4AC: @ 0x0806E4AC
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r1, _0806E588 @ =0x0203E0FC
	ldr r2, [r1, #0x50]
	ldrb r1, [r2, #2]
	lsrs r2, r1, #3
	adds r1, r2, #0
	movs r2, #1
	ands r1, r2
	adds r2, r0, #0
	adds r0, #0x58
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x59
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5d
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #3]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _0806E588 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806E576
	ldr r0, _0806E588 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0806E576:
	ldr r1, _0806E588 @ =0x0203E0FC
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r1, _0806E588 @ =0x0203E0FC
	ldr r2, [r1, #0x50]
	adds r1, r2, #4
	str r1, [r0, #0x50]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E588: .4byte 0x0203E0FC

	thumb_func_start sub_0806E58C
sub_0806E58C: @ 0x0806E58C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E5B8 @ =0x0203E0FC
	ldr r1, [r0, #0x50]
	ldrb r0, [r1, #2]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E5C0
	ldr r0, [r7]
	bl Proc_Break
	ldr r1, _0806E5BC @ =0x08C9D6DC
	ldr r0, [r7]
	bl Proc_GotoScript
	b _0806E5CA
	.align 2, 0
_0806E5B8: .4byte 0x0203E0FC
_0806E5BC: .4byte 0x08C9D6DC
_0806E5C0:
	bl sub_0806E4AC
	ldr r0, [r7]
	bl Proc_Break
_0806E5CA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806E5D4
sub_0806E5D4: @ 0x0806E5D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_08075638
	adds r1, r0, #0
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProcLocking
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806E5F4
sub_0806E5F4: @ 0x0806E5F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E640 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x40
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806E636
	ldr r0, _0806E640 @ =0x0203E0FC
	ldr r2, _0806E640 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0807160C
	ldr r0, [r7]
	movs r1, #0x64
	bl StartTemporaryLock
_0806E636:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E640: .4byte 0x0203E0FC

	thumb_func_start sub_0806E644
sub_0806E644: @ 0x0806E644
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E66C @ =0x0203E0FC
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806E66C @ =0x0203E0FC
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl CameraMoveWatchPosition
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E66C: .4byte 0x0203E0FC

	thumb_func_start sub_0806E670
sub_0806E670: @ 0x0806E670
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E688 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806E68C
	b _0806E6A2
	.align 2, 0
_0806E688: .4byte 0x0203E0FC
_0806E68C:
	ldr r0, _0806E6AC @ =0x0203E0FC
	ldr r2, [r0, #0x14]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806E6AC @ =0x0203E0FC
	ldr r3, [r0, #0x14]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl CameraMoveWatchPosition
_0806E6A2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E6AC: .4byte 0x0203E0FC

	thumb_func_start sub_0806E6B0
sub_0806E6B0: @ 0x0806E6B0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E6D0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E6E4
	cmp r0, #2
	beq _0806E6D4
	b _0806E6F8
	.align 2, 0
_0806E6D0: .4byte 0x0203E0FC
_0806E6D4:
	ldr r1, _0806E6F4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806E6E4
	movs r0, #1
	str r0, [r7, #4]
_0806E6E4:
	ldr r0, _0806E6F4 @ =0x0203E0FC
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806E6F0
	movs r0, #0
	str r0, [r7, #4]
_0806E6F0:
	b _0806E6F8
	.align 2, 0
_0806E6F4: .4byte 0x0203E0FC
_0806E6F8:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806E742
	ldr r0, _0806E74C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrb r1, [r0, #4]
	str r1, [r7, #8]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl CheckBattleDefeatTalk
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E742
	bl EndManimInfoWindow
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl DisplayDefeatTalkForPid
	bl sub_0800ADB8
_0806E742:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E74C: .4byte 0x0203E0FC

	thumb_func_start sub_0806E750
sub_0806E750: @ 0x0806E750
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E770 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E784
	cmp r0, #2
	beq _0806E774
	b _0806E798
	.align 2, 0
_0806E770: .4byte 0x0203E0FC
_0806E774:
	ldr r1, _0806E794 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806E784
	movs r0, #1
	str r0, [r7, #4]
_0806E784:
	ldr r0, _0806E794 @ =0x0203E0FC
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806E790
	movs r0, #0
	str r0, [r7, #4]
_0806E790:
	b _0806E798
	.align 2, 0
_0806E794: .4byte 0x0203E0FC
_0806E798:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806E7B8
	ldr r0, _0806E7C0 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl StartMuDeathFade
_0806E7B8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E7C0: .4byte 0x0203E0FC

	thumb_func_start sub_0806E7C4
sub_0806E7C4: @ 0x0806E7C4
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #8]
	ldr r1, _0806E7E4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E7FC
	cmp r0, #2
	beq _0806E7E8
	b _0806E818
	.align 2, 0
_0806E7E4: .4byte 0x0203E0FC
_0806E7E8:
	ldr r0, _0806E814 @ =0x0203E0FC
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806E7FC
	movs r0, #1
	str r0, [r7, #8]
_0806E7FC:
	ldr r0, _0806E814 @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806E810
	movs r0, #0
	str r0, [r7, #8]
_0806E810:
	b _0806E818
	.align 2, 0
_0806E814: .4byte 0x0203E0FC
_0806E818:
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _0806E8C8
	ldr r1, _0806E8D0 @ =0x08C9D820
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProcLocking
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _0806E8D4 @ =0x0203E0FC
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, _0806E8D4 @ =0x0203E0FC
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	ldr r2, _0806E8D4 @ =0x0203E0FC
	ldr r3, [r7, #8]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, #4
	adds r3, r2, r3
	ldr r4, [r3]
	adds r2, r4, #0
	adds r3, r4, #0
	adds r3, #0x6e
	movs r4, #0
	ldrsb r4, [r3, r4]
	adds r2, r4, #0
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806E8C8:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8D0: .4byte 0x08C9D820
_0806E8D4: .4byte 0x0203E0FC

	thumb_func_start sub_0806E8D8
sub_0806E8D8: @ 0x0806E8D8
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E93C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806E940 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #2
	bgt _0806E946
	cmp r0, #1
	blt _0806E946
	b _0806E944
	.align 2, 0
_0806E93C: .4byte 0x03002870
_0806E940: .4byte 0x0203E0FC
_0806E944:
	b _0806EA8A
_0806E946:
	b _0806E948
_0806E948:
	ldr r0, _0806E964 @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocReturnBool
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _0806E968
	b _0806EA8A
	.align 2, 0
_0806E964: .4byte 0x0203E0FC
_0806E968:
	ldr r1, _0806E998 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806E9AA
	ldr r0, _0806E998 @ =0x0203E0FC
	ldr r1, [r0]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	lsls r0, r2, #4
	ldr r1, _0806E99C @ =0x0202BBB8
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0x6f
	ble _0806E9A0
	ldr r0, [r7, #4]
	adds r1, r0, #0
	subs r1, #0x28
	str r1, [r7, #4]
	b _0806E9A8
	.align 2, 0
_0806E998: .4byte 0x0203E0FC
_0806E99C: .4byte 0x0202BBB8
_0806E9A0:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x18
	str r1, [r7, #4]
_0806E9A8:
	b _0806EA76
_0806E9AA:
	movs r0, #0
	str r0, [r7, #0x10]
_0806E9AE:
	ldr r1, _0806E9C0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0x10]
	cmp r1, r0
	blt _0806E9C4
	b _0806EA00
	.align 2, 0
_0806E9C0: .4byte 0x0203E0FC
_0806E9C4:
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, _0806E9F8 @ =0x0203E0FC
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	lsls r1, r3, #4
	ldr r2, _0806E9FC @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _0806E9AE
	.align 2, 0
_0806E9F8: .4byte 0x0203E0FC
_0806E9FC: .4byte 0x0202BBB8
_0806EA00:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	blt _0806EA16
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806EA22
	b _0806EA28
_0806EA16:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	subs r0, r0, r1
	cmp r0, #0x4f
	bgt _0806EA22
	b _0806EA28
_0806EA22:
	movs r0, #0x40
	str r0, [r7, #4]
	b _0806EA76
_0806EA28:
	movs r0, #0
	ldr r1, [r7, #8]
	ldr r2, [r7, #0xc]
	cmp r1, r2
	bgt _0806EA34
	movs r0, #1
_0806EA34:
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	cmp r1, #0x6f
	ble _0806EA62
	movs r0, #1
	ldr r1, [r7, #0x14]
	subs r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	subs r0, #0x28
	str r0, [r7, #4]
	b _0806EA76
_0806EA62:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r1, r0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r7, #4]
_0806EA76:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	cmp r0, #0
	bge _0806EA80
	adds r0, #7
_0806EA80:
	asrs r1, r0, #3
	movs r0, #0xf
	ldr r2, [r7]
	bl StartManimInfoWindow
_0806EA8A:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806EA94
sub_0806EA94: @ 0x0806EA94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EAAC @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806EAB0
	b _0806EACC
	.align 2, 0
_0806EAAC: .4byte 0x0203E0FC
_0806EAB0:
	ldr r0, _0806EAC8 @ =0x0203E0FC
	ldr r1, [r0]
	ldr r2, [r1]
	ldrb r0, [r2, #4]
	ldr r1, _0806EAC8 @ =0x0203E0FC
	ldr r2, [r1, #0x14]
	ldr r1, [r2]
	ldrb r2, [r1, #4]
	adds r1, r2, #0
	bl StartBattleTalk
	b _0806EACE
	.align 2, 0
_0806EAC8: .4byte 0x0203E0FC
_0806EACC:
	b _0806EACE
_0806EACE:
	bl sub_0800ADB8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806EADC
sub_0806EADC: @ 0x0806EADC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806EAEC
sub_0806EAEC: @ 0x0806EAEC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EB08 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EB12
	cmp r0, #2
	beq _0806EB0C
	b _0806EB18
	.align 2, 0
_0806EB08: .4byte 0x0203E0FC
_0806EB0C:
	movs r0, #1
	bl sub_0806EADC
_0806EB12:
	movs r0, #0
	bl sub_0806EADC
_0806EB18:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806EB20
sub_0806EB20: @ 0x0806EB20
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806EB40 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806EB3A
	movs r0, #0xa0
	bl m4aSongNumStart
_0806EB3A:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB40: .4byte 0x0202BBF8

	thumb_func_start InitManimActor
InitManimActor: @ 0x0806EB44
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806EB58
	b _0806EC0C
_0806EB58:
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #8]
	str r1, [r0]
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r0, [r7, #4]
	str r0, [r1]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl StartMu
	ldr r1, _0806EBF0 @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #8
	adds r2, r1, r2
	str r0, [r2]
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x1b
	beq _0806EBF4
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x33
	beq _0806EBF4
	b _0806EC0C
	.align 2, 0
_0806EBF0: .4byte 0x0203E0FC
_0806EBF4:
	ldr r0, _0806EC14 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806DAB4
_0806EC0C:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC14: .4byte 0x0203E0FC

	thumb_func_start sub_0806EC18
sub_0806EC18: @ 0x0806EC18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #1
	beq _0806ECB0
	cmp r0, #1
	bgt _0806EC34
	cmp r0, #0
	beq _0806EC3A
	b _0806ED1A
_0806EC34:
	cmp r0, #2
	beq _0806ECD0
	b _0806ED1A
_0806EC3A:
	ldr r0, _0806ECAC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806ECAC @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _0806ECAC @ =0x0203E0FC
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r3, _0806ECAC @ =0x0203E0FC
	ldr r4, [r7, #4]
	adds r6, r4, #0
	lsls r5, r6, #2
	adds r5, r5, r4
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetFacingFromTo
	str r0, [r7, #0xc]
	ldr r0, _0806ECAC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl SetMuFacing
	b _0806ED1A
	.align 2, 0
_0806ECAC: .4byte 0x0203E0FC
_0806ECB0:
	ldr r0, _0806ECCC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806BFA4
	b _0806ED1A
	.align 2, 0
_0806ECCC: .4byte 0x0203E0FC
_0806ECD0:
	ldr r0, _0806ED24 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806ED24 @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0
	movs r3, #0
	bl GetFacingFromTo
	str r0, [r7, #0xc]
	ldr r0, _0806ED24 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl SetMuFacing
_0806ED1A:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED24: .4byte 0x0203E0FC

	thumb_func_start InitManimActorFacings
InitManimActorFacings: @ 0x0806ED28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _0806ED5C @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFacing
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7]
	bl sub_0806EDAC
	ldr r1, _0806ED5C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806ED94
	cmp r0, #2
	beq _0806ED60
	b _0806EDA4
	.align 2, 0
_0806ED5C: .4byte 0x0203E0FC
_0806ED60:
	ldr r0, _0806EDA0 @ =0x0203A4F0
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806ED8A
	movs r0, #2
	movs r1, #1
	ldr r2, [r7]
	bl sub_0806EC18
	movs r0, #3
	movs r1, #1
	ldr r2, [r7]
	bl sub_0806EC18
_0806ED8A:
	movs r0, #1
	movs r1, #0
	ldr r2, [r7]
	bl sub_0806EC18
_0806ED94:
	movs r0, #0
	movs r1, #1
	ldr r2, [r7]
	bl sub_0806EC18
	b _0806EDA4
	.align 2, 0
_0806EDA0: .4byte 0x0203A4F0
_0806EDA4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806EDAC
sub_0806EDAC: @ 0x0806EDAC
	push {r4, r7, lr}
	sub sp, #0x18
	mov r7, sp
	ldr r1, _0806EDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	str r0, [r7, #0x14]
	ldr r1, _0806EDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EDF8
	cmp r0, #2
	beq _0806EDD4
	b _0806EDFA
	.align 2, 0
_0806EDD0: .4byte 0x0203E0FC
_0806EDD4:
	ldr r0, _0806EDF4 @ =0x0203A4F0
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806EDF0
	ldr r0, [r7, #0x14]
	adds r1, r0, #2
	str r1, [r7, #0x14]
_0806EDF0:
	b _0806EDFA
	.align 2, 0
_0806EDF4: .4byte 0x0203A4F0
_0806EDF8:
	b _0806EDFA
_0806EDFA:
	movs r0, #0
	str r0, [r7, #8]
_0806EDFE:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806EE08
	b _0806EE28
_0806EE08:
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806EDFE
_0806EE28:
	movs r0, #0
	str r0, [r7, #8]
_0806EE2C:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #8]
	cmp r1, r0
	blt _0806EE38
	b _0806EF6C
_0806EE38:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #0xc]
_0806EE3E:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806EE48
	b _0806EF64
_0806EE48:
	movs r0, #0
	str r0, [r7, #0x10]
	ldr r0, _0806EEC8 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806EEC8 @ =0x0203E0FC
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0806EECC
	ldr r0, _0806EEC8 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806EEC8 @ =0x0203E0FC
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806EEC6
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806EEC6:
	b _0806EF0C
	.align 2, 0
_0806EEC8: .4byte 0x0203E0FC
_0806EECC:
	ldr r0, _0806EF60 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0806EF60 @ =0x0203E0FC
	adds r2, r7, #0
	ldr r3, [r7, #0xc]
	adds r4, r2, r3
	ldrb r2, [r4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _0806EF0C
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806EF0C:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _0806EF56
	adds r0, r7, #4
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	ldr r2, [r7, #0xc]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	adds r1, r7, #4
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
_0806EF56:
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806EE3E
	.align 2, 0
_0806EF60: .4byte 0x0203E0FC
_0806EF64:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806EE2C
_0806EF6C:
	movs r0, #0
	str r0, [r7, #8]
_0806EF70:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	blt _0806EF7A
	b _0806EFBC
_0806EF7A:
	ldr r0, _0806EFB4 @ =0x0203E0FC
	adds r1, r7, #0
	ldr r2, [r7, #8]
	adds r3, r1, r2
	ldrb r1, [r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldr r1, _0806EFB8 @ =0x083FC174
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	ldrh r2, [r0, #0x1e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806EF70
	.align 2, 0
_0806EFB4: .4byte 0x0203E0FC
_0806EFB8: .4byte 0x083FC174
_0806EFBC:
	add sp, #0x18
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0806EFC4
sub_0806EFC4: @ 0x0806EFC4
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F03C @ =0x0203A3F0
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x6b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	ldr r1, _0806F044 @ =0x0203A4F0
	str r1, [r0, #0x50]
	bl sub_0806E4AC
	ldr r0, _0806F03C @ =0x0203A3F0
	ldr r1, _0806F048 @ =0x0203A470
	ldr r2, _0806F044 @ =0x0203A4F0
	bl InitManimActors
	ldr r1, _0806F04C @ =0x08C9D48C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F03C: .4byte 0x0203A3F0
_0806F040: .4byte 0x0203E0FC
_0806F044: .4byte 0x0203A4F0
_0806F048: .4byte 0x0203A470
_0806F04C: .4byte 0x08C9D48C

	thumb_func_start sub_0806F050
sub_0806F050: @ 0x0806F050
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F0C8 @ =0x0203A3F0
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x6b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F0CC @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F0CC @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F0CC @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F0CC @ =0x0203E0FC
	ldr r1, _0806F0D0 @ =0x0203A4F0
	str r1, [r0, #0x50]
	bl sub_0806E4AC
	ldr r0, _0806F0C8 @ =0x0203A3F0
	ldr r1, _0806F0D4 @ =0x0203A470
	ldr r2, _0806F0D0 @ =0x0203A4F0
	bl InitManimActors
	ldr r1, _0806F0D8 @ =0x08C9D4CC
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0C8: .4byte 0x0203A3F0
_0806F0CC: .4byte 0x0203E0FC
_0806F0D0: .4byte 0x0203A4F0
_0806F0D4: .4byte 0x0203A470
_0806F0D8: .4byte 0x08C9D4CC

	thumb_func_start sub_0806F0DC
sub_0806F0DC: @ 0x0806F0DC
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F17C @ =0x0203A3F0
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F180 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F180 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F180 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F180 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F180 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F17C @ =0x0203A3F0
	ldr r1, _0806F184 @ =0x0203A470
	ldr r2, _0806F188 @ =0x0203A4F0
	bl InitManimActors
	ldr r1, _0806F18C @ =0x08C9D50C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F17C: .4byte 0x0203A3F0
_0806F180: .4byte 0x0203E0FC
_0806F184: .4byte 0x0203A470
_0806F188: .4byte 0x0203A4F0
_0806F18C: .4byte 0x08C9D50C

	thumb_func_start sub_0806F190
sub_0806F190: @ 0x0806F190
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F228 @ =0x0203A3F0
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x4e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F22C @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F22C @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F22C @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F22C @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F22C @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F228 @ =0x0203A3F0
	ldr r1, _0806F230 @ =0x0203A470
	ldr r2, _0806F234 @ =0x0203A4F0
	bl InitManimActors
	ldr r1, _0806F238 @ =0x08C9D5DC
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F228: .4byte 0x0203A3F0
_0806F22C: .4byte 0x0203E0FC
_0806F230: .4byte 0x0203A470
_0806F234: .4byte 0x0203A4F0
_0806F238: .4byte 0x08C9D5DC

	thumb_func_start StartBattleManim
StartBattleManim: @ 0x0806F23C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F25C @ =0x0203A3D8
	ldrh r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F260
	bl sub_0806F190
	b _0806F29E
	.align 2, 0
_0806F25C: .4byte 0x0203A3D8
_0806F260:
	ldr r0, _0806F2A4 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F2A4 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F2A8 @ =0x0203A3F0
	ldr r1, _0806F2AC @ =0x0203A470
	ldr r2, _0806F2B0 @ =0x0203A4F0
	bl InitManimHits
	ldr r0, _0806F2A8 @ =0x0203A3F0
	ldr r1, _0806F2AC @ =0x0203A470
	ldr r2, _0806F2B0 @ =0x0203A4F0
	bl InitManimActors
	ldr r1, _0806F2B4 @ =0x08C9D634
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
_0806F29E:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F2A4: .4byte 0x0203E0FC
_0806F2A8: .4byte 0x0203A3F0
_0806F2AC: .4byte 0x0203A470
_0806F2B0: .4byte 0x0203A4F0
_0806F2B4: .4byte 0x08C9D634

	thumb_func_start InitManimHits
InitManimHits: @ 0x0806F2B8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetWeaponAnimActorCount
	ldr r1, _0806F308 @ =0x0203E0FC
	adds r2, r1, #0
	adds r1, #0x5e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _0806F308 @ =0x0203E0FC
	ldr r1, [r7, #8]
	str r1, [r0, #0x50]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetWeaponAnimManimSpecialScr
	ldr r1, _0806F308 @ =0x0203E0FC
	str r0, [r1, #0x54]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F308: .4byte 0x0203E0FC

	thumb_func_start InitManimActors
InitManimActors: @ 0x0806F30C
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #0
	ldr r1, [r7]
	ldr r2, [r7]
	bl InitManimActor
	ldr r1, _0806F39C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bls _0806F340
	ldr r1, _0806F3A0 @ =0x0203A470
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r1, [r7, #4]
	ldr r2, [r7, #4]
	movs r0, #1
	bl InitManimActor
_0806F340:
	ldr r0, _0806F3A4 @ =0x0203A4F0
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F382
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r2, [r0, #0x10]
	movs r0, #2
	ldr r1, [r7]
	bl InitManimActor
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r2, [r0, #0x14]
	movs r0, #3
	ldr r1, [r7]
	bl InitManimActor
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r1, [r0, #0x10]
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	bl HideUnitSprite
_0806F382:
	bl InitManimActorFacings
	movs r0, #0
	str r0, [r7, #0xc]
_0806F38A:
	ldr r1, _0806F39C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _0806F3AC
	b _0806F424
	.align 2, 0
_0806F39C: .4byte 0x0203E0FC
_0806F3A0: .4byte 0x0203A470
_0806F3A4: .4byte 0x0203A4F0
_0806F3A8: .4byte 0x0203A3D8
_0806F3AC:
	ldr r0, _0806F420 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _0806F420 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r1, [r2]
	adds r2, r1, #0
	adds r1, #0x72
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
	ldr r0, _0806F420 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl GetUnitMaxHp
	ldr r1, _0806F420 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806F38A
	.align 2, 0
_0806F420: .4byte 0x0203E0FC
_0806F424:
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F474: .4byte 0x03002870

	thumb_func_start GetFacingFromTo
GetFacingFromTo: @ 0x0806F478
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806F49E
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
	b _0806F4AA
_0806F49E:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
_0806F4AA:
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806F4C0
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806F4CC
	b _0806F4E0
_0806F4C0:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806F4CC
	b _0806F4E0
_0806F4CC:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	cmp r0, r2
	bge _0806F4DA
	movs r0, #2
	b _0806F4F2
_0806F4D8:
	.byte 0x01, 0xE0
_0806F4DA:
	movs r0, #3
	b _0806F4F2
_0806F4DE:
	.byte 0x08, 0xE0
_0806F4E0:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	cmp r0, r2
	bge _0806F4EE
	movs r0, #1
	b _0806F4F2
_0806F4EC:
	.byte 0x01, 0xE0
_0806F4EE:
	movs r0, #0
	b _0806F4F2
_0806F4F2:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UnpackManimWindowDigits
UnpackManimWindowDigits: @ 0x0806F4FC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r4, _0806F52C @ =0x083F3FA4
	movs r0, #0
	bl GetBgChrOffset
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r2, r3
	adds r2, r0, r1
	adds r0, r4, #0
	adds r1, r2, #0
	bl Decompress
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F52C: .4byte 0x083F3FA4

	thumb_func_start PutManimWindowNumber
PutManimWindowNumber: @ 0x0806F530
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x30]
	adds r1, r7, #0
	adds r1, #0x10
	strh r0, [r1]
	movs r0, #7
	str r0, [r7, #0x1c]
_0806F54A:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bge _0806F552
	b _0806F5C6
_0806F552:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x1c]
	adds r4, r0, r1
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r1, [r4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806F5BE
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x20]
_0806F592:
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _0806F59A
	b _0806F5BC
_0806F59A:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x20]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x20]
	subs r1, r0, #1
	str r1, [r7, #0x20]
	b _0806F592
_0806F5BC:
	b _0806F5C6
_0806F5BE:
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806F54A
_0806F5C6:
	adds r0, r7, #0
	adds r0, #0x14
	adds r1, r0, #7
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	bl PutDigits
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
_0806F5DC:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bgt _0806F5E4
	b _0806F612
_0806F5E4:
	adds r0, r7, #0
	adds r0, #0x14
	movs r1, #7
	ldr r2, [r7, #0x1c]
	subs r1, r1, r2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0x20
	beq _0806F5F8
	b _0806F612
_0806F5F8:
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	subs r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806F5DC
_0806F612:
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnpackManimWindowGraphics
UnpackManimWindowGraphics: @ 0x0806F61C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x20
	bl UnpackManimWindowDigits
	ldr r1, _0806F648 @ =0x06000540
	ldr r0, [r7]
	bl Decompress
	ldr r1, _0806F64C @ =0x083FA12C
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F648: .4byte 0x06000540
_0806F64C: .4byte 0x083FA12C

	thumb_func_start PutManimWindowBarTile
PutManimWindowBarTile: @ 0x0806F650
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	ble _0806F66E
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	b _0806F674
_0806F66E:
	ldr r0, [r7, #4]
	ldr r1, [r0]
	str r1, [r7, #0x10]
_0806F674:
	ldr r0, [r7]
	ldr r2, [r7, #0x1c]
	adds r1, r2, #0
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #8]
	adds r2, r3, #0
	lsls r3, r2, #0xc
	adds r2, r3, #0
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	ldr r2, [r7, #0xc]
	subs r1, r1, r2
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _0806F6AA
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_0806F6AA:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutManimWindowBar
PutManimWindowBar: @ 0x0806F6B4
	push {r4, r7, lr}
	sub sp, #0x20
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806F6CA:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806F6D4
	b _0806F6E8
_0806F6D4:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #0x18]
	ldrh r2, [r1]
	adds r0, r0, r2
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806F6CA
_0806F6E8:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _0806F6FC
	ldr r0, [r7, #0x14]
	str r0, [r7, #0x10]
	b _0806F710
_0806F6FC:
	ldr r0, [r7, #0x14]
	lsls r1, r0, #8
	adds r0, r1, #0
	ldr r1, [r7, #4]
	bl __divsi3
	ldr r1, [r7, #8]
	muls r0, r1, r0
	asrs r1, r0, #8
	str r1, [r7, #0x10]
_0806F710:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0806F722
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _0806F722
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806F722:
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806F726:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806F730
	b _0806F764
_0806F730:
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, _0806F760 @ =0x08C9D790
	ldr r2, [r7, #0xc]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r7, #0x18]
	ldrh r3, [r0]
	ldr r4, [r7, #0x18]
	adds r0, r4, #2
	ldrh r4, [r0]
	str r4, [sp]
	ldr r0, [r7]
	bl PutManimWindowBarTile
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806F726
	.align 2, 0
_0806F760: .4byte 0x08C9D790
_0806F764:
	add sp, #0x20
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start EndManimInfoWindow
EndManimInfoWindow: @ 0x0806F76C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806F780 @ =0x08C9D7B0
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F780: .4byte 0x08C9D7B0

	thumb_func_start StartManimInfoWindow
StartManimInfoWindow: @ 0x0806F784
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0806F7DC @ =0x08C9D7B0
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x30]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F7DC: .4byte 0x08C9D7B0

	thumb_func_start ManimWindow_Clear
ManimWindow_Clear: @ 0x0806F7E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetOnHBlankA
	bl ClearUi
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

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

	thumb_func_start sub_0806F910
sub_0806F910: @ 0x0806F910
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #4]
_0806F924:
	ldr r1, _0806F934 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _0806F938
	b _0806FA38
	.align 2, 0
_0806F934: .4byte 0x0203E0FC
_0806F938:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	ble _0806F97C
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #0
	subs r1, #0x10
	adds r2, r1, #0
	strh r2, [r0]
_0806F97C:
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	bge _0806F9D6
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #4
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0806F9D6
	ldr r1, _0806FA30 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806F9D6
	ldr r1, _0806FA34 @ =0x00000395
	adds r0, r1, #0
	bl m4aSongNumStart
_0806F9D6:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1, #0xe]
	cmp r0, r1
	beq _0806FA24
	ldr r0, _0806FA2C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_0806FA6C
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #1
	strb r1, [r0]
_0806FA24:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806F924
	.align 2, 0
_0806FA2C: .4byte 0x0203E0FC
_0806FA30: .4byte 0x0202BBF8
_0806FA34: .4byte 0x00000395
_0806FA38:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0806FA60
	ldr r1, _0806FA68 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806FA60
	ldr r0, _0806FA68 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0806FA60:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA68: .4byte 0x0203E0FC

	thumb_func_start sub_0806FA6C
sub_0806FA6C: @ 0x0806FA6C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806FB3C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FB40 @ =0x02022C60
	adds r0, r0, r1
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	lsrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	ldr r2, _0806FB44 @ =0x00005020
	movs r3, #0
	str r3, [sp]
	movs r3, #3
	bl PutManimWindowNumber
	ldr r0, _0806FB3C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	adds r0, r1, #2
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FB40 @ =0x02022C60
	adds r0, r0, r1
	ldr r1, _0806FB3C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r3, r1, r2
	ldrb r1, [r3, #0xc]
	ldr r2, _0806FB3C @ =0x0203E0FC
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldrh r3, [r2, #0xe]
	lsrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	ldr r3, _0806FB48 @ =0x08C9D774
	str r3, [sp]
	movs r3, #0
	bl PutManimWindowBar
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FB3C: .4byte 0x0203E0FC
_0806FB40: .4byte 0x02022C60
_0806FB44: .4byte 0x00005020
_0806FB48: .4byte 0x08C9D774

	thumb_func_start sub_0806FB4C
sub_0806FB4C: @ 0x0806FB4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0x40
	beq _0806FB88
	cmp r0, #0x40
	bgt _0806FB6E
	cmp r0, #0
	beq _0806FB78
	b _0806FB98
_0806FB6E:
	cmp r0, #0x80
	beq _0806FB80
	cmp r0, #0xc0
	beq _0806FB90
	b _0806FB98
_0806FB78:
	ldr r0, _0806FB7C @ =0x083F41CC
	b _0806FB9C
	.align 2, 0
_0806FB7C: .4byte 0x083F41CC
_0806FB80:
	ldr r0, _0806FB84 @ =0x083F41EC
	b _0806FB9C
	.align 2, 0
_0806FB84: .4byte 0x083F41EC
_0806FB88:
	ldr r0, _0806FB8C @ =0x083F420C
	b _0806FB9C
	.align 2, 0
_0806FB8C: .4byte 0x083F420C
_0806FB90:
	ldr r0, _0806FB94 @ =0x083F422C
	b _0806FB9C
	.align 2, 0
_0806FB94: .4byte 0x083F422C
_0806FB98:
	movs r0, #0
	b _0806FB9C
_0806FB9C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0806FBA4
sub_0806FBA4: @ 0x0806FBA4
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0806FD34 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x2e
	ldr r3, [r7, #8]
	adds r2, r3, #0
	ldrb r3, [r1]
	adds r1, r2, r3
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x10]
	ldr r0, _0806FD34 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x2f
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x11]
	ldr r0, _0806FD34 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0806FB4C
	ldr r2, [r7, #4]
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806FD38 @ =0x08C9D798
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	ldr r3, _0806FD34 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x5e
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _0806FD3C @ =0x02020140
	adds r0, r1, #0
	adds r1, r2, #0
	bl Decompress
	ldr r0, _0806FD34 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	lsls r0, r1, #5
	ldr r1, _0806FD34 @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FD40 @ =0x02023460
	adds r0, r0, r1
	ldr r1, _0806FD3C @ =0x02020140
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #0xc
	adds r2, r3, #0
	movs r3, #1
	orrs r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl TmApplyTsa_t
	movs r0, #2
	bl EnableBgSync
	ldr r0, _0806FD34 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x11]
	lsls r2, r1, #5
	adds r0, r2, #1
	ldr r1, _0806FD34 @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x10]
	adds r0, r0, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FD44 @ =0x02022C60
	adds r4, r0, r1
	ldr r0, _0806FD34 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl PutStringCentered
	movs r0, #1
	bl EnableBgSync
	ldr r0, _0806FD34 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _0806FD34 @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r3, [r1, #0xd]
	adds r2, r3, #0
	lsls r1, r2, #4
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_0806FA6C
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD34: .4byte 0x0203E0FC
_0806FD38: .4byte 0x08C9D798
_0806FD3C: .4byte 0x02020140
_0806FD40: .4byte 0x02023460
_0806FD44: .4byte 0x02022C60

	thumb_func_start sub_0806FD48
sub_0806FD48: @ 0x0806FD48
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x2a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7]
	bl sub_0806FE34
	ldr r0, _0806FE30 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0806FE30 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0806FE30 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FE30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE30: .4byte 0x03002870

	thumb_func_start sub_0806FE34
sub_0806FE34: @ 0x0806FE34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806FF14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FF14 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806FF14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FF14 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x2a]
	adds r1, r2, #2
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x2a]
	ldr r0, [r7]
	movs r2, #0x2a
	ldrsh r1, [r0, r2]
	cmp r1, #0x10
	ble _0806FF0C
	ldr r0, _0806FF14 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0806FF14 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0806FF14 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	bl Proc_Break
_0806FF0C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF14: .4byte 0x03002870

	thumb_func_start sub_0806FF18
sub_0806FF18: @ 0x0806FF18
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FF78 @ =0x02022C60
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r2, _0806FF7C @ =0x0000521F
	ldr r3, _0806FF80 @ =0x00005229
	str r3, [sp]
	movs r3, #2
	bl PutManimWindowNumber
	ldr r1, [r7, #4]
	adds r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #3
	ldr r1, [r7]
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806FF78 @ =0x02022C60
	adds r0, r0, r1
	ldr r2, [r7, #8]
	ldr r1, _0806FF84 @ =0x08C9D7E8
	str r1, [sp]
	movs r1, #0x63
	movs r3, #0
	bl PutManimWindowBar
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF78: .4byte 0x02022C60
_0806FF7C: .4byte 0x0000521F
_0806FF80: .4byte 0x00005229
_0806FF84: .4byte 0x08C9D7E8

	thumb_func_start sub_0806FF88
sub_0806FF88: @ 0x0806FF88
	push {r4, r7, lr}
	sub sp, #4
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
	ldr r4, _08070018 @ =0x081D97F0
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _0807001C @ =0x06004000
	adds r1, r0, r2
	adds r0, r4, #0
	movs r2, #0xe0
	bl RegisterDataMove
	ldr r4, _08070020 @ =0x081D9AF0
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070024 @ =0x060040E0
	adds r1, r0, r2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r4, _08070028 @ =0x081D9DF0
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _0807002C @ =0x060043E0
	adds r1, r0, r2
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r1, _08070030 @ =0x081D9FBC
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08070034 @ =0x02022E6C
	ldr r1, _08070038 @ =0x083F3F3C
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_t
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_0806FF18
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070018: .4byte 0x081D97F0
_0807001C: .4byte 0x06004000
_08070020: .4byte 0x081D9AF0
_08070024: .4byte 0x060040E0
_08070028: .4byte 0x081D9DF0
_0807002C: .4byte 0x060043E0
_08070030: .4byte 0x081D9FBC
_08070034: .4byte 0x02022E6C
_08070038: .4byte 0x083F3F3C

	thumb_func_start sub_0807003C
sub_0807003C: @ 0x0807003C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08070068 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807005E
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStart
_0807005E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070068: .4byte 0x0202BBF8

	thumb_func_start sub_0807006C
sub_0807006C: @ 0x0807006C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	ble _080700B8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_080700B8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_0806FF18
	ldr r1, [r7]
	adds r0, r1, #0
	adds r4, r1, #0
	adds r4, #0x64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	movs r1, #0x64
	bl __modsi3
	adds r1, r0, #0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	bne _08070102
	ldr r0, [r7]
	bl Proc_Break
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStop
_08070102:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807010C
sub_0807010C: @ 0x0807010C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl sub_080701FC
	ldr r0, _080701F8 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080701F8 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080701F8 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080701F8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080701F8: .4byte 0x03002870

	thumb_func_start sub_080701FC
sub_080701FC: @ 0x080701FC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080702D4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080702D4 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r3, [r2]
	adds r1, r3, #0
	movs r2, #0x4c
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _080702D4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080702D4 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r1, [r2]
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x4c
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	ldrh r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x6a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x6a
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc
	ble _080702CC
	ldr r0, _080702D4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080702D4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080702D4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	bl Proc_Break
_080702CC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080702D4: .4byte 0x03002870

	thumb_func_start sub_080702D8
sub_080702D8: @ 0x080702D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	bgt _080702F0
	b _08070302
_080702F0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_0807489C
_08070302:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807030C
sub_0807030C: @ 0x0807030C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08070320 @ =0x08C9D93C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070320: .4byte 0x08C9D93C

	thumb_func_start sub_08070324
sub_08070324: @ 0x08070324
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x30
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetCharacterData
	str r0, [r7, #0xc]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r4, #0xe
	ldrsh r1, [r0, r4]
	adds r0, r1, #0
	bl GetJobInfo
	str r0, [r7, #0x10]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r5, #8
	ldrsh r1, [r0, r5]
	str r1, [r7, #0x14]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0xe
	ldrsh r1, [r0, r6]
	str r1, [r7, #0x18]
	ldr r1, _080703B0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r7, #0x1c]
	ldr r0, [r7, #4]
	cmp r0, #9
	bls _080703A2
	b _08070778
_080703A2:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080703B4 @ =_080703B8
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080703B0: .4byte 0x08C9D938
_080703B4: .4byte _080703B8
_080703B8: @ jump table
	.4byte _080703E0 @ case 0
	.4byte _08070468 @ case 1
	.4byte _080704E4 @ case 2
	.4byte _08070560 @ case 3
	.4byte _080705E8 @ case 4
	.4byte _0807067C @ case 5
	.4byte _0807067C @ case 6
	.4byte _0807067C @ case 7
	.4byte _0807067C @ case 8
	.4byte _0807067C @ case 9
_080703E0:
	ldr r0, _08070460 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x14
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070460 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x14
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x14]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0xc]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMsg
	ldr r1, _08070460 @ =0x08C9D938
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x14
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070464 @ =0x02022C6C
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_08070460: .4byte 0x08C9D938
_08070464: .4byte 0x02022C6C
_08070468:
	ldr r0, _080704DC @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x1c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _080704DC @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r2, [r7, #8]
	ldr r3, _080704DC @ =0x08C9D938
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r4, #0xa
	ldrsh r3, [r1, r4]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _080704DC @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _080704E0 @ =0x02022CEE
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_080704DC: .4byte 0x08C9D938
_080704E0: .4byte 0x02022CEE
_080704E4:
	ldr r0, _08070558 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x24
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070558 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r2, [r7, #8]
	ldr r3, _08070558 @ =0x08C9D938
	ldr r1, [r3]
	ldr r3, [r7]
	movs r4, #0x64
	muls r3, r4, r3
	adds r1, r1, r3
	movs r5, #0xc
	ldrsh r3, [r1, r5]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08070558 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x24
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #3
	ldr r2, _0807055C @ =0x02022CF4
	adds r1, r1, r2
	bl PutText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_08070558: .4byte 0x08C9D938
_0807055C: .4byte 0x02022CF4
_08070560:
	ldr r0, _080705E0 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x2c
	adds r0, r1, #0
	bl ClearText
	ldr r0, _080705E0 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x2c
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x18]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r0, [r7, #0x10]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMsg
	ldr r1, _080705E0 @ =0x08C9D938
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x2c
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _080705E4 @ =0x02022D6C
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_080705E0: .4byte 0x08C9D938
_080705E4: .4byte 0x02022D6C
_080705E8:
	ldr r0, _08070674 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	adds r1, r0, #0
	adds r1, #0x34
	adds r0, r1, #0
	bl ClearText
	ldr r0, _08070674 @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r0, [r0]
	adds r1, r2, r0
	adds r0, r1, #0
	adds r0, #0x34
	ldr r2, [r7, #8]
	ldr r3, [r7, #0x1c]
	movs r1, #0x10
	bl Text_InsertDrawNumberOrBlank
	ldr r1, _08070674 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #0x10
	ldrsh r1, [r0, r6]
	adds r0, r1, #0
	bl GetItemName
	ldr r1, _08070674 @ =0x08C9D938
	ldr r2, [r7]
	movs r3, #0x64
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r1, [r1]
	adds r2, r3, r1
	adds r1, r2, #0
	adds r1, #0x34
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #3
	ldr r3, _08070678 @ =0x02022DEC
	adds r2, r2, r3
	ldr r3, [r7, #8]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x18
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_08070674: .4byte 0x08C9D938
_08070678: .4byte 0x02022DEC
_0807067C:
	ldr r0, _0807076C @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, _0807076C @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #8]
	ldr r3, _0807076C @ =0x08C9D938
	ldr r1, [r3]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	ldr r4, [r7]
	movs r5, #0x64
	muls r4, r5, r4
	adds r3, r3, r4
	adds r1, #8
	adds r4, r1, r3
	movs r1, #0
	ldrsh r3, [r4, r1]
	movs r1, #8
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _0807076C @ =0x08C9D938
	ldr r1, [r7]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r7, #4]
	subs r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #0
	adds r2, #8
	lsls r3, r2, #5
	adds r1, r3, #7
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, _08070770 @ =0x02022C60
	adds r1, r1, r2
	ldr r2, [r7, #8]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08070774 @ =0x08C9D898
	ldr r5, _0807076C @ =0x08C9D938
	ldr r4, [r5]
	ldr r5, [r7, #4]
	adds r6, r5, #0
	lsls r5, r6, #1
	str r5, [r7, #0x20]
	ldr r6, [r7]
	str r6, [r7, #0x24]
	movs r5, #0x64
	mov r8, r5
	ldr r5, [r7, #0x24]
	mov r6, r8
	muls r6, r5, r6
	str r6, [r7, #0x24]
	ldr r6, [r7, #0x20]
	ldr r5, [r7, #0x24]
	adds r6, r6, r5
	str r6, [r7, #0x20]
	adds r4, #8
	ldr r6, [r7, #0x20]
	adds r5, r4, r6
	movs r6, #0
	ldrsh r4, [r5, r6]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	str r4, [sp, #4]
	movs r3, #0x10
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	b _08070778
	.align 2, 0
_0807076C: .4byte 0x08C9D938
_08070770: .4byte 0x02022C60
_08070774: .4byte 0x08C9D898
_08070778:
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08070784
sub_08070784: @ 0x08070784
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08070978 @ =0x08B9333C
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0xe]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0x10]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x10]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0xc]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x72
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x6c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x6e
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x70
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x12]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0x14]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x14]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x16]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, _0807097C @ =0x08C9D938
	ldr r0, [r1]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x78
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807097C @ =0x08C9D938
	ldr r2, [r0]
	adds r1, r2, #0
	adds r0, r2, #0
	adds r0, #0x7e
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070978: .4byte 0x08B9333C
_0807097C: .4byte 0x08C9D938

	thumb_func_start sub_08070980
sub_08070980: @ 0x08070980
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	bl EndAllMus
	bl ResetText
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08070A7C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08070A80 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070A74 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070A74 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1d
	movs r3, #0x13
	bl DrawUiFrame2
	movs r0, #0
	str r0, [r7, #4]
_08070A62:
	ldr r0, _08070A84 @ =0x08C9D910
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	bne _08070A88
	b _08070ABC
	.align 2, 0
_08070A74: .4byte 0x03002870
_08070A78: .4byte 0x030028AC
_08070A7C: .4byte 0x0000FFE0
_08070A80: .4byte 0x0000E0FF
_08070A84: .4byte 0x08C9D910
_08070A88:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r2, _08070AB4 @ =0x02022C62
	adds r0, r1, r2
	ldr r1, _08070AB8 @ =0x08C9D910
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	bl PutString
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08070A62
	.align 2, 0
_08070AB4: .4byte 0x02022C62
_08070AB8: .4byte 0x08C9D910
_08070ABC:
	movs r0, #0
	str r0, [r7, #4]
_08070AC0:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _08070AC8
	b _08070B52
_08070AC8:
	movs r0, #0
	str r0, [r7, #8]
_08070ACC:
	ldr r0, [r7, #8]
	cmp r0, #1
	ble _08070AD4
	b _08070B4A
_08070AD4:
	ldr r0, _08070B30 @ =0x08C9D938
	ldr r1, [r7, #8]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r1, _08070B34 @ =0x08C9D8C0
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	bl InitTextDb
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #8]
	cmp r1, r0
	bne _08070B38
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #4]
	cmp r1, r0
	bne _08070B38
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #0
	bl sub_08070324
	b _08070B42
	.align 2, 0
_08070B30: .4byte 0x08C9D938
_08070B34: .4byte 0x08C9D8C0
_08070B38:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #1
	bl sub_08070324
_08070B42:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08070ACC
_08070B4A:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08070AC0
_08070B52:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08070B60
sub_08070B60: @ 0x08070B60
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r0, [r1, r3]
	str r0, [r7, #8]
	ldr r1, _08070BA4 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070BAE
	bl sub_08071174
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _08070BA8
	b _08071074
	.align 2, 0
_08070BA4: .4byte 0x08B857F8
_08070BA8:
	ldr r0, [r7]
	bl Proc_Break
_08070BAE:
	ldr r1, _08070BCC @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070BD0
	movs r0, #0xa
	str r0, [r7, #0xc]
	b _08070BD4
	.align 2, 0
_08070BCC: .4byte 0x08B857F8
_08070BD0:
	movs r0, #1
	str r0, [r7, #0xc]
_08070BD4:
	ldr r1, _08070CEC @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _08070BEC
	b _08070D48
_08070BEC:
	ldr r1, _08070CF0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r5, #0
	ldrsh r2, [r3, r5]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _08070CF0 @ =0x08C9D938
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08070CF0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _08070CF4 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #6]
	cmp r0, r2
	blt _08070D48
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _08070CF8
	ldr r1, _08070CF0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08070CF4 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08070D48
	.align 2, 0
_08070CEC: .4byte 0x08B857F8
_08070CF0: .4byte 0x08C9D938
_08070CF4: .4byte 0x08C9D8C0
_08070CF8:
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08070E68 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08070D48:
	ldr r1, _08070E6C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _08070D60
	b _08070EBC
_08070D60:
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _08070E64 @ =0x08C9D938
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _08070E68 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	cmp r0, r2
	bge _08070EBC
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _08070E70
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08070E68 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08070EBC
	.align 2, 0
_08070E64: .4byte 0x08C9D938
_08070E68: .4byte 0x08C9D8C0
_08070E6C: .4byte 0x08B857F8
_08070E70:
	ldr r1, _0807107C @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070EBC:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070F2E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _08070F02
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08070F02:
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #3
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070F2E:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070FA0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #1
	beq _08070F74
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08070F74:
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #4
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070FA0:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070FE2
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #1
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070FE2:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071024
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #2
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08071024:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071044
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	movs r2, #1
	bl sub_08070324
_08071044:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071074
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	bl sub_08070324
_08071074:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807107C: .4byte 0x08C9D938
_08071080: .4byte 0x08C9D8C0
_08071084: .4byte 0x08B857F8

	thumb_func_start sub_08071088
sub_08071088: @ 0x08071088
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x72
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x1e
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #0x12]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x3c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x12]
	ldr r1, _08071170 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7, #4]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetCharacterData
	ldr r1, [r7]
	str r0, [r1]
	ldr r1, _08071170 @ =0x08C9D938
	ldr r0, [r1]
	ldr r1, [r7, #4]
	movs r2, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	bl GetJobInfo
	ldr r1, [r7]
	str r0, [r1, #4]
	ldr r0, [r7]
	ldr r2, _08071170 @ =0x08C9D938
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r1, #0xa]
	adds r1, r2, #0
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, [r7]
	ldr r2, _08071170 @ =0x08C9D938
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r1, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r0, [r7]
	ldr r2, _08071170 @ =0x08C9D938
	ldr r1, [r2]
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x6e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071170: .4byte 0x08C9D938

	thumb_func_start sub_08071174
sub_08071174: @ 0x08071174
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	ldr r0, _080711A8 @ =0x0203A4F0
	str r0, [r7, #0xc]
	ldr r1, _080711AC @ =0x0203A3F0
	adds r0, r1, #0
	movs r1, #0
	bl sub_08071088
	ldr r1, _080711B0 @ =0x0203A470
	adds r0, r1, #0
	movs r1, #1
	bl sub_08071088
	bl ClearBattleHits
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7]
_0807119E:
	ldr r0, [r7]
	cmp r0, #4
	ble _080711B4
	b _08071204
	.align 2, 0
_080711A8: .4byte 0x0203A4F0
_080711AC: .4byte 0x0203A3F0
_080711B0: .4byte 0x0203A470
_080711B4:
	movs r0, #0
	str r0, [r7, #4]
_080711B8:
	ldr r0, [r7, #4]
	cmp r0, #1
	ble _080711C0
	b _080711F4
_080711C0:
	ldr r1, _080711E8 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080711EC
	movs r0, #1
	str r0, [r7, #0x10]
	b _080711F4
	.align 2, 0
_080711E8: .4byte 0x08C9D938
_080711EC:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080711B8
_080711F4:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080711FC
	b _08071204
_080711FC:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0807119E
_08071204:
	ldr r0, [r7]
	cmp r0, #5
	bne _08071214
	ldr r0, [r7, #4]
	cmp r0, #2
	bne _08071214
	movs r0, #0
	b _080713E2
_08071214:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #8]
_08071220:
	ldr r0, [r7, #8]
	cmp r0, #9
	ble _08071228
	b _080713C2
_08071228:
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	str r0, [r7]
	ldr r0, [r7, #8]
	movs r1, #1
	ands r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	ldr r1, _08071284 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #5
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	cmp r0, #8
	bhi _08071316
	lsls r1, r0, #2
	ldr r2, _08071288 @ =_0807128C
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071284: .4byte 0x08C9D938
_08071288: .4byte _0807128C
_0807128C: @ jump table
	.4byte _080712E2 @ case 0
	.4byte _080712E2 @ case 1
	.4byte _080712E2 @ case 2
	.4byte _080712E2 @ case 3
	.4byte _080712B0 @ case 4
	.4byte _080712B0 @ case 5
	.4byte _080712B0 @ case 6
	.4byte _080712B0 @ case 7
	.4byte _080712F8 @ case 8
_080712B0:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071316
_080712E2:
	ldr r0, [r7, #0xc]
	ldrb r1, [r0, #3]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #3]
	b _08071316
_080712F8:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08071316
_08071316:
	ldr r1, [r7, #0x10]
	subs r0, r1, #2
	cmp r0, #6
	bhi _080713AA
	lsls r1, r0, #2
	ldr r2, _08071328 @ =_0807132C
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08071328: .4byte _0807132C
_0807132C: @ jump table
	.4byte _08071348 @ case 0
	.4byte _08071368 @ case 1
	.4byte _0807138A @ case 2
	.4byte _080713AA @ case 3
	.4byte _08071348 @ case 4
	.4byte _08071368 @ case 5
	.4byte _0807138A @ case 6
_08071348:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080713AA
_08071366:
	.byte 0x20, 0xE0
_08071368:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080713AA
_08071388:
	.byte 0x0F, 0xE0
_0807138A:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1]
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _080713AA
_080713A8:
	.byte 0xFF, 0xE7
_080713AA:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _080713B2
	b _080713B4
_080713B2:
	b _080713BA
_080713B4:
	ldr r0, [r7, #0xc]
	adds r1, r0, #4
	str r1, [r7, #0xc]
_080713BA:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08071220
_080713C2:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #2]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	ldrb r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #2]
	movs r0, #1
	b _080713E2
_080713E2:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080713EC
sub_080713EC: @ 0x080713EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0807141C @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _08071420 @ =0x02023460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	bl StartBattleManim
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807141C: .4byte 0x02022C60
_08071420: .4byte 0x02023460

	thumb_func_start sub_08071424
sub_08071424: @ 0x08071424
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071490 @ =0x083F2B4C
	ldr r1, _08071494 @ =0x06013000
	bl Decompress
	ldr r0, _08071498 @ =0x083F2C3C
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _0807149C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	ldr r3, [r7]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _0807149C @ =0x0202BBB8
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #3
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071490: .4byte 0x083F2B4C
_08071494: .4byte 0x06013000
_08071498: .4byte 0x083F2C3C
_0807149C: .4byte 0x0202BBB8

	thumb_func_start sub_080714A0
sub_080714A0: @ 0x080714A0
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _0807150C @ =0x083F2DA4
	ldr r1, _08071510 @ =0x06013000
	bl Decompress
	ldr r0, _08071514 @ =0x083F2EE8
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071518 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	ldr r3, [r7]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08071518 @ =0x0202BBB8
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #3
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807150C: .4byte 0x083F2DA4
_08071510: .4byte 0x06013000
_08071514: .4byte 0x083F2EE8
_08071518: .4byte 0x0202BBB8

	thumb_func_start sub_0807151C
sub_0807151C: @ 0x0807151C
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _080715A8 @ =0x08C9D99C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080715AC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080715AC @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	subs r1, #8
	str r1, [r0, #0x34]
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	movs r2, #1
	eors r1, r2
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080715A8: .4byte 0x08C9D99C
_080715AC: .4byte 0x0202BBB8

	thumb_func_start sub_080715B0
sub_080715B0: @ 0x080715B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _080715FC @ =0x083F4464
	ldr r1, _08071600 @ =0x06013000
	bl Decompress
	ldr r0, _08071604 @ =0x083F46F0
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08071608 @ =0x083EDA80
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc6
	lsls r3, r3, #6
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x48
	movs r6, #0
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080715FC: .4byte 0x083F4464
_08071600: .4byte 0x06013000
_08071604: .4byte 0x083F46F0
_08071608: .4byte 0x083EDA80

	thumb_func_start sub_0807160C
sub_0807160C: @ 0x0807160C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071674 @ =0x08C9D9BC
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071678 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071678 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071674: .4byte 0x08C9D9BC
_08071678: .4byte 0x0202BBB8

	thumb_func_start sub_0807167C
sub_0807167C: @ 0x0807167C
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xb7
	bl PlaySeSpacial
	ldr r0, _080716CC @ =0x083F4894
	ldr r1, _080716D0 @ =0x06013800
	bl Decompress
	ldr r0, _080716D4 @ =0x083F4BE8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080716D8 @ =0x083ED9E8
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #8
	ldr r3, _080716DC @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080716CC: .4byte 0x083F4894
_080716D0: .4byte 0x06013800
_080716D4: .4byte 0x083F4BE8
_080716D8: .4byte 0x083ED9E8
_080716DC: .4byte 0x000041C0

	thumb_func_start sub_080716E0
sub_080716E0: @ 0x080716E0
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071748 @ =0x08C9D9DC
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _0807174C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _0807174C @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071748: .4byte 0x08C9D9DC
_0807174C: .4byte 0x0202BBB8

	thumb_func_start sub_08071750
sub_08071750: @ 0x08071750
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	bl sub_08073D80
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _0807186C @ =0x083F6334
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08071870 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08071874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071878 @ =0x030028AC
	ldr r1, _08071878 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _0807187C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071878 @ =0x030028AC
	ldr r1, _08071878 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071878 @ =0x030028AC
	ldr r1, _08071878 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08071880 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071878 @ =0x030028AC
	ldr r1, _08071878 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071884 @ =0x083F695C
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl StartPaletteAnimatorReverse
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807186C: .4byte 0x083F6334
_08071870: .4byte 0x06002800
_08071874: .4byte 0x03002870
_08071878: .4byte 0x030028AC
_0807187C: .4byte 0x0000FFE0
_08071880: .4byte 0x0000E0FF
_08071884: .4byte 0x083F695C

	thumb_func_start sub_08071888
sub_08071888: @ 0x08071888
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #2
	bls _08071910
	bl sub_080146DC
	ldr r0, _08071904 @ =0x083F695C
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
	ldr r4, _08071908 @ =0x083F699C
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _0807190C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _080718CE
	adds r0, #7
_080718CE:
	asrs r1, r0, #3
	subs r0, r1, #4
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _080718DE
	adds r1, #7
_080718DE:
	asrs r2, r1, #3
	subs r1, r2, #4
	movs r2, #0
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #8
	movs r3, #0x3c
	bl sub_08071B34
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8c
	bl PlaySeSpacial
	b _080719AA
	.align 2, 0
_08071904: .4byte 0x083F695C
_08071908: .4byte 0x083F699C
_0807190C: .4byte 0x06002800
_08071910:
	ldr r0, _080719B4 @ =0x08C9DA14
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #4]
	ldr r0, _080719B4 @ =0x08C9DA14
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _0807194E
	adds r0, #7
_0807194E:
	asrs r0, r0, #3
	ldr r2, [r7, #4]
	adds r1, r0, r2
	subs r0, r1, #3
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _08071962
	adds r1, #7
_08071962:
	asrs r1, r1, #3
	ldr r3, [r7, #8]
	adds r2, r1, r3
	subs r1, r2, #3
	movs r2, #8
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #6
	movs r3, #0xa
	bl sub_08071B34
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x89
	bl PlaySeSpacial
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080719AA:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080719B4: .4byte 0x08C9DA14

	thumb_func_start sub_080719B8
sub_080719B8: @ 0x080719B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080719D8 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080719D8: .4byte 0x02023C60

	thumb_func_start sub_080719DC
sub_080719DC: @ 0x080719DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080146DC
	ldr r1, _08071A50 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08071A54 @ =0x030028AC
	ldr r1, _08071A54 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08071A58 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071A54 @ =0x030028AC
	ldr r1, _08071A54 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0x1f
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071A5C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl sub_08071A60
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071A50: .4byte 0x02023C60
_08071A54: .4byte 0x030028AC
_08071A58: .4byte 0x0000FFE0
_08071A5C: .4byte 0x03002870

	thumb_func_start sub_08071A60
sub_08071A60: @ 0x08071A60
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08071B30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071B30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071B30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071B30 @ =0x03002870
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	asrs r2, r1, #2
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x46
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08071B26
	ldr r0, _08071B30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071B30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071B30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071B30 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08071B26:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071B30: .4byte 0x03002870

	thumb_func_start sub_08071B34
sub_08071B34: @ 0x08071B34
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08071B84 @ =0x08C9DA3C
	ldr r1, [r7, #0x20]
	bl SpawnProcLocking
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	str r1, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x58]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071B84: .4byte 0x08C9DA3C

	thumb_func_start sub_08071B88
sub_08071B88: @ 0x08071B88
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071BA8 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071BA8: .4byte 0x02023C60

	thumb_func_start sub_08071BAC
sub_08071BAC: @ 0x08071BAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071BCC @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071BCC: .4byte 0x02023C60

	thumb_func_start sub_08071BD0
sub_08071BD0: @ 0x08071BD0
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08071C64 @ =0x02023C60
	ldr r2, [r7]
	ldr r1, [r2, #0x2c]
	ldr r3, [r7]
	ldr r2, [r3, #0x30]
	ldr r3, _08071C68 @ =0x00004140
	ldr r4, [r7]
	ldr r5, [r4, #0x54]
	str r5, [sp]
	ldr r4, [r7]
	ldr r5, [r4, #0x54]
	str r5, [sp, #4]
	bl sub_080147BC
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08071C6C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071C6C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071C6C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071C6C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071C64: .4byte 0x02023C60
_08071C68: .4byte 0x00004140
_08071C6C: .4byte 0x03002870

	thumb_func_start sub_08071C70
sub_08071C70: @ 0x08071C70
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r1, r3, #2
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08071D24 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08071D24 @ =0x03002870
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08071D24 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071D24 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #7
	ble _08071D1A
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08071D1A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071D24: .4byte 0x03002870

	thumb_func_start sub_08071D28
sub_08071D28: @ 0x08071D28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x44
	ldr r1, [r7]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x44
	ldrh r3, [r2]
	subs r0, r3, #1
	adds r2, r1, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r0, #0
	orrs r3, r2
	adds r2, r3, #0
	strh r2, [r1]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	movs r1, #1
	cmn r0, r1
	bne _08071D68
	ldr r0, [r7]
	bl Proc_Break
_08071D68:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08071D70
sub_08071D70: @ 0x08071D70
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	cmp r1, #0
	bne _08071D88
	ldr r0, [r7]
	bl Proc_Break
	b _08071E3C
_08071D88:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	str r1, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, _08071E44 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08071E44 @ =0x03002870
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08071E44 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071E44 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	cmp r0, r2
	blt _08071E3C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _08071E48 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7]
	bl Proc_Break
_08071E3C:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071E44: .4byte 0x03002870
_08071E48: .4byte 0x02023C60

	thumb_func_start sub_08071E4C
sub_08071E4C: @ 0x08071E4C
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08071EC4 @ =0x08C9DA7C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071EC8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08071EC8 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	str r1, [r0, #0x50]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071EC4: .4byte 0x08C9DA7C
_08071EC8: .4byte 0x0202BBB8

	thumb_func_start sub_08071ECC
sub_08071ECC: @ 0x08071ECC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xb6
	bl PlaySeSpacial
	ldr r0, _08071FC8 @ =0x03002870
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _08071FC8 @ =0x03002870
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _08071FC8 @ =0x03002870
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _08071FC8 @ =0x03002870
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldr r4, [r0, #0x50]
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08071FCC @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08073D80
	ldr r0, _08071FC8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071FC8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071FC8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08071FC8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071FC8: .4byte 0x03002870
_08071FCC: .4byte 0x06002800

	thumb_func_start sub_08071FD0
sub_08071FD0: @ 0x08071FD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08072088 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08071FEA
	adds r1, #7
_08071FEA:
	asrs r2, r1, #3
	subs r1, r2, #3
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08071FFA
	adds r2, #7
_08071FFA:
	asrs r3, r2, #3
	subs r2, r3, #3
	ldr r3, _0807208C @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _08072090 @ =0x083F5CF4
	str r4, [sp, #8]
	ldr r4, _08072094 @ =0x08C9DAAC
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080148FC
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072094 @ =0x08C9DAAC
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _0807207A
	ldr r0, [r7]
	bl Proc_Break
_0807207A:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072088: .4byte 0x02023C60
_0807208C: .4byte 0x00004140
_08072090: .4byte 0x083F5CF4
_08072094: .4byte 0x08C9DAAC

	thumb_func_start sub_08072098
sub_08072098: @ 0x08072098
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080720FC @ =0x08C9DAC4
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072100 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08072100 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080720FC: .4byte 0x08C9DAC4
_08072100: .4byte 0x0202BBB8

	thumb_func_start sub_08072104
sub_08072104: @ 0x08072104
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08072120 @ =0x0000010F
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	bl PlaySeSpacial
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072120: .4byte 0x0000010F

	thumb_func_start sub_08072124
sub_08072124: @ 0x08072124
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	adds r0, r3, #0
	adds r1, r7, #0
	adds r1, #0xc
	strh r0, [r1]
	ldr r1, _0807217C @ =0x08C9DAE4
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	str r1, [r0, #0x50]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	str r1, [r0, #0x54]
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0xc
	adds r2, r0, #0
	adds r0, #0x58
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807217C: .4byte 0x08C9DAE4

	thumb_func_start sub_08072180
sub_08072180: @ 0x08072180
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldr r4, [r0, #0x50]
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080722B0 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080722B4 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080722B8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _080722B8 @ =0x0202BBB8
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	subs r2, r3, #2
	ldr r3, _080722BC @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	bl sub_080147BC
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	ldr r0, [r1, #0x54]
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x58
	ldrh r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080722B8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	bl PlaySeSpacial
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080722AC: .4byte 0x03002870
_080722B0: .4byte 0x06002800
_080722B4: .4byte 0x02023C60
_080722B8: .4byte 0x0202BBB8
_080722BC: .4byte 0x00004140

	thumb_func_start sub_080722C0
sub_080722C0: @ 0x080722C0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x10
	bne _08072300
	ldr r0, [r7]
	bl Proc_Break
_08072300:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r1, [r2]
	movs r2, #0x16
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #0x10
	bls _08072346
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08072346:
	ldr r0, _08072414 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072414 @ =0x03002870
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08072414 @ =0x03002870
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072414 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072418 @ =0x030028AC
	ldr r1, _08072418 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _0807241C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072418 @ =0x030028AC
	ldr r1, _08072418 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072414 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072418 @ =0x030028AC
	ldr r1, _08072418 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08072420 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072418 @ =0x030028AC
	ldr r1, _08072418 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072414 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072414: .4byte 0x03002870
_08072418: .4byte 0x030028AC
_0807241C: .4byte 0x0000FFE0
_08072420: .4byte 0x0000E0FF

	thumb_func_start sub_08072424
sub_08072424: @ 0x08072424
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0
	bne _08072464
	ldr r0, [r7]
	bl Proc_Break
_08072464:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r1, [r2]
	movs r2, #0x16
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #0x10
	bls _080724AA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080724AA:
	ldr r0, _08072578 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072578 @ =0x03002870
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, _08072578 @ =0x03002870
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r0, r3, #0
	adds r2, r1, #0
	adds r1, #0x45
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072578 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807257C @ =0x030028AC
	ldr r1, _0807257C @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08072580 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807257C @ =0x030028AC
	ldr r1, _0807257C @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072578 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807257C @ =0x030028AC
	ldr r1, _0807257C @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08072584 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807257C @ =0x030028AC
	ldr r1, _0807257C @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072578 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072578: .4byte 0x03002870
_0807257C: .4byte 0x030028AC
_08072580: .4byte 0x0000FFE0
_08072584: .4byte 0x0000E0FF

	thumb_func_start sub_08072588
sub_08072588: @ 0x08072588
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080146DC
	ldr r1, _08072618 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0807261C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807261C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807261C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807261C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807261C @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807261C @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0807261C @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072618: .4byte 0x02023C60
_0807261C: .4byte 0x03002870

	thumb_func_start sub_08072620
sub_08072620: @ 0x08072620
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetOnHBlankA
	bl sub_080146DC
	ldr r1, _080726B8 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _080726BC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080726BC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080726BC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080726BC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080726BC @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080726BC @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080726BC @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080726B8: .4byte 0x02023C60
_080726BC: .4byte 0x03002870

	thumb_func_start sub_080726C0
sub_080726C0: @ 0x080726C0
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08072724 @ =0x08C9DB1C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072728 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08072728 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x34]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072724: .4byte 0x08C9DB1C
_08072728: .4byte 0x0202BBB8

	thumb_func_start sub_0807272C
sub_0807272C: @ 0x0807272C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08072778 @ =0x083F4C08
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _0807277C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08072780 @ =0x083F4E68
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_080752C8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072778: .4byte 0x083F4C08
_0807277C: .4byte 0x06002800
_08072780: .4byte 0x083F4E68

	thumb_func_start sub_08072784
sub_08072784: @ 0x08072784
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08072884 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	subs r1, r2, #1
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	subs r2, r3, #3
	ldr r3, _08072888 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0807288C @ =0x083F4E88
	str r4, [sp, #8]
	ldr r4, _08072890 @ =0x08C9DB4C
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080148FC
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072890 @ =0x08C9DB4C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _0807281A
	ldr r0, [r7]
	bl Proc_Break
_0807281A:
	bl sub_08073D80
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072884: .4byte 0x02023C60
_08072888: .4byte 0x00004140
_0807288C: .4byte 0x083F4E88
_08072890: .4byte 0x08C9DB4C
_08072894: .4byte 0x03002870

	thumb_func_start sub_08072898
sub_08072898: @ 0x08072898
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080728E4 @ =0x08C9DB64
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r1, _080728E8 @ =0x0203A85C
	ldrb r2, [r1, #0x13]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080728EC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r1, _080728E8 @ =0x0203A85C
	ldrb r2, [r1, #0x14]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080728EC @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080728E4: .4byte 0x08C9DB64
_080728E8: .4byte 0x0203A85C
_080728EC: .4byte 0x0202BBB8

	thumb_func_start sub_080728F0
sub_080728F0: @ 0x080728F0
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r1, _080729EC @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807290E
	movs r0, #0xb3
	bl m4aSongNumStart
_0807290E:
	ldr r0, _080729F0 @ =0x083F6D78
	ldr r1, _080729F4 @ =0x06013800
	bl Decompress
	ldr r0, _080729F8 @ =0x083F7030
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl sub_08013C7C
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080729FC @ =0x06002800
	adds r1, r0, r2
	ldr r2, _08072A00 @ =0x0000FFFF
	adds r0, r1, #0
	movs r1, #0x10
	bl sub_08014B94
	ldr r0, _08072A04 @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _08072A08 @ =0x00004140
	bl sub_08014B94
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08072A0C @ =0x083ECCA0
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #4
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08072A10 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	bl InitScanlineEffect
	bl sub_0807689C
	bl sub_08073D80
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080729EC: .4byte 0x0202BBF8
_080729F0: .4byte 0x083F6D78
_080729F4: .4byte 0x06013800
_080729F8: .4byte 0x083F7030
_080729FC: .4byte 0x06002800
_08072A00: .4byte 0x0000FFFF
_08072A04: .4byte 0x02023C60
_08072A08: .4byte 0x00004140
_08072A0C: .4byte 0x083ECCA0
_08072A10: .4byte 0x000041C0
_08072A14: .4byte 0x03002870

	thumb_func_start sub_08072A18
sub_08072A18: @ 0x08072A18
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r3, [r1]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	adds r1, #8
	ldr r2, [r7, #4]
	bl sub_080769CC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r1, r0, #0
	lsls r2, r1, #4
	adds r0, r2, #0
	movs r1, #0x28
	bl __divsi3
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08072A94
	movs r0, #0x10
	str r0, [r7, #8]
_08072A94:
	ldr r0, _08072B0C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072B0C @ =0x03002870
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072B0C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072B0C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x27
	bls _08072B02
	ldr r0, [r7]
	bl Proc_Break
	bl EndEachSpriteAnimProc
_08072B02:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072B0C: .4byte 0x03002870

	thumb_func_start sub_08072B10
sub_08072B10: @ 0x08072B10
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r3, [r1]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	adds r1, #8
	ldr r2, [r7, #4]
	bl sub_080769CC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r1, r0, #0
	subs r1, #0x28
	adds r0, r1, #0
	lsls r1, r0, #4
	adds r0, r1, #0
	movs r1, #0x1e
	bl __divsi3
	movs r1, #0x10
	subs r0, r1, r0
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bgt _08072B94
	movs r0, #0
	str r0, [r7, #8]
_08072B94:
	ldr r0, _08072C08 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072C08 @ =0x03002870
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072C08 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072C08 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x45
	bls _08072BFE
	ldr r0, [r7]
	bl Proc_Break
_08072BFE:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072C08: .4byte 0x03002870

	thumb_func_start sub_08072C0C
sub_08072C0C: @ 0x08072C0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetScanLineHBlank
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08072C20
sub_08072C20: @ 0x08072C20
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08072C88 @ =0x08C9DBAC
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072C8C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08072C8C @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072C88: .4byte 0x08C9DBAC
_08072C8C: .4byte 0x0202BBB8

	thumb_func_start sub_08072C90
sub_08072C90: @ 0x08072C90
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x87
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_08073D80
	ldr r0, _08072CFC @ =0x083F87B4
	ldr r1, _08072D00 @ =0x06013800
	bl Decompress
	ldr r0, _08072D04 @ =0x083F8A8C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08072D08 @ =0x083F8AAC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08072D0C @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072CFC: .4byte 0x083F87B4
_08072D00: .4byte 0x06013800
_08072D04: .4byte 0x083F8A8C
_08072D08: .4byte 0x083F8AAC
_08072D0C: .4byte 0x000041C0

	thumb_func_start sub_08072D10
sub_08072D10: @ 0x08072D10
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08072D74 @ =0x08C9DBD4
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072D78 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08072D78 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072D74: .4byte 0x08C9DBD4
_08072D78: .4byte 0x0202BBB8

	thumb_func_start sub_08072D7C
sub_08072D7C: @ 0x08072D7C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x86
	bl PlaySeSpacial
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08072D98
sub_08072D98: @ 0x08072D98
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_08073D80
	ldr r0, _08072E4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072E4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r4, _08072E50 @ =0x083F7474
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08072E54 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08072E58 @ =0x08272DBC
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072E4C: .4byte 0x03002870
_08072E50: .4byte 0x083F7474
_08072E54: .4byte 0x06002800
_08072E58: .4byte 0x08272DBC

	thumb_func_start sub_08072E5C
sub_08072E5C: @ 0x08072E5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08072EF0 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08072E78
	adds r1, #7
_08072E78:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08072E88
	adds r2, #7
_08072E88:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #9
	ldr r3, _08072EF4 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xb
	str r4, [sp, #4]
	ldr r4, _08072EF8 @ =0x083F8148
	str r4, [sp, #8]
	ldr r4, _08072EFC @ =0x083FC4EC
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080149A8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08072EFC @ =0x083FC4EC
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08072EE2
	ldr r0, [r7]
	bl Proc_Break
_08072EE2:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072EF0: .4byte 0x02023C60
_08072EF4: .4byte 0x00004140
_08072EF8: .4byte 0x083F8148
_08072EFC: .4byte 0x083FC4EC

	thumb_func_start sub_08072F00
sub_08072F00: @ 0x08072F00
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08072FB8 @ =0x083FC508
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x13
	bl memcpy
	ldr r0, _08072FBC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072FBC @ =0x03002870
	adds r1, r7, #4
	ldr r2, [r7]
	adds r3, r2, #0
	adds r2, #0x4a
	ldrh r3, [r2]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r2]
	lsls r3, r3, #0x10
	asrs r2, r3, #0x10
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08072FBC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072FBC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4a
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08072FB0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08072FB0:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072FB8: .4byte 0x083FC508
_08072FBC: .4byte 0x03002870

	thumb_func_start sub_08072FC0
sub_08072FC0: @ 0x08072FC0
	push {r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _0807305C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _0807305C @ =0x03002870
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _0807305C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0807305C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1e
	ble _08073052
	ldr r0, [r7]
	bl Proc_Break
_08073052:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807305C: .4byte 0x03002870

	thumb_func_start sub_08073060
sub_08073060: @ 0x08073060
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080730C0 @ =0x08C9DC14
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080730C4 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080730C4 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730C0: .4byte 0x08C9DC14
_080730C4: .4byte 0x0202BBB8

	thumb_func_start sub_080730C8
sub_080730C8: @ 0x080730C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	bl PlaySeSpacial
	ldr r1, _080730F0 @ =0x08270258
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730F0: .4byte 0x08270258

	thumb_func_start sub_080730F4
sub_080730F4: @ 0x080730F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08073188 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08073110
	adds r1, #7
_08073110:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08073120
	adds r2, #7
_08073120:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #9
	ldr r3, _0807318C @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xb
	str r4, [sp, #4]
	ldr r4, _08073190 @ =0x083F7208
	str r4, [sp, #8]
	ldr r4, _08073194 @ =0x083FC534
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080149A8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073194 @ =0x083FC534
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _0807317A
	ldr r0, [r7]
	bl Proc_Break
_0807317A:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073188: .4byte 0x02023C60
_0807318C: .4byte 0x00004140
_08073190: .4byte 0x083F7208
_08073194: .4byte 0x083FC534

	thumb_func_start sub_08073198
sub_08073198: @ 0x08073198
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080731F8 @ =0x08C9DC54
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080731FC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080731FC @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080731F8: .4byte 0x08C9DC54
_080731FC: .4byte 0x0202BBB8

	thumb_func_start sub_08073200
sub_08073200: @ 0x08073200
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_08073D80
	ldr r0, _08073258 @ =0x08275FB0
	ldr r1, _0807325C @ =0x06013800
	bl Decompress
	ldr r0, _08073260 @ =0x08276198
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073264 @ =0x083F83B4
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, _08073268 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073258: .4byte 0x08275FB0
_0807325C: .4byte 0x06013800
_08073260: .4byte 0x08276198
_08073264: .4byte 0x083F83B4
_08073268: .4byte 0x000041C0

	thumb_func_start sub_0807326C
sub_0807326C: @ 0x0807326C
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	ldr r0, _080732A4 @ =0x083F83B4
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	subs r2, #8
	ldr r3, _080732A8 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080732A4: .4byte 0x083F83B4
_080732A8: .4byte 0x000041C0

	thumb_func_start sub_080732AC
sub_080732AC: @ 0x080732AC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	ldr r0, _080732E0 @ =0x083F83B4
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _080732E4 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080732E0: .4byte 0x083F83B4
_080732E4: .4byte 0x000041C0

	thumb_func_start sub_080732E8
sub_080732E8: @ 0x080732E8
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _0807334C @ =0x08C9DC94
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08073350 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08073350 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #0x12
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807334C: .4byte 0x08C9DC94
_08073350: .4byte 0x0202BBB8

