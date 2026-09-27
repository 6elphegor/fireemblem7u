	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8BF0
sub_080B8BF0: @ 0x080B8BF0
	movs r3, #0
	str r3, [r0, #0x34]
	ldr r0, _080B8C34 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080B8C38 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	ldr r1, _080B8C3C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_080B8C34: .4byte 0x03002870
_080B8C38: .4byte 0x0000FFE0
_080B8C3C: .4byte 0x0000E0FF
