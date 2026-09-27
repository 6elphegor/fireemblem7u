	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5350
sub_080B5350: @ 0x080B5350
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0x30
	ldr r0, [r5, #0x2c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B536A
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #2
	b _080B5372
_080B536A:
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #1
_080B5372:
	strh r1, [r0]
	adds r2, r0, #0
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B5386
	ldrh r2, [r2]
	lsrs r4, r2, #1
	b _080B5388
_080B5386:
	ldrh r4, [r2]
_080B5388:
	movs r7, #8
	ands r1, r7
	cmp r1, #0
	beq _080B53AC
	subs r1, r6, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r1, r6, #0
	muls r1, r6, r1
	bl __divsi3
	adds r1, r0, #0
	movs r0, #0x70
	subs r0, r0, r1
	bl sub_08077680
_080B53AC:
	cmp r4, r6
	bne _080B540C
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, [r5, #0x2c]
	ands r0, r7
	cmp r0, #0
	beq _080B540C
	movs r0, #0
	bl SetOnHBlankB
	ldr r3, _080B5414 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _080B5418 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _080B541C @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
_080B540C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5414: .4byte 0x03002870
_080B5418: .4byte 0x0000FFE0
_080B541C: .4byte 0x0000E0FF
