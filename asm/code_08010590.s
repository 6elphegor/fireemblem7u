	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010590
sub_08010590: @ 0x08010590
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080105FC @ =0x03002870
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
	ldr r0, _08010600 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	ldr r1, _08010604 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08010608 @ =0x08B91EDC
	bl Proc_Find
	movs r1, #1
	bl sub_08010464
	pop {r0}
	bx r0
	.align 2, 0
_080105FC: .4byte 0x03002870
_08010600: .4byte 0x0000FFE0
_08010604: .4byte 0x0000E0FF
_08010608: .4byte 0x08B91EDC
