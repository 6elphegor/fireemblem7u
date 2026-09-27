	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2020
sub_080B2020: @ 0x080B2020
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0xb9
	movs r1, #8
	bl PlaySeDelayed
	ldr r0, _080B2094 @ =0x0203A85C
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
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_080B1D40
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r0, [r7]
	bl sub_080B0520
	ldr r0, [r7]
	bl sub_080B19AC
	ldr r1, _080B2098 @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2094: .4byte 0x0203A85C
_080B2098: .4byte 0x02022E16
