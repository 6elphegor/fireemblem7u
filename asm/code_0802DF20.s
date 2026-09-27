	.include "macro.inc"

	.syntax unified

	thumb_func_start InitPlayConfig
InitPlayConfig: @ 0x0802DF20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r7, _0802DFEC @ =0x0202BBF8
	ldr r2, _0802DFF0 @ =0x01000024
	adds r1, r7, #0
	bl CpuSet
	strb r4, [r7, #0xe]
	cmp r5, #0
	beq _0802DF4C
	movs r0, #0x40
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
_0802DF4C:
	movs r3, #0x42
	adds r3, r3, r7
	mov ip, r3
	movs r4, #7
	rsbs r4, r4, #0
	adds r3, r4, #0
	mov r5, ip
	ldrb r5, [r5]
	ands r3, r5
	movs r6, #3
	rsbs r6, r6, #0
	mov r8, r6
	mov r2, r8
	ldr r0, _0802DFF4 @ =0x0202BC38
	ldrb r0, [r0]
	ands r2, r0
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r2, r1
	movs r5, #0x11
	rsbs r5, r5, #0
	ands r2, r5
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r5, #0x7f
	ands r2, r5
	movs r6, #0x41
	adds r6, r6, r7
	mov sl, r6
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
	mov r1, sb
	ldrb r6, [r6]
	ands r1, r6
	mov r0, r8
	ands r1, r0
	movs r6, #0xd
	rsbs r6, r6, #0
	ands r1, r6
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	ands r1, r5
	adds r0, #0x28
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	ldr r0, _0802DFF8 @ =0xFFFFFE7F
	mov r3, ip
	ldrh r3, [r3]
	ands r0, r3
	mov r5, ip
	strh r0, [r5]
	adds r0, r7, #0
	adds r0, #0x43
	ldrb r6, [r0]
	ands r4, r6
	strb r4, [r0]
	mov r0, sb
	ands r2, r0
	ldr r3, _0802DFF4 @ =0x0202BC38
	strb r2, [r3]
	movs r5, #0x11
	rsbs r5, r5, #0
	ands r1, r5
	mov r6, sl
	strb r1, [r6]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DFEC: .4byte 0x0202BBF8
_0802DFF0: .4byte 0x01000024
_0802DFF4: .4byte 0x0202BC38
_0802DFF8: .4byte 0xFFFFFE7F
