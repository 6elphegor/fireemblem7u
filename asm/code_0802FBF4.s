	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPointAlongPath
GetPointAlongPath: @ 0x0802FBF4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0
	ldr r0, _0802FC48 @ =0x08B96444
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r1, r3
	bgt _0802FC5A
	mov ip, r2
	lsls r0, r4, #0x18
	asrs r7, r0, #0x18
	mov r6, ip
	adds r6, #0x41
	lsls r0, r5, #0x18
	asrs r5, r0, #0x18
	adds r4, r3, #0
_0802FC20:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	mov r1, ip
	adds r1, #0x2d
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, #0
	cmp r1, r7
	bne _0802FC4C
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _0802FC4C
	adds r0, r2, #0
	b _0802FC5E
	.align 2, 0
_0802FC48: .4byte 0x08B96444
_0802FC4C:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	ble _0802FC20
_0802FC5A:
	movs r0, #1
	rsbs r0, r0, #0
_0802FC5E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
