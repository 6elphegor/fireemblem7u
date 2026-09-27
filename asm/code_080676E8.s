	.include "macro.inc"

	.syntax unified

	thumb_func_start M4aPlayWithPostionCtrl
M4aPlayWithPostionCtrl: @ 0x080676E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _08067714 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08067790
	cmp r2, #0
	beq _08067760
	cmp r6, #0x77
	bgt _08067718
	adds r0, r6, #0
	muls r0, r6, r0
	movs r1, #0x78
	bl Div
	adds r5, r0, #0
	subs r5, #0x78
	b _0806772C
	.align 2, 0
_08067714: .4byte 0x0202BBB8
_08067718:
	movs r0, #0xf0
	subs r0, r0, r6
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x78
	bl Div
	movs r1, #0x78
	subs r5, r1, r0
_0806772C:
	ldr r2, _08067754 @ =0x0869D668
	ldr r0, _08067758 @ =0x0869D6E0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r1, _0806775C @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl MPlayPanpotControl
	b _08067790
	.align 2, 0
_08067754: .4byte 0x0869D668
_08067758: .4byte 0x0869D6E0
_0806775C: .4byte 0x0000FFFF
_08067760:
	ldr r2, _08067798 @ =0x0869D668
	ldr r0, _0806779C @ =0x0869D6E0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _080677A0 @ =0x0000FFFF
	adds r0, r6, #0
	bl Screen2Pan
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayPanpotControl
_08067790:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067798: .4byte 0x0869D668
_0806779C: .4byte 0x0869D6E0
_080677A0: .4byte 0x0000FFFF
