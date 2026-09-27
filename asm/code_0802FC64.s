	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPathFromMovementScript
GetPathFromMovementScript: @ 0x0802FC64
	push {r4, lr}
	movs r4, #0
_0802FC68:
	ldr r2, _0802FC90 @ =0x02033E00
	adds r1, r4, #0
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xa
	bhi _0802FC68
	lsls r0, r0, #2
	ldr r1, _0802FC94 @ =_0802FC98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802FC90: .4byte 0x02033E00
_0802FC94: .4byte _0802FC98
_0802FC98: @ jump table
	.4byte _0802FD5C @ case 0
	.4byte _0802FCC4 @ case 1
	.4byte _0802FCE0 @ case 2
	.4byte _0802FD30 @ case 3
	.4byte _0802FD0C @ case 4
	.4byte _0802FD5C @ case 5
	.4byte _0802FC68 @ case 6
	.4byte _0802FC68 @ case 7
	.4byte _0802FC68 @ case 8
	.4byte _0802FC68 @ case 9
	.4byte _0802FC68 @ case 10
_0802FCC4:
	ldr r0, _0802FCDC @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	b _0802FCF4
	.align 2, 0
_0802FCDC: .4byte 0x08B96444
_0802FCE0:
	ldr r0, _0802FD08 @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #1
_0802FCF4:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	b _0802FC68
	.align 2, 0
_0802FD08: .4byte 0x08B96444
_0802FD0C:
	ldr r0, _0802FD2C @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r1, #1
	b _0802FD4E
	.align 2, 0
_0802FD2C: .4byte 0x08B96444
_0802FD30:
	ldr r0, _0802FD58 @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #1
_0802FD4E:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	b _0802FC68
	.align 2, 0
_0802FD58: .4byte 0x08B96444
_0802FD5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
