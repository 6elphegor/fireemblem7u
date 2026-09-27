	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BD64
sub_0803BD64: @ 0x0803BD64
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl InitAiMoveMapForUnit
	adds r0, r5, #0
	bl sub_0803BFC0
	movs r0, #1
	orrs r0, r6
	adds r1, r4, #0
	bl AiFindClosestUnlockPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BDB0
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803BDAC @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BDB0
_0803BDA6:
	movs r0, #1
	b _0803BDF6
	.align 2, 0
_0803BDAC: .4byte 0x0202E3E4
_0803BDB0:
	adds r0, r5, #0
	bl sub_0803BFF4
	adds r0, r6, #0
	adds r1, r4, #0
	bl AiFindClosestUnlockPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BDF4
	movs r3, #2
	ldrsh r1, [r4, r3]
	ldr r0, _0803BDFC @ =0x0202E3E4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BDA6
	ldr r0, _0803BE00 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803BDA6
_0803BDF4:
	movs r0, #0
_0803BDF6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803BDFC: .4byte 0x0202E3E4
_0803BE00: .4byte 0x0202E3DC
