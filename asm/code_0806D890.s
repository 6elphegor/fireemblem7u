	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806D890
sub_0806D890: @ 0x0806D890
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806D8F8 @ =0x08C9D06C
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x10]
	ldr r0, _0806D8F8 @ =0x08C9D06C
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, #3
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x14]
	ldr r0, _0806D8FC @ =0x030014E0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
	ldr r0, _0806D900 @ =0x030014E4
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #2
	movs r2, #0xf
	adds r3, r2, #0
	lsls r3, r1
	adds r1, r3, #0
	str r1, [r0]
	ldr r0, _0806D8FC @ =0x030014E0
	ldr r1, _0806D8FC @ =0x030014E0
	ldr r2, _0806D900 @ =0x030014E4
	ldr r3, [r2]
	mvns r2, r3
	ldr r1, [r1]
	ands r2, r1
	str r2, [r0]
	movs r0, #0
	str r0, [r7, #8]
_0806D8F0:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806D904
	b _0806D95E
	.align 2, 0
_0806D8F8: .4byte 0x08C9D06C
_0806D8FC: .4byte 0x030014E0
_0806D900: .4byte 0x030014E4
_0806D904:
	movs r0, #0
	str r0, [r7, #0xc]
_0806D908:
	ldr r0, [r7, #0xc]
	cmp r0, #3
	ble _0806D910
	b _0806D94C
_0806D910:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0x18]
	ldr r0, _0806D948 @ =0x030014E0
	ldr r1, [r7, #0x18]
	ldr r0, [r0]
	ands r1, r0
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r7, #0x18]
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806D908
	.align 2, 0
_0806D948: .4byte 0x030014E0
_0806D94C:
	ldr r0, [r7]
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D8F0
_0806D95E:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
