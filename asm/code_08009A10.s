	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08009A10
sub_08009A10: @ 0x08009A10
	push {r4, r5, r6, lr}
	ldr r4, _08009A8C @ =0x03002870
	mov ip, r4
	movs r4, #0x20
	mov r5, ip
	ldrb r5, [r5, #1]
	orrs r4, r5
	movs r5, #0x41
	rsbs r5, r5, #0
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	mov r6, ip
	strb r4, [r6, #1]
	adds r4, r0, #1
	lsls r4, r4, #3
	mov r5, ip
	adds r5, #0x2d
	strb r4, [r5]
	adds r4, r1, #1
	lsls r4, r4, #3
	adds r5, #4
	strb r4, [r5]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #3
	mov r2, ip
	adds r2, #0x2c
	strb r0, [r2]
	adds r1, r1, r3
	subs r1, #1
	lsls r1, r1, #3
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x34
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009A8C: .4byte 0x03002870
