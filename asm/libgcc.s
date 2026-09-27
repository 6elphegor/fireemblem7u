	.include "macro.inc"

	.syntax unified

	thumb_func_start _call_via_r0
_call_via_r0: @ 0x080BFC4C
	bx r0
	nop

	thumb_func_start _call_via_r1
_call_via_r1: @ 0x080BFC50
	bx r1
	nop

	thumb_func_start _call_via_r2
_call_via_r2: @ 0x080BFC54
	bx r2
	nop

	thumb_func_start _call_via_r3
_call_via_r3: @ 0x080BFC58
	bx r3
	nop

	thumb_func_start _call_via_r4
_call_via_r4: @ 0x080BFC5C
	bx r4
	nop

	thumb_func_start _call_via_r5
_call_via_r5: @ 0x080BFC60
	bx r5
	nop

	thumb_func_start _call_via_r6
_call_via_r6: @ 0x080BFC64
	bx r6
	nop

	thumb_func_start sub_080BFC68
sub_080BFC68: @ 0x080BFC68
	bx r7
	nop

	thumb_func_start sub_080BFC6C
sub_080BFC6C: @ 0x080BFC6C
	bx r8
	nop

	thumb_func_start sub_080BFC70
sub_080BFC70: @ 0x080BFC70
	bx sb
	nop

	thumb_func_start sub_080BFC74
sub_080BFC74: @ 0x080BFC74
	bx sl
	nop
_080BFC78:
	.byte 0x58, 0x47, 0xC0, 0x46, 0x60, 0x47, 0xC0, 0x46
	.byte 0x68, 0x47, 0xC0, 0x46, 0x70, 0x47, 0xC0, 0x46

	thumb_func_start __divsi3
__divsi3: @ 0x080BFC88
	cmp r1, #0
	beq _080BFD10
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _080BFC9E
	rsbs r1, r1, #0
_080BFC9E:
	cmp r0, #0
	bpl _080BFCA4
	rsbs r0, r0, #0
_080BFCA4:
	cmp r0, r1
	blo _080BFD02
	movs r4, #1
	lsls r4, r4, #0x1c
_080BFCAC:
	cmp r1, r4
	bhs _080BFCBA
	cmp r1, r0
	bhs _080BFCBA
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080BFCAC
_080BFCBA:
	lsls r4, r4, #3
_080BFCBC:
	cmp r1, r4
	bhs _080BFCCA
	cmp r1, r0
	bhs _080BFCCA
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080BFCBC
_080BFCCA:
	cmp r0, r1
	blo _080BFCD2
	subs r0, r0, r1
	orrs r2, r3
_080BFCD2:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080BFCDE
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_080BFCDE:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080BFCEA
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_080BFCEA:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080BFCF6
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_080BFCF6:
	cmp r0, #0
	beq _080BFD02
	lsrs r3, r3, #4
	beq _080BFD02
	lsrs r1, r1, #4
	b _080BFCCA
_080BFD02:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _080BFD0C
	rsbs r0, r0, #0
_080BFD0C:
	pop {r4}
	mov pc, lr
_080BFD10:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start __div0
__div0: @ 0x080BFD1C
	mov pc, lr
	.align 2, 0

	thumb_func_start __modsi3
__modsi3: @ 0x080BFD20
	movs r3, #1
	cmp r1, #0
	beq _080BFDE4
	bpl _080BFD2A
	rsbs r1, r1, #0
_080BFD2A:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _080BFD34
	rsbs r0, r0, #0
_080BFD34:
	cmp r0, r1
	blo _080BFDD8
	movs r4, #1
	lsls r4, r4, #0x1c
_080BFD3C:
	cmp r1, r4
	bhs _080BFD4A
	cmp r1, r0
	bhs _080BFD4A
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080BFD3C
_080BFD4A:
	lsls r4, r4, #3
_080BFD4C:
	cmp r1, r4
	bhs _080BFD5A
	cmp r1, r0
	bhs _080BFD5A
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080BFD4C
_080BFD5A:
	movs r2, #0
	cmp r0, r1
	blo _080BFD62
	subs r0, r0, r1
_080BFD62:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080BFD74
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080BFD74:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080BFD86
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080BFD86:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080BFD98
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080BFD98:
	mov ip, r3
	cmp r0, #0
	beq _080BFDA6
	lsrs r3, r3, #4
	beq _080BFDA6
	lsrs r1, r1, #4
	b _080BFD5A
_080BFDA6:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _080BFDD8
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _080BFDBC
	lsrs r4, r1, #3
	adds r0, r0, r4
