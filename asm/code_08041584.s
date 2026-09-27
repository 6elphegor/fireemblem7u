	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041584
sub_08041584: @ 0x08041584
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0804160C @ =0x08B857F8
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080415D2
	ldr r0, [r4]
	cmp r0, r6
	bgt _080415B4
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne _080415D2
_080415B4:
	subs r2, r7, #1
	movs r3, #1
	rsbs r3, r3, #0
_080415BA:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _080415C6
	str r2, [r4]
_080415C6:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq _080415BA
_080415D2:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08041606
	ldr r0, [r4]
	cmp r0, ip
	blt _080415EA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08041606
_080415EA:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080415EA
_08041606:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804160C: .4byte 0x08B857F8
