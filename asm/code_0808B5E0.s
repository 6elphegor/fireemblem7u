	.include "macro.inc"

	.syntax unified

	thumb_func_start SortUnitList
SortUnitList: @ 0x0808B5E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x68
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls _0808B602
	bl _0808D9F0
_0808B602:
	lsls r0, r0, #2
	ldr r1, _0808B60C @ =_0808B610
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B60C: .4byte _0808B610
_0808B610: @ jump table
	.4byte _0808B690 @ case 0
	.4byte _0808B994 @ case 1
	.4byte _0808B888 @ case 2
	.4byte _0808BA98 @ case 3
	.4byte _0808BB94 @ case 4
	.4byte _0808BC9C @ case 5
	.4byte _0808BDA4 @ case 6
	.4byte _0808BEB0 @ case 7
	.4byte _0808BFB8 @ case 8
	.4byte _0808C0C0 @ case 9
	.4byte _0808C1CC @ case 10
	.4byte _0808C2D4 @ case 11
	.4byte _0808C644 @ case 12
	.4byte _0808C74C @ case 13
	.4byte _0808C958 @ case 14
	.4byte _0808CA4C @ case 15
	.4byte _0808CB40 @ case 16
	.4byte _0808CC34 @ case 17
	.4byte _0808C3DC @ case 18
	.4byte _0808C538 @ case 19
	.4byte _0808CD64 @ case 20
	.4byte _0808CE70 @ case 21
	.4byte _0808CFFC @ case 22
	.4byte _0808D100 @ case 23
	.4byte _0808D204 @ case 24
	.4byte _0808D300 @ case 25
	.4byte _0808D3FC @ case 26
	.4byte _0808D4F8 @ case 27
	.4byte _0808D5F4 @ case 28
	.4byte _0808D6F0 @ case 29
	.4byte _0808D7EC @ case 30
	.4byte _0808D8E4 @ case 31
_0808B690:
	cmp r2, #0
	bne _0808B78C
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, _0808B784 @ =0x0200E668
	mov sl, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808B706
	adds r4, r3, #0
	mov sb, r4
	ldr r6, _0808B788 @ =0x0200CBF0
	mov ip, r6
_0808B6AE:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B6F8
	mov r8, ip
_0808B6C0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808B6EA
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
_0808B6EA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808B6C0
_0808B6F8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B6AE
_0808B706:
	movs r1, #0
	ldr r7, _0808B784 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808B77E
	mov sl, r7
