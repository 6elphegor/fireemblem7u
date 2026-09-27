	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A504
sub_0809A504: @ 0x0809A504
	push {r4, lr}
	movs r1, #0
	movs r4, #0xf0
	cmp r0, #0
	ble _0809A510
	adds r1, r0, #0
_0809A510:
	cmp r0, #0
	bge _0809A51A
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r0, r2
_0809A51A:
	cmp r4, #0xf0
	bgt _0809A528
	adds r0, r4, #0
	cmp r0, #0
	bge _0809A52A
	movs r0, #0
	b _0809A52A
_0809A528:
	movs r0, #0xf0
_0809A52A:
	adds r4, r0, #0
	cmp r1, #0xf0
	bgt _0809A538
	cmp r1, #0
	bge _0809A53A
	movs r1, #0
	b _0809A53A
_0809A538:
	movs r1, #0xf0
_0809A53A:
	ldr r2, _0809A55C @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x2d
	movs r0, #0
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x31
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A55C: .4byte 0x03002870
