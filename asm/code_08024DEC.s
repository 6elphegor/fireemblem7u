	.include "macro.inc"

	.syntax unified

	thumb_func_start UseUnitSprite
UseUnitSprite: @ 0x08024DEC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08024E24 @ =0x02033E44
	adds r7, r6, r0
	ldrb r1, [r7]
	cmp r1, #0xff
	bne _08024EA0
	ldr r5, _08024E28 @ =0x08C99700
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08024E2C @ =0x08B93E44
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08024E54
	cmp r0, #1
	bgt _08024E30
	cmp r0, #0
	beq _08024E36
	b _08024E96
	.align 2, 0
_08024E24: .4byte 0x02033E44
_08024E28: .4byte 0x08C99700
_08024E2C: .4byte 0x08B93E44
_08024E30:
	cmp r0, #2
	beq _08024E70
	b _08024E96
_08024E36:
	ldr r4, _08024E50 @ =0x02039F14
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08024EB8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	subs r0, #1
	b _08024E94
	.align 2, 0
_08024E50: .4byte 0x02039F14
_08024E54:
	ldr r4, _08024E6C @ =0x02039F18
	ldr r0, [r4]
	adds r1, r6, #0
	bl ApplyUnitSpriteImage16x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #2
	b _08024E94
	.align 2, 0
_08024E6C: .4byte 0x02039F18
_08024E70:
	ldr r4, _08024EAC @ =0x02039F18
	ldr r1, [r4]
	movs r0, #0x1e
	ands r0, r1
	cmp r0, #0x1e
	bne _08024E80
	adds r0, r1, #2
	str r0, [r4]
_08024E80:
	ldr r0, [r4]
	adds r1, r6, #0
	bl ApplyUnitSpriteImage32x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #4
_08024E94:
	str r0, [r4]
_08024E96:
	ldr r1, _08024EB0 @ =0x0203A3D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08024EB4 @ =0x02033E44
_08024EA0:
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024EAC: .4byte 0x02039F18
_08024EB0: .4byte 0x0203A3D0
_08024EB4: .4byte 0x02033E44
