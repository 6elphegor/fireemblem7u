	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045AB8
sub_08045AB8: @ 0x08045AB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, _08045B40 @ =0x03001400
	ldr r2, _08045B44 @ =0x0203DC9C
	mov r8, r2
	ldrb r1, [r2, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov sb, r0
	mov r2, r8
	ldrb r2, [r2, #5]
	adds r4, r2, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08045BB6
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	adds r0, #1
	ldr r1, _08045B48 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08045B24
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [sp, #4]
_08045B24:
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _08045B50
	ldr r0, _08045B4C @ =0x03004690
	ldr r0, [r0]
	bl sub_08044B08
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	b _08045BB6
	.align 2, 0
_08045B40: .4byte 0x03001400
_08045B44: .4byte 0x0203DC9C
_08045B48: .4byte 0x0202E3E0
_08045B4C: .4byte 0x03004690
_08045B50:
	ldr r7, _08045BA4 @ =0x03004690
	ldr r0, [r7]
	mov r2, r8
	ldrb r1, [r2, #7]
	bl EquipUnitItemSlot
	ldr r4, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r4, r0
	cmp r4, #0
	bne _08045BA8
	adds r0, r6, #0
	bl NewBattleForecast
	mov r0, r8
	ldrb r0, [r0, #6]
	cmp r0, #2
	bne _08045B7A
	movs r1, #1
	mov sl, r1
_08045B7A:
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	add r2, sl
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	ldr r0, [sp, #4]
	adds r3, r3, r0
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	bl BattleGenerateSimulation
	bl UpdateBattleForecastContents
	ldr r0, [r7]
	bl sub_08044B08
	adds r0, r6, #0
	bl Proc_Break
	b _08045BB6
	.align 2, 0
_08045BA4: .4byte 0x03004690
_08045BA8:
	ldr r0, [r7]
	bl sub_08044B08
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_08045BB6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
