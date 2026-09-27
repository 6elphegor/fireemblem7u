	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043B1C
sub_08043B1C: @ 0x08043B1C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r6, sp
	adds r6, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl FormatTime
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _08043B44
	add r0, sp, #4
	movs r1, #0x63
	strh r1, [r0]
	movs r0, #0x3b
	strh r0, [r5]
	strh r0, [r6]
_08043B44:
	ldrh r0, [r5]
	movs r1, #0xa
	bl DivRem
	ldr r4, _08043C04 @ =0x08B99984
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r5]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	movs r5, #0xa
	str r5, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r6]
	movs r1, #0xa
	bl DivRem
	ldr r4, _08043C08 @ =0x08B9997C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r6]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	str r5, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl DivRem
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl Div
	cmp r0, #0
	ble _08043BFC
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
_08043BFC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043C04: .4byte 0x08B99984
_08043C08: .4byte 0x08B9997C
