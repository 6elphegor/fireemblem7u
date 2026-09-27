	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_Loop_MainKeyHandler
PrepItemScreen_Loop_MainKeyHandler: @ 0x08092708
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _0809271A
	b _08092840
_0809271A:
	ldr r0, _08092734 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092738
	adds r0, r6, #0
	bl Proc_Break
	b _08092846
	.align 2, 0
_08092734: .4byte 0x08B857F8
_08092738:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080927B0
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	ldrb r5, [r5]
	ldrb r4, [r4]
	cmp r5, r4
	beq _08092794
	cmp r7, #0
	bgt _0809276E
	cmp r0, #0
	ble _08092794
_0809276E:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _0809278C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092846
	ldr r0, _08092790 @ =0x0000038A
	bl m4aSongNumStart
	b _08092846
	.align 2, 0
_0809278C: .4byte 0x0202BBF8
_08092790: .4byte 0x0000038A
_08092794:
	ldr r0, _080927AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092846
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08092846
	.align 2, 0
_080927AC: .4byte 0x0202BBF8
_080927B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080927E4
	movs r0, #1
	bl EndPrepItemScreenFace
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080927DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092846
	ldr r0, _080927E0 @ =0x0000038B
	bl m4aSongNumStart
	b _08092846
	.align 2, 0
_080927DC: .4byte 0x0202BBF8
_080927E0: .4byte 0x0000038B
_080927E4:
	adds r0, r6, #0
	bl sub_08091AD8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092840
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08092850 @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r4, _08092854 @ =0x02012A48
	ldr r5, _08092858 @ =0x02022EBE
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_080929D0
	subs r4, #0x28
	subs r5, #0x1a
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
_08092840:
	adds r0, r6, #0
	bl sub_08091C48
_08092846:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092850: .4byte 0x00000502
_08092854: .4byte 0x02012A48
_08092858: .4byte 0x02022EBE