_0808B714:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B770
	ldr r4, _0808B788 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808B72E:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bhs _0808B75E
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x40]
_0808B75E:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808B72E
_0808B770:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808B784 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B714
_0808B77E:
	ldr r7, [sp, #0x40]
	bl _0808D95C
	.align 2, 0
_0808B784: .4byte 0x0200E668
_0808B788: .4byte 0x0200CBF0
_0808B78C:
	movs r0, #0
	str r0, [sp, #0x44]
	movs r1, #0
	ldr r2, _0808B880 @ =0x0200E668
	mov sl, r2
	ldrb r0, [r2]
	subs r0, #1
	ldr r3, [sp, #0x44]
	cmp r3, r0
	bge _0808B800
	adds r4, r2, #0
	mov sb, r4
	ldr r6, _0808B884 @ =0x0200CBF0
	mov ip, r6
_0808B7A8:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B7F2
	mov r8, ip
_0808B7BA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808B7E4
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
_0808B7E4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808B7BA
_0808B7F2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B7A8
_0808B800:
	movs r1, #0
	ldr r7, _0808B880 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808B878
	mov sl, r7
_0808B80E:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B86A
	ldr r4, _0808B884 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808B828:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bls _0808B858
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x44]
_0808B858:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808B828
_0808B86A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808B880 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808B80E
_0808B878:
	ldr r7, [sp, #0x44]
	bl _0808D95C
	.align 2, 0
_0808B880: .4byte 0x0200E668
_0808B884: .4byte 0x0200CBF0
_0808B888:
	cmp r2, #0
	bne _0808B910
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808B908 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808B8A2
	bl _0808D9DE
_0808B8A2:
	adds r4, r3, #0
	mov sb, r4
_0808B8A6:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B8F6
	ldr r0, _0808B90C @ =0x0200CBF0
	mov r8, r0
_0808B8BA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _0808B8E8
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808B8E8:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808B8BA
_0808B8F6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808B8A6
	bl _0808D9DE
	.align 2, 0
_0808B908: .4byte 0x0200E668
_0808B90C: .4byte 0x0200CBF0
_0808B910:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808B98C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808B924
	bl _0808D9DE
_0808B924:
	adds r3, r2, #0
	mov sb, r3
_0808B928:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B978
	ldr r6, _0808B990 @ =0x0200CBF0
	mov r8, r6
_0808B93C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0808B96A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808B96A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808B93C
_0808B978:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808B928
	bl _0808D9DE
	.align 2, 0
_0808B98C: .4byte 0x0200E668
_0808B990: .4byte 0x0200CBF0
_0808B994:
	cmp r2, #0
	bne _0808BA18
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BA10 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808B9AC
	bl _0808D9DE
_0808B9AC:
	adds r4, r3, #0
	mov sb, r4
_0808B9B0:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808B9FC
	ldr r0, _0808BA14 @ =0x0200CBF0
	mov r8, r0
_0808B9C4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808B9EE
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808B9EE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808B9C4
_0808B9FC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808B9B0
	bl _0808D9DE
	.align 2, 0
_0808BA10: .4byte 0x0200E668
_0808BA14: .4byte 0x0200CBF0
_0808BA18:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808BA90 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BA2C
	bl _0808D9DE
_0808BA2C:
	adds r3, r2, #0
	mov sb, r3
_0808BA30:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808BA7C
	ldr r6, _0808BA94 @ =0x0200CBF0
	mov r8, r6
_0808BA44:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808BA6E
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808BA6E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808BA44
_0808BA7C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808BA30
	bl _0808D9DE
	.align 2, 0
_0808BA90: .4byte 0x0200E668
_0808BA94: .4byte 0x0200CBF0
_0808BA98:
	cmp r2, #0
	bne _0808BB18
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BB10 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BAB0
	bl _0808D9DE
_0808BAB0:
	adds r4, r3, #0
	mov sb, r4
_0808BAB4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808BAFC
	ldr r0, _0808BB14 @ =0x0200CBF0
	mov r8, r0
_0808BAC8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bls _0808BAEE
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808BAEE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808BAC8
_0808BAFC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808BAB4
	bl _0808D9DE
	.align 2, 0
_0808BB10: .4byte 0x0200E668
_0808BB14: .4byte 0x0200CBF0
_0808BB18:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808BB8C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BB2C
	bl _0808D9DE
_0808BB2C:
	adds r3, r2, #0
	mov sb, r3
_0808BB30:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808BB78
	ldr r6, _0808BB90 @ =0x0200CBF0
	mov r8, r6
_0808BB44:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bhs _0808BB6A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808BB6A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808BB44
_0808BB78:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808BB30
	bl _0808D9DE
	.align 2, 0
_0808BB8C: .4byte 0x0200E668
_0808BB90: .4byte 0x0200CBF0
_0808BB94:
	cmp r2, #0
	bne _0808BC18
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BC10 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BBAA
	bl _0808D8CE
_0808BBAA:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BBFC
	ldr r2, _0808BC14 @ =0x0200CBF0
	mov sb, r2
_0808BBBC:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	ble _0808BBEC
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808BBEC:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BC10 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808BBBC
_0808BBFC:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BC10 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BBAA
	bl _0808D8CE
	.align 2, 0
_0808BC10: .4byte 0x0200E668
_0808BC14: .4byte 0x0200CBF0
_0808BC18:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808BC94 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BC2C
	bl _0808D95A
_0808BC2C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BC7E
	ldr r0, _0808BC98 @ =0x0200CBF0
	mov sb, r0
_0808BC3E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	bge _0808BC6E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808BC6E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BC94 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808BC3E
_0808BC7E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BC94 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BC2C
	bl _0808D95A
	.align 2, 0
_0808BC94: .4byte 0x0200E668
_0808BC98: .4byte 0x0200CBF0
_0808BC9C:
	cmp r2, #0
	bne _0808BD24
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808BD1C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BCB4
	bl _0808D9DE
_0808BCB4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BD06
	ldr r1, _0808BD20 @ =0x0200CBF0
	mov sb, r1
_0808BCC6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	ble _0808BCF6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808BCF6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BD1C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808BCC6
_0808BD06:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BD1C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BCB4
	bl _0808D9DE
	.align 2, 0
_0808BD1C: .4byte 0x0200E668
_0808BD20: .4byte 0x0200CBF0
_0808BD24:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808BD9C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BD36
	bl _0808D8CE
_0808BD36:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BD88
	ldr r2, _0808BDA0 @ =0x0200CBF0
	mov sb, r2
_0808BD48:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	bge _0808BD78
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808BD78:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BD9C @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808BD48
_0808BD88:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BD9C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BD36
	bl _0808D8CE
	.align 2, 0
_0808BD9C: .4byte 0x0200E668
_0808BDA0: .4byte 0x0200CBF0
_0808BDA4:
	cmp r2, #0
	bne _0808BE2C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808BE24 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BDBC
	bl _0808D95A
_0808BDBC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BE0E
	ldr r0, _0808BE28 @ =0x0200CBF0
	mov sb, r0
_0808BDCE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	ble _0808BDFE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808BDFE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BE24 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808BDCE
_0808BE0E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BE24 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BDBC
	bl _0808D95A
	.align 2, 0
_0808BE24: .4byte 0x0200E668
_0808BE28: .4byte 0x0200CBF0
_0808BE2C:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808BEA8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BE40
	bl _0808D9DE
_0808BE40:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BE92
	ldr r1, _0808BEAC @ =0x0200CBF0
	mov sb, r1
_0808BE52:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	bge _0808BE82
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808BE82:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BEA8 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808BE52
_0808BE92:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BEA8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BE40
	bl _0808D9DE
	.align 2, 0
_0808BEA8: .4byte 0x0200E668
_0808BEAC: .4byte 0x0200CBF0
_0808BEB0:
	cmp r2, #0
	bne _0808BF34
	movs r1, #0
	mov sl, r1
	ldr r3, _0808BF2C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BEC6
	bl _0808D8CE
_0808BEC6:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BF18
	ldr r2, _0808BF30 @ =0x0200CBF0
	mov sb, r2
_0808BED8:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	ble _0808BF08
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808BF08:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BF2C @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808BED8
_0808BF18:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808BF2C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BEC6
	bl _0808D8CE
	.align 2, 0
_0808BF2C: .4byte 0x0200E668
_0808BF30: .4byte 0x0200CBF0
_0808BF34:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808BFB0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808BF48
	bl _0808D95A
_0808BF48:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808BF9A
	ldr r0, _0808BFB4 @ =0x0200CBF0
	mov sb, r0
_0808BF5A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	bge _0808BF8A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808BF8A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808BFB0 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808BF5A
_0808BF9A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808BFB0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808BF48
	bl _0808D95A
	.align 2, 0
_0808BFB0: .4byte 0x0200E668
_0808BFB4: .4byte 0x0200CBF0
_0808BFB8:
	cmp r2, #0
	bne _0808C040
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C038 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808BFD0
	bl _0808D9DE
_0808BFD0:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C022
	ldr r1, _0808C03C @ =0x0200CBF0
	mov sb, r1
_0808BFE2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	ble _0808C012
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C012:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C038 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808BFE2
_0808C022:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C038 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808BFD0
	bl _0808D9DE
	.align 2, 0
_0808C038: .4byte 0x0200E668
_0808C03C: .4byte 0x0200CBF0
_0808C040:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C0B8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C052
	bl _0808D8CE
_0808C052:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C0A4
	ldr r2, _0808C0BC @ =0x0200CBF0
	mov sb, r2
_0808C064:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	bge _0808C094
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C094:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C0B8 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C064
_0808C0A4:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C0B8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C052
	bl _0808D8CE
	.align 2, 0
_0808C0B8: .4byte 0x0200E668
_0808C0BC: .4byte 0x0200CBF0
_0808C0C0:
	cmp r2, #0
	bne _0808C148
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808C140 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C0D8
	bl _0808D95A
_0808C0D8:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C12A
	ldr r0, _0808C144 @ =0x0200CBF0
	mov sb, r0
_0808C0EA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	ble _0808C11A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C11A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C140 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C0EA
_0808C12A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C140 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C0D8
	bl _0808D95A
	.align 2, 0
_0808C140: .4byte 0x0200E668
_0808C144: .4byte 0x0200CBF0
_0808C148:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808C1C4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C15C
	bl _0808D9DE
_0808C15C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C1AE
	ldr r1, _0808C1C8 @ =0x0200CBF0
	mov sb, r1
_0808C16E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	bge _0808C19E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C19E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C1C4 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C16E
_0808C1AE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C1C4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C15C
	bl _0808D9DE
	.align 2, 0
_0808C1C4: .4byte 0x0200E668
_0808C1C8: .4byte 0x0200CBF0
_0808C1CC:
	cmp r2, #0
	bne _0808C250
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C248 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C1E2
	bl _0808D8CE
_0808C1E2:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C234
	ldr r2, _0808C24C @ =0x0200CBF0
	mov sb, r2
_0808C1F4:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	ble _0808C224
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C224:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C248 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C1F4
_0808C234:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C248 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C1E2
	bl _0808D8CE
	.align 2, 0
_0808C248: .4byte 0x0200E668
_0808C24C: .4byte 0x0200CBF0
_0808C250:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C2CC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C264
	bl _0808D95A
_0808C264:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C2B6
	ldr r0, _0808C2D0 @ =0x0200CBF0
	mov sb, r0
_0808C276:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	bge _0808C2A6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C2A6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C2CC @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C276
_0808C2B6:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C2CC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C264
	bl _0808D95A
	.align 2, 0
_0808C2CC: .4byte 0x0200E668
_0808C2D0: .4byte 0x0200CBF0
_0808C2D4:
	cmp r2, #0
	bne _0808C35C
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C354 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C2EC
	bl _0808D9DE
_0808C2EC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C33E
	ldr r1, _0808C358 @ =0x0200CBF0
	mov sb, r1
_0808C2FE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	ble _0808C32E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C32E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C354 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C2FE
_0808C33E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C354 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C2EC
	bl _0808D9DE
	.align 2, 0
_0808C354: .4byte 0x0200E668
_0808C358: .4byte 0x0200CBF0
_0808C35C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C3D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C36E
	bl _0808D8CE
_0808C36E:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C3C0
	ldr r2, _0808C3D8 @ =0x0200CBF0
	mov sb, r2
_0808C380:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	bge _0808C3B0
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C3B0:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C3D4 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C380
_0808C3C0:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C3D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C36E
	bl _0808D8CE
	.align 2, 0
_0808C3D4: .4byte 0x0200E668
_0808C3D8: .4byte 0x0200CBF0
_0808C3DC:
	cmp r2, #0
	bne _0808C48C
	movs r7, #0
	str r7, [sp, #0x48]
	movs r1, #0
	ldr r3, _0808C484 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808C47C
	adds r4, r3, #0
	mov sl, r4
_0808C3F4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808C46C
	ldr r7, _0808C488 @ =0x0200CBF0
	mov ip, r7
_0808C408:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble _0808C45A
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
_0808C45A:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C408
_0808C46C:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C484 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C3F4
_0808C47C:
	ldr r3, [sp, #0x48]
	bl _0808CD4E
	.align 2, 0
_0808C484: .4byte 0x0200E668
_0808C488: .4byte 0x0200CBF0
_0808C48C:
	movs r4, #0
	str r4, [sp, #0x4c]
	movs r1, #0
	ldr r6, _0808C530 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r4, r0
	bge _0808C528
	adds r7, r6, #0
	mov sl, r7
_0808C4A0:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	mov sb, r0
	cmp r2, r1
	bge _0808C518
	ldr r4, _0808C534 @ =0x0200CBF0
	mov ip, r4
_0808C4B4:
	adds r6, r2, #1
	mov r8, r6
	lsls r0, r6, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge _0808C506
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x4c]
_0808C506:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C4B4
_0808C518:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C530 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C4A0
_0808C528:
	ldr r3, [sp, #0x4c]
	bl _0808CD4E
	.align 2, 0
_0808C530: .4byte 0x0200E668
_0808C534: .4byte 0x0200CBF0
_0808C538:
	cmp r2, #0
	bne _0808C5C0
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r3, _0808C5B8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C550
	bl _0808D95A
_0808C550:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C5A2
	ldr r6, _0808C5BC @ =0x0200CBF0
	mov sb, r6
_0808C562:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble _0808C592
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C592:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C5B8 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C562
_0808C5A2:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C5B8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C550
	bl _0808D95A
	.align 2, 0
_0808C5B8: .4byte 0x0200E668
_0808C5BC: .4byte 0x0200CBF0
_0808C5C0:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808C63C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C5D4
	bl _0808D9DE
_0808C5D4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C626
	ldr r1, _0808C640 @ =0x0200CBF0
	mov sb, r1
_0808C5E6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge _0808C616
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C616:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C63C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C5E6
_0808C626:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C63C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C5D4
	bl _0808D9DE
	.align 2, 0
_0808C63C: .4byte 0x0200E668
_0808C640: .4byte 0x0200CBF0
_0808C644:
	cmp r2, #0
	bne _0808C6C8
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C6C0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C65A
	bl _0808D8CE
_0808C65A:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C6AC
	ldr r2, _0808C6C4 @ =0x0200CBF0
	mov sb, r2
_0808C66C:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge _0808C69C
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C69C:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C6C0 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C66C
_0808C6AC:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C6C0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C65A
	bl _0808D8CE
	.align 2, 0
_0808C6C0: .4byte 0x0200E668
_0808C6C4: .4byte 0x0200CBF0
_0808C6C8:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C744 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C6DC
	bl _0808D95A
_0808C6DC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C72E
	ldr r0, _0808C748 @ =0x0200CBF0
	mov sb, r0
_0808C6EE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble _0808C71E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C71E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C744 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C6EE
_0808C72E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C744 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C6DC
	bl _0808D95A
	.align 2, 0
_0808C744: .4byte 0x0200E668
_0808C748: .4byte 0x0200CBF0
_0808C74C:
	cmp r2, #0
	beq _0808C752
	b _0808C854
_0808C752:
	movs r0, #0
	str r0, [sp, #0x50]
	movs r4, #0
	ldr r0, _0808C790 @ =0x0200E668
	ldrb r0, [r0]
	cmp r2, r0
	bhs _0808C78A
	ldr r5, _0808C794 @ =0x0200CBF0
_0808C762:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808C790 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808C762
_0808C78A:
	movs r4, #0
	b _0808C842
	.align 2, 0
_0808C790: .4byte 0x0200E668
_0808C794: .4byte 0x0200CBF0
_0808C798:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x58]
	cmp r6, r1
	bge _0808C83C
	ldr r3, _0808C7E4 @ =0x0200CBF0
	mov sl, r3
_0808C7AA:
	adds r0, r6, #1
	mov r4, sp
	adds r4, r4, r0
	mov r8, r4
	mov r7, sp
	adds r5, r7, r6
	ldrb r4, [r4]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bls _0808C7E8
	adds r1, r2, #0
	strb r4, [r5]
	mov r0, r8
	strb r1, [r0]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	mov r4, sb
	lsls r1, r4, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r6, #1
	str r6, [sp, #0x50]
	b _0808C82A
	.align 2, 0
_0808C7E4: .4byte 0x0200CBF0
_0808C7E8:
	cmp r3, r2
	bne _0808C82A
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls _0808C82A
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r4, #1
	str r4, [sp, #0x50]
_0808C82A:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808C850 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x58]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808C7AA
_0808C83C:
	ldr r1, [sp, #0x58]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808C842:
	ldr r1, _0808C850 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808C798
	ldr r2, [sp, #0x50]
	b _0808C946
	.align 2, 0
_0808C850: .4byte 0x0200E668
_0808C854:
	movs r3, #0
	str r3, [sp, #0x54]
	movs r4, #0
	ldr r0, _0808C890 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0808C88C
	ldr r5, _0808C894 @ =0x0200CBF0
_0808C864:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r6, sp
	adds r1, r6, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808C890 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808C864
_0808C88C:
	movs r4, #0
	b _0808C93A
	.align 2, 0
_0808C890: .4byte 0x0200E668
_0808C894: .4byte 0x0200CBF0
_0808C898:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x5c]
	cmp r6, r1
	bge _0808C934
	ldr r7, _0808C8DC @ =0x0200CBF0
	mov sl, r7
_0808C8AA:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bhs _0808C8E0
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	b _0808C91E
	.align 2, 0
_0808C8DC: .4byte 0x0200CBF0
_0808C8E0:
	cmp r3, r2
	bne _0808C922
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhs _0808C922
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
_0808C91E:
	movs r4, #1
	str r4, [sp, #0x54]
_0808C922:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808C954 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x5c]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808C8AA
_0808C934:
	ldr r1, [sp, #0x5c]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808C93A:
	ldr r1, _0808C954 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808C898
	ldr r2, [sp, #0x54]
_0808C946:
	cmp r2, #0
	bne _0808C94E
	bl _0808D9F0
_0808C94E:
	movs r0, #1
	bl _0808D9F2
	.align 2, 0
_0808C954: .4byte 0x0200E668
_0808C958:
	cmp r2, #0
	bne _0808C9D4
	movs r3, #0
	mov ip, r3
	movs r1, #0
	ldr r4, _0808C9CC @ =0x0200E668
	ldrb r0, [r4]
	subs r0, #1
	cmp r2, r0
	bge _0808C9C6
	adds r6, r4, #0
	mov sl, r6
_0808C970:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sl
	ldrb r7, [r7]
	subs r1, r7, r0
	mov sb, r0
	cmp r2, r1
	bge _0808C9B6
	mov r8, sb
_0808C982:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _0808C9D0 @ =0x0200CBF0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808C9A6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808C9A6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808C982
_0808C9B6:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808C9CC @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C970
_0808C9C6:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808C9CC: .4byte 0x0200E668
_0808C9D0: .4byte 0x0200CBF0
_0808C9D4:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808CA44 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808CA3E
	adds r3, r2, #0
	mov sl, r3
_0808C9E8:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CA2E
	mov r8, sb
_0808C9FA:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CA48 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808CA1E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CA1E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808C9FA
_0808CA2E:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CA44 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C9E8
_0808CA3E:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CA44: .4byte 0x0200E668
_0808CA48: .4byte 0x0200CBF0
_0808CA4C:
	cmp r2, #0
	bne _0808CAC8
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808CAC0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808CABA
	adds r4, r3, #0
	mov sl, r4
_0808CA64:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CAAA
	mov r8, sb
_0808CA76:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CAC4 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808CA9A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CA9A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CA76
_0808CAAA:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CAC0 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CA64
_0808CABA:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CAC0: .4byte 0x0200E668
_0808CAC4: .4byte 0x0200CBF0
_0808CAC8:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808CB38 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808CB32
	adds r3, r2, #0
	mov sl, r3
_0808CADC:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CB22
	mov r8, sb
_0808CAEE:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CB3C @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808CB12
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CB12:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CAEE
_0808CB22:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CB38 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CADC
_0808CB32:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CB38: .4byte 0x0200E668
_0808CB3C: .4byte 0x0200CBF0
_0808CB40:
	cmp r2, #0
	bne _0808CBBC
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808CBB4 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808CBAE
	adds r4, r3, #0
	mov sl, r4
_0808CB58:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CB9E
	mov r8, sb
_0808CB6A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CBB8 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808CB8E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CB8E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CB6A
_0808CB9E:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CBB4 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CB58
_0808CBAE:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CBB4: .4byte 0x0200E668
_0808CBB8: .4byte 0x0200CBF0
_0808CBBC:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808CC2C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808CC26
	adds r3, r2, #0
	mov sl, r3
_0808CBD0:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CC16
	mov r8, sb
_0808CBE2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808CC30 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808CC06
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808CC06:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808CBE2
_0808CC16:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808CC2C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808CBD0
_0808CC26:
	mov r7, ip
	bl _0808D95C
	.align 2, 0
_0808CC2C: .4byte 0x0200E668
_0808CC30: .4byte 0x0200CBF0
_0808CC34:
	cmp r2, #0
	bne _0808CCC8
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808CCC0 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CC4A
	b _0808CD4C
_0808CC4A:
	adds r4, r3, #0
	mov sl, r4
_0808CC4E:
	movs r3, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r3, r1
	bge _0808CCAE
	ldr r7, _0808CCC4 @ =0x0200CBF0
	mov sb, r7
_0808CC62:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble _0808CC9E
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808CC9E:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808CC62
_0808CCAE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CCC0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CC4E
	b _0808CD4C
	.align 2, 0
_0808CCC0: .4byte 0x0200E668
_0808CCC4: .4byte 0x0200CBF0
_0808CCC8:
	movs r4, #0
	mov ip, r4
	movs r1, #0
	ldr r6, _0808CD5C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp ip, r0
	bge _0808CD4C
	adds r7, r6, #0
	mov sl, r7
_0808CCDC:
	movs r3, #0
	adds r0, r1, #1
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r3, r1
	bge _0808CD3C
	ldr r4, _0808CD60 @ =0x0200CBF0
	mov sb, r4
_0808CCF0:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _0808CD2C
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808CD2C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808CCF0
_0808CD3C:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CD5C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CCDC
_0808CD4C:
	mov r3, ip
_0808CD4E:
	cmp r3, #0
	bne _0808CD56
	bl _0808D9F0
_0808CD56:
	movs r0, #1
	bl _0808D9F2
	.align 2, 0
_0808CD5C: .4byte 0x0200E668
_0808CD60: .4byte 0x0200CBF0
_0808CD64:
	cmp r2, #0
	bne _0808CDEC
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r6, _0808CDE4 @ =0x0200E668
	mov ip, r6
	ldrb r0, [r6]
	subs r0, #1
	cmp r2, r0
	blt _0808CD7E
	bl _0808D9DE
_0808CD7E:
	adds r7, r6, #0
	mov sb, r7
_0808CD82:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808CDD2
	ldr r4, _0808CDE8 @ =0x0200CBF0
	mov r8, r4
_0808CD96:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls _0808CDC4
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808CDC4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CD96
_0808CDD2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808CD82
	bl _0808D9DE
	.align 2, 0
_0808CDE4: .4byte 0x0200E668
_0808CDE8: .4byte 0x0200CBF0
_0808CDEC:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808CE68 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CE00
	bl _0808D9DE
_0808CE00:
	adds r3, r2, #0
	mov sb, r3
_0808CE04:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808CE54
	ldr r6, _0808CE6C @ =0x0200CBF0
	mov r8, r6
_0808CE18:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bhs _0808CE46
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808CE46:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CE18
_0808CE54:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808CE04
	bl _0808D9DE
	.align 2, 0
_0808CE68: .4byte 0x0200E668
_0808CE6C: .4byte 0x0200CBF0
_0808CE70:
	cmp r2, #0
	bne _0808CF38
	movs r1, #0
	mov sb, r1
	movs r3, #0
	ldr r0, _0808CEA4 @ =0x0200E668
	ldrb r1, [r0]
	cmp r2, r1
	bhs _0808CEBC
	ldr r6, _0808CEA8 @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808CE8A:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808CEAC
	mov r7, sp
	adds r0, r7, r3
	strb r4, [r0]
	b _0808CEB2
	.align 2, 0
_0808CEA4: .4byte 0x0200E668
_0808CEA8: .4byte 0x0200CBF0
_0808CEAC:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808CEB2:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808CE8A
_0808CEBC:
	movs r3, #0
	ldr r1, _0808CF30 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808CF28
	mov r8, r1
	ldr r2, _0808CF34 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808CED0:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808CF1A
	mov r7, ip
_0808CEE2:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls _0808CF0C
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808CF0C:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808CEE2
_0808CF1A:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808CED0
_0808CF28:
	mov r6, sb
	bl _0808D8D0
	.align 2, 0
_0808CF30: .4byte 0x0200E668
_0808CF34: .4byte 0x0200CBF0
_0808CF38:
	movs r7, #0
	mov sb, r7
	movs r3, #0
	ldr r0, _0808CF68 @ =0x0200E668
	ldrb r1, [r0]
	cmp sb, r1
	bhs _0808CF80
	ldr r6, _0808CF6C @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808CF4E:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808CF70
	mov r1, sp
	adds r0, r1, r3
	strb r4, [r0]
	b _0808CF76
	.align 2, 0
_0808CF68: .4byte 0x0200E668
_0808CF6C: .4byte 0x0200CBF0
_0808CF70:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808CF76:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808CF4E
_0808CF80:
	movs r3, #0
	ldr r1, _0808CFF4 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808CFEC
	mov r8, r1
	ldr r2, _0808CFF8 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808CF94:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808CFDE
	mov r7, ip
_0808CFA6:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bhs _0808CFD0
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808CFD0:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808CFA6
_0808CFDE:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808CF94
_0808CFEC:
	mov r6, sb
	bl _0808D8D0
	.align 2, 0
_0808CFF4: .4byte 0x0200E668
_0808CFF8: .4byte 0x0200CBF0
_0808CFFC:
	cmp r2, #0
	bne _0808D080
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808D078 @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _0808D016
	bl _0808D9DE
_0808D016:
	ldr r2, _0808D078 @ =0x0200E668
	mov sb, r2
_0808D01A:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D066
	ldr r4, _0808D07C @ =0x0200CBF0
	mov r8, r4
_0808D02E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D058
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D058:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D02E
_0808D066:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D01A
	bl _0808D9DE
	.align 2, 0
_0808D078: .4byte 0x0200E668
_0808D07C: .4byte 0x0200CBF0
_0808D080:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D0F8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D094
	bl _0808D9DE
_0808D094:
	adds r3, r2, #0
	mov sb, r3
_0808D098:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D0E4
	ldr r6, _0808D0FC @ =0x0200CBF0
	mov r8, r6
_0808D0AC:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D0D6
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D0D6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D0AC
_0808D0E4:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D098
	bl _0808D9DE
	.align 2, 0
_0808D0F8: .4byte 0x0200E668
_0808D0FC: .4byte 0x0200CBF0
_0808D100:
	cmp r2, #0
	bne _0808D184
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D17C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D118
	bl _0808D9DE
_0808D118:
	adds r4, r3, #0
	mov sb, r4
_0808D11C:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D168
	ldr r0, _0808D180 @ =0x0200CBF0
	mov r8, r0
_0808D130:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D15A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D15A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D130
_0808D168:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D11C
	bl _0808D9DE
	.align 2, 0
_0808D17C: .4byte 0x0200E668
_0808D180: .4byte 0x0200CBF0
_0808D184:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D1FC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D198
	bl _0808D9DE
_0808D198:
	adds r3, r2, #0
	mov sb, r3
_0808D19C:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D1E8
	ldr r6, _0808D200 @ =0x0200CBF0
	mov r8, r6
_0808D1B0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D1DA
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D1DA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D1B0
_0808D1E8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D19C
	bl _0808D9DE
	.align 2, 0
_0808D1FC: .4byte 0x0200E668
_0808D200: .4byte 0x0200CBF0
_0808D204:
	cmp r2, #0
	bne _0808D284
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D27C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D21A
	b _0808D9DE
_0808D21A:
	adds r4, r3, #0
	mov sb, r4
_0808D21E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D26A
	ldr r0, _0808D280 @ =0x0200CBF0
	mov r8, r0
_0808D232:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D25C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D25C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D232
_0808D26A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D21E
	b _0808D9DE
	.align 2, 0
_0808D27C: .4byte 0x0200E668
_0808D280: .4byte 0x0200CBF0
_0808D284:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D2F8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D296
	b _0808D9DE
_0808D296:
	adds r3, r2, #0
	mov sb, r3
_0808D29A:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D2E6
	ldr r6, _0808D2FC @ =0x0200CBF0
	mov r8, r6
_0808D2AE:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D2D8
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D2D8:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D2AE
_0808D2E6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D29A
	b _0808D9DE
	.align 2, 0
_0808D2F8: .4byte 0x0200E668
_0808D2FC: .4byte 0x0200CBF0
_0808D300:
	cmp r2, #0
	bne _0808D380
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D378 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D316
	b _0808D9DE
_0808D316:
	adds r4, r3, #0
	mov sb, r4
_0808D31A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D366
	ldr r0, _0808D37C @ =0x0200CBF0
	mov r8, r0
_0808D32E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D358
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D358:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D32E
_0808D366:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D31A
	b _0808D9DE
	.align 2, 0
_0808D378: .4byte 0x0200E668
_0808D37C: .4byte 0x0200CBF0
_0808D380:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D3F4 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D392
	b _0808D9DE
_0808D392:
	adds r3, r2, #0
	mov sb, r3
_0808D396:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D3E2
	ldr r6, _0808D3F8 @ =0x0200CBF0
	mov r8, r6
_0808D3AA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D3D4
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D3D4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D3AA
_0808D3E2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D396
	b _0808D9DE
	.align 2, 0
_0808D3F4: .4byte 0x0200E668
_0808D3F8: .4byte 0x0200CBF0
_0808D3FC:
	cmp r2, #0
	bne _0808D47C
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D474 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D412
	b _0808D9DE
_0808D412:
	adds r4, r3, #0
	mov sb, r4
_0808D416:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D462
	ldr r0, _0808D478 @ =0x0200CBF0
	mov r8, r0
_0808D42A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D454
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D454:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D42A
_0808D462:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D416
	b _0808D9DE
	.align 2, 0
_0808D474: .4byte 0x0200E668
_0808D478: .4byte 0x0200CBF0
_0808D47C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D4F0 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D48E
	b _0808D9DE
_0808D48E:
	adds r3, r2, #0
	mov sb, r3
_0808D492:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D4DE
	ldr r6, _0808D4F4 @ =0x0200CBF0
	mov r8, r6
_0808D4A6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D4D0
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D4D0:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D4A6
_0808D4DE:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D492
	b _0808D9DE
	.align 2, 0
_0808D4F0: .4byte 0x0200E668
_0808D4F4: .4byte 0x0200CBF0
_0808D4F8:
	cmp r2, #0
	bne _0808D578
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D570 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D50E
	b _0808D9DE
_0808D50E:
	adds r4, r3, #0
	mov sb, r4
_0808D512:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D55E
	ldr r0, _0808D574 @ =0x0200CBF0
	mov r8, r0
_0808D526:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D550
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D550:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D526
_0808D55E:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D512
	b _0808D9DE
	.align 2, 0
_0808D570: .4byte 0x0200E668
_0808D574: .4byte 0x0200CBF0
_0808D578:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D5EC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D58A
	b _0808D9DE
_0808D58A:
	adds r3, r2, #0
	mov sb, r3
_0808D58E:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D5DA
	ldr r6, _0808D5F0 @ =0x0200CBF0
	mov r8, r6
_0808D5A2:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D5CC
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D5CC:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D5A2
_0808D5DA:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D58E
	b _0808D9DE
	.align 2, 0
_0808D5EC: .4byte 0x0200E668
_0808D5F0: .4byte 0x0200CBF0
_0808D5F4:
	cmp r2, #0
	bne _0808D674
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D66C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D60A
	b _0808D9DE
_0808D60A:
	adds r4, r3, #0
	mov sb, r4
_0808D60E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D65A
	ldr r0, _0808D670 @ =0x0200CBF0
	mov r8, r0
_0808D622:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D64C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D64C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D622
_0808D65A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D60E
	b _0808D9DE
	.align 2, 0
_0808D66C: .4byte 0x0200E668
_0808D670: .4byte 0x0200CBF0
_0808D674:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D6E8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D686
	b _0808D9DE
_0808D686:
	adds r3, r2, #0
	mov sb, r3
_0808D68A:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D6D6
	ldr r6, _0808D6EC @ =0x0200CBF0
	mov r8, r6
_0808D69E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D6C8
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D6C8:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D69E
_0808D6D6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D68A
	b _0808D9DE
	.align 2, 0
_0808D6E8: .4byte 0x0200E668
_0808D6EC: .4byte 0x0200CBF0
_0808D6F0:
	cmp r2, #0
	bne _0808D770
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D768 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D706
	b _0808D9DE
_0808D706:
	adds r4, r3, #0
	mov sb, r4
_0808D70A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D756
	ldr r0, _0808D76C @ =0x0200CBF0
	mov r8, r0
_0808D71E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D748
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D748:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D71E
_0808D756:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D70A
	b _0808D9DE
	.align 2, 0
_0808D768: .4byte 0x0200E668
_0808D76C: .4byte 0x0200CBF0
_0808D770:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D7E4 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D782
	b _0808D9DE
_0808D782:
	adds r3, r2, #0
	mov sb, r3
_0808D786:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D7D2
	ldr r6, _0808D7E8 @ =0x0200CBF0
	mov r8, r6
_0808D79A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808D7C4
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D7C4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D79A
_0808D7D2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D786
	b _0808D9DE
	.align 2, 0
_0808D7E4: .4byte 0x0200E668
_0808D7E8: .4byte 0x0200CBF0
_0808D7EC:
	cmp r2, #0
	bne _0808D864
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D85C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808D8CE
	adds r4, r3, #0
	mov sb, r4
_0808D804:
	movs r4, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r4, r1
	bge _0808D848
	ldr r6, _0808D860 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808D81A:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bls _0808D838
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808D838:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808D81A
_0808D848:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808D804
	b _0808D8CE
	.align 2, 0
_0808D85C: .4byte 0x0200E668
_0808D860: .4byte 0x0200CBF0
_0808D864:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808D8DC @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge _0808D8CE
	ldr r2, _0808D8DC @ =0x0200E668
	mov sb, r2
_0808D87A:
	movs r4, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r4, r1
	bge _0808D8BE
	ldr r6, _0808D8E0 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808D890:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bhs _0808D8AE
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808D8AE:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808D890
_0808D8BE:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808D87A
_0808D8CE:
	mov r6, sl
_0808D8D0:
	cmp r6, #0
	bne _0808D8D6
	b _0808D9F0
_0808D8D6:
	movs r0, #1
	b _0808D9F2
	.align 2, 0
_0808D8DC: .4byte 0x0200E668
_0808D8E0: .4byte 0x0200CBF0
_0808D8E4:
	cmp r2, #0
	bne _0808D96C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808D964 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _0808D95A
_0808D8F8:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808D94A
	ldr r0, _0808D968 @ =0x0200CBF0
	mov sb, r0
_0808D90A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	ble _0808D93A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808D93A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D964 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808D90A
_0808D94A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D964 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D8F8
_0808D95A:
	mov r7, sl
_0808D95C:
	cmp r7, #0
	beq _0808D9F0
	movs r0, #1
	b _0808D9F2
	.align 2, 0
_0808D964: .4byte 0x0200E668
_0808D968: .4byte 0x0200CBF0
_0808D96C:
	movs r0, #0
	mov sl, r0
	movs r2, #0
	ldr r1, _0808D9E8 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp sl, r0
	bge _0808D9DE
_0808D97C:
	movs r5, #0
	adds r0, r2, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	mov r8, r0
	cmp r5, r1
	bge _0808D9CE
	ldr r1, _0808D9EC @ =0x0200CBF0
	mov sb, r1
_0808D98E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	bge _0808D9BE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808D9BE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D9E8 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808D98E
_0808D9CE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0808D9E8 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r2, r0
	blt _0808D97C
_0808D9DE:
	mov r0, sl
	cmp r0, #0
	beq _0808D9F0
	movs r0, #1
	b _0808D9F2
	.align 2, 0
_0808D9E8: .4byte 0x0200E668
_0808D9EC: .4byte 0x0200CBF0
_0808D9F0:
	movs r0, #0
_0808D9F2:
	add sp, #0x68
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
