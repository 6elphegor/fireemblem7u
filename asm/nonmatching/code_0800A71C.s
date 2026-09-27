	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800A71C
sub_0800A71C: @ 0x0800A71C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r6, #0
	beq _0800A796
	cmp r3, #0
	beq _0800A786
	cmp r7, #0
	beq _0800A774
	ldr r5, [r6, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0800A774
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r6, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	ldr r0, _0800A770 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r2, [r4, #4]
	ands r1, r2
	ldrh r2, [r4, #6]
	ands r0, r2
	cmp r1, r0
	beq _0800A796
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	bl TryMoveUnitDisplayed
	b _0800A796
	.align 2, 0
_0800A770: .4byte 0x0000FFFF
_0800A774:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	b _0800A796
_0800A786:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
_0800A796:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
