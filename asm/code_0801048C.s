	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801048C
sub_0801048C: @ 0x0801048C
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080104F8 @ =0x03002870
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
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080104FC @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	ldr r1, _08010500 @ =0x0000E0FF
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
	ldr r0, _08010504 @ =0x08B91EDC
	bl Proc_Find
	movs r1, #1
	bl sub_08010464
	pop {r0}
	bx r0
	.align 2, 0
_080104F8: .4byte 0x03002870
_080104FC: .4byte 0x0000FFE0
_08010500: .4byte 0x0000E0FF
_08010504: .4byte 0x08B91EDC
