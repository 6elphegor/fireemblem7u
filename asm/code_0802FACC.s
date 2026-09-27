	.include "macro.inc"

	.syntax unified

	thumb_func_start CutOffPathLength
CutOffPathLength: @ 0x0802FACC
	push {r4, r5, r6, r7, lr}
	ldr r3, _0802FB68 @ =0x08B96444
	ldr r1, [r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _0802FB60
	subs r0, #1
	strb r0, [r2]
	ldr r2, [r3]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #0x29
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	strb r1, [r0]
	movs r5, #1
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bgt _0802FB60
	adds r7, r3, #0
_0802FB0E:
	bl GetWorkingMoveCosts
	ldr r3, [r7]
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	adds r5, r3, #0
	adds r5, #0x55
	adds r6, r5, r4
	subs r1, r4, #1
	adds r5, r5, r1
	adds r1, r3, #0
	adds r1, #0x41
	adds r1, r1, r4
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldr r1, _0802FB6C @ =0x0202E3E0
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r3, #0x2d
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r1, [r2]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r5, [r5]
	ldrb r0, [r0]
	subs r0, r5, r0
	strb r0, [r6]
	adds r4, #1
	lsls r4, r4, #0x18
	ldr r0, [r7]
	adds r0, #0x2c
	lsrs r5, r4, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	cmp r4, r0
	ble _0802FB0E
_0802FB60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FB68: .4byte 0x08B96444
_0802FB6C: .4byte 0x0202E3E0
