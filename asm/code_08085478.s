	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawTerrainDisplayWindow
DrawTerrainDisplayWindow: @ 0x08085478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r0, _08085564 @ =0x0202BBB8
	mov sb, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, _08085568 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sb
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	ldr r0, _0808556C @ =0x020034BC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085570 @ =0x020039BC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetTerrainName
	adds r5, r0, #0
	movs r0, #0x20
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl PutText
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, _08085574 @ =0x08404880
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r0, _08085578 @ =0x08BE398C
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08085554
	ldr r0, _0808557C @ =0x08BE453A
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08005044
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _08085580 @ =0x02028D4B
	movs r5, #0x94
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
	ldr r0, _08085584 @ =0x08BE44F9
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08005044
	movs r0, #0xa4
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
_08085554:
	cmp r7, #0x29
	bgt _08085588
	cmp r7, #0x27
	bge _080855EC
	cmp r7, #0x1b
	beq _0808558C
	b _0808561A
	.align 2, 0
_08085564: .4byte 0x0202BBB8
_08085568: .4byte 0x0202E3E0
_0808556C: .4byte 0x020034BC
_08085570: .4byte 0x020039BC
_08085574: .4byte 0x08404880
_08085578: .4byte 0x08BE398C
_0808557C: .4byte 0x08BE453A
_08085580: .4byte 0x02028D4B
_08085584: .4byte 0x08BE44F9
_08085588:
	cmp r7, #0x33
	bne _0808561A
_0808558C:
	ldr r4, _080855C0 @ =0x020035BE
	ldr r1, _080855C4 @ =0x08404894
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r1, _080855C8 @ =0x0202BBB8
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl GetObstacleHpAt
	adds r6, r0, #0
	cmp r6, #0x64
	bne _080855D0
	adds r0, r4, #0
	adds r0, #0x44
	ldr r1, _080855CC @ =0x084048A0
	movs r2, #0x80
	lsls r2, r2, #1
	bl TmApplyTsa_thm
	b _0808561A
	.align 2, 0
_080855C0: .4byte 0x020035BE
_080855C4: .4byte 0x08404894
_080855C8: .4byte 0x0202BBB8
_080855CC: .4byte 0x084048A0
_080855D0:
	adds r0, r6, #0
	bl sub_08005044
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, _080855E8 @ =0x02028D4B
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
	b _0808561A
	.align 2, 0
_080855E8: .4byte 0x02028D4B
_080855EC:
	ldr r1, _08085634 @ =0x0840488C
	adds r0, r6, #0
	mov r2, sl
	bl TmApplyTsa_thm
	mov r3, sb
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	movs r2, #0x16
	ldrsh r1, [r3, r2]
	bl GetObstacleHpAt
	bl sub_08005044
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _08085638 @ =0x02028D4B
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
_0808561A:
	ldr r0, _0808563C @ =0x020039BC
	ldr r1, _08085640 @ =0x0840459C
	movs r2, #0x88
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085634: .4byte 0x0840488C
_08085638: .4byte 0x02028D4B
_0808563C: .4byte 0x020039BC
_08085640: .4byte 0x0840459C
