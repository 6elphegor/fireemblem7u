	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8FBC
sub_080B8FBC: @ 0x080B8FBC
	push {r4, lr}
	ldr r1, _080B9014 @ =0x03002870
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r3, [r1]
	mov r2, ip
	adds r2, #0x45
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x46
	strb r3, [r1]
	ldr r1, _080B9018 @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #4
	orrs r1, r2
	ldr r2, _080B901C @ =0x0000E0FF
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r0, #0x4c
	strh r3, [r0]
	bl DrawFinImage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9014: .4byte 0x03002870
_080B9018: .4byte 0x0000FFE0
_080B901C: .4byte 0x0000E0FF
