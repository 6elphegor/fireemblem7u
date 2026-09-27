	.include "macro.inc"

	.syntax unified

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
