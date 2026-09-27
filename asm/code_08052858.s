	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleAnimationId_WithUnique
GetBattleAnimationId_WithUnique: @ 0x08052858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	mov sb, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _0805288E
	mov r0, r8
	bl GetItemType
	cmp r0, #9
	bne _08052898
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08052898
_0805288E:
	ldr r0, _08052894 @ =0x0000FFFF
	b _08052944
	.align 2, 0
_08052894: .4byte 0x0000FFFF
_08052898:
	mov r1, r8
	cmp r1, #0
	bne _080528A2
	movs r3, #9
	b _080528AC
_080528A2:
	mov r0, r8
	bl GetItemType
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080528AC:
	str r4, [sp]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x25
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080528D2
	ldr r1, _080528E4 @ =0x08C996B4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
_080528D2:
	movs r0, #0
	mov r2, sb
	str r0, [r2]
	movs r7, #0
	movs r1, #0
_080528DC:
	ldr r5, [sp]
	movs r6, #0
	b _0805292C
	.align 2, 0
_080528E4: .4byte 0x08C996B4
_080528E8:
	cmp r7, #0
	bne _080528F0
	cmp r0, #0xff
	bhi _08052928
_080528F0:
	cmp r7, #1
	bne _080528FA
	ldrh r4, [r5]
	cmp r4, #0xff
	bls _08052928
_080528FA:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r3, [sp, #8]
	bl GetItemIndex
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	cmp r4, r0
	beq _08052918
	ldrh r2, [r5]
	ldr r4, _08052924 @ =0xFFFFFF00
	adds r0, r2, r4
	cmp r0, r3
	bne _08052928
_08052918:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, sb
	str r6, [r0]
	movs r1, #1
	b _08052932
	.align 2, 0
_08052924: .4byte 0xFFFFFF00
_08052928:
	adds r5, #4
	adds r6, #1
_0805292C:
	ldrh r0, [r5]
	cmp r0, #0
	bne _080528E8
_08052932:
	cmp r1, #1
	beq _0805293C
	adds r7, #1
	cmp r7, #1
	ble _080528DC
_0805293C:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08052944:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
