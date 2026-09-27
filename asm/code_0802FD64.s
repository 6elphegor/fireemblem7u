	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMovementScriptFromPath
GetMovementScriptFromPath: @ 0x0802FD64
	push {r4, r5, r6, r7, lr}
	movs r6, #1
	ldr r2, _0802FDA8 @ =0x08B96444
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r2, #0
	ldr r1, _0802FDAC @ =0x02033E00
	mov ip, r1
	cmp r6, r0
	bgt _0802FDF6
	mov r5, ip
_0802FD80:
	ldr r4, [r2]
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x2d
	adds r1, r0, r3
	subs r2, r3, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0802FDB0
	adds r1, r2, r5
	movs r0, #0
	b _0802FDDC
	.align 2, 0
_0802FDA8: .4byte 0x08B96444
_0802FDAC: .4byte 0x02033E00
_0802FDB0:
	cmp r1, r0
	ble _0802FDBA
	adds r1, r2, r5
	movs r0, #1
	b _0802FDDC
_0802FDBA:
	adds r0, r4, #0
	adds r0, #0x41
	adds r1, r0, r3
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0802FDD8
	adds r1, r2, r5
	movs r0, #3
	b _0802FDDC
_0802FDD8:
	adds r1, r2, r5
	movs r0, #2
_0802FDDC:
	strb r0, [r1]
	lsls r0, r6, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	adds r2, r7, #0
	ldr r1, [r2]
	adds r1, #0x2c
	lsrs r6, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	cmp r0, r1
	ble _0802FD80
_0802FDF6:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	add r0, ip
	movs r1, #4
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
