	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048D64
sub_08048D64: @ 0x08048D64
	push {r4, lr}
	ldr r1, _08048DD4 @ =0x0202BBF8
	ldr r0, _08048DD8 @ =0x0300144C
	ldr r0, [r0]
	movs r2, #0
	strb r0, [r1, #0xf]
	ldr r3, _08048DDC @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r4, [r3, #0x10]
	ands r0, r4
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048DD4: .4byte 0x0202BBF8
_08048DD8: .4byte 0x0300144C
_08048DDC: .4byte 0x03002870
