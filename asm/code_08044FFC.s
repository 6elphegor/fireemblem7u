	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044FFC
sub_08044FFC: @ 0x08044FFC
	push {r4, r5, lr}
	ldr r1, _08045054 @ =0x0202BBF8
	movs r0, #0x42
	adds r0, r0, r1
	mov ip, r0
	movs r3, #7
	rsbs r3, r3, #0
	ldrb r2, [r0]
	ands r3, r2
	adds r5, r1, #0
	adds r5, #0x40
	movs r2, #0x10
	ldrb r0, [r5]
	orrs r2, r0
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x40
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r4, r1, #0
	adds r4, #0x41
	subs r0, #0x81
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0xa
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	movs r0, #1
	orrs r2, r0
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045054: .4byte 0x0202BBF8
