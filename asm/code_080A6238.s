	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6238
sub_080A6238: @ 0x080A6238
	push {r4, lr}
	mov ip, r0
	mov r2, ip
	adds r2, #0x29
	adds r0, #0x2b
	ldrb r1, [r2]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r2]
	ldr r3, _080A62A8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080A62AC
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r1, #4
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r1, r4, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldrb r2, [r2]
	lsls r1, r2, #1
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x32
	b _080A62E0
	.align 2, 0
_080A62A8: .4byte 0x03002870
_080A62AC:
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r1, #0x78
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #1
	movs r0, #0x50
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x33
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x78
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, #0x50
	adds r1, #4
_080A62E0:
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r4, [r2]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _080A632C
	mov r0, ip
	bl Proc_Break
_080A632C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
