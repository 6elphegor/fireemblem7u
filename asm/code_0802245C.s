	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802245C
sub_0802245C: @ 0x0802245C
	push {r4, r5, r6, lr}
	sub sp, #4
	bl sub_080223EC
	ldr r6, _080224E4 @ =0x03004690
	ldr r0, [r6]
	bl GetUnitItemCount
	cmp r0, #0
	beq _080224FC
	ldr r0, _080224E8 @ =0x0200323C
	ldr r5, _080224EC @ =0x02022CB6
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _080224F0 @ =0x0200373C
	ldr r4, _080224F4 @ =0x020234B6
	adds r1, r4, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	subs r5, #0x14
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	subs r4, #0x14
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	ldr r0, _080224F8 @ =0x08B95A40
	bl StartMenu
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r6]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #1
	b _0802251E
	.align 2, 0
_080224E4: .4byte 0x03004690
_080224E8: .4byte 0x0200323C
_080224EC: .4byte 0x02022CB6
_080224F0: .4byte 0x0200373C
_080224F4: .4byte 0x020234B6
_080224F8: .4byte 0x08B95A40
_080224FC:
	bl ClearUi
	movs r0, #0
	bl EndFaceById
	ldr r0, _08022528 @ =0x08B95AAC
	ldr r2, _0802252C @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	movs r0, #0x1b
_0802251E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022528: .4byte 0x08B95AAC
_0802252C: .4byte 0x0202BBB8
