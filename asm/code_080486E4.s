	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080486E4
sub_080486E4: @ 0x080486E4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r7, #0x38]
	ldr r0, [r7, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r7, #0x2c]
	str r2, [r7, #0x30]
	ldr r3, _08048750 @ =0x08B9A4D8
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x40]
	adds r1, #0x60
	ldr r3, _08048754 @ =0x081D5664
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl PutSprite
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08048760
	ldr r3, _08048758 @ =0x08B9A428
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl PutSprite
	ldr r3, _0804875C @ =0x081D55FE
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	b _08048780
	.align 2, 0
_08048750: .4byte 0x08B9A4D8
_08048754: .4byte 0x081D5664
_08048758: .4byte 0x08B9A428
_0804875C: .4byte 0x081D55FE
_08048760:
	ldr r3, _080487A8 @ =0x08B9A436
	str r0, [sp]
	movs r0, #2
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	ldr r3, _080487AC @ =0x081D5618
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
_08048780:
	movs r4, #3
	ldr r0, _080487B0 @ =0x08B9A4E0
	adds r6, r0, #0
	adds r6, #0xc
	movs r5, #0x78
_0804878A:
	ldr r0, [r7, #0x44]
	cmp r0, r4
	bne _080487B4
	cmp r4, #2
	bgt _080487B4
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
	b _080487C6
	.align 2, 0
_080487A8: .4byte 0x08B9A436
_080487AC: .4byte 0x081D5618
_080487B0: .4byte 0x08B9A4E0
_080487B4:
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
_080487C6:
	adds r6, #4
	adds r5, #0x10
	adds r4, #1
	cmp r4, #4
	ble _0804878A
	bl UpdateNameEntrySpriteGlow
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
