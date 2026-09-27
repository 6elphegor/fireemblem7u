	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045FC4
sub_08045FC4: @ 0x08045FC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r1, _08046030 @ =0x03001400
	ldr r0, _08046034 @ =0x0203DC9C
	mov sl, r0
	ldrb r2, [r0, #4]
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	mov r3, sl
	ldrb r3, [r3, #5]
	adds r1, r3, r1
	ldrb r1, [r1]
	mov sb, r1
	bl GetUnit
	adds r4, r0, #0
	mov r0, sb
	bl GetUnit
	mov r8, r0
	movs r7, #0
	adds r0, r5, #0
	bl sub_08044BF0
	str r0, [sp, #0x10]
	mov r0, sb
	bl sub_08044BF0
	str r0, [sp, #0x14]
	ldr r6, _08046038 @ =0x03001420
	str r7, [r6, #4]
	str r7, [r6]
	ldr r0, [r4, #0xc]
	ldr r1, _0804603C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046020
	ldr r0, [r4]
	cmp r0, #0
	bne _08046040
_08046020:
	lsrs r0, r5, #6
	mov r1, sl
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	b _08046078
	.align 2, 0
_08046030: .4byte 0x03001400
_08046034: .4byte 0x0203DC9C
_08046038: .4byte 0x03001420
_0804603C: .4byte 0x00010004
_08046040:
	adds r0, r4, #0
	bl StartMu
	str r0, [r6]
	bl DisableMuCamera
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	movs r7, #1
	ldr r1, [r6]
	ldr r2, _080460A0 @ =0x081D5490
	ldr r5, [sp, #0x10]
	lsls r0, r5, #2
	adds r0, r0, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r4, #0
	bl sub_08047A00
_08046078:
	mov r1, r8
	ldr r0, [r1, #0xc]
	ldr r1, _080460A4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804608C
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	bne _080460AC
_0804608C:
	ldr r0, _080460A8 @ =0x0203DC9C
	mov r3, sb
	lsrs r1, r3, #6
	adds r0, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _080460F0
	.align 2, 0
_080460A0: .4byte 0x081D5490
_080460A4: .4byte 0x00010004
_080460A8: .4byte 0x0203DC9C
_080460AC:
	mov r0, r8
	bl StartMu
	ldr r4, _0804610C @ =0x03001420
	str r0, [r4, #4]
	bl DisableMuCamera
	mov r5, r8
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r7, #0
	movs r7, #0
	cmp r0, #0
	bne _080460CE
	movs r7, #1
_080460CE:
	ldr r1, [r4, #4]
	ldr r2, _08046110 @ =0x081D5490
	ldr r3, [sp, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r0, r8
	bl sub_08047A00
_080460F0:
	bl sub_08044B24
	ldr r0, [sp, #0xc]
	bl Proc_Break
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804610C: .4byte 0x03001420
_08046110: .4byte 0x081D5490
