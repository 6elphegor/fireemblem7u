	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080443DC
sub_080443DC: @ 0x080443DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	str r0, [sp, #4]
	ldr r3, [r7, #0x3c]
	cmp r3, #0x10
	bhi _08044470
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	mov sl, r0
	ldr r4, _080444A0 @ =0x080C5A48
	movs r1, #0x80
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08044470:
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080444C2
	ldr r1, [r7, #0x3c]
	cmp r1, #3
	bls _080444C2
	cmp r1, #0x16
	bhi _080444C2
	subs r1, #4
	ldr r4, [sp, #4]
	ldrb r4, [r4, #0x10]
	cmp r4, #8
	bne _080444A8
	ldr r0, _080444A4 @ =0x08B99B10
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r2, [r7, #0x2a]
	ldrh r0, [r0]
	adds r0, r2, r0
	b _080444B4
	.align 2, 0
_080444A0: .4byte 0x080C5A48
_080444A4: .4byte 0x08B99B10
_080444A8:
	ldr r0, _08044508 @ =0x08B99B10
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r4, [r7, #0x2a]
	ldrh r0, [r0]
	subs r0, r4, r0
_080444B4:
	strh r0, [r7, #0x2a]
	ldr r0, _0804450C @ =0x08B99B36
	adds r0, r1, r0
	ldrh r1, [r7, #0x2c]
	ldrh r0, [r0]
	subs r0, r1, r0
	strh r0, [r7, #0x2c]
_080444C2:
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	movs r4, #0x2c
	ldrsh r1, [r7, r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r2, _08044510 @ =0x08B905F8
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r3, [r3]
	lsls r3, r3, #2
	ldr r4, _08044514 @ =0x00009340
	adds r3, r3, r4
	bl PutOamHiRam
	ldr r0, [r7, #0x3c]
	adds r0, #1
	str r0, [r7, #0x3c]
	cmp r0, #0x40
	bls _080444F6
	movs r0, #0
	str r0, [r7, #0x3c]
	adds r0, r7, #0
	bl Proc_Break
_080444F6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044508: .4byte 0x08B99B10
_0804450C: .4byte 0x08B99B36
_08044510: .4byte 0x08B905F8
_08044514: .4byte 0x00009340
