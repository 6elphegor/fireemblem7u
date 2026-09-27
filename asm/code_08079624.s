	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayDefeatTalkForPid
DisplayDefeatTalkForPid: @ 0x08079624
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08079674 @ =0x0202BBF8
	ldr r1, _08079678 @ =0x08C9F22C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079636
	ldr r1, _0807967C @ =0x08C9F16C
_08079636:
	adds r0, r5, #0
	bl sub_080793B0
	adds r4, r0, #0
	cmp r4, #0
	beq _0807969A
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0807964C
	bl sub_0800AF5C
_0807964C:
	bl sub_0800ADB8
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #8]
	cmp r0, #0x65
	bne _08079680
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	adds r1, r6, #0
	adds r1, #0x41
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	b _080796FC
	.align 2, 0
_08079674: .4byte 0x0202BBF8
_08079678: .4byte 0x08C9F22C
_0807967C: .4byte 0x08C9F16C
_08079680:
	adds r0, r5, #0
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _080796FC
	movs r0, #0x2c
	movs r1, #0
	bl StartBgm
	b _080796FC
_0807969A:
	ldr r1, _080796B4 @ =0x08C9F2EC
	adds r0, r5, #0
	bl sub_08079368
	adds r4, r0, #0
	cmp r4, #0
	beq _080796E4
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080796B8
	bl sub_0800ED78
	b _080796C2
	.align 2, 0
_080796B4: .4byte 0x08C9F2EC
_080796B8:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _080796C2
	bl sub_0800AF5C
_080796C2:
	bl sub_0800ADB8
	ldr r0, [r4, #0xc]
	bl SetFlag
	adds r0, r5, #0
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _080796E4
	movs r0, #0x2c
	movs r1, #0
	bl StartBgm
_080796E4:
	cmp r5, #0xf
	beq _080796EE
	cmp r5, #0x15
	beq _080796F6
	b _080796FC
_080796EE:
	movs r0, #0x15
	bl sub_08079568
	b _080796FC
_080796F6:
	movs r0, #0xf
	bl sub_08079568
_080796FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
