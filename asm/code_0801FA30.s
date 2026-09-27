	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801FA30
sub_0801FA30: @ 0x0801FA30
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, _0801FA7C @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _0801FA80 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #6
	orrs r0, r1
	ldr r1, _0801FA84 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0801FA7C: .4byte 0x03002870
_0801FA80: .4byte 0x0000FFE0
_0801FA84: .4byte 0x0000E0FF
