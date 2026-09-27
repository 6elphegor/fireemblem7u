	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809714C
sub_0809714C: @ 0x0809714C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809717C @ =0x08B857F8
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08097192
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _08097180
	subs r0, #1
	strb r0, [r2]
	b _080971C2
	.align 2, 0
_0809717C: .4byte 0x08B857F8
_08097180:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080971E0
	subs r0, r3, #1
	strb r0, [r2]
	b _080971C2
_08097192:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080971E0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080971B4
	adds r0, r1, #1
	strb r0, [r2]
	b _080971C2
_080971B4:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080971E0
	strb r5, [r2]
_080971C2:
	ldr r0, _080971D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080971D4
	ldr r0, _080971DC @ =0x00000386
	bl m4aSongNumStart
_080971D4:
	movs r0, #1
	b _080971E2
	.align 2, 0
_080971D8: .4byte 0x0202BBF8
_080971DC: .4byte 0x00000386
_080971E0:
	movs r0, #0
_080971E2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
