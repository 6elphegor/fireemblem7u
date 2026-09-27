	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08085710
sub_08085710: @ 0x08085710
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08085790 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08085794 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _080857AE
	ldr r0, _08085798 @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _080857A0
	bl GetCursorQuadrant
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08085780
	ldr r0, _0808579C @ =0x08CC2B94
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3]
	ldrb r0, [r1]
	cmp r2, r0
	bne _080857A0
	ldrb r3, [r3, #1]
	ldrb r1, [r1, #1]
	cmp r3, r1
	bne _080857A0
_08085780:
	adds r0, r4, #0
	bl DrawTerrainDisplayWindow
	adds r0, r4, #0
	bl sub_08084DE4
	b _080857AE
	.align 2, 0
_08085790: .4byte 0x0202BBB8
_08085794: .4byte 0x0000FFFF
_08085798: .4byte 0x08B92E38
_0808579C: .4byte 0x08CC2B94
_080857A0:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080857AE:
	pop {r4}
	pop {r0}
	bx r0
