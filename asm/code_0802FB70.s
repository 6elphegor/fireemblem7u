	.include "macro.inc"

	.syntax unified

	thumb_func_start AddPointToPathArrowProc
AddPointToPathArrowProc: @ 0x0802FB70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _0802FBEC @ =0x08B96444
	ldr r0, [r6]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2d
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x41
	adds r0, r0, r1
	strb r4, [r0]
	bl GetWorkingMoveCosts
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, #0x55
	adds r3, r2, r1
	subs r1, #1
	adds r2, r2, r1
	lsls r4, r4, #0x18
	ldr r1, _0802FBF0 @ =0x0202E3E0
	ldr r1, [r1]
	asrs r4, r4, #0x16
	adds r4, r4, r1
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r2, [r2]
	ldrb r0, [r0]
	subs r0, r2, r0
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FBEC: .4byte 0x08B96444
_0802FBF0: .4byte 0x0202E3E0
