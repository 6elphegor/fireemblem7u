	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035124
sub_08035124: @ 0x08035124
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	movs r0, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _08035180 @ =0x0202BBF8
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _080351A6
	ldrb r1, [r1, #0xf]
	cmp r1, #0x80
	bne _080351A6
	ldr r0, _08035184 @ =0x03004690
	ldr r1, [r0]
	movs r5, #0x11
	ldrsb r5, [r1, r5]
	ldr r0, _08035188 @ =0x0202E3EC
	ldr r2, [r0]
	lsls r0, r5, #2
	adds r0, r0, r2
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035176
	ldr r3, _0803518C @ =0x0203A97C
	ldrb r6, [r3, #3]
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrb r2, [r3, #2]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035190
_08035176:
	adds r0, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoPosition
	b _080351B8
	.align 2, 0
_08035180: .4byte 0x0202BBF8
_08035184: .4byte 0x03004690
_08035188: .4byte 0x0202E3EC
_0803518C: .4byte 0x0203A97C
_08035190:
	mov r6, ip
	strb r0, [r6]
	ldrb r0, [r3]
	cmp r0, #4
	bne _080351B8
	ldrb r1, [r3, #2]
	ldrb r2, [r3, #3]
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	b _080351B8
_080351A6:
	ldr r0, _080351C0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
_080351B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080351C0: .4byte 0x03004690
