	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098FC4
sub_08098FC4: @ 0x08098FC4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _08099054 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08098FE8
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08098FE8
	subs r0, r4, #1
	strb r0, [r3]
_08098FE8:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _08099006
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08099006
	adds r0, r1, #1
	strb r0, [r3]
_08099006:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809901E
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _0809901E
	adds r0, r1, #2
	strb r0, [r3]
_0809901E:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08099036
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _08099036
	subs r0, r1, #2
	strb r0, [r3]
_08099036:
	ldrb r3, [r3]
	cmp r4, r3
	beq _08099060
	ldr r0, _08099058 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809904E
	ldr r0, _0809905C @ =0x00000385
	bl m4aSongNumStart
_0809904E:
	movs r0, #1
	b _08099062
	.align 2, 0
_08099054: .4byte 0x08B857F8
_08099058: .4byte 0x0202BBF8
_0809905C: .4byte 0x00000385
_08099060:
	movs r0, #0
_08099062:
	pop {r4, r5}
	pop {r1}
	bx r1
