	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0F1C
sub_080B0F1C: @ 0x080B0F1C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B0F3C
	cmp r0, #1
	bgt _080B0F36
	cmp r0, #0
	beq _080B0FD2
	b _080B0FD2
_080B0F36:
	cmp r0, #2
	beq _080B0FD2
	b _080B0FD2
_080B0F3C:
	movs r0, #0xb9
	movs r1, #8
	bl PlaySeDelayed
	ldr r0, _080B0FC8 @ =0x0203A85C
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	bl GetGold
	str r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetItemSellPrice
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	bl UnitRemoveItem
	ldr r0, [r7]
	bl sub_080B0520
	ldr r0, [r7]
	bl sub_080B1AD8
	ldr r1, _080B0FCC @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B0FD0
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B0FDC
	.align 2, 0
_080B0FC8: .4byte 0x0203A85C
_080B0FCC: .4byte 0x02022E16
_080B0FD0:
	b _080B0FDC
_080B0FD2:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
	b _080B0FDC
_080B0FDC:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
