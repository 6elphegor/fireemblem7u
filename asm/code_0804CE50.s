	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrDispUPMain
ekrDispUPMain: @ 0x0804CE50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804CF40
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CF40
	ldrh r1, [r7, #0x3a]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	lsls r2, r0, #5
	mov r8, r2
	cmp r2, #0
	bge _0804CE82
	movs r1, #0
	mov r8, r1
_0804CE82:
	adds r6, r0, #7
	cmp r6, #6
	ble _0804CE8A
	movs r6, #6
_0804CE8A:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804CEA8 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _0804CEAC
	cmp r0, #2
	bgt _0804CEAC
	movs r4, #0
	b _0804CEAE
	.align 2, 0
_0804CEA8: .4byte 0x0203E02C
_0804CEAC:
	movs r4, #0xf
_0804CEAE:
	ldr r0, _0804CF50 @ =0x02022C60
	mov sb, r0
	movs r0, #0x9f
	str r0, [sp]
	mov r0, sb
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl FillBGRect
	cmp r6, #0
	ble _0804CF3A
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _0804CF00
	ldr r0, _0804CF54 @ =0x081D8C34
	add r0, sl
	mov r1, r8
	lsls r5, r1, #1
	lsls r1, r4, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_0806693C
_0804CF00:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne _0804CF3A
	ldr r0, _0804CF58 @ =0x081D8CE8
	add r0, sl
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl sub_0806693C
_0804CF3A:
	movs r0, #1
	bl EnableBgSync
_0804CF40:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CF50: .4byte 0x02022C60
_0804CF54: .4byte 0x081D8C34
_0804CF58: .4byte 0x081D8CE8
