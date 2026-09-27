	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080240C8
sub_080240C8: @ 0x080240C8
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802416C @ =0x02033E40
	str r0, [r4]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl BeginTargetList
	ldr r0, [r4]
	bl GetUnitSupporterCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _08024166
	adds r7, r4, #0
_080240EC:
	ldr r0, [r7]
	adds r1, r5, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08024160
	ldr r3, [r7]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802410C
	subs r1, r0, r2
_0802410C:
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802411E
	subs r0, r2, r3
_0802411E:
	adds r0, r1, r0
	cmp r0, #1
	bne _08024160
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024160
	ldr r0, [r4, #0xc]
	ldr r1, _08024170 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08024160
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08024160
	cmp r1, #2
	beq _08024160
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	adds r3, r5, #0
	bl EnlistTarget
_08024160:
	adds r5, #1
	cmp r5, r6
	blt _080240EC
_08024166:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802416C: .4byte 0x02033E40
_08024170: .4byte 0x0001002C