_080BFDBC:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _080BFDCA
	lsrs r4, r1, #2
	adds r0, r0, r4
_080BFDCA:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _080BFDD8
	lsrs r4, r1, #1
	adds r0, r0, r4
_080BFDD8:
	pop {r4}
	cmp r4, #0
	bpl _080BFDE0
	rsbs r0, r0, #0
_080BFDE0:
	pop {r4}
	mov pc, lr
_080BFDE4:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start __muldi3
__muldi3: @ 0x080BFDF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r3, [sp]
	ldr r0, _080BFE5C @ =0x0000FFFF
	mov ip, r0
	adds r2, r3, #0
	ands r2, r0
	lsrs r3, r3, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, #0
	mov r4, ip
	ands r0, r4
	lsrs r1, r1, #0x10
	adds r5, r2, #0
	muls r5, r0, r5
	adds r4, r2, #0
	muls r4, r1, r4
	adds r2, r3, #0
	muls r2, r0, r2
	muls r3, r1, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r2
	cmp r4, r2
	bhs _080BFE30
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_080BFE30:
	lsrs r0, r4, #0x10
	adds r7, r3, r0
	mov r1, ip
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r6, r0, #0
	orrs r6, r5
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r3, [sp]
	ldr r4, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r5, [sp, #4]
	ldr r4, [sp, #8]
	adds r3, r5, #0
	muls r3, r4, r3
	adds r2, r2, r3
	adds r1, r7, r2
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080BFE5C: .4byte 0x0000FFFF

	thumb_func_start __udivsi3
__udivsi3: @ 0x080BFE60
	cmp r1, #0
	beq _080BFECE
	movs r3, #1
	movs r2, #0
	push {r4}
	cmp r0, r1
	blo _080BFEC8
	movs r4, #1
	lsls r4, r4, #0x1c
_080BFE72:
	cmp r1, r4
	bhs _080BFE80
	cmp r1, r0
	bhs _080BFE80
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080BFE72
_080BFE80:
	lsls r4, r4, #3
_080BFE82:
	cmp r1, r4
	bhs _080BFE90
	cmp r1, r0
	bhs _080BFE90
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080BFE82
_080BFE90:
	cmp r0, r1
	blo _080BFE98
	subs r0, r0, r1
	orrs r2, r3
_080BFE98:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080BFEA4
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_080BFEA4:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080BFEB0
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_080BFEB0:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080BFEBC
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_080BFEBC:
	cmp r0, #0
	beq _080BFEC8
	lsrs r3, r3, #4
	beq _080BFEC8
	lsrs r1, r1, #4
	b _080BFE90
_080BFEC8:
	adds r0, r2, #0
	pop {r4}
	mov pc, lr
_080BFECE:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}

	thumb_func_start __umodsi3
__umodsi3: @ 0x080BFED8
	cmp r1, #0
	beq _080BFF8E
	movs r3, #1
	cmp r0, r1
	bhs _080BFEE4
	mov pc, lr
_080BFEE4:
	push {r4}
	movs r4, #1
	lsls r4, r4, #0x1c
_080BFEEA:
	cmp r1, r4
	bhs _080BFEF8
	cmp r1, r0
	bhs _080BFEF8
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080BFEEA
_080BFEF8:
	lsls r4, r4, #3
_080BFEFA:
	cmp r1, r4
	bhs _080BFF08
	cmp r1, r0
	bhs _080BFF08
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080BFEFA
_080BFF08:
	movs r2, #0
	cmp r0, r1
	blo _080BFF10
	subs r0, r0, r1
_080BFF10:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080BFF22
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080BFF22:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080BFF34
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080BFF34:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080BFF46
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080BFF46:
	mov ip, r3
	cmp r0, #0
	beq _080BFF54
	lsrs r3, r3, #4
	beq _080BFF54
	lsrs r1, r1, #4
	b _080BFF08
_080BFF54:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	bne _080BFF60
	pop {r4}
	mov pc, lr
_080BFF60:
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _080BFF6E
	lsrs r4, r1, #3
	adds r0, r0, r4
_080BFF6E:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _080BFF7C
	lsrs r4, r1, #2
	adds r0, r0, r4
_080BFF7C:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _080BFF8A
	lsrs r4, r1, #1
	adds r0, r0, r4
_080BFF8A:
	pop {r4}
	mov pc, lr
_080BFF8E:
	push {lr}
	bl __div0
	movs r0, #0
	pop {pc}

