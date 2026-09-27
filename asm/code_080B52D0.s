	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B52D0
sub_080B52D0: @ 0x080B52D0
	push {lr}
	ldr r0, [r0, #0x2c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080B533A
	bl InitScanlineEffect
	ldr r0, _080B5340 @ =sub_08077860
	bl SetOnHBlankB
	movs r0, #0
	bl sub_08077680
	ldr r0, _080B5344 @ =0x03002870
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
	movs r3, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080B5348 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080B534C @ =0x0000E0FF
	ands r0, r1
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
_080B533A:
	pop {r0}
	bx r0
	.align 2, 0
_080B5340: .4byte sub_08077860
_080B5344: .4byte 0x03002870
_080B5348: .4byte 0x0000FFE0
_080B534C: .4byte 0x0000E0FF
