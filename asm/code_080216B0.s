	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080216B0
sub_080216B0: @ 0x080216B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08021708 @ =0x03004690
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl IsCameraNotWatchingPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021702
	ldr r0, [r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r0, _0802170C @ =0x08B92E38
	bl Proc_EndEach
	lsls r0, r4, #4
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08021710 @ =0x0202BBB8
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080216F4
	ldrh r2, [r2, #0x2a]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	adds r4, r0, #2
_080216F4:
	ldr r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl EnsureCameraOntoPosition
_08021702:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021708: .4byte 0x03004690
_0802170C: .4byte 0x08B92E38
_08021710: .4byte 0x0202BBB8
