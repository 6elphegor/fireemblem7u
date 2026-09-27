	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098B7C
sub_08098B7C: @ 0x08098B7C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08098BAC @ =0x08B857F8
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08098BC2
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _08098BB0
	subs r0, #1
	strb r0, [r2]
	b _08098BF2
	.align 2, 0
_08098BAC: .4byte 0x08B857F8
_08098BB0:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098C10
	subs r0, r3, #1
	strb r0, [r2]
	b _08098BF2
_08098BC2:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08098C10
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _08098BE4
	adds r0, r1, #1
	strb r0, [r2]
	b _08098BF2
_08098BE4:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098C10
	strb r5, [r2]
_08098BF2:
	ldr r0, _08098C08 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098C04
	ldr r0, _08098C0C @ =0x00000386
	bl m4aSongNumStart
_08098C04:
	movs r0, #1
	b _08098C12
	.align 2, 0
_08098C08: .4byte 0x0202BBF8
_08098C0C: .4byte 0x00000386
_08098C10:
	movs r0, #0
_08098C12:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
