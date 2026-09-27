	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046A7C
sub_08046A7C: @ 0x08046A7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl GetGameTime
	ldr r2, _08046B34 @ =0x08B99C98
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #4
	asrs r0, r0, #1
	mov sl, r0
	movs r7, #0
_08046A9C:
	ldr r0, _08046B38 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _08046B3C @ =0x081D5470
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq _08046B1E
	movs r6, #0
	lsls r0, r7, #2
	mov r8, r0
_08046AC4:
	mov r1, r8
	adds r0, r1, r7
	adds r0, r0, r6
	ldr r1, _08046B40 @ =0x03001400
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08046B18
	ldr r0, [r2]
	cmp r0, #0
	beq _08046B18
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08046B18
	movs r5, #0x10
	ldrsb r5, [r2, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r2, r4]
	lsls r4, r4, #4
	mov r0, sl
	subs r4, r4, r0
	adds r0, r2, #0
	bl GetUnitDisplayedSpritePalette
	movs r3, #0xf
	ands r3, r0
	lsls r3, r3, #0xc
	movs r1, #0xa4
	lsls r1, r1, #4
	adds r3, r3, r1
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _08046B44 @ =0x08B905B8
	bl PutOamHiRam
_08046B18:
	adds r6, #1
	cmp r6, #4
	ble _08046AC4
_08046B1E:
	mov r7, sb
	cmp r7, #3
	ble _08046A9C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046B34: .4byte 0x08B99C98
_08046B38: .4byte 0x08B98AEC
_08046B3C: .4byte 0x081D5470
_08046B40: .4byte 0x03001400
_08046B44: .4byte 0x08B905B8
