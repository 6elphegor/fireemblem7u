	.include "macro.inc"

	.syntax unified

	thumb_func_start MMB_Loop_Display
MMB_Loop_Display: @ 0x08085888
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08085940 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08085944 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl UnitMapUiUpdate
	movs r0, #0x3f
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080858CC
	adds r0, r5, #0
	bl sub_08084D90
_080858CC:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x4c
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldr r0, _08085948 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08085962
	cmp r7, #0
	beq _08085954
	ldr r0, _0808594C @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _08085954
	bl GetCursorQuadrant
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08085936
	ldr r0, _08085950 @ =0x08CC2B94
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r0, [r3, #2]
	ldrb r2, [r1, #2]
	cmp r0, r2
	bne _08085954
	ldrb r3, [r3, #3]
	ldrb r1, [r1, #3]
	cmp r3, r1
	bne _08085954
_08085936:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08085962
	.align 2, 0
_08085940: .4byte 0x0202BBB8
_08085944: .4byte 0x0202E3DC
_08085948: .4byte 0x0000FFFF
_0808594C: .4byte 0x08B92E38
_08085950: .4byte 0x08CC2B94
_08085954:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08085962:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
