	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A4E0
sub_0806A4E0: @ 0x0806A4E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	mov sl, r0
	mov r8, r0
	movs r7, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806A50C
	ldr r0, _0806A508 @ =0x0203E094
	b _0806A50E
	.align 2, 0
_0806A508: .4byte 0x0203E094
_0806A50C:
	ldr r0, _0806A55C @ =0x0203E098
_0806A50E:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r5, [r0, #4]
	cmp r5, #0x14
	bge _0806A51A
	b _0806A61C
_0806A51A:
	cmp r5, #0x17
	ble _0806A520
	b _0806A61C
_0806A520:
	ldr r0, _0806A560 @ =0x0203E0A0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x14
	bne _0806A530
	movs r2, #0
	mov sb, r2
_0806A530:
	cmp r0, #0x15
	bne _0806A538
	movs r2, #0
	mov sb, r2
_0806A538:
	cmp r0, #0x16
	bne _0806A540
	movs r2, #1
	mov sb, r2
_0806A540:
	cmp r0, #0x17
	bne _0806A548
	movs r0, #1
	mov sb, r0
_0806A548:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A564
	movs r0, #1
	b _0806A56A
	.align 2, 0
_0806A55C: .4byte 0x0203E098
_0806A560: .4byte 0x0203E0A0
_0806A564:
	adds r0, r4, #0
	bl GetItemType
_0806A56A:
	cmp r0, #1
	beq _0806A574
	cmp r0, #2
	beq _0806A57A
	b _0806A58C
_0806A574:
	movs r1, #0
	mov r8, r1
	b _0806A58C
_0806A57A:
	adds r0, r4, #0
	bl GetItemIndex
	movs r2, #1
	mov r8, r2
	cmp r0, #0x28
	bne _0806A58C
	movs r0, #2
	mov r8, r0
_0806A58C:
	ldr r0, _0806A5C8 @ =0x0203E0A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x14
	bne _0806A59C
	movs r2, #0
	mov sl, r2
_0806A59C:
	cmp r0, #0x15
	bne _0806A5A4
	movs r2, #0
	mov sl, r2
_0806A5A4:
	cmp r0, #0x16
	bne _0806A5AC
	movs r2, #1
	mov sl, r2
_0806A5AC:
	cmp r0, #0x17
	bne _0806A5B4
	movs r0, #1
	mov sl, r0
_0806A5B4:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A5CC
	movs r0, #1
	b _0806A5D2
	.align 2, 0
_0806A5C8: .4byte 0x0203E0A0
_0806A5CC:
	adds r0, r4, #0
	bl GetItemType
_0806A5D2:
	cmp r0, #1
	beq _0806A5DC
	cmp r0, #2
	beq _0806A5E0
	b _0806A5EE
_0806A5DC:
	movs r7, #0
	b _0806A5EE
_0806A5E0:
	adds r0, r4, #0
	bl GetItemIndex
	movs r7, #1
	cmp r0, #0x28
	bne _0806A5EE
	movs r7, #2
_0806A5EE:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_0806A97C
	ldr r0, _0806A614 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x28
	bne _0806A6C4
	ldr r1, _0806A618 @ =0x02020134
	movs r0, #0
	b _0806A6C8
	.align 2, 0
_0806A614: .4byte 0x0203E098
_0806A618: .4byte 0x02020134
_0806A61C:
	ldr r0, _0806A648 @ =0x0203E0A0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x32
	bne _0806A62C
	movs r2, #0
	mov sb, r2
_0806A62C:
	cmp r0, #0x33
	bne _0806A634
	movs r0, #1
	mov sb, r0
_0806A634:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A64C
	movs r0, #1
	b _0806A656
	.align 2, 0
_0806A648: .4byte 0x0203E0A0
_0806A64C:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0806A660
_0806A656:
	cmp r0, #1
	bne _0806A664
	movs r1, #0
	mov r8, r1
	b _0806A664
_0806A660:
	movs r2, #1
	mov r8, r2
_0806A664:
	ldr r0, _0806A690 @ =0x0203E0A0
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x32
	bne _0806A674
	movs r2, #0
	mov sl, r2
_0806A674:
	cmp r0, #0x33
	bne _0806A67C
	movs r0, #1
	mov sl, r0
_0806A67C:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0806A694
	movs r0, #1
	b _0806A69E
	.align 2, 0
_0806A690: .4byte 0x0203E0A0
_0806A694:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0806A6A6
_0806A69E:
	cmp r0, #1
	bne _0806A6A8
	movs r7, #0
	b _0806A6A8
_0806A6A6:
	movs r7, #1
_0806A6A8:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_0806A6E4
	cmp r5, #0x32
	bne _0806A6C4
	ldr r1, _0806A6C0 @ =0x02020134
	movs r0, #0
	b _0806A6C8
	.align 2, 0
_0806A6C0: .4byte 0x02020134
_0806A6C4:
	ldr r1, _0806A6E0 @ =0x02020134
	movs r0, #1
_0806A6C8:
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A6E0: .4byte 0x02020134
