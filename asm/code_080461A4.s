	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080461A4
sub_080461A4: @ 0x080461A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _08046248 @ =0x03001400
	ldr r5, _0804624C @ =0x0203DC9C
	ldrb r2, [r5, #4]
	adds r1, r2, r0
	ldrb r6, [r1]
	ldrb r1, [r5, #5]
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r1, [r4, #0xc]
	ldr r3, _08046250 @ =0x00010004
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _080461E0
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
_080461E0:
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _080461F2
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
_080461F2:
	lsrs r0, r6, #6
	adds r1, r0, #0
	adds r2, r5, #0
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _0804620E
	lsrs r1, r7, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804626A
_0804620E:
	adds r4, r1, #0
	ldr r2, _0804624C @ =0x0203DC9C
	ldr r3, _08046254 @ =0x0203D90C
	adds r3, #0xa0
	ldrb r6, [r3]
	ldrb r1, [r2, #0xe]
	subs r0, r6, r1
	adds r1, r2, #0
	adds r1, #0xf
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804626A
	adds r1, r5, #0
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046258
	adds r4, r1, #0
	b _0804625A
	.align 2, 0
_08046248: .4byte 0x03001400
_0804624C: .4byte 0x0203DC9C
_08046250: .4byte 0x00010004
_08046254: .4byte 0x0203D90C
_08046258:
	lsrs r4, r7, #6
_0804625A:
	strb r4, [r2, #0xf]
	movs r0, #0xff
	bl sub_08044B34
	mov r0, r8
	bl Proc_Break
	b _08046278
_0804626A:
	ldr r0, _08046284 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl sub_08044B34
	mov r0, r8
	bl Proc_Break
_08046278:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046284: .4byte 0x0202BBF8
