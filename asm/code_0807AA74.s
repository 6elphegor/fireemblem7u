	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807AA74
sub_0807AA74: @ 0x0807AA74
	adds r0, #0x4d
	movs r3, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807AAB8 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807AABC @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #0x1f
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r3, [r2]
	orrs r0, r3
	strb r0, [r2]
	bx lr
	.align 2, 0
_0807AAB8: .4byte 0x03002870
_0807AABC: .4byte 0x0000FFE0
