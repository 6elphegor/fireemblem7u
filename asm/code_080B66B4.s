	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B66B4
sub_080B66B4: @ 0x080B66B4
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r0, _080B672C @ =0x0202BBF8
	ldrh r5, [r0, #0x10]
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	movs r0, #0x98
	muls r1, r0, r1
	ldr r0, _080B6730 @ =0x08C9A200
	adds r4, r1, r0
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x39
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x35
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #4]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x31
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #8]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x2d
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B6714:
	ldr r0, [r1]
	cmp r5, r0
	bgt _080B6722
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B6714
_080B6722:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B672C: .4byte 0x0202BBF8
_080B6730: .4byte 0x08C9A200
