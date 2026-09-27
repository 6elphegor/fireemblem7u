	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DEA8
sub_0803DEA8: @ 0x0803DEA8
	mov ip, r0
	mov r2, ip
	adds r2, #0x4a
	movs r3, #0
	movs r1, #0
	movs r0, #0xd8
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x48
	strb r3, [r0]
	mov r0, ip
	str r1, [r0, #0x40]
	str r1, [r0, #0x3c]
	adds r0, #0x52
	strb r3, [r0]
	adds r2, #0xa
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x53
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x4c
	strb r3, [r0]
	bx lr
	.align 2, 0
