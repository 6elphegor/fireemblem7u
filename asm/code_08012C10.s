	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012C10
sub_08012C10: @ 0x08012C10
	push {r4, r5, lr}
	ldr r1, _08012C5C @ =0x0202BBF8
	adds r2, r1, #0
	adds r2, #0x42
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r5, r1, #0
	adds r5, #0x40
	movs r2, #0x61
	rsbs r2, r2, #0
	ldrb r0, [r5]
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r3, r1, #0
	adds r3, #0x41
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ands r2, r4
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012C5C: .4byte 0x0202BBF8
