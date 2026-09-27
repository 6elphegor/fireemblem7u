	.include "macro.inc"

	.syntax unified

	thumb_func_start EventSnowStormfx_Loop3
EventSnowStormfx_Loop3: @ 0x080112A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #3
	ldr r3, _08011318 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r5
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xd
	cmp r0, #0x10
	ble _080112D2
	movs r0, #0x10
_080112D2:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	cmp r5, #0x10
	bne _08011310
	adds r0, r4, #0
	bl Proc_Break
_08011310:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011318: .4byte 0x03002870
