	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitDrop
UnitDrop: @ 0x08017E08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r1, _08017E54 @ =0x08B92EB0
	ldrb r2, [r5, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x31
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r3, [r2, #0xc]
	movs r0, #0x32
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r2, #0xc]
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	ldr r1, _08017E58 @ =0x0202BBF8
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _08017E44
	movs r0, #2
	orrs r3, r0
	str r3, [r2, #0xc]
_08017E44:
	movs r0, #0
	strb r0, [r5, #0x1b]
	strb r0, [r4, #0x1b]
	strb r6, [r4, #0x10]
	strb r7, [r4, #0x11]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017E54: .4byte 0x08B92EB0
_08017E58: .4byte 0x0202BBF8
