	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DF48
sub_0803DF48: @ 0x0803DF48
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r5, #0
	ldr r1, _0803DF78 @ =0x08B98C9C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r7, [r0]
	bl InitUnits
	cmp r4, #0
	beq _0803DF7C
	cmp r4, #0
	blt _0803E02A
	cmp r4, #2
	bgt _0803E02A
	movs r6, #0
	b _0803DFE8
	.align 2, 0
_0803DF78: .4byte 0x08B98C9C
_0803DF7C:
	movs r6, #0
	mov r1, r8
	lsls r0, r1, #4
	adds r5, r0, r7
	movs r0, #1
	mov r8, r0
	movs r7, #0
_0803DF8A:
	ldr r0, _0803DFA8 @ =0x0203DA78
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080A1C44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803DFAC
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x14]
	strb r6, [r4, #0x13]
	b _0803DFC4
	.align 2, 0
_0803DFA8: .4byte 0x0203DA78
_0803DFAC:
	ldr r0, _0803DFE4 @ =0x081D5228
	adds r1, r4, #0
	bl SioStrCpy
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x14]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0x13]
_0803DFC4:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_080A1E8C
	movs r1, #5
	add r8, r1
	adds r7, #0x18
	adds r6, #1
	cmp r6, #9
	ble _0803DF8A
	adds r5, r6, #0
	b _0803E02A
	.align 2, 0
_0803DFE4: .4byte 0x081D5228
_0803DFE8:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0803E03C @ =0x0203DA78
	adds r4, r0, r1
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080A1C44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E024
	mov r1, r8
	lsls r0, r1, #4
	adds r0, r0, r7
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x14]
	strb r6, [r4, #0x13]
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_080A1E8C
	adds r5, #1
_0803E024:
	adds r6, #1
	cmp r6, #9
	ble _0803DFE8
_0803E02A:
	adds r0, r5, #0
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E03C: .4byte 0x0203DA78
